// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function screenshotIntervalReset()
{
  if ( window.screenshotInterval ) clearInterval( window.screenshotInterval );
  window.screenshotInterval = setInterval( function() {
    var selected = $(".screenshot.selected");
    if ( selected.length )
    {
      var next = false
      if ( !$(selected).is(":last") )
        next = $(selected).next();
      else
        next = $(".screenshot.first");
      $(next).click();

    }
  }, 6000);
}
screenshotIntervalReset();