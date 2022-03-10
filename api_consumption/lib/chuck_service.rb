class ChuckService 

  def initialize
    @conn = connect 
  end

  def connect
    Faraday.new("https://api.chucknorris.io")
  end

  def random
    resp = @conn.get("/jokes/random")
    json = JSON.parse(resp.body, sybolize_names: false)
  end


end