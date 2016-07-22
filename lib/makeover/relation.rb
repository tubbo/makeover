# frozen_string_literal: true
module Makeover
  # Refines +ActiveRecord::Relation+ to provide a +#presenter+ method.
  module Relation
    refine ActiveRecord::Relation do
      prepend Makeover::Presentable

      def presenter
        if to_sql =~ /FROM "(.*)"/
          "#{Regexp.last_match(1).camelize}Presenter".constantize
        end
      end
    end
  end
end
