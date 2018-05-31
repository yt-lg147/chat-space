$(function() {

  $(".new_message").on("submit", function(event) {
    event.preventDefault();
    var $this = $(this);
    var url = $(this).attr('action');
    var formData = new FormData($this.get(0));
    $.ajax({
      url: url,
      type: "POST",
      dataType: 'json',
      data: formData,
      processData: false,
      contentType: false
    })
    .done(function(data) {
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