# frozen_string_literal: true
class PresenterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :collection, type: :boolean, default: false

  def copy_presenter
    if collection?
      template 'collection_presenter.rb.erb', "app/presenters/#{file_name}_presenter.rb"
    else
      template 'presenter.rb.erb', "app/presenters/#{file_name}_presenter.rb"
    end
  end

  def copy_test
    if Dir.exist? Rails.root.join('spec').to_s
      template 'spec.rb.erb', "spec/presenters/#{file_name}_presenter_spec.rb"
    else
      template 'test.rb.erb', "test/presenters/#{file_name}_presenter_test.rb"
    end
  end

  private

  def collection?
    options[:collection] || plural?
  end

  def plural?
    file_name == file_name.pluralize
  end
end
