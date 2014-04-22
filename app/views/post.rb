class Post < UIView
  include PM::Styling

  def self.new
    post = alloc.initWithFrame(CGRectZero)
    post
  end

end
