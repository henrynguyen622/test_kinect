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
             $('.slide-out-div').tabSlideOut({
                 tabHandle: '.handle',                              //class of the element that will be your tab
                 pathToTabImage: '/assets/panel_button.png',          //path to the image for the tab (optionaly can be set using css)
                 imageHeight: '124px',                               //height of tab image
                 imageWidth: '34px',                               //width of tab image    
                 tabLocation: 'left',                               //side of screen where tab lives, top, right, bottom, or left
                 speed: 300,                                        //speed of animation
                 action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
                 topPos: '300px',                                   //position from the top
                 fixedPosition: true                               //options: true makes it stick(fixed position) on scroll
             });
});

//upload button
$(document).ready(function(){
    $('#upload_btn').click(function() {
        $('#post_postphoto').trigger('click');
    });
});

//layout for content
$(document).ready(function(){
        var handler = null;

        // Prepare layout options.
        var options = {
          autoResize: true, // This will auto-update the layout when the browser window is resized.
          container: $('#main'), // Optional, used for some extra CSS styling
          offset: 20, // Optional, the distance between grid items
          itemWidth: 210 // Optional, the width of a grid item
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

        $('#post_postphoto').change(function() { 
                // select the form and submit
               // alert("hell");
               var uploadpost = $('#upload_post').children(":first");//.clone()
               $('#tiles').prepend(uploadpost);
               applyLayout();
        });
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
});





