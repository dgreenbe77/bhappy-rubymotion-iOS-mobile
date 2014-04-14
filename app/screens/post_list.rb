class PostList < PM::TableScreen
  include PostStyles
  searchable placeholder: "Find a Post"
  refreshable callback: :on_refresh,
              pull_message: "Pull to update",
              refreshing: "Refresing posts…",
              updated_format: "Last updated at %s",
              updated_time_format: "%l:%M %p"
  title "Bhappy Posts"

  def table_data
    [{
      title: "",
      cells: Array(@posts)
    }]
  end

  def on_load
    on_refresh
    set_attributes self.view, :main_view_style
    button =  UIButton.buttonWithType(UIButtonTypeCustom)
    button.setImage(UIImage.imageNamed("guide"), forState:UIControlStateNormal)
    button.addTarget(self, action: :open_guide, forControlEvents:UIControlEventTouchUpInside)
    button.setFrame [[ 0, 0 ], [ 32, 32 ]]
    set_nav_bar_button :left, button: UIBarButtonItem.alloc.initWithCustomView(button)
    set_nav_bar_button :right, system_item: :add, action: :add_post
  end

  def logout
    open Login.new(nav_bar: true)
    # UIApplication.sharedApplication.delegate.on_load
  end

  def on_refresh
    Bhappy.new.get_posts do |response|
      unless response.nil?      
        @posts = response.map do |f|
          {
            title: f["title"],
            subtitle: f["main_post"],
            action: :open_posts,
            editing_style: :delete,
            arguments: { created_at: f["created_at"] }
          }
        end
      end
      update_table_data
      stop_refreshing
    end
  end

  def add_post
    open_modal AddPost.new(nav_bar: true)
  end

  def open_guide
    open_modal Guide.new(nav_bar: true)
  end

end
