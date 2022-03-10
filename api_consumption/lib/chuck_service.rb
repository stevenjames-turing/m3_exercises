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

  def random_in_category(category)
    resp = @conn.get("/jokes/random?category=#{category}")
    json = JSON.parse(resp.body, sybolize_names: false)
  end

  def categories
    resp = @conn.get("/jokes/categories")
    json = JSON.parse(resp.body, sybolize_names: false)
  end

  def search(query)
    resp = @conn.get("/jokes/search?query=#{query}")
    json = JSON.parse(resp.body, sybolize_names: false)
  end

end