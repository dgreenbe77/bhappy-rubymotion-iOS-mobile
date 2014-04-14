class Bhappy
  EMAIL = App::Persistence['email']
  URL = "http://localhost:3000/world.json" #"http://bhappy.herokuapp.com/world.json"

  def now(&callback)
    AFMotion::JSON.get(URL, email: EMAIL) do |result|
      callback.call result.object
    end
  end
end
