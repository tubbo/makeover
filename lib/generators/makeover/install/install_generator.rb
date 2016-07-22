# frozen_string_literal: true
module Makeover
  # Install the makeover library.
  # More info: +rails g makeover:install --help+
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    MIXIN = "\n\s\sinclude Makeover::Presentable\n"

    def copy_makeover
      %w(application collection).each do |type|
        filename = "app/presenters/#{type}_presenter.rb"
        if File.exist? Rails.root.join(filename).to_s
          copy_file "#{type}_presenter.rb", filename
        end
      end
    end

    def inject_mixin
      insert_into_file(
        'app/models/application_record.rb',
        MIXIN,
        after: "self.abstract_class = true\n"
      )
      insert_into_file(
        'app/controllers/application_controller.rb',
        MIXIN,
        after: "class ApplicationController < ActionController::Base\n"
      )
    end
  end
end
