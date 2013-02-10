var initPage = function() {
  $('.carousel').each(function(){
    $(this).carousel({
      interval: false
    });
  });

  $(".default-tooltip").tooltip();
  $("a.default-tooltip").click(function(e) {
    e.preventDefault();
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