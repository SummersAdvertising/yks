$(function(){
   $('.side-box').find('.side-title').click(function(){
   return; // 取消效果
      var $qa_content = $(this).next('.side-text');
      if(!$qa_content.is(':visible')){
         
	     $('.side-text:visible').slideUp();
	  }
		$qa_content.slideToggle()
	})
});
