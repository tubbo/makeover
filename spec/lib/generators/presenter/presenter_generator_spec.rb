# frozen_string_literal: true
require 'spec_helper'
require 'generators/presenter/presenter_generator'

RSpec.describe PresenterGenerator, type: :generator do
  destination File.expand_path('../../../../tmp', __dir__)

  before do
    prepare_destination
    run_generator
  end

  context 'when singular name is given' do
    arguments %w(post)

    it 'generates model presenter' do
      assert_file 'app/presenters/post_presenter.rb', "class PostPresenter < ApplicationPresenter\nend\n"
      assert_file 'test/presenters/post_presenter_test.rb', "class PostPresenterTest < ActiveSupport::TestCase\nend\n"
    end
  end

  context 'when plural name is given' do
    arguments %w(posts)

    it 'generates collection presenter' do
      assert_file 'app/presenters/posts_presenter.rb', "class PostsPresenter < CollectionPresenter\nend\n"
      assert_file 'test/presenters/posts_presenter_test.rb', "class PostsPresenterTest < ActiveSupport::TestCase\nend\n"
    end
  end

  context 'when --collection option is set' do
    before { run_generator %w(search --collection) }

    it 'generates collection presenter' do
      assert_file 'app/presenters/search_presenter.rb', "class SearchPresenter < CollectionPresenter\nend\n"
      assert_file 'test/presenters/search_presenter_test.rb', "class SearchPresenterTest < ActiveSupport::TestCase\nend\n"
    end
  end
end
