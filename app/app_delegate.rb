class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    open Login.new(nav_bar: true)
    # open PostList.new(nav_bar: true)
  end

end
