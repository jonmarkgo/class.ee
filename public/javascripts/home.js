function resortRatings(rating)
{
  var votes = rating.attr("upvotes") - rating.attr("downvotes");
  var prevVotes = rating.prev().attr("upvotes") - rating.prev().attr("downvotes");
  var nextVotes = rating.next().attr("upvotes") - rating.next().attr("downvotes");

  if (votes > prevVotes && votes > nextVotes)
  {

    rating.insertBefore(rating.prev()).effect('bounce', null, 'fast');
  }
  if (votes < prevVotes && votes < nextVotes)
  {
    rating.insertAfter(rating.next()).effect('bounce', null, 'fast');
  }
}

function setupButtons()
{

  $(".votebuttons").buttonset();
  $(".votebuttons input").click(function ()
  {
    var self = $(this);
    if (self.attr('rating-up'))
    {
      $.post("professor_ratings/upvote/" + self.attr('rating-up'), null, function (data)
      {
        self.parent().attr("upvotes", data.professor_rating.upvotes);
        self.button(
        {
          label: data.professor_rating.upvotes + " +"
        })
        resortRatings(self.parent());
      });
    }
    if (self.attr('rating-down'))
    {
      $.post("professor_ratings/downvote/" + self.attr('rating-down'), null, function (data)
      {
        console.log(data.professor_rating);
        console.log(data.professor_rating.downvotes);
        self.parent().attr("downvotes", data.professor_rating.downvotes);
        self.button(
        {
          label: data.professor_rating.downvotes + " -"
        })
        resortRatings(self.parent());
      });

    }
  });
}

$(document).ready(function ()
{
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
  var ratingBox = $("#rating_box");
  var pastRatings = $("#past_ratings");


  ratingForm.bind('ajax:error', function (xhr, status, error)
  {
    var errortxt = $.parseJSON(status.responseText);
    $(".error").show("blind", "fast");
    for (var key in errortxt)
    {
      $(".error").append(key + " " + errortxt[key]);
    }


  });
  ratingForm.bind('ajax:success', function (xhr, status, error)
  {
    $(".error").html("");
    $(".error").hide("blind", "fast");
    $(".success").html("Rating added, shazam!");
    $(".success").show("blind", "fast");
    $(status).prependTo(pastRatings).effect("highlight", null, 'slow');
    $("#past_ratings:first-child").effect('highlight', null, 'slow');
    ratingComments.val("Comment on your professor...");
    ratingCourse.val("What course are you rating them for?");
    courseID.val("");
    ratingTags.html('<li class="tagit-new"><input class="tagit-input ui-autocomplete-input" type="text" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true" value="Tag your professor..."></li>');
    setupButtons();
  });

  if ($.cookie("classee_school")) {
    schoolInput.hide();
    professorInput.show();
  }

  ratingComments.focus(function ()
  {
    if (ratingComments.val() == "Comment on your professor...")
    {
      ratingComments.val("");
    }
  });

  ratingComments.blur(function ()
  {
    if (ratingComments.val() == "")
    {
      ratingComments.val("Comment on your professor...");
    }
  });

  schoolInput.focus(function ()
  {
    if (schoolInput.val() == "Start typing your school's name...")
    {
      schoolInput.val("");
    }
  });

  schoolInput.blur(function ()
  {
    if (schoolInput.val() == "")
    {
      schoolInput.val("Start typing your school's name...");
    }
  });

  professorInput.focus(function ()
  {
    if (professorInput.val() == "Start typing your professor's name...")
    {
      professorInput.val("");
    }
  });

  professorInput.blur(function ()
  {
    if (professorInput.val() == "")
    {
      professorInput.val("Start typing your professor's name...");
    }
  });
  ratingCourse.focus(function ()
  {
    if (ratingCourse.val() == "What course are you rating them for?")
    {
      ratingCourse.val("");
    }
  });

  ratingCourse.blur(function ()
  {
    if (ratingCourse.val() == "")
    {
      ratingCourse.val("What course are you rating them for?");
    }
  });


  professorInput.autocomplete(
  {
    source: "professors/school/" + $.cookie("classee_school"),
    minLength: 0,
  //  disabled: true,
    select: function (event, ui)
    {
      professorInput.hide('blind', 'fast');
      professorID.val(ui.item.value);

      ratingCourse.autocomplete("option", "source", "professors/" + ui.item.value + "/courses/search");
      ratingCourse.autocomplete("enable");
      ratingPhoto.attr("src", "images/professors/" + ui.item.value + ".jpg");
      ratingRightProfessor.html(ui.item.label);
      ratingTagCloud.load("professors/" + ui.item.value + "/tags/cloud", null, function ()
      {
        $('#rating-tagcloud a').each(function (index, self)
        {
          $(self).click(function ()
          {
            var el = "";
            el = "<li class=\"tagit-choice\">\n";
            el += $(self).html() + "\n";
            el += "<a class=\"close\">x</a>\n";
            el += "<input type=\"hidden\" style=\"display:none;\" value=\"" + $(self).html() + "\" name=\"item[tags][]\">\n";
            el += "</li>\n";
            if ($(".tagit-choice").length) $(".tagit-choice").last().after(el);
            else ratingTags.prepend(el);
            $(".tagit-input").val("");
          });
        });

      });
      pastRatings.load("professors/" + ui.item.value + "/ratings", null, function ()
      {
        ratingBox.show('blind', 'slow');
        pastRatings.show('blind', 'slow');
        setupButtons();
      });
    }
  });

  ratingCourse.autocomplete(
  {
    source: "professors/course",
    minLength: 0,
    disabled: true,
    select: function (event, ui)
    {
      ratingCourse.val(ui.item.label);
      courseID.val(ui.item.value);
      return false;
    }
  });


  ratingTags.tagit(
  {
    availableTags: "professors/tags/search"
  });

  schoolInput.autocomplete(
  {
    minLength: 0,
    source: "schools/search",
    focus: function (event, ui)
    {
      schoolInput.val(ui.item.label);
      schoolInput.css("background-image", "url(images/schools/" + ui.item.value + ".jpg)");
      return false;
    },
    select: function (event, ui)
    {
      schoolInput.val(ui.item.label);
      schoolInput.css("background-image", "url(images/schools/" + ui.item.value + ".jpg)");
      schoolInput.hide('blind', 'slow');
      professorInput.show('blind', 'slow');
      professorInput.autocomplete("option", "source", "professors/school/" + ui.item.value);
      professorInput.autocomplete("enable");
      ratingSchool.html(ui.item.label);
      $.cookie("classee_school",ui.item.value);
      return false;
    }
  }).data("autocomplete")._renderItem = function (ul, item)
  {
    return $("<li></li>").data("item.autocomplete", item).append("<a>" + item.label + " - <i>" + item.state + "</i></a>").appendTo(ul);
  };
});
