# frozen_string_literal: true
module Presenters
  module Relation
    refine ActiveRecord::Relation do
      def decorator
        "#{Regexp.last_match(1).camelize}Presenter".constantize if to_sql =~ /FROM "(.*)"/
      end
    end
  end
end
