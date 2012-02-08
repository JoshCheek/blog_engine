class BlogEngine
  module Persisters
    
    # this would be initialized with active record configured such that
    # it could talk to whatever you were interested in (e.g. mysql, postgresql, etc)
    module ActiveRecord
      # ...
    end
  end
end