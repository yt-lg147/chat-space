$(function() {

  $(".new_message").on("submit", function(event) {
    event.preventDefault();
    var $this = $(this);
    var url = $(this).attr('action');
    var formData = new FormData($this.get(0));
      console.log("イベント発火確認");
  });
});