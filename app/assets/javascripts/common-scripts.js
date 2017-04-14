/*---LEFT BAR ACCORDION----*/

var Script = function () {
    // sidebar dropdown menu auto scrolling
    $(function() {
      jQuery('#sidebar .sub-menu > a').click(function () {
          var o = ($(this).offset());
          diff = 250 - o.top;
          if(diff>0)
              $("#sidebar").scrollTo("-="+Math.abs(diff),500);
          else
              $("#sidebar").scrollTo("+="+Math.abs(diff),500);
      });
    });

    // sidebar toggle
    function responsiveView() {
        var wSize = $(window).width();
        if (wSize <= 768) {
          console.log("resize");
            $('#container').addClass('sidebar-close');
            $('#sidebar > ul').hide();
        }

        if (wSize > 768) {
          console.log("resize");
            $('#container').removeClass('sidebar-close');
            $('#sidebar > ul').show();
        }
    }
    $(window).on('page:load', responsiveView);
    $(window).on('resize', responsiveView);
    
    $(document).on('click', '.fa-bars', function () {
        if ($('#sidebar > ul').is(":visible") === true) {
            console.log("is visible");
            $('#main-content').css({
                'margin-left': '0px'
            });
            $('#sidebar').css({
                'margin-left': '-140px'
            });
            $('#sidebar > ul').hide();
            $("#container").addClass("sidebar-closed");
        } else {
            console.log("is  not visible");
            $('#main-content').css({
                'margin-left': '140px'
            });
            $('#sidebar > ul').show();
            $('#sidebar').css({
                'margin-left': '0'
            });
            $("#container").removeClass("sidebar-closed");
        }
    });

    // custom scrollbar
    $(function()   {
      $("#sidebar").niceScroll({styler:"fb",cursorcolor:"#4ECDC4", cursorwidth: '3', cursorborderradius: '10px', background: '#404040', spacebarenabled:false, cursorborder: ''});
      $("html").niceScroll({styler:"fb",cursorcolor:"#4ECDC4", cursorwidth: '6', cursorborderradius: '10px', background: '#404040', spacebarenabled:false,  cursorborder: '', zindex: '1000'});
    });
    
    // widget tools
    jQuery('.panel .tools .fa-chevron-down').click(function () {
        var el = jQuery(this).parents(".panel").children(".panel-body");
        if (jQuery(this).hasClass("fa-chevron-down")) {
            jQuery(this).removeClass("fa-chevron-down").addClass("fa-chevron-up");
            el.slideUp(200);
        } else {
            jQuery(this).removeClass("fa-chevron-up").addClass("fa-chevron-down");
            el.slideDown(200);
        }
    });

    jQuery('.panel .tools .fa-times').click(function () {
        jQuery(this).parents(".panel").parent().remove();
    });


    // popovers
    // tool tips
    $(function() {
      $('.tooltips').tooltip();
      $('.popovers').popover();
    });

    // custom bar chart
    if ($(".custom-bar-chart")) {
        $(".bar").each(function () {
            var i = $(this).find(".value").html();
            $(this).find(".value").html("");
            $(this).find(".value").animate({
                height: i
            }, 2000);
        });
    }

}();
