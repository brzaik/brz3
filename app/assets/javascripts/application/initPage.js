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
};
$(window).bind('load', initPage);