class Login < PM::FormotionScreen
  include PostStyles

  def on_load
    set_attributes self.view, :main_view_style
  end

  def table_data
    {
      sections: [{
        rows: [{
          title: "Email",
          key: :email,
          placeholder: "me@mail.com",
          type: :email,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Password",
          key: :password,
          placeholder: "required",
          type: :string,
          secure: true
        }],
      }, {
        rows: [{
          title: "Login",
          type: :submit,
        }]
      }]
    }
  end

  def on_submit(form)
    data = form.render

    [['Email', :email], ['Password', :password]].each do |field|
      if data[field[1]].length > 50
        App.alert("#{field[0]} is too long")
        open_modal Login.new(nav_bar: true)
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
        open_modal Login.new(nav_bar: true)
      end
    end

    App::Persistence['email'] = form.render[:email]
    App::Persistence['password'] = form.render[:password]
    open PostList.new(nav_bar: true)
  end

 
end
