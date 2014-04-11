class Post < UIView
  include PM::Styling

  def self.new
    post = alloc.initWithFrame(CGRectZero)
    post
  end

  # def initWithFrame(frame)
  #   super
  #   set_attributes self, {
  #     background_color: hex_color("F6F6F6"),
  #     layer: {
  #       shadow_radius: 4.0,
  #       shadow_opacity: 0.4,
  #       shadow_color: UIColor.blackColor.CGColor,
  #       frame: [[  18,  90 ], [ 285, 400 ]]
  #     }
  #   }
  #   self
  # end
end
