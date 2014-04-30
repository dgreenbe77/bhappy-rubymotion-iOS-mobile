class AddPost < PM::FormotionScreen
  include PostStyles

  title "Create Post"

  def on_load
    set_attributes self.view, :main_view_style
    set_nav_bar_button :left, title: "Exit", action: :close_screen
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

  def on_submit(form)
    data = form.render

    [['Title', :title], ['Post', :main_post], ['Address', :address]].each do |field|
      if data[field[1]].length > 50 && field[0] != 'Post'
        App.alert("#{field[0]} is too long")
        open AddPost.new(nav_bar: true)
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
        open AddPost.new(nav_bar: true)
      end
    end

    url = "http://bhappy.herokuapp.com/world.json"
    email = App::Persistence['email']
    headers = { 'Content-Type' => 'application/json' }
    data = BW::JSON.generate({ email: email, title: form.render[:title], 
                                      main_post: form.render[:main_post],
                                      address: form.render[:address]
                                      })

    BW::HTTP.post(url, { headers: headers, payload: data } ) do |response|
      if response.status_description.nil?
        App.alert(response.error_message)
      else
        if response.ok?
          json = BW::JSON.parse(response.body.to_s)
          App.alert(json['info'])
          open PostList.new(nav_bar: true)
        elsif response.status_code.to_s =~ /40\d/
          App.alert("Post failed")
        else
          App.alert(response.to_s)
        end
      end
    end

  end

  def close_screen
    close
  end

end
