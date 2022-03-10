class AdviceService

  def initialize
    @conn = connect
  end

  def connect
     Faraday.new("https://api.adviceslip.com")
  end

  

end