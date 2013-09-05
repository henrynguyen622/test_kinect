//side bar menu function
// $(document).ready(function(){
	
// 	$('#sidebar-menu').dialog({
//       autoOpen: false,
//       show: {
//         effect: "slide",
//         //direction: "left",
//         duration: 1000
//       },
//       hide: {
//         effect: "slide",
//         //direction: "left",
//         duration: 1000
//       },
//       position: { my: 'left top', at: 'left top', of: window},
//       //close: function( event, ui ) {$("#sidebar").show();},
//       //open: function( event, ui ) {$("#sidebar").hide();},
//     });
// 	$('#sidebar').mouseover(function() {
// 	  $( "#sidebar-menu" ).dialog( "open");
// 	});
// 	$('#sidebar-menu').mouseout(function() {
// 	  $( "#sidebar-menu" ).dialog( "close" );
// 	});
// });

// side menu
$(document).ready(function(){
  
  //  Sticky Sidebar menu
  $('#sticky_side_menu').hover(function () {
    if ($('#slide').is(":hidden")) {
      $('#slide').show('slide', {direction: 'left'}, 300);
    }
  });


   $('.main').mouseover(function() {
      if (!$('#slide').is(":hidden")) {
        $('#slide').hide('slide', {direction: 'left'}, 300);
      }
    });

   $('#home_menu, #home_menu_link').mouseover(function() {
      $('#home_menu_link').css('color', '#f1442b');
      $('#home_menu').css('background-position', '-304px 0px');
    });

    $('#home_menu, #home_menu_link').mouseout(function() {
      $('#home_menu_link').css('color', '#3f3636');
      $('#home_menu').css('background-position', '-280px 0px');
    });

    $('#friends_menu, #friends_menu_link').mouseover(function() {
      $('#friends_menu_link').css('color', '#f1442b');
      $('#friends_menu').css('background-position', '-406px 0px');
    });

    $('#friends_menu, #friends_menu_link').mouseout(function() {
      $('#friends_menu_link').css('color', '#3f3636');
      $('#friends_menu').css('background-position', '-380px 0px');
    });

    $('#followers_menu, #followers_menu_link').mouseover(function() {
      $('#followers_menu_link').css('color', '#f1442b');
      $('#followers_menu').css('background-position', '-453px 0px');
    });

    $('#followers_menu, #followers_menu_link').mouseout(function() {
      $('#followers_menu_link').css('color', '#3f3636');
      $('#followers_menu').css('background-position', '-430px 0px');
    });



});

//upload button
// $(document).ready(function(){
//     $('#upload_btn').click(function() {
//         $('#post_postphoto').trigger('click');
//     });
// });

//layout for content
$(document).ready(function(){
        var handler = null;

        // Prepare layout options.
        var options = {
          autoResize: true, // This will auto-update the layout when the browser window is resized.
          container: $('#main'), // Optional, used for some extra CSS styling
          offset: 20, // Optional, the distance between grid items
          itemWidth: 200 // Optional, the width of a grid item
        };

        function applyLayout() {
          $('#tiles').imagesLoaded(function() {
            // Destroy the old handler
            if (handler.wookmarkInstance) {
              handler.wookmarkInstance.clear();
            }

            // Create a new layout handler.
            handler = $('#tiles li');
            handler.wookmark(options);
          });
        };


      $('#tiles').imagesLoaded(function() {

          /**
           * When scrolled all the way to the bottom, add more tiles.
           */
          function onScroll(event) {
            // Check if we're within 100 pixels of the bottom edge of the broser window.
            var winHeight = window.innerHeight ? window.innerHeight : $(window).height(); // iphone fix
            var closeToBottom = ($(window).scrollTop() + winHeight > $(document).height() - 100);

            if (closeToBottom) {
              // Get the first then items from the grid, clone them, and add them to the bottom of the grid.
              var items = $('#tiles li'),
                  firstTen = items.slice(0, 10);
              $('#tiles').append(firstTen.clone());

              applyLayout();
            }
          };

          // Capture scroll event.
          $(window).bind('scroll', onScroll);

          // Call the layout function.
          handler = $('#tiles li');
          handler.wookmark(options);

      });

});

//for rating star
$(document).ready(function(){       
    function applyStarRaty() {
        $('.star').raty({
            path     : 'assets/',
            readOnly: true,
            starHalf : 'spoon-half.png',
            starOff  : 'spoon-off.png',
            starOn   : 'spoon-on.png',
            width    : 160,
            score: function() {
                return $(this).attr('data-score');
            }
        });
    };
    applyStarRaty();

      $('#star_rating').raty({
          path     : 'assets/',
          starHalf : 'spoon-half.png',
          starOff  : 'spoon-off.png',
          starOn   : 'spoon-on.png',
          width    : 160,
          score: function() {
              return $(this).attr('data-score');
          },
          click: function(score, evt) {
            $('#post_rating').attr('value',score);
          },
      });

  $( "#upload_post" ).dialog({
      modal: true,
      autoOpen: false,
      position: { my: 'center', at: 'center', of: window},
    });

  $('#upload_btn').click(function() {
        $( "#upload_post" ).dialog( "open");
    });
});





