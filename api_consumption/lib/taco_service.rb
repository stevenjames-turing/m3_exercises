class TacoService
  def initialize
    @conn = connect
  end

  def connect
    Faraday.new("http://taco-randomizer.herokuapp.com")
  end

  # def random_ingredients
  #   resp = @conn.get("/random")
  #   json = JSON.parse(resp.body, symbolize_names: false)
  # end

  
end