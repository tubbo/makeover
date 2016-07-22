# frozen_string_literal: true
require 'spec_helper'
require 'generators/makeover/install/install_generator'

module Makeover
  RSpec.describe InstallGenerator, type: :generator do
    destination File.expand_path('../../../../../tmp', __dir__)

    before do
      prepare_destination
      FileUtils.mkdir_p "#{destination_root}/app/models"
      FileUtils.mkdir_p "#{destination_root}/app/controllers"
      FileUtils.cp(
        "#{Rails.root}/app/models/application_record.rb",
        "#{destination_root}/app/models/application_record.rb"
      )
      FileUtils.cp(
        "#{Rails.root}/app/controllers/application_controller.rb",
        "#{destination_root}/app/controllers/application_controller.rb"
      )
      run_generator
    end

    it 'installs base model presenter' do
      assert_file 'app/presenters/application_presenter.rb'
    end

    it 'installs base collection presenter' do
      assert_file 'app/presenters/collection_presenter.rb'
    end

    it 'injects mixin into controller' do
      assert_file(
        'app/controllers/application_controller.rb',
        <<-RUBY
# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Makeover::Presentable
  protect_from_forgery with: :exception
end
RUBY
      )
    end

    it 'injects mixin into models' do
      assert_file(
        'app/models/application_record.rb',
        <<-RUBY
# frozen_string_literal: true
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Makeover::Presentable
end
RUBY
      )
    end
  end
end
