require 'blog_engine/validators/always_valid'

class BlogEngine
  module Validators
    describe AlwaysValid do
      it 'everything is considered valid' do
        [1,2,nil,false,true,Object.new].each do |abysmally_invalid_blog|
          described_class.new(abysmally_invalid_blog).should be_valid
        end
      end
    end
  end
end