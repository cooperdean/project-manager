 $(document).ready(function () {

if ( $( "#signup" ).length ) {

  $('.header').hide();
  $('.navlink').hide();
  $('.footer').hide();

}

// NAVIGATION LINKS -- NAVBAR
$('.navlink').hover(function () {

  $(this).css('color', 'white');
  $(this).css('letter-spacing', '1px');
},function () {
  $(this).css('color', '#FBC93D');
  $(this).css('letter-spacing', '-1px');
});

// USERNAME LINKS ON INDEX PAGE
$('.indexlinks').hover(function () {

  $(this).css('color', '#FBC93D');
  $(this).css('letter-spacing', '2px');
},function () {
  $(this).css('color', 'white');
  $(this).css('letter-spacing', '1px');
});

// USERNAME LINKS ON PROJECT SHOW PAGE
$('.showlinks').hover(function () {

  $(this).css('color', 'white');
  $(this).css('letter-spacing', '2px');
},function () {
  $(this).css('color', '#FBC93D');
  $(this).css('letter-spacing', '1px');
});

// PENCIL BUTTON ON SHOW PAGE
$('#createtask').hover(function () {

  $(this).css('color', '#FBC93D');
},function () {
  $(this).css('color', '#2E2E2E');

});

$('#createtask').on('click', function () {

if ($('.swaptitle').text() == 'Incompleted Tasks') {
  $('.taskform').fadeToggle("slow");
}
else {
  $('.newcomment').fadeToggle("slow");
}

});

// + SIGN ON PROJECT SHOW PAGE
$('#menubar').hover(function () {

  $(this).css('color', '#FBC93D');
},function () {
  $(this).css('color', '#2E2E2E');

});

$('#arrowtoggle').click(function(){
    
    $(this).toggleClass('glyphicon-minus glyphicon-plus');
    $('#menudiscussion').fadeToggle('slow');
    $('#menutask').fadeToggle('slow');

});

$('#menudiscussion').hover(function () {

  $(this).css('color', '#FBC93D');
},function () {
  $(this).css('color', '#2E2E2E');

});

$('#menutask').hover(function () {

  $(this).css('color', '#FBC93D');
},function () {
  $(this).css('color', '#2E2E2E');

});

$('#menudiscussion').on('click', function () {

  $('.taskform').fadeOut('slow');
  $('.tasklist').fadeOut("slow");
  $('.disscusionlist').fadeIn("slow");
  $('.swaptitle').text('Discussion');

});

$('#menutask').on('click', function () {

  $('.newcomment').fadeOut('slow');
  $('.tasklist').fadeIn("slow");
  $('.disscusionlist').fadeOut("slow");
  $('.swaptitle').text('Incompleted Tasks');

});

// PROGRESSION BAR MATH


var tasktotal = ($('.indtask').size())+($('.indtask-done').size());
var progression = (($('.indtask-done').size()) / tasktotal)*100 || 0;

// PROGRESS BAR
$('.progress-bar').css("width", progression + "%");
$('.progress-bar').text(progression.toFixed(2) + "% of all tasks completed");

// PROGRESS CIRCLE TEXT
if (progression < 10) {
  $('#circletext').text(progression.toFixed(1) + "%");
  $('#circletext').css('margin-left', '-10px')
}
else if (progression == 100) {
  $('#circletext').css('font-size', '63px')
  $('#circletext').text("done");
}
else {
  $('#circletext').text(progression.toFixed(0) + "%");
}
// PROGRESS CIRCLE (USING PLUGIN)

$('.circle').circleProgress({
        value: (progression/100),

        size: 200,
        fill: {
            color: ["#FBC93D"]
        }
});


});