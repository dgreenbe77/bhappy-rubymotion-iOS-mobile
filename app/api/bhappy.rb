class Bhappy

  def get_posts(&callback)
    email = App::Persistence['email']
    url = "http://bhappy.herokuapp.com/world.json"
    AFMotion::JSON.get(url, email: email) do |result|
      callback.call result.object
    end
  end

end
