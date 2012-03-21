$(function(){
   $('.side-box').find('.side-title').click(function(){
      var $qa_content = $(this).next('.side-text');
      if(!$qa_content.is(':visible')){
	     $('.side-text:visible').slideUp();
	  }
		$qa_content.slideToggle()
	})
});
