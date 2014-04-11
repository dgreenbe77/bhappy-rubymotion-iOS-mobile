class AddPost < PM::FormotionScreen
  title "Create Post"

  def on_load
    set_nav_bar_button :left, title: "Exit", action: :close_screen
  end

  def on_submit(form)
    data = form.render

    [['Title', :title], ['Address', :address]].each do |field|
      if data[field[1]].length > 50
        App.alert("#{field[0]} is too long")
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
      end
    end

    # app_delegate.posts << data
    close
  end

  def close_screen
    close
  end

  def table_data
    {
      sections: [
        {
        rows: [{
          title: "Title",
          key: :title,
          placeholder: "50 characters max",
          type: :string
        },{
          title: "Post",
          key: :main_post,
          type: :text,
          placeholder: "Enter your Content here...",
          row_height: 100
        },{
          title: "Address",
          key: :address,
          placeholder: "Enter your Address here",
          type: :string
        },{
          title: "Photo",
          key: :photo,
          type: :image,
          image: "camera",
          deletable: true
        }]
      }, {
        rows: [{
          title: "Make Post",
          type: :submit
        }]
      }]
    }
  end
end
