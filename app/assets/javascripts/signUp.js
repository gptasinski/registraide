$(document).ready(function () {

  $("#sign-up").on("click", function (event) {
    event.preventDefault();

    var url = $(this).attr("href");

    var request = $.ajax({
      url: url
    });

    request.done(function (response) {
      $(".splash-btns").hide();
      $("#sign-up-space").html(response);
    })
  });

  $("#log-in").on("click", function (event) {
    event.preventDefault();

    var url = $(this).attr("href");

    var request = $.ajax({
      url: url
    });

    request.done(function (response) {
      $(".splash-btns").hide();
      $("#sign-up-space").html(response);
    })
  });

});