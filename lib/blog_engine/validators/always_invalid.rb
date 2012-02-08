class BlogEngine
  module Validators
    class AlwaysInvalid
      def initialize(*)
      end
      
      def valid?
        false
      end
    end
  end
end