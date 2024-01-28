// get the elements from the document
const form = document.getElementById("form");
const firstName = document.getElementById("firstname");
const lastName = document.getElementById("lastname");
const userName = document.getElementById("username");
const email = document.getElementById("email");
const phone = document.getElementById("phone");

// add submit eventlistener to form element
form.addEventListener("submit", (e) => {
  e.preventDefault();

  // function to validate form fields
  validateForm();
});

// type of messages for individual form fields
const messageType = {
  ERROR: "ERROR",
  SUCCESS: "SUCCESS",
};

// set success or error message and css classes
const setMessage = (type, element, message = "") => {
  // get the parent element of input element
  const inputGroup = element.parentElement;

  // get the error element for above input
  const errorField = inputGroup.querySelector(".error__field");

  // set success or error
  switch (type) {
    case messageType.ERROR:
      errorField.innerText = message;
      inputGroup.classList.add("error");
      break;
    case messageType.SUCCESS:
    default:
      errorField.innerText = "";
      inputGroup.classList.remove("error");
      break;
  }
};

// check if the value is numric
const isNumeric = (num) => {
  return !isNaN(num - parseFloat(num));
};

// check if the email is valid
const isValidEmail = (val) => {
  return val.match(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/);
};

// validate form fields function
const validateForm = () => {
  // get value of all the form fields
  const firstNameValue = firstName.value.trim();
  const lastNameValue = lastName.value.trim();
  const userNameValue = userName.value.trim();
  const emailValue = email.value.trim();
  const phoneValue = phone.value.trim();

  // is forrm valid variable
  let isFormValid = true;

  // check first name field for error and success
  if (firstNameValue === "") {
    setMessage(messageType.ERROR, firstName, "First Name is required");
    isFormValid = false;
  } else {
    setMessage(messageType.SUCCESS, firstName);
  }

  // check last name field for error and success
  if (lastNameValue === "") {
    setMessage(messageType.ERROR, lastName, "Last Name is required");
    isFormValid = false;
  } else {
    setMessage(messageType.SUCCESS, lastName);
  }

  // check user name field for error and success
  if (userNameValue === "") {
    setMessage(messageType.ERROR, userName, "User Name is required");
    isFormValid = false;
  } else if (userNameValue.length < 3 || userNameValue > 20) {
    setMessage(
      messageType.ERROR,
      userName,
      "User Name should contain 3-20 characters"
    );
    isFormValid = false;
  } else {
    setMessage(messageType.SUCCESS, userName);
  }

  // check email field for error and success
  if (emailValue === "") {
    setMessage(messageType.ERROR, email, "Email is required");
    isFormValid = false;
  } else if (!isValidEmail(emailValue)) {
    setMessage(messageType.ERROR, email, "Email is invalid");
    isFormValid = false;
  } else {
    setMessage(messageType.SUCCESS, email);
  }

  // check phone number field for error and success
  if (phoneValue === "") {
    setMessage(messageType.ERROR, phone, "Phone Number is required");
    isFormValid = false;
  } else if (phoneValue.length !== 10) {
    setMessage(
      messageType.ERROR,
      phone,
      "Phone number should contain 10 digits"
    );
    isFormValid = false;
  } else if (!isNumeric(phoneValue)) {
    setMessage(
      messageType.ERROR,
      phone,
      "Phone number should only contain digits"
    );
    isFormValid = false;
  } else {
    setMessage(messageType.SUCCESS, phone);
  }

  if (isFormValid) {
    // form is valid and can be submitted
    alert("Form Submitted");
  }
};
