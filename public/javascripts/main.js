var recognition = new webkitSpeechRecognition();
recognition.continuous = true;
recognition.interimResults = true;
recognition.onresult = function(event) { 
  var results = event.results[0][0]  

  console.log(results.confidence)
  if (results.confidence > 0.70) {
    $("#results").text(event.results[0][0].transcript) 
    
    //recognition.stop();
  }  
}
recognition.start();