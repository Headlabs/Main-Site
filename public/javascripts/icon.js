$('.lightsaber-button').click(function() {
    var blur_attr = {
      "-webkit-filter": "blur(2px)",
      "-moz-filter": "blur(2px)",
      "-ms-filter": "blur(2px)",
      "-o-filter": "blur(2px)",
      "filter": "blur(2px)"
    };

    $('.wrapper > :not(".lightsaber")').css(blur_attr)

});