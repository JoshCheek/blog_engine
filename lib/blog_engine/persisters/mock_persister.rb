require 'blog_engine/persisters/in_memory'

class BlogEngine
  module Persisters
    class MockPersister < InMemory
      attr_accessor :date_requested
      
      def has_been_told_to_add?(blog)
        blogs.include? blog
      end
      
      def will_return(blogs)
        self.blogs.replace blogs
      end
      
      def blogs_written_on(date)
        self.date_requested = date
        blogs
      end
      
      def all_blogs
        @was_asked_for_all_blogs = true
        super
      end
      
      def has_been_asked_for_all_blogs?
        @was_asked_for_all_blogs
      end
      
      def has_been_asked_for_blogs_written_on?(date)
        date_requested == date
      end
    end
  end
end