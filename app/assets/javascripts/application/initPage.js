var initPage = function() {
  $(".orbit").orbit({
    timer: false,
    bullets: true,
    animation: 'fade',
    directionalNav: false
  });

  $('#nav-affix-wrapper').height($('#nav-sectionlist').height());
  $('#nav-sectionlist').affix({
    offset: $('#nav-sectionlist').position()
  });

  $('#nav-sectionlist').localScroll();
};
$(window).bind('load', initPage);