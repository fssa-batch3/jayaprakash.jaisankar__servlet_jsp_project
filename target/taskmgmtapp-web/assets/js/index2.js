let arrow = document.querySelectorAll(".arrow");
for (var i = 0; i < arrow.length; i++) {
  arrow[i].addEventListener("click", (e) => {
    let arrowParent = e.target.parentElement.parentElement; 
       arrowParent.classList.toggle("showMenu");
  });
}

let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".bx-menu");
console.log(sidebarBtn);
sidebarBtn.addEventListener("click", () => {
  sidebar.classList.toggle("close");
});

document.getElementById("taskForm").addEventListener("submit", function (event) {
    event.preventDefault(); // Prevent the default form submission

    // Get the form data
    const formData = new FormData(this);

    // Prepare the template parameters using form data
    const templateParams = {
        taskname: formData.get("taskname"),
        taskdetails: formData.get("taskdetails"),
        taskcategory: formData.get("taskcategory"),
        taskdue: formData.get("taskdue"),
        taskassignee: formData.get("taskassignee"),
        taskstatus: formData.get("taskstatus"),
        projectname: formData.get("projectname"),
        taskpriority: formData.get("taskpriority"),
        tasktags: formData.get("tasktags"),
        // Add more fields as needed
    };

    // Send the email using email.js (no need to specify user ID)
    emailjs.send("service_1pzxrcb", "template_kixexnk", templateParams)
        .then(function (response) {
            console.log("Email sent successfully", response);
            // Show a success alert to the user
            alert("Email sent successfully");
            
            // Optionally, you can redirect the user to a thank you page.
            // window.location.href = "thankyou.html";
        })
        .catch(function (error) {
            console.error("Email sending failed", error);
            // Show an error alert to the user
            alert("Email sending failed. Please try again later.");
        });
});



fetch("/getAllUsers") 
  .then((response) => response.json())
  .then((userData) => {
	    console.log(userData);

    const findUser = userData.find((user) => user.email == todoLogin);
    console.log(findUser);

    document.getElementById("profile_pic").src = findUser["profile_pic"];
    document.getElementById("profile_name").innerText = findUser["name"];
  })
  .catch((error) => {
    console.error("Error fetching user data:", error);
  });




// add task div open
let addtask = document.getElementById("addtask");
addtask.addEventListener("click", (event) => {
  event.preventDefault();
  document.getElementById("popupOverlay").style.display = "block";
});

// cancel task
let closetask = document.getElementById("closePopup");
closetask.addEventListener("click", (event) => {
  event.preventDefault();
  document.getElementById("popupOverlay").style.display = "none";
});



// add task
// add colors according to the priority
for (let i = 0; i < findUser["mytodos"].length; i++) {
  const todo = findUser["mytodos"][i];
  const priority = todo.taskpriority;

  console.log(priority);

  const element = document.getElementById(`bx-circle-${i}`);
  const tododiv = document.getElementById(`tododiv-${i}`);

  if (priority === "High") {
    element.classList.add("red");
    tododiv.classList.add("lightred");
  } else if (priority === "Medium") {
    element.classList.add("yellow");
    tododiv.classList.add("lightyellow");
  } else if (priority === "Low") {
    element.classList.add("green");
    tododiv.classList.add("lightgreen");
  }
}

let selectfilter = document.getElementById("filter");
selectfilter.addEventListener("change", (event) => {
  event.preventDefault();

  let selectfiltervalue = document.getElementById("filter").value;
  console.log(selectfiltervalue);

  document.getElementById("searchbarfilter").style.display = "block";
  document.getElementById("searchicon").style.display = "block";

  if (selectfiltervalue === "Based On Category") {
    document.getElementById("searchbarfilter").placeholder =
      "Search Category : Academic Tasks";
  } else if (selectfiltervalue === "Based On Assignee") {
    document.getElementById("searchbarfilter").placeholder =
      "Search Assignee : JP@gmail.com";
  } else if (selectfiltervalue === "Based On Status") {
    document.getElementById("searchbarfilter").placeholder =
      "Search Status : Completed";
  } else if (selectfiltervalue === "Based On Priority") {
    document.getElementById("searchbarfilter").placeholder =
      "Search Priority : High";
  } else if (selectfiltervalue === "Based On Tags") {
    document.getElementById("searchbarfilter").placeholder =
      "Search Tags : #Project #Presentation";
  }
});
