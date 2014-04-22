# This is a simple, CSS-like way to style your application.
# You can set these attributes in your screens by using `add` or `set_attributes`
# and passing in the method you want to use.
#
# Example usage: `add UILabel.new, :label_view_style`

module PostStyles

  def main_view_style
    {
      background_color: hex_color("79daf3"),
      text_color: hex_color("79daf3")
    }
  end

  def global_label_style
    {
      # background_color: hex_color("FF6666"),
      layer: {
        shadow_radius: 4.0,
        shadow_opacity: 0.4,
        shadow_color: UIColor.blackColor.CGColor,
        frame: [[  18,  90 ], [ 285, 400 ]]
      }
    }
  end

end

 # text: "Enter Post:",
      # text_color: hex_color("8F8F8D"),
      # background_color: UIColor.blackColor,
# shadow_color: UIColor.blackColor,
      # text_alignment: UITextAlignmentCenter,
      # font: UIFont.systemFontOfSize(15.0),
      # resize: [ :left, :right, :bottom ],
      # frame: CGRectMake(10, 10, 300, 35)
      
# module PostListStyles
#   def label_view_style
#     {
#       text: "Welcome to ProMotion!",
#       text_color: UIColor.whiteColor,
#       background_color: UIColor.clearColor,
#       shadow_color: UIColor.blackColor,
#       number_of_lines: 0,
#       text_alignment: UITextAlignmentCenter,
#       font: UIFont.boldSystemFontOfSize(18.0),
#       resize: [ :left, :right, :top ], # ProMotion sugar here
#       frame: CGRectMake(10, 10, 300, 45)
#     }
#   end

#   def home_view_style
#     {
#       background_color: UIColor.grayColor
#     }
#   end
# end
