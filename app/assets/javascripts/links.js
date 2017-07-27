function checkLinks() {
  let url = $('#url_input').val()
  let title = $('#title_input').val()

  if (url == "") {
    alert("Please fill in url")
  }else if (title == ""){
    alert("Please fill in title")
  }else {

    createLink(title, url)

    $.ajax({
      type: 'GET',
      url: "/links/new",
      data: {url: url, title: title},
      success: function() {

      },
      error: function() {
        return "Invalid URL"
      }
    });

}

function createLink(title, url) {
  let div = `<div class="link" id="link">
        Title: ${ title } <br> <br>
        URL: <a href="${url}">${url}</a> <br><br>
        <div id=.mark_ru">
          Read? false <br><br>
        </div>
        <button class="mark_starter"> Mark as Read </button>
        <button id=.unread" style="display:none;">Mark as Read</button>
        <button id="read" style="display:none;">Mark as Unread</button>
      </div>`
      // document.getElementsByClassName('Links')[0].createElement('div').innerHTML(div)
  $('#all_links')
    .append(div)
}

}

function markRead() {
  this.style.display = "none"
  let parent = this.parentElement
  $(`#${parent.id} .read`)[0].style.display = ""
  $(`#${parent.id} .mark_ru`)[0].innerHTML = `Read? true<br><br>`
  $.ajax({
    type: 'PUT',
    data: {read: "Read"},
    url: `/links/${parent.id}`
  })
}

function markUnread() {
  this.style.display = "none"
  let parent = this.parentElement
  $(`#${parent.id} .unread`)[0].style.display = ""
  $(`#${parent.id} .mark_ru`)[0].innerHTML = `Read? false<br><br>`

  $.ajax({
    type: 'PUT',
    data: {read: "Unread"},
    url: `/links/${parent.id}`
  })
}
function mark() {
  if (this.innerHTML == " Mark as Unread ") {
    this.style.display = "none"
    let parent = this.parentElement
    $(`#${parent.id} .unread`)[0].style.display = ""
    $(`#${parent.id} .mark_ru`)[0].innerHTML = `Read? false<br><br>`

    $.ajax({
      type: 'PUT',
      data: {read: "Unread"},
      url: `/links/${parent.id}`
    })
  }
  else {
    this.style.display = "none"
    let parent = this.parentElement
    $(`#${parent.id} .read`)[0].style.display = ""
    $(`#${parent.id} .mark_ru`)[0].innerHTML = `Read? true<br><br>`

    $.ajax({
      type: 'PUT',
      data: {read: "Read"},
      url: `/links/${parent.id}`
    })
  }
}

$(document).ready(function(){
  $('#add-link').on('click', checkLinks)
  $('.mark_starter').on('click', mark)
  $('.unread').on('click', markRead)
  $('.read').on('click', markUnread)
})
