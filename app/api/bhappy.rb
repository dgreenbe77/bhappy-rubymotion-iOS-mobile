class Bhappy

  def get_posts(&callback)
    email = App::Persistence['email']
    url = "http://localhost:3000/happy.json" #"http://bhappy.herokuapp.com/happy.json"
    AFMotion::JSON.get(url, email: email) do |result|
      callback.call result.object
    end
  end

end
