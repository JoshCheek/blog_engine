class BlogEngine
  module Validators
    class ContentExists < Struct.new(:blog)
      def valid?
        attributes.all? { |attribute| blog.send attribute }
      end
      
      def attributes
        Blog.attributes
      end
    end
  end
end
