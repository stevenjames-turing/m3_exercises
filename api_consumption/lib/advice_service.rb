class AdviceService

  def initialize
    @conn = connect
  end

  def connect
     Faraday.new("https://api.adviceslip.com")
  end

  def random
    resp = @conn.get("/advice")
    json = JSON.parse(resp.body, symbolize_names: false)
  end

end