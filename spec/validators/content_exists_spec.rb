require 'blog_engine'
require 'blog_engine/validators/content_exists'

class BlogEngine
  module Validators
    describe ContentExists do
      
      def blog_for(attributes)
        Blog.new attributes
      end
      
      attributes = {author: 'author', title: 'title', content: 'content', date: 'date'}.freeze
    
      it 'is valid if it has an author, title, content, and date' do
        described_class.new(blog_for attributes).should be_valid
      end
    
      attributes.keys.each do |attribute|
        it "is invalid if it is missing the #{attribute}" do
          invalid_attributes = attributes.dup
          invalid_attributes.delete attribute
          described_class.new(blog_for invalid_attributes).should_not be_valid
        end
      end
    end
  end
end