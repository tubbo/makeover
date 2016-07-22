# frozen_string_literal: true

# Generates a presenter. More info: +rails g presenter --help+.
class PresenterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :collection, type: :boolean, default: false

  def copy_presenter
    template "#{presenter}.rb.erb", "app/presenters/#{file_name}_presenter.rb"
  end

  def copy_test
    template(
      "#{test}.rb.erb",
      "#{test}/presenters/#{file_name}_presenter_#{test}.rb"
    )
  end

  private

  def collection?
    options[:collection] || plural?
  end

  def plural?
    file_name == file_name.pluralize
  end

  def presenter
    collection? ? 'collection_presenter' : 'presenter'
  end

  def test
    Dir.exist?(Rails.root.join('spec').to_s) ? 'spec' : 'test'
  end
end
