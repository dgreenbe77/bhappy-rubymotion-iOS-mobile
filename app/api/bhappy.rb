class Bhappy
  # API_KEY = ""
  URL = "http://bhappy.herokuapp.com/world.json"

  def now(&callback)
    AFMotion::JSON.get(URL) do |result|
      callback.call result.object
    end
  end
end
