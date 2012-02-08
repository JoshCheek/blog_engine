class BlogEngine
  module Persisters
    class InMemory
      def add_blog(blog_hash)
        blogs << blog_hash
      end
    
      def blogs_written_on(date)
        blogs.select { |blog| blog.date == date }
      end
    
      def blogs
        @blogs ||= []
      end
      
      alias all_blogs blogs
    end
  end
end