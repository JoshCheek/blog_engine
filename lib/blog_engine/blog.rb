class BlogEngine
  class Blog
    class << self
      def attributes
        [:author, :title, :content, :date]
      end
    end
    
    attr_accessor :attributes
    
    def initialize(attributes={})
      self.attributes = attributes
    end
    
    attributes.each do |attribute|
      define_method(attribute)        { attributes[attribute] }
      define_method("#{attribute}=")  { |value| attributes[attribute] = value }
    end
    
    def ==(blog)
      self.class.attributes.all? { |attribute| send(attribute) == blog.send(attribute) }
    end
  end
end
