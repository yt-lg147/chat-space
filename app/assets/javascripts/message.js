$(function() {

  var message_list = $('.chat-post');

  function appendMessage(message) {
    var img_src = ( message.image == null ) ? "" : message.image;

    var html = `<div class="temp-post clearfix">
                  <div class="temp-post__user-name">
                    ${ message.user_name }
                  </div>
                  <div class="temp-post__date">
                    ${ message.date }
                  </div>
                  <div class="temp-post__message">
                    ${ message.body }
                  </div>
                  <div class="temp-post__image">
                    <img src=${ img_src }></img>
                  </div>
                </div>
                `
    message_list.append(html);
  }

  $("#new_message").on("submit", function(event) {
    event.preventDefault();
    var url = $(this).attr('action');
    var formData = new FormData($(this).get(0));
    $('.btn-form').removeAttr('data-disable-with');
    $.ajax({
      url: url,
      type: "POST",
      dataType: 'json',
      data: formData,
      processData: false,
      contentType: false
    })
    .done(function(data) {
      appendMessage(data);
      $('#new_message')[0].reset();
      $('.chat-post').animate({scrollTop: $('.chat-post')[0].scrollHeight});
    })
    .fail(function() {
      alert("投稿に失敗しました。");
    })
  });
});
