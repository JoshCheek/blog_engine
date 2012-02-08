require 'blog_engine'
require 'blog_engine/validators/all'
require 'blog_engine/persisters/mock_persister'

describe BlogEngine do
  let(:persister)                 { BlogEngine::Persisters::MockPersister.new }
  let(:always_valid_engine)       { described_class.new persister:  persister, validators: [BlogEngine::Validators::AlwaysValid] }
  let(:always_invalid_engine)     { described_class.new persister:  persister, validators: [BlogEngine::Validators::AlwaysInvalid] }
  let(:no_validator_engine)       { described_class.new persister:  persister }
  let(:valid_and_invalid_engine)  { described_class.new persister:  persister, validators: [BlogEngine::Validators::AlwaysValid, BlogEngine::Validators::AlwaysInvalid] }
  let(:engine)                    { no_validator_engine }
  let(:blogs)                     { [double('blog1'), double('blog2')] }
  let(:blog)                      { double 'Blog' }
  
  describe 'blog validity' do
    specify 'everything is considered valid when initialized without validators' do
      no_validator_engine.should be_valid blog
    end
    
    specify 'if any validators fail, the blog is not valid' do
      valid_and_invalid_engine.should_not be_valid blog
    end
  end
  
  describe '#add_blog' do
    context 'when blog is valid' do
      it 'tells the persister to add the blog' do
        always_valid_engine.add_blog blog
        persister.should have_been_told_to_add blog
      end
    end
    
    context 'when blog is invalid' do
      it 'does not tell the persister to add the blog' do
        always_invalid_engine.add_blog blog
        persister.should_not have_been_told_to_add blog
      end
    end
  end
  
  describe '#blog_written_on' do
    let(:date)  { double 'some date' }
    
    it 'gets the blogs from the persister' do
      persister.will_return(blogs)
      engine.blogs_written_on(date).should == blogs
      persister.should have_been_asked_for_blogs_written_on date
    end
  end
  
  describe '#all_blogs' do
    it 'gets all the blogs from the persister' do
      persister.will_return(blogs)
      engine.all_blogs.should == blogs
      persister.should have_been_asked_for_all_blogs
    end
  end
end