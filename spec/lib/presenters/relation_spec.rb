# frozen_string_literal: true
require 'spec_helper'

module Presenters
  RSpec.describe Relation do
    using Relation

    let :builder do
      double 'PredicateBuilder'
    end

    let :relation do
      ActiveRecord::Relation.new Post, 'posts', builder
    end


    xit 'refines ActiveRecord::Relation to provide #present method' do
      expect(relation).to respond_to(:presenter)
      expect(relation).to respond_to(:present)
    end
  end
end
