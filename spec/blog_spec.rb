require 'blog_engine'

class BlogEngine
  describe Blog do
    let(:author)      { 'Bob' }
    let(:title)       { 'some blog title' }
    let(:content)     { 'some blog content' }
    let(:date)        { Date.parse 'Tue Feb  7 21:05:59 CST 2012' }
    let(:attributes)  {{author: author, title: title, content: content, date: date}}
    let(:empty_blog)  { described_class.new }
    
    it "can be initialized with a hash of author, title, content, and date" do
      blog = Blog.new attributes
      attributes.each { |attribute, value| blog.send(attribute).should == value }
    end
        
    specify 'the class knows its attributes' do
      Blog.attributes.should == [:author, :title, :content, :date]
    end
    
    specify "the instance's attributes default to nil" do
      attributes.keys.each { |attribute| empty_blog.send(attribute).should be_nil }
    end
    
    it 'is equal to another blog if all attributes match' do
      described_class.new(attributes).should == described_class.new(attributes)
    end
    
    Blog.attributes.each do |attribute|
      it "can set and get the #{attribute}" do
        empty_blog.send "#{attribute}=", attribute
        empty_blog.send(attribute).should == attribute
      end
      
      it "is not equal to another blog if the #{attribute} does not match" do
        described_class.new(attributes).should_not == 
          described_class.new(attributes.merge attribute => 'different value')
      end
    end
  end
end