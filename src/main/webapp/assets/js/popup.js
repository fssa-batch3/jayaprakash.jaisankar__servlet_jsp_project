/**
 * 
 */// Get the "Add project task" button and the popup overlay
const addTaskButton = document.getElementById("addtask");
const popupOverlay = document.getElementById("popupOverlay");

// Show the popup when the button is clicked
addTaskButton.addEventListener("click", () => {
  popupOverlay.style.display = "block";
});

// Get the "Cancel" button inside the popup content
const closePopupButton = document.getElementById("closePopup");

// Hide the popup when the "Cancel" button is clicked
closePopupButton.addEventListener("click", () => {
  popupOverlay.style.display = "none";
});

// Get the form element
const form = document.getElementById("form");

// Handle the form submission
form.addEventListener("submit", (event) => {
  event.preventDefault();
  // Your form submission logic here

  // After form submission, hide the popup
  popupOverlay.style.display = "none";
});
