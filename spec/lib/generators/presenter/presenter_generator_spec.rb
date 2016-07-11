# frozen_string_literal: true
require 'spec_helper'
require 'generators/presenter/presenter_generator'

RSpec.describe PresenterGenerator, type: :generator do
  destination File.expand_path('../../../../tmp', __dir__)
  before { prepare_destination }

  context 'when singular name is given' do
    before do
      run_generator %w(post)
    end

    it 'generates model presenter' do
      assert_file 'app/presenters/post_presenter.rb'
      assert_file 'test/presenters/post_presenter_test.rb'
    end
  end

  context 'when plural name is given' do
    before { run_generator %w(posts) }

    it 'generates collection presenter' do
      assert_file 'app/presenters/posts_presenter.rb'
      assert_file 'test/presenters/posts_presenter_test.rb'
    end
  end

  context 'when --collection option is set' do
    before { run_generator %w(search --collection) }

    it 'generates collection presenter' do
      assert_file 'app/presenters/search_presenter.rb', /class SearchPresenter/
      assert_file 'test/presenters/search_presenter_test.rb'
    end
  end
end
