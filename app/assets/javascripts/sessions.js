function signupForm(e) {
  document.getElementsByClassName('create-user')[0].style.display = ""
  document.getElementsByClassName('login-user')[0].style.display = "none"
}

function loginForm() {
  document.getElementsByClassName('login-user')[0].style.display = ""
  document.getElementsByClassName('create-user')[0].style.display = "none"
}

$(document).ready(function(){
  $('#signup-button').on('click', signupForm)
  $('#login-button').on('click', loginForm)
})
