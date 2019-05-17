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
//= require activestorage
//= require jquery
<<<<<<< HEAD
//= require jquery_ujs
//= require bootstrap.min
//= require npm
=======

>>>>>>> 05d84ff94881dd70c090934cc6c01de1fe716bb0
//= require bootstrap/bootstrap-tooltip
//= require bootstrap-sprockets
//= require bootstrap
$(function(){
  $("a[rel='youtube']").tooltip({title: "<img src=\"assets/youtube-32.png\" />", html: true});
})
$(function(){
  $("a[rel='twitter']").tooltip({title: "<img src=\"assets/twitter-32.png\" />", html: true});
})
$(function(){
  $("a[rel='facebook']").tooltip({title: "<img src=\"assets/facebook-32.png\" />", html: true});
})
$(function(){
  $("a[rel='instagram']").tooltip({title: "<img src=\"assets/instagram-32.png\" />", html: true});
})
$(function(){
  $("a[rel='skype']").tooltip({title: "<img src=\"assets/skype-32.png\" />", html: true});
})
//= require turbolinks
//= require_tree .
