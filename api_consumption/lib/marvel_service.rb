class MarvelService 
  def initialize
    @conn = connect 
    @public_key = "e77405aa0b1a98814cb6169c8beba643"
    @md5 = "6fe48b1161201a879022002cc4a0d4b2"
  end
  def connect 
    Faraday.new("https://gateway.marvel.com/")
  end

  def character(name)
    resp = @conn.get("/v1/public/characters?name=#{name}&ts=1&apikey=#{@public_key}&hash=#{@md5}")
    json = JSON.parse(resp.body, symbolize_names: false)
  end


end