$(document).ready(function() {
  var readButton = $("#read-button");
  var rateButton = $("#rate-button");
  var homeButtonContainer = $("#home-buttons");
  var readContainer = $("#home-find-rating");
  var rateContainer = $("#home-add-rating");
  var schoolInput = $("#school");
  var professorID = $("#rating_form_professor_id");
  var courseID = $("#rating_form_course_id");
  var professorInput = $("#professor");
  var ratingForm = $("#rating_form");
  var ratingTags = $("#rating_form_tags");
  var ratingComments = $("#rating_form_comments");
  var ratingCourse = $("#auto_course");
  var ratingPhoto = $("#professor_rating_photo");
  var ratingRightBox = $("#home-add-rating-right");
  var ratingSchool = $("#rating-school");
  var ratingRightProfessor = $("#rating-right-professor");
  var ratingTagCloud = $("#rating-tagcloud");
 ratingForm.bind('ajax:error', function(xhr, status, error) {
        var errortxt = $.parseJSON(status.responseText);
        for(var key in errortxt){
          $(".notice").append(key + " " + errortxt[key]);
        }
       
        
  });
  readButton.click(function() {
    readButton.hide('blind','slow');
    rateButton.hide('blind','slow');
    readontainer.show('blind','slow');
  });
  rateButton.click(function() {
    readButton.hide('blind','slow');
    rateButton.hide('blind','slow');
    rateContainer.show('blind','slow');
    schoolInput.autocomplete("enable");
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
  ratingCourse.focus(function() {
    if (ratingCourse.val() == "What course are you rating them for?") {
      ratingCourse.val("");
    }
  });
  
  ratingCourse.blur(function() {
    if (ratingCourse.val() == "") {
      ratingCourse.val("What course are you rating them for?");
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
      ratingCourse.autocomplete("option","source", "professors/" + ui.item.value + "/courses/search");
      ratingCourse.autocomplete("enable");
      ratingPhoto.attr("src", "images/professors/" + ui.item.value + ".jpg");
      ratingRightProfessor.html(ui.item.label);
      ratingTagCloud.load("professors/" + ui.item.value + "/tags/cloud",null,function() {
  $('#rating-tagcloud a').each(function(index, self) {
    $(self).click(function() {
      var el = "";
      el  = "<li class=\"tagit-choice\">\n";
      el += $(self).html() + "\n";
      el += "<a class=\"close\">x</a>\n";
      el += "<input type=\"hidden\" style=\"display:none;\" value=\""+$(self).html()+"\" name=\"item[tags][]\">\n";
      el += "</li>\n";
      if ($(".tagit-choice").length)
        $(".tagit-choice").last().after(el);
      else
        ratingTags.prepend(el);
      $(".tagit-input").val("");
    });
  });
  });

      ratingRightBox.show('blind','slow');
    }
  });

  ratingCourse.autocomplete({
    source: "professors/course",
    minLength: 0,
    disabled: true,
    select: function( event, ui ) {
      ratingCourse.val(ui.item.label);
      courseID.val(ui.item.value);
      return false;
    }
  });
  

  ratingTags.tagit({
    availableTags: "professors/tags/search"
  });
    
  schoolInput.autocomplete({
    minLength: 0,
    disabled: true,
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
      ratingSchool.html(ui.item.label);
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