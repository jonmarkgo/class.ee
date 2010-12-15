$(document).ready(function() {
  var readButton = $("#read-button");
  var rateButton = $("#rate-button");
  var homeButtonContainer = $("#home-buttons");
  var readContainer = $("#home-find-rating");
  var rateContainer = $("#home-add-rating");
  var schoolInput = $("#school");
  var professorID = $("#professor-id");
  var professorInput = $("#professor");
  var ratingForm = $("#rating-form");
  var ratingTags = $("#professor_rating_tags");
  var ratingComments = $("#professor_rating_comments");

  readButton.click(function() {
    readButton.hide('blind','slow');
    rateButton.hide('blind','slow');
    readontainer.show('blind','slow');
  });
  rateButton.click(function() {
    readButton.hide('blind','slow');
    rateButton.hide('blind','slow');
    rateContainer.show('blind','slow');
  });
  
  ratingComments.focus(function() {
    if (ratingComments.val() == "Comment on your professor...") {
      ratingComments.val("");
    }
  });
  
  ratingComments.blur(function() {
    if (ratingComments.val() == "") {
      ratingComments.val("Comment on your professor...");
    }
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
  
  professorInput.focus(function() {
    if (professorInput.val() == "Start typing your professor's name...") {
      professorInput.val("");
    }
  });
  
  professorInput.blur(function() {
    if (professorInput.val() == "") {
      professorInput.val("Start typing your professor's name...");
    }
  });
 
  professorInput.autocomplete({
    source: "professors/school",
    minLength: 0,
    disabled: true,
    select: function( event, ui ) {
      professorInput.hide('blind','slow');
      professorID.val(ui.item.value);
      ratingForm.show('blind','slow');
      //ratingTags.autocomplete("enable");
    }
  });
  
ratingTags.tagit({
      availableTags: "professors/tags/search"
    });
    
  schoolInput.autocomplete({
    minLength: 0,
    source: "schools/search",
    focus: function( event, ui ) {
      schoolInput.val( ui.item.label );
      schoolInput.css("background-image", "url(images/schools/" + ui.item.value + ".jpg)" );
      return false;
    },
    select: function( event, ui ) {
      schoolInput.val( ui.item.label );
      schoolInput.css("background-image", "url(images/schools/" + ui.item.value + ".jpg)" );
      schoolInput.hide('blind','slow');
      professorInput.show('blind','slow');
      professorInput.autocomplete("option","source", "professors/school/" + ui.item.value);
      professorInput.autocomplete("enable");
      return false;
    }
  })
  .data( "autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li></li>" )
    .data( "item.autocomplete", item )
    .append( "<a>" + item.label + " - <i>" + item.state + "</i></a>" )
    .appendTo( ul );
  };
});