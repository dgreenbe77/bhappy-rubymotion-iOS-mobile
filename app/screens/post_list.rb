class PostList < PM::TableScreen
  refreshable
  title "Bhappy Posts"

  def table_data
    [{
      title: "",
      cells: Array(@posts)
    }]
  end

  def on_load
    on_refresh
  end

  def on_refresh
    Bhappy.new.now do |response|      
      @posts = response.map do |f|
        {
          title: f["title"],
          subtitle: f["main_post"]
        }

      # response["feed"].map do |f|
      #   {
      #     title: f["headline"],
      #     action: :tap_headline,
      #     arguments: { links: f["links"] }
      #   }
      end
      update_table_data
      stop_refreshing
    end
  end

end
