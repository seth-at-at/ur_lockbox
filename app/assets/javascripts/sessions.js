function loginForm(e) {
  document.getElementsByClassName('create-user')[0].style.display = ""
}

$(document).ready(function(){
  $('#signup-button').on('click', loginForm)
})
