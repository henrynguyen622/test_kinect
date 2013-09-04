$(document).ready(function(){

	$("#new_post").on("ajax:success", function(e, data, status, xhr) {
	  var post = JSON.parse(xhr.responseText);


	  $( "#upload_post" ).dialog( "close");

		// var new_post = '<li"><img alt="Thumb_pic_2" height="262" width="262" src="'+post.postphoto.thumb.url+'"/>';
	 //    new_post = new_post + '<div class="star" data-score='+post.rating+' style="text-align:center;padding-top:10px;"></div>';
	 //    new_post = new_post + ' <div>' + post.text + '</div>';
	 //    new_post = new_post + '<div>' + post.location +'</div>';
	 //    new_post = new_post + '<hr>';
	 //    new_post = new_post + '<div>View 1,066 comments</div>';
	 //    new_post = new_post + '</li>';
	 //    $('#tiles').prepend(new_post);

	 //    $('.star').raty({
	 //            path     : 'assets/',
	 //            readOnly: true,
	 //            starHalf : 'spoon-half.png',
	 //            starOff  : 'spoon-off.png',
	 //            starOn   : 'spoon-on.png',
	 //            width    : 160,
	 //            score: function() {
	 //                return $(this).attr('data-score');
	 //            }
	 //        });

	 //    applyLayout();



      //$("#new_post").append(xhr.responseText);
    }).bind("ajax:error", function(e, xhr, status, error) {
      $("#new_post").append("<p>ERROR</p>");
    });
});