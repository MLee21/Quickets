# Quickets

##https://quickets.herokuapp.com

Quickets is a web application that uses Gmail Oauth for login and consumes the Bands in Town API and based off of a user's reverse geolocation, it will give you the nearby events where you can then purchase tickets directly. This was a self-directed project and involved many different technologies. Below were a few challenges and a glimpse at the process. 


#Challenges
  # Bands in Town API
    # Although there are worse, the Bands in Town API has not been very kind. The documentation led me to believe that you can pass latitude and longitude as a paramater for location, but you cannot. This led to:
      ## Reverse Geocoding involving an ajax request to get a user's latitude and longitude and use the google maps api to reverse geocode the data to return a city and state via javascript.

      ## This also involved posting the data to my session making it accessible to my other controllers before passing it to the API url endpoint.

      ## Another step that was included was to take the state and fetch the abbreviation from a large hand-made hash, because Bands in Town will not allow you to pass in a state's full name.

  # The Asset Pipeline
    # learning how to use helpers involved in maintaining and compiling the asset pipeline

  # Test External APIs
    # using webmock and vcr

  # Foundation
    # using Foundation and the SASS library

  # UX
    # making sure to keep in mind the user experience.

