// DOM elements
let usernameInput = document.getElementById("usernameInput");
let submitButton = document.getElementById("submitButton");
let greetingMessage = document.getElementById("greeting-message");
let displaySelection = document.getElementById("destination-selection");
let resultOutcome = document.getElementById("result");
let itineraryOutcome = document.getElementById("itinerary");
let countryButton = document.getElementById("country-Button");

// creating a  greeting message function to display a personalised string
function greetingUsername() {
    const username = usernameInput.value;
    if (username){
    greetingMessage.innerHTML = `Welcome, ${username} ! <p>We're so happy to have you on board.</p>`;
      displaySelection.style.display = 'block'; // used style.display to show the destination options in the HTML div with style=display
    } else { greetingMessage.innerHTML = "Oops, forgetting anything?";
           }
}

// adding event listener to submit button to trigger the greeting function
submitButton.addEventListener("click", greetingUsername);

// creating an object with an array of destinations for each country
let itinerary = {
    thailand: ["Bangkok", "Chiang Mai", "Krabi Island"],
    california: ["Yosemite National Park", "Los Angeles", "San Francisco"],
    tanzania: ["Mount Kilimanjaro", "Mweka Village", "Materuni Waterfalls"]
};

// function to collect the user's radio button selection and adding a variable for the selected country
function userSelection() {
    let radioButtons = document.getElementsByClassName("item");
    let selectedCountry = ""; 

    // find the checked radio one by creating a loop
    for (let i = 0; i < radioButtons.length; i++) {
        if (radioButtons[i].checked) {
            selectedCountry = radioButtons[i].value; // the checked radio button is now stored 
            break; // to stop the loop once condition is met
        }
    }

    // Check if a valid country was selected
    if (selectedCountry) { 
        resultOutcome.innerHTML = `${selectedCountry.toUpperCase()} here I come! <p>What would you like to explore there?</p>`;
        getItinerary(selectedCountry);
    }  else {
       console.log(alert("Select a destination first")); //using console log to create an alert when button is pressed without the destination being selected
    }
}

// now i will get intinerary from the selected country and use an array to track selected destinations
function getItinerary(selectedCountry) {
    itineraryOutcome.innerHTML = ""; 
    let selectedDestinations = []; 

    itinerary[selectedCountry]?.forEach(function(destination) {
        let checkbox = document.createElement("input"); // create checkboxes by declaring the type value and id
        checkbox.type = "checkbox";
        checkbox.value = destination;
        checkbox.id = destination;
            
        let label = document.createElement("label"); //creating a label for the checkbox
        label.htmlFor = destination; // now linking label element to the checkbox with id=destination 
        label.textContent = destination; // to insert text in html content 

        // using appendchild to append the checkbox and label to the outcome, and adding a line break after each checkbox
        itineraryOutcome.appendChild(checkbox);
        itineraryOutcome.appendChild(label);
        itineraryOutcome.appendChild(document.createElement("br")); 
     itineraryOutcome.appendChild(document.createElement("br")); //adding two line breaks for improved UX
    });

    // creating a new button to submit selected destinations
    let summaryButton = document.createElement("button");
    summaryButton.textContent = "Summary";
 summaryButton.style.backgroundColor = "#94b8b8";
summaryButton.style.color = "#33333";
summaryButton.style.padding = "12px 25px";
summaryButton.style.border = "1px";
summaryButton.style.borderRadius = "8px";
summaryButton.style.cursor = "pointer";
    summaryButton.addEventListener("click", getSelectedDestinations);
    itineraryOutcome.appendChild(summaryButton); // adding the button after checkboxes
}


    // loop through all checkboxes and check which ones are selected:
   function getSelectedDestinations() {
    let checkboxes = itineraryOutcome.getElementsByTagName("input"); // Get all checkboxes
    let selected = []; // array to store selected destinations
    let isAnySelected = false; //  track if any checkbox is selected
    let i = 0; // index for while loop

    //using a while loop to go trough checkboxes, using push method to append the value to the selected array, ensuring at least one checkbox is checked
     
    while (i < checkboxes.length) {  
        let checkbox = checkboxes[i]; 
        if (checkbox.type === "checkbox" && checkbox.checked) {
            selected.push(checkbox.value); 
            isAnySelected = true; 
        }

        i++; // increment index to move to the next checkbox
    }
//condition is at least one checkbox is selected, then display the intinerary, and using the join method (with and inbetween) to display the alert with the intinerary
     
    if (isAnySelected) {      
        alert(selected.join(" and ") + " added to your itinerary🎉. Go to checkout or continue adding?"); 
    } else {
        alert("Select at least one destination");
    }
}

  

countryButton.addEventListener("click", userSelection);// attaching an event listener to the button

document.body.style.backgroundColor ="white"; //styling the background from javascript