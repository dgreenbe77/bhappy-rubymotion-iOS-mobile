class Login < PM::FormotionScreen
  # API_LOGIN_ENDPOINT = "http://localhost:3000/api/v1/sessions.json"

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
    # form.on_submit do
    #   App::Persistence['email'] = form.render[:email]
    #   close
    #   # self.navigationController.dismissModalViewControllerAnimated(true)
    #   # open PostList.new(nav_bar: true)
    #   # TasksListController.controller.refresh
    #   # self.login
    # end
    # super.initWithForm(form)
  end

  def on_submit(form)
    data = form.render

    [['Email', :email], ['Password', :password]].each do |field|
      if data[field[1]].length > 50
        App.alert("#{field[0]} is too long")
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
      end
    end

    App::Persistence['email'] = form.render[:email]

    # app_delegate.posts << data
    # close
    open PostList.new(nav_bar: true)
  end

  # def viewDidLoad
  #   super
  #   self.title = "Login"
  # end

  # def login
    # headers = { 'Content-Type' => 'application/json' }
    # data = BW::JSON.generate({ user: {
    #                              email: form.render[:email],
    #                              password: form.render[:password]
    #                             } })

    # # SVProgressHUD.showWithStatus("Logging in", maskType:SVProgressHUDMaskTypeGradient)
    # BW::HTTP.post(API_LOGIN_ENDPOINT, { headers: headers, payload: data } ) do |response|
    #   if response.status_description.nil?
    #     App.alert(response.error_message)
    #   else
    #     if response.ok?
    #       json = BW::JSON.parse(response.body.to_s)
    #       App::Persistence['authToken'] = json['data']['auth_token']
    #       App.alert(json['info'])
    #       self.navigationController.dismissModalViewControllerAnimated(true)
    #       TasksListController.controller.refresh
    #     elsif response.status_code.to_s =~ /40\d/
    #       App.alert("Login failed")
    #     else
    #       App.alert(response.to_s)
    #     end
    #   end
    #   # SVProgressHUD.dismiss
    # end
  # end
end
