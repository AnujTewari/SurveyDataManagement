$(document).ready(function(){
  var question_order_counter = 0;
  $('.takeSurveyClass1').click(function(){
    var id = $(this).attr('id');
    var url = "http://localhost:3000/surveys/"+id+"/get_survey_object";
    console.log("Taking survey " + url);
    question_order_counter = 0;
    $.ajax({
      type: "GET",
      url: url, // should be mapped in routes.rb
      datatype: "json", // check more option
      async: true,
      success: function(data) {
        console.log("Success");
        console.log(data);
      },
      error: function(data){
        console.log("Failure");
        console.log(data);
      }
    });
  });
});
