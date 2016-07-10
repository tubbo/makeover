require 'spec_helper'
require 'generators/presenters/install/install_generator'

module Presenters
  RSpec.describe InstallGenerator, type: :generator do
    it 'installs presenters into the rails app' do
      run_generator []

      assert_file 'app/presenters/application_presenter.rb'
      assert_file 'app/presenters/collection_presenter.rb'
      assert_file 'app/controllers/application_controller.rb', 'Presenters::Presentable'
      assert_file 'app/models/application_record.rb', 'Presenters::Presentable'
    end
  end
end
