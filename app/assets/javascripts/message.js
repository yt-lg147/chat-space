$(function() {

  $(".new_message").on("submit", function(event) {
    event.preventDefault();
      console.log("イベント発火確認");
  });
});