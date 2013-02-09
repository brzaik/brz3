var adminPageBuilder = {
  turnOnHoverEvents: function() {
    $('body').on('mouseenter', '.admin-block', function() {
        $(this).find("> .admin-controls").fadeIn("fast");
    });
    $('body').on('mouseleave', '.admin-block', function() {
        $(this).find("> .admin-controls").fadeOut("fast");
    });
  },

  turnOffHoverEvents: function() {
    $('body').off('mouseenter', '.admin-block');
    $('body').off('mouseleave', '.admin-block');
  },

  resetPageBuildingUi: function() {
    adminPageBuilder.turnOnHoverEvents();
    $('.admin-block').removeClass('admin-shade').removeClass('solid-shadow');
    $('.admin-controls').hide();
    adminPageBuilder.slideOutAdminDrawer();
  },

  slideInAdminDrawer: function() {
    $('#admin-drawer').show().animate({
      right: '0px'
    }, 200, function() {});
  },

  slideOutAdminDrawer: function() {
    $('#admin-drawer').animate({
      right: '-402px'
    }, 100, function() {
      $(this).hide();
    });
  },

  initBlockForm: function() {
    $("#image_form_div").hide();
    $("#video_form_div").hide();
    $("#twitterboard_form_div").hide();
    
    $('body').on('change', '#content_name_selector', function() {
      $("#form_div > div").slideUp("fast");
      $("[id^='" + $("#content_name_selector").val().toLowerCase() + "']").slideDown("fast");
    });
  },

  initAdminPage: function() {

    if ( $("#flash-banner").html() !== "" ) {
      $("#flash-banner").delay(3000).hide("slow");
    }

    adminPageBuilder.turnOnHoverEvents();

    $('body').on('click', '.editBtn', function(e) {
      // freeze state in place:
      adminPageBuilder.turnOffHoverEvents();
      $(this).closest('.admin-block').addClass('admin-shade');
      $(this).parents('.admin-block').each(function() {
        $(this).addClass('solid-shadow');
      });
    });

    $('body').on('click', '.cancelBtn', function(e) {
      adminPageBuilder.resetPageBuildingUi();
    });

    $('body').on('click', '.editBtn.blockBtn', function(e) {
      adminPageBuilder.initBlockForm();
    });

    $(document).keyup(function(e) {
      if (e.keyCode == 27 && $('#admin-drawer').css('display') == 'block') {
        adminPageBuilder.resetPageBuildingUi();
      }
    });

  }
};

$(window).bind('load', adminPageBuilder.initAdminPage);