document.getElementById('dynamic-form').addEventListener('submit', function(event) {
    //event.preventDefault(); // Prevent form submission

    const answersTextArea = document.getElementById('answers');
    answersTextArea.value = ''; // Clear previous answers

    const formElements = event.target.elements;
    for (let i = 0; i < formElements.length; i++) {
        const element = formElements[i];
        if (element.type === 'text' || element.type === 'checkbox' || element.type === 'radio') {
            if (element.type === 'checkbox' || element.type === 'radio') {
                if (element.checked) {
                    answersTextArea.value += `${element.name}: ${element.value}\n`;
                }
            } else {
                answersTextArea.value += `${element.name}: ${element.value}\n`;
            }
        }
    }
});