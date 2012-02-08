This is a proof of concept for a blog engine which tries to avoid making assumptions.
-------------------------------------------------------------------------------------

Assumptions it tries to avoid making would be delivery mechanism (Rails, Sinatra, CLI), persistence (in-memory, activerecord, any given data store).

The idea comes from [this](https://gist.github.com/1763643) gist.



Things that might make this better.
-----------------------------------

* The validators should probably receive the persister so that they can do things like check uniqueness

* It might be nice if the Validators module was a class which represents a collection of validators. This would allow you to create different collections for different contexts (admin validations vs regular user validations). Then instead of passing an array of validators, you pass an instance of Validators.

* I kind of don't like how the engine class itself mimics the persister interface. But then it does have its own behaviour (doesn't persist invalid info)

* I would like the BlogEngine#add_blog to return a result object instead of true/false. This object could then be queried like this:

.

    result = engine.add_blog invalid_blog
    result.should_not be_added
    result.errors_on(:author) # => :presence
    result.errors_on(:content) # => :too_short

I wanted to do this, but I wasn't really sure how the interface between the engine, validators, and result should go. (I still might attempt it later, but it's getting late)

* There should probably be some sort of blog building object which would convert date strings to Date objects.

* The content_exists validator should consider white space strings to be non-content.




MIT License
-----------

Copyright (c) 2012 Josh Cheek

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

