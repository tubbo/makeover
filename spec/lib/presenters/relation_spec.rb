require 'spec_helper'

module Presenters
  RSpec.describe Relation do
    it 'refines ActiveRecord::Relation to provide #present method' do
      expect(ActiveRecord::Relation.public_instance_methods).to include(:present)
    end
  end
end
