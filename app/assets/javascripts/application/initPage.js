var initPage = function() {
  $(".orbit").carousel({
    interval: false,
    pause: 'hover'
  });

  $('#nav-affix-wrapper').height($('#nav-sectionlist').height());
  $('#nav-sectionlist').affix({
    offset: $('#nav-sectionlist').position()
  });

  $('#nav-sectionlist').localScroll();

  $("#frontpage-header a").mouseenter(function() {
    $(this).find(".more").addClass("expanded");
  });
  $("#frontpage-header a").mouseleave(function() {
    $(this).find(".more").removeClass("expanded");
  });
};
$(window).bind('load', initPage);