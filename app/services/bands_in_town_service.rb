class BandsInTownService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://api.bandsintown.com")
  end

  def get_artist_events(name)
    response = connection.get("/artists/#{name}/events.json?api_version=2.0&app_id=Quickets")
    response_body = parse(response.body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end