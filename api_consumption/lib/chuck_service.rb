class ChuckService 

  def initialize
    @conn = connect 
  end

  def connect
    Faraday.new("https://api.chucknorris.io")
  end

 


end