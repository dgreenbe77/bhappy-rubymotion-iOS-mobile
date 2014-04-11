class Guide < PM::Screen
  title "Guide"

  def on_load
    set_nav_bar_button :right, title: "Exit", action: :close_guide
    add Post.new
  end

  def view_did_load
    @label = add UILabel.new, {
      font: UIFont.systemFontOfSize(32),
      left: 20,
      top: 200,
      width: 280,
      height: 150,
      text_alignment: NSTextAlignmentCenter
    }
 end

 def will_appear
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }

    @label.text = "Siri Is Watching"
  end

  def close_guide
    close
  end
end
