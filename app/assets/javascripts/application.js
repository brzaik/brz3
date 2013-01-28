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
//= require application/bootstrap-dropdown
//= require application/bootstrap-tooltip
//= require application/bootstrap-popover
//= require application/bootstrapx-clickover
//= require application/lightzap


$(document).ready(function() {
  
  if ( $("#flash-banner").html() !== "" ) {
    $("#flash-banner").delay(3000).hide("slow");
  }

  $("body").on("click", "a.btnCancel", function(e) {
    e.preventDefault();
    $(this).closest(".panel.admin").remove();
  });

  $('.editFormTrigger').clickover({
    html : true,
    placement: 'left',
    title: function() {
      return $(this).attr('data-po-title');
    },
    content: function() {
      var object_type = $(this).attr('data-object-type');
      var object_id = $(this).attr('data-object-id');
      return $("#" + object_type + "_" + object_id + "_editForm").html();
    }
  });

});