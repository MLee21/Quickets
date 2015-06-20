class BandsInTownService
  class ArtistAtEvent
    attr_reader :name, :event_venue, :event_date, :event_ticket_url

    def initialize(name:, event_venue:, event_date:, event_ticket_url:)
      @name = name
      @event_venue = event_venue
      @event_date = event_date
      @event_ticket_url = event_ticket_url
    end

    def event_date
      Date.parse(@event_date)
    end

    def self.build_from_api_response(response_body)
      response_body.flat_map do |event|
        event[:artists].map do |artist|
          ArtistAtEvent.new(
            name: artist[:name],
            event_venue: event[:venue][:name],
            event_date: event[:datetime],
            event_ticket_url: event[:ticket_url]
          ) 
        end
      end 
    end
  end
end