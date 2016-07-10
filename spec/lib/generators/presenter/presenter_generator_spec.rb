require 'spec_helper'
require 'generators/presenter/presenter_generator'

RSpec.describe PresenterGenerator, type: :generator do
  before :all do
    prepare_destination
  end

  context 'when singular name is given' do
    before { run_generator %w(post) }

    it 'generates model presenter'
    it 'generates test'
  end

  context 'when plural name is given' do
    before { run_generator %w(posts) }

    it 'generates collection presenter'
  end

  context 'when --collection option is set' do
    before { run_generator %w(search --collection) }

    it 'generates collection presenter'
  end
end
