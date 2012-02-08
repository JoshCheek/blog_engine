require 'blog_engine/validators/always_invalid'

class BlogEngine
  module Validators
    describe AlwaysInvalid do
      it 'everything is considered invalid' do
        [1,2,nil,false,true,Object.new].each do |abysmally_invalid_blog|
          described_class.new(abysmally_invalid_blog).should_not be_valid
        end
      end
    end
  end
end