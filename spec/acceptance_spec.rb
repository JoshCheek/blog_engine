require 'blog_engine'
require 'blog_engine/persisters/in_memory'
require 'blog_engine/validators/content_exists'

class BlogEngine
  describe 'acceptance spec' do
    it 'must be able to add/validate blogs all the way through the stack' do
      engine = BlogEngine.new persister:  Persisters::InMemory.new,
                              validators: [Validators::ContentExists]
    
      yesterday = Date.parse 'Tue Feb  6 21:21:43 CST 2012'
      today     = Date.parse 'Tue Feb  7 21:21:43 CST 2012'
      tomorrow  = Date.parse 'Tue Feb  8 21:21:43 CST 2012'
    
      # adding a valid blog
      todays_blog1 = valid_blog = Blog.new author: 'bob',
                                           title: 'this is cool',
                                           content: 'see? a blog!',
                                           date: today
    
      engine.add_blog(valid_blog).should be_true
      engine.all_blogs.should == [valid_blog]
    
    
      # adding an invalid blog
      invalid_blog = Blog.new author: nil,
                              title: 'this is cool',
                              content: 'see? a blog!',
                              date: Date.today
      engine.add_blog(invalid_blog).should be_false
      engine.all_blogs.should == [valid_blog]
    
    
      # querying by date
      yesterdays_blog = Blog.new author: 'author', title: 'title', content: 'content', date: yesterday
      todays_blog2    = Blog.new author: 'author', title: 'title', content: 'content', date: today
      engine.add_blog todays_blog2
      engine.add_blog yesterdays_blog
      engine.blogs_written_on(today).should == [todays_blog1, todays_blog2]
    end
  end
end