$(document).ready(function() {
  var readButton = $("#read-button");
  var rateButton = $("#rate-button");
  var homeButtonContainer = $("#home-buttons");
  var readContainer = $("#home-find-rating");
  var rateContainer = $("#home-add-rating");
  var schoolInput = $("#school");
  var schoolInputID = $("#school-id");
  
  readButton.click(function() {
    homeButtonContainer.hide('blind');
    readContainer.show('clip');
  });
  rateButton.click(function() {
    homeButtonContainer.hide('blind');
    rateContainer.show('drop');
  });
  
  schoolInput.focus(function() {
    if (schoolInput.val() == "Start typing your school's name...") {
      schoolInput.val("");
    }
  });
  
  schoolInput.blur(function() {
    if (schoolInput.val() == "") {
      schoolInput.val("Start typing your school's name...");
    }
  });
  
  schoolInput.autocomplete({
    minLength: 0,
    source: "schools/search",
    focus: function( event, ui ) {
      schoolInput.val( ui.item.label );
      return false;
    },
    select: function( event, ui ) {
      schoolInput.val( ui.item.label );
      schoolInputID.val( ui.item.value );
     // $( "#school-state" ).html( ui.item.state );
      schoolInput.css("background-image", "url(images/schools/" + ui.item.value + ".jpg)" );

      return false;
    }
  })
  .data( "autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li></li>" )
    .data( "item.autocomplete", item )
    .append( "<a>" + item.label + "<br>" + item.state + "</a>" )
    .appendTo( ul );
  };
});