# frozen_string_literal: true

require 'active_support/core_ext/module/attribute_accessors'

module Rake
  # Functions for running tests directly on the command line with
  #
  #     rake test test/path/to/file_test.rb`
  #
  # Ideas copied from Rails 5.
  module TestRunner
    class << self
      mattr_accessor :filters, default: []

      def extract_filter_from(path)
        if path.match?(/(:\d+)+$/)
          file, *lines = path.split(':')
          filters << [file, lines]
          file
        elsif Dir.exist?(path)
          "#{path}/**/*_test.rb"
        else
          filters << [path, []]
          path
        end
      end

      def test_file_arguments
        ARGV.select do |arg|
          arg =~ %r{^/?\w+/} && !arg.end_with?('/')
        end
      end

      def extract_filters
        test_file_arguments.map do |path|
          extract_filter_from(path)
        end
      end

      def all_tests
        FileList['test/**/*_test.rb']
      end

      def running_single_test?
        ARGV.include?('test') && ARGV.count > 1
      end

      def load_tests
        return all_tests unless running_single_test?

        patterns = extract_filters

        test_file_list(patterns).to_a.each do |path|
          require File.expand_path(path)
        end
      end

      private

      def test_file_list(patterns)
        return all_tests if patterns.empty?

        FileList[patterns]
      end
    end
  end
end
