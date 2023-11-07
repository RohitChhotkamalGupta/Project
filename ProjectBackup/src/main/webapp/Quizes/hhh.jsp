<!DOCTYPE html>
<html>
<head>
  <title>Generated Form</title>
  <style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #00008B;
  }
  #answers {
    display: none;
  }
  #TimerLabel {
	  color:white;
      margin-top:20px;
      margin-left: 10px;
      margin-right: 10px;
      font-size: 24px;
    }

    #timer {
	  color:white;
      margin-left: 25px;
      font-size: 24px;
      display: flex;
      align-items: center;
    }
  #form-container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ADD8E6;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  #form-container h1 {
    margin-top: 0;
  }

  #form-container button {
    margin-right: 10px;
  }

  #form-container textarea {
    width: 100%;
    height: 300px;
    resize: vertical;
  }
</style>
</head>
<body>
<div id="TimerLabel">Time Left</div>
<div id="timer"></div>
<form id="dynamic-form" action="/ProjectBackup/ResponceController" method="post">
 <div id="form-container">
  <%String quizattempter = request.getParameter("quizattempter"); %>
	<input type="text" id = "quizattempter" name="quizattempter" value="<%=quizattempter%>" hidden>
	<input type="text" id = "formname" name="formname" value="FirstPerfectForm" hidden>
  
        <br>Question 3 : <label for="add-label">First Question</label><br>
        <input type="radio" id = "option 1" value="option 1" name="First Question">
        <label for="option 1">option 1</label><br>
      
        <input type="radio" id = "option 2" value="option 2" name="First Question">
        <label for="option 2">option 2</label><br>
      
        <input type="radio" id = "option 3" value="option 3" name="First Question">
        <label for="option 3">option 3</label><br>
      
        <input type="radio" id = "option 4" value="option 4" name="First Question">
        <label for="option 4">option 4</label><br>
      
        <input type="radio" id = "option 5" value="option 5" name="First Question">
        <label for="option 5">option 5</label><br>
      
        <br>Question 4 : <label for="add-label">Second Question</label><br>
        <input type="checkbox" name="op1">
        <label>op1</label><br>
      
        <input type="checkbox" name="op2">
        <label>op2</label><br>
      
        <input type="checkbox" name="op3">
        <label>op3</label><br>
      
        <input type="checkbox" name="op4">
        <label>op4</label><br>
      
        <input type="checkbox" name="op5">
        <label>op5</label><br>
      
  <br>
  <script src="answer.js"></script><br><br>
  <center><input type="submit"/></center><br>
  <textarea id="answers" name="answers" rows="10" cols="50" readonly></textarea>
 </div> 
</form>
<script>
  var countdownTime = 660;
  var timerDisplay = document.getElementById('timer');
  var countdownInterval = setInterval(function () {
    var minutes = Math.floor(countdownTime / 60);
    var seconds = countdownTime % 60;
    var minutesStr = minutes < 10 ? '0' + minutes : minutes;
    var secondsStr = seconds < 10 ? '0' + seconds : seconds;

    timerDisplay.textContent = minutesStr + ':' + secondsStr;
    if (countdownTime <= 0) {
      clearInterval(countdownInterval);
      timerDisplay.textContent = 'Time Expired';
      document.getElementById('dynamic-form').submit();
    } else {
      countdownTime--;
    }
  }, 1000);
</script>
 
</body>
</html>

