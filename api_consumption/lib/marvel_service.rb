class MarvelService 
  def initialize
    @conn = connect 
  end
  def connect 
    Faraday.new("https://gateway.marvel.com/")
  end

  def character(name)
    resp = @conn.get("/v1/public/characters?name=#{name}&ts=1&apikey=#{ENV["marvel_public_api_key"]}&hash=#{ENV["marvel_md5_key"]}")
    json = JSON.parse(resp.body, symbolize_names: false)
  end

  def creators(creator)
    if creator.keys == [:last_name]
      resp = @conn.get("/v1/public/creators?lastName=#{creator[:last_name]}&ts=1&apikey=#{ENV["marvel_public_api_key"]}&hash=#{ENV["marvel_md5_key"]}")
    elsif creator.keys == [:first_name]
      resp = @conn.get("/v1/public/creators?firstName=#{creator[:first_name]}&ts=1&apikey=#{ENV["marvel_public_api_key"]}&hash=#{ENV["marvel_md5_key"]}")
    end
    json = JSON.parse(resp.body, symbolize_names: false)
  end


end