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
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap

$(function() {
    $(document).foundation();
});

//However, don't forget to include jQuery for it to work.

$(document).on('turbolinks:load', function() {
    $(function(){ $(document).foundation(); });
});
function toggleMenu() {
    var body = document.body;
    body.className.match(/(?:^|\s)menu-open(?!\S)/) ? body.className = body.className.replace( /(?:^|\s)menu-open(?!\S)/g , '' ) : body.className += "menu-open";
}

window.onload = function(e) {
    var hamburger = document.getElementsByClassName('hamburger-menu')[0];
    var menuLinks = document.getElementsByClassName('link');
e.preventDefault();
    hamburger.addEventListener( 'click' , toggleMenu );

    for(var i = 0; i < menuLinks.length; ++i) {
        var menuLink = menuLinks[i];
        menuLink.addEventListener( 'click' , toggleMenu );
    }
}