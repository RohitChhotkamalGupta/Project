<!DOCTYPE html>
<html>
<head>
  <title>Generated Form</title>
  <style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
  }
  #answers {
    display: none;
  }
  #TimerLabel {
      margin-top:20px;
      margin-left: 10px;
      margin-right: 10px;
      font-size: 24px;
    }

    #timer {
      margin-left: 25px;
      font-size: 24px;
      display: flex;
      align-items: center;
    }
  #form-container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
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
	<input type="text" id = "formname" name="formname" value="MyForm1" hidden>
  
        <br>Question : <label for="add-label">Who is Currunt Prime Minister of india?</label><br>
      
        <input type="text" name="Current Prime Minister"><br>
      
        <br>Question : <label for="add-label">Who was first Prime minister of india?</label><br>
      
        <input type="radio" id = "Pandit Jawaharlal nehru" value="Pandit Jawaharlal nehru" name="First Prime minister">
        <label for="Pandit Jawaharlal nehru">Pandit Jawaharlal nehru</label><br>
      
        <input type="radio" id = "mahatma gandhi" value="mahatma gandhi" name="First Prime minister">
        <label for="mahatma gandhi">mahatma gandhi</label><br>
      
        <input type="radio" id = "netaji subhash chandra bose" value="netaji subhash chandra bose" name="First Prime minister">
        <label for="netaji subhash chandra bose">netaji subhash chandra bose</label><br>
      
        <input type="radio" id = "sardar vallabhbhai patel" value="sardar vallabhbhai patel" name="First Prime minister">
        <label for="sardar vallabhbhai patel">sardar vallabhbhai patel</label><br>
      
        <br>Question : <label for="add-label">india's independence year</label><br>
      
        <input type="text" name="1947"><br>
      
        <input type="text" name="1857"><br>
      
        <input type="text" name="1950"><br>
      
        <input type="text" name="1999"><br>
      
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

