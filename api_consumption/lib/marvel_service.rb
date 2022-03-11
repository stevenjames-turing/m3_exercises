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

  def creators(creator)
    if creator.keys == [:last_name]
      resp = @conn.get("/v1/public/creators?lastName=#{creator[:last_name]}&ts=1&apikey=#{@public_key}&hash=#{@md5}")
    elsif creator.keys == [:first_name]
      resp = @conn.get("/v1/public/creators?firstName=#{creator[:first_name]}&ts=1&apikey=#{@public_key}&hash=#{@md5}")
    end
    json = JSON.parse(resp.body, symbolize_names: false)
  end


end