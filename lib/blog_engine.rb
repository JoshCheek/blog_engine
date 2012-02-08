require 'date'
require 'blog_engine/version'
require 'blog_engine/blog'

class BlogEngine
  
  attr_accessor :persister, :validators
  
  def initialize(options)
    self.persister = options[:persister]
    self.validators = options.fetch :validators, []
  end
  
  def add_blog(blog)
    return false unless valid? blog
    persister.add_blog blog
    true
  end
  
  def valid?(blog)
    validators.all? { |validator| validator.new(blog).valid? }
  end
  
  def blogs_written_on(date)
    persister.blogs_written_on date
  end
  
  def all_blogs
    persister.all_blogs
  end
end

