class BandsInTownService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://api.bandsintown.com")
  end

  def nearby_artists_at_events(location)
    response = connection.get("/events/search.json", {api_version: 2.0, app_id: "Quickets", location: location})
    response_body = parse(response.body)
    ArtistAtEvent.build_from_api_response(response_body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end