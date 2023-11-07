const formElements = [];
const formcreator = document.getElementById("formcreator");
console.log(formcreator);
updateFormPreview();

let myNumber = 1;


document.getElementById('add-label').addEventListener('click', function() {
	const newLabel = prompt('Enter Text for label');
	while (!newLabel) {
		if (!newLabel) {
			newLabel = prompt('Name is Required for Label');
		}
	}
	if (newLabel !== null) {
		formElements.push({ type: 'label', label: newLabel, id: 'add-label' });
		updateFormPreview();
	}
	
});


document.getElementById('add-checkbox').addEventListener('click', function() {
	const name1 = prompt('Enter name for this Check-box group');
	while (!name1) {
		if (!name1) {
			name1 = prompt('Name is Required for Check-box group');
		}
	}
	const n = prompt('How many radio buttons are there in this Check-Box Group');
	if (!isNaN(n)) {
		for (let i = 0; i < n; i++) {
			const newLabel = prompt('Enter Text for radiobutton');
			while (!newLabel) {
				if (!newLabel) {
					newLabel = prompt('Name is Required for Check-Box');
				}
			}
			if (newLabel !== null) {
				formElements.push({ type: 'checkbox', label: newLabel, value: newLabel });
				updateFormPreview();
			}
		}
	} else {
		console.log('Invalid input. Please enter a valid number.');
	}
});

document.getElementById('add-radiobutton').addEventListener('click', function() {
	const name1 = prompt('Enter name for this radio group');
	while (!name1) {
		if (!name1) {
			name1 = prompt('Name is Required for radio group');
		}
	}
	const n = prompt('How many radio buttons are there in this Radio Group');
	if (!isNaN(n)) {
		for (let i = 0; i < n; i++) {
			const newLabel = prompt('Enter Text for radiobutton');
			while (!newLabel) {
				if (!newLabel) {
					newLabel = prompt('Name is Required for radiobutton');
				}
			}
			if (newLabel !== null) {
				formElements.push({ type: 'radio', label: newLabel, name1: name1 });
				updateFormPreview();
			}
		}
	} else {
		console.log('Invalid input. Please enter a valid number.');
	}

});

document.getElementById('generate-form').addEventListener('click', function() {
	myNumber = 1;
	const formCode = generateFormCode();
	document.getElementById('form-preview').innerHTML = formCode;
	generateCode();
});

function updateFormPreview() {
	const preview = document.getElementById('form-preview');
	preview.innerHTML = '';

	formElements.forEach(element => {
		const elementDiv = document.createElement('div');
		elementDiv.textContent = element.label;
		preview.appendChild(elementDiv);
	});
}

function generateFormCode() {
	myNumber=1;
	if (document.getElementById("formname").value === "") {
		return "";
	}
	else {
		let formCode = '';

		formElements.forEach(element => {
			if (element.type === 'hiddentext') {
				formCode += `<input type="text" name="${element.label}",value="${element.label}" hidden><br>`;
			} else
				if (element.type === 'text') {
					formCode += `<input type="text" name="${element.label}"><br>`;
				} else if (element.type === 'checkbox') {
					formCode += `<input type="checkbox" name="${element.value}"> <label>${element.label}</label><br>`;
				} else if (element.type === 'label') {
					formCode += `<br>Question `+myNumber+` : <label for="${element.id}">${element.label}</label><br>`;
        			myNumber = myNumber + 1;
				}
				else if (element.type === 'radio') {
					formCode += `<input type="radio" id = "${element.label}" value="${element.label}" name="${element.name1}">
        				<label for="${element.label}">${element.label}</label><br>`;
				}
		});
		formCode += '';
		return formCode;
	}
}
function generateCode() {
	var minutes = document.getElementsByName("timeInput")[0]; 

	if (minutes) {
		var Seconds = parseInt(minutes.value) * 60;
	} else {
		console.error("Input element not found.");
	}
	formCode = generateFormCode();
	var time=document.getElementById("timeInput").value;
	if (formCode === ""||time==="") {
		alert("Enter proper formname and time");
	} else {		
		const formname = document.getElementById("formname").value ;
		const scriptCode = ``;
		const fullCode = `<!DOCTYPE html>
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
<center><h1><u>`+formname+`</u></h1></center><br>
<div id="TimerLabel">Time Left</div>
<div id="timer"></div>
<form id="dynamic-form" action="/ProjectBackup/ResponceController" method="post">
 <div id="form-container">
  <%String quizattempter = request.getParameter("quizattempter"); %>
	<input type="text" id = "quizattempter" name="quizattempter" value="<%=quizattempter%>" hidden>
	<input type="text" id = "formname" name="formname" value="${formname}" hidden>
  ${formCode}
  ${scriptCode}<br>
  <script src="answer.js"></script><br><br>
  <center><input type="submit"/></center><br>
  <textarea id="answers" name="answers" rows="10" cols="50" readonly></textarea>
 </div> 
</form>
<script>
  var countdownTime = `+ Seconds + `;
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
`;

		document.getElementById('code-preview').value = fullCode;
	}
}