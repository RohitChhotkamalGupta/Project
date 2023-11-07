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
<center><h1><u>ArpitForm</u></h1></center><br>
<div id="TimerLabel">Time Left</div>
<div id="timer"></div>
<form id="dynamic-form" action="/ProjectBackup/ResponceController" method="post">
 <div id="form-container">
  <%String quizattempter = request.getParameter("quizattempter"); %>
	<input type="text" id = "quizattempter" name="quizattempter" value="<%=quizattempter%>" hidden>
	<input type="text" id = "formname" name="formname" value="ArpitForm" hidden>
  <br>Question 1 : <label for="add-label">Who teaches us ws.</label><br><input type="radio" id = "Mahesh" value="Mahesh" name="wsteacher">
        				<label for="Mahesh">Mahesh</label><br><input type="radio" id = "Girish" value="Girish" name="wsteacher">
        				<label for="Girish">Girish</label><br><input type="radio" id = "Sujitha" value="Sujitha" name="wsteacher">
        				<label for="Sujitha">Sujitha</label><br><input type="radio" id = "Sidhhi" value="Sidhhi" name="wsteacher">
        				<label for="Sidhhi">Sidhhi</label><br>
  <br>
  <script src="answer.js"></script><br><br>
  <center><input type="submit"/></center><br>
  <textarea id="answers" name="answers" rows="10" cols="50" readonly></textarea>
 </div> 
</form>
<script>
  var countdownTime = 1800;
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

