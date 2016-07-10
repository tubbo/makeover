require 'spec_helper'
require 'presenters'

RSpec.describe Presenters do
  it 'autoloads objects' do
    expect(described_class).to be_const_defined(:Presenter)
    expect(described_class).to be_const_defined(:CollectionPresenter)
    expect(described_class).to be_const_defined(:Presentable)
    expect(described_class).to be_const_defined(:Helpers)
    expect(described_class).to be_const_defined(:Relation)
  end

  it 'refines relation object' do
    expect(ActiveRecord::Relation.ancestors).to include(Presenters::Relation)
  end
end
