var recognition = new webkitSpeechRecognition();

var results_found = false

recognition.continuous = true;

recognition.interimResults = true;

recognition.onresult = function(event) { 
  var results = event.results[0][0];  

  if (results.confidence > 0.89 && !results_found) {
    $("#results").text(event.results[0][0].transcript) 
    
    
      $.get( "/get_video", {search_term: event.results[0][0].transcript}, function( data ) {
        $("#frame").attr("src", "http://www.youtube.com/embed/"+ data.video_ids[0] +"?rel=0&autoplay=1");
      });

  };
}  

recognition.onend = function() {
    recognition.start();
};

recognition.start();
