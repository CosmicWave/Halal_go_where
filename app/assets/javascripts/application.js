// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require masonry/jquery.masonry
//= require_tree .


$(document).ready(function() {

    $(".dropdown").click(function() {
        $(".dropdown-menu").fadeToggle();
    });

    $('.notice').fadeOut(5000, function() {
        $(this).remove();
    });

    var maxLength = 130;
    $('#textareachars').keyup(function() {
        var length = $(this).val().length;
        var length = maxLength - length;
        $('.chars').text(length);
    });


    var scrollTop = $(".scrollbutton");
    $(window).scroll(function() {
        var topPos = $(this).scrollTop();

        if (topPos > 100) {
            $(scrollTop).css("opacity", "1");

        } else {
            $(scrollTop).css("opacity", "0");
        }

    });

    $(scrollTop).click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 300);
        return false;

    });

});

