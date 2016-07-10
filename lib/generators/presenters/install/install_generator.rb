class Presenters::InstallGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  MIXIN = "\n\s\sinclude Presenters::Presentable\n"

  def copy_presenters
    copy_file 'application_presenter.rb', 'app/presenters/application_presenter.rb'
    copy_file 'collection_presenter.rb',  'app/presenters/collection_presenter.rb'
  end

  def inject_mixin
    insert_into_file(
      MIXIN,
      after: "self.abstract_class = true\n"
    )
    insert_into_file(
      MIXIN,
      after: "class ApplicationController < ActionController::Base\n"
    )
  end
end
