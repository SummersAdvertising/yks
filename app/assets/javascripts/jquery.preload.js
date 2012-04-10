function preloadImages() {
 var a = (typeof arguments[0] == 'object')? arguments[0] : arguments;
 for(var i = a.length -1; i > 0; i--) {
  jQuery("<img>").attr("src", 'images/'+a[i]);
 }
}
preloadImages("btn_click.png","btn_out.png","btn_over.png","businessbg.png","businessend.png","businesstopbg.png","close.png","contactbg.png","menubg.png","menubg2.png","menubgend.png","menuover.png","needbtn.png","needbtn2.png","open.png","slider.png");