require 'blog_engine'
require 'blog_engine/persisters/in_memory'

class BlogEngine
  module Persisters
    describe InMemory do
      let(:in_memory) { InMemory.new }
      
      it 'has no blogs by default' do
        in_memory.all_blogs.should be_empty
      end
      
      let(:blog) { double 'a blog' }
      it 'can add blogs' do
        in_memory.add_blog blog
        in_memory.all_blogs.size.should == 1
        in_memory.all_blogs.first.should be blog
      end

      let(:yesterday)       { Date.parse 'Tue Feb  6 21:21:43 CST 2012' }
      let(:today)           { Date.parse 'Tue Feb  7 21:21:43 CST 2012' }
      let(:tomorrow)        { Date.parse 'Tue Feb  8 21:21:43 CST 2012' }
      let(:yesterdays_blog) { Blog.new author: 'author', title: 'title', content: 'content', date: yesterday }
      let(:todays_blog)     { Blog.new author: 'author', title: 'title', content: 'content', date: today }
      let(:tomorrows_blog)  { Blog.new author: 'author', title: 'title', content: 'content', date: tomorrow }
      let(:blogs)           {[yesterdays_blog, todays_blog, tomorrows_blog]}
      
      it 'can find blogs written on a given date' do
        blogs.each &in_memory.method(:add_blog)
        in_memory.blogs_written_on(yesterday).should == [yesterdays_blog]
        in_memory.blogs_written_on(today).should == [todays_blog]
        in_memory.blogs_written_on(tomorrow).should == [tomorrows_blog]
      end
    end
  end
end