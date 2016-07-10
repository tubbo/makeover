# frozen_string_literal: true
module Presenters
  # Install the presenters library.
  # More info: +rails g presenters:install --help+
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    MIXIN = "\n\s\sinclude Presenters::Presentable\n"

    def copy_presenters
      %w(application collection).each do |type|
        copy_file "#{type}_presenter.rb", "app/presenters/#{type}_presenter.rb"
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
