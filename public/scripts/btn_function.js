// JavaScript Document

function mouseOver1()
{
document.getElementById("neetbtn").src ="images/needbtn2.png";
}
function mouseOut1()
{
document.getElementById("neetbtn").src ="images/needbtn.png";
}



var closeFlag = false;
var inTimeOut = false;
var timeID = '';

var currentList;
var currentBox;

function closeMenu(timeSecond) {
	if (!timeSecond) {
		timeSecond = 200;
	}
	
	closeFlag = true;
	if (!inTimeOut) {
		
		inTimeOut = true;
		timeID = setTimeout(function() {
			if (closeFlag) {
				currentList.slideUp('fast');
				currentBox.slideUp();
				
			}
			inTimeOut = false;
			closeFlag = false;				
		}, timeSecond);
	}
}

function closeMenuInstant() {
	if (currentBox) {
		currentList.hide();
		currentBox.hide();
	}	
}


function menuInitial() {	
	//$('<div id="logDiv" style="position: fixed; left: 0; top: 200px;"></div>').prependTo('body');
	$('#menuimage a img').filter('img[id!="btn1"]').mouseover(function() {
		closeMenu(500);
	});
	
	$("#btn1").mouseover(function(){	
		if (timeID) {
			window.clearTimeout(timeID);
			inTimeOut = false;
		}
		
		closeMenuInstant();		
		
		currentList = $("#businesslist");
		currentBox = $("#btnlistbox");
		closeFlag = false;			
			
		currentList.show();
		currentBox.show();
	});
	
	
	$("#btn12").mouseover(function(){
		if (timeID) {
			window.clearTimeout(timeID);
			inTimeOut = false;
		}

	});

	$('div[id^="businesslist"]').mouseover(function() {
		if (timeID) {
			window.clearTimeout(timeID);
			inTimeOut = false;
		}
		closeFlag = false;
	});
	$('div[id^="btnlistbox"]').mouseout(function() {
		
		if (timeID) {
			window.clearTimeout(timeID);
			inTimeOut = false;
		}
		closeMenu(500);
	});
	
}
