class BlogEngine
  module Validators
    class AlwaysValid
      def initialize(*)
      end
      
      def valid?
        true
      end
    end
  end
end