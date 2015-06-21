(function () {
  angular.module("Quickets")
    .filter("artists", function (){
      return function(artists, artistName) {  
        return artists.filter(function (artist) {
          return artist.name.toLowerCase().match(artistName);
        });
      }
    })
})()