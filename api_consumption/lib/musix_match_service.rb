class MusixMatchService 
  def initialize
    @conn = connect
    @api_key = "a57caa0e6b229a901ff32a3d652e0423"
  end

  def connect 
    Faraday.new("https://api.musixmatch.com/ws/1.1/")
  end

  def music_genres 
    resp = @conn.get("music.genres.get?apikey=#{@api_key}")
    json = JSON.parse(resp.body, symbolize_names: false)
  end

  def tracks_from_artist(artist)
    resp = @conn.get("track.search?apikey=#{@api_key}&q_artist=#{artist}")
    json = JSON.parse(resp.body, symbolize_names: false)
  end
end