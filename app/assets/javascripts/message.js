$(function() {

  var message_list = $('.chat-post');

  function appendMessage(message) {
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
                  <div class="temp-post__image"></div>
                </div>
                `
    message_list.append(html);
  }

  $(".new_message").on("submit", function(event) {
    event.preventDefault();
    var $this = $(this);
    var url = $(this).attr('action');
    var formData = new FormData($this.get(0));
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
      console.log("イベント発火確認");
      $('.box__text').val('');
      $('.label-box__file').val('');
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      console.log("XMLHttpRequest : " + jqXHR.status);
      console.log("textStatus     : " + textStatus);
      console.log("errorThrown    : " + errorThrown.message);
    })
  });
});