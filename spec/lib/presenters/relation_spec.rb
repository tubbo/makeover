# frozen_string_literal: true
require 'spec_helper'

module Presenters
  RSpec.describe Relation do
    let :relation_methods do
      ActiveRecord::Relation.public_instance_methods
    end

    it 'refines ActiveRecord::Relation to provide #present method' do
      expect(relation_methods).to include(:present)
    end
  end
end
