// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require application/admin
//= require application/bootstrap-dropdown
//= require application/bootstrap-tooltip
//= require application/jquery.foundation.orbit
//= require application/lightzap


var do_on_load = function() {
  $(".orbit").orbit({
    timer: false,
    bullets: true,
    animation: 'fade',
    directionalNav: false
  });

  // $('#nav-sectionlist').scrollspy();

  // $('#nav-affix-wrapper').height($('#nav-sectionlist').height());
  // $('#nav-sectionlist').affix({
  //     offset: 645
  // });
};
$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);
