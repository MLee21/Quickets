function trackArtistbutton () {
  $("add-artist").on('click', function (){
    var data = ;
    $.post('/tracked/artist', data, function(){

    })
  })
}