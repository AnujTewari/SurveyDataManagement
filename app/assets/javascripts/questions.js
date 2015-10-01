$(document).ready(function(){
    console.log("Hello");
    $('#createNewQuestionButton').click(function(){
	console.log("New Question Clicked");
	$("#createNewQuestionHeading").css("display","block");
	$("#newQuestionForm").css("display","block");
    });
});
