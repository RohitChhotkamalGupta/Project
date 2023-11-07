<!DOCTYPE html>
<html>
<head>
  <title>Generated Form</title>
  <style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color:#00008B;
    height: 100vh;
  }
  h1{
	  color:white;
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
    background: linear-gradient(to bottom, #00FF00, #ffffff);
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
<center><h1><u>Indian Politics</u></h1></center><br>
<div id="TimerLabel">Time Left</div>
<div id="timer"></div>
<form id="dynamic-form" action="/ProjectBackup/ResponceController" method="post">
 <div id="form-container">
  <%String quizattempter = request.getParameter("quizattempter"); %>
	<input type="text" id = "quizattempter" name="quizattempter" value="<%=quizattempter%>" hidden>
	<input type="text" id = "formname" name="formname" value="undefined" hidden>
  
        <br>Question 1 : <label for="add-label">Who is Prime minister of india?</label><br>
        <input type="radio" id = "Narendra Modi" value="Narendra Modi" name="Prime Minister">
        <label for="Narendra Modi">Narendra Modi</label><br>
      
        <input type="radio" id = "Jawaharlal Nehru" value="Jawaharlal Nehru" name="Prime Minister">
        <label for="Jawaharlal Nehru">Jawaharlal Nehru</label><br>
      
        <input type="radio" id = "Indira Gandhi" value="Indira Gandhi" name="Prime Minister">
        <label for="Indira Gandhi">Indira Gandhi</label><br>
      
        <input type="radio" id = "Draupadi Murmu" value="Draupadi Murmu" name="Prime Minister">
        <label for="Draupadi Murmu">Draupadi Murmu</label><br>
      
        <br>Question 2 : <label for="add-label">Select Indian State.</label><br>
        <input type="checkbox" name="Uttar Pradesh">
        <label>Uttar Pradesh</label><br>
      
        <input type="checkbox" name="Bihar">
        <label>Bihar</label><br>
      
        <input type="checkbox" name="Mumbai">
        <label>Mumbai</label><br>
      
        <input type="checkbox" name="Maharashtra">
        <label>Maharashtra</label><br>
      
        <input type="checkbox" name="Goa">
        <label>Goa</label><br>
      
        <br>Question 3 : <label for="add-label">Is delhi capital of india?</label><br>
        <input type="radio" id = "Yes" value="Yes" name="isdelhicapital">
        <label for="Yes">Yes</label><br>
      
        <input type="radio" id = "No" value="No" name="isdelhicapital">
        <label for="No">No</label><br>
      
  <br>
  <script src="answer.js"></script><br><br>
  <center><input type="submit"/></center><br>
  <textarea id="answers" name="answers" rows="10" cols="50" readonly></textarea>
 </div> 
</form>
<script>
  var countdownTime = 600;
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

