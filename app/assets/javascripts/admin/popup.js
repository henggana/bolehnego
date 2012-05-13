/***************************/
//@Author: Adrian "yEnS" Mato Gondelle
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

//SETTING UP OUR POPUP
//0 means disabled; 1 means enabled;
var popupStatus = 0;

function showPopup(priv, id){
	centerPopup();
	setSelected(priv);
	loadPopup(id);
}

//loading popup with jQuery magic!
function loadPopup(id){
	//loads popup only if it is disabled
	if(popupStatus==0){
	  $('.setpriv').attr('action', '/admin/users/'+id+'/changepriv');
		$("#backgroundPopup").css({
			"opacity": "0.7"
		});
		
		$("#backgroundPopup").fadeIn("fast");
		$("#popupContact").fadeIn("fast");
		popupStatus = 1;
		
	}
}

function setSelected(priviledges){
	//priviledges = $(".popupTrigger").attr("title");			
	if(priviledges=="admin"){
		$(".adminPriv").attr("selected","selected");
	}
	
	if(priviledges=="super-admin"){
		$(".saPriv").attr("selected","selected");
	}
	
	if(priviledges=="customer"){
		$(".custPriv").attr("selected","selected");
	}
}

//disabling popup with jQuery magic!
function disablePopup(){
	//disables popup only if it is enabled
	if(popupStatus==1){
		$("#backgroundPopup").fadeOut("slow");
		$("#popupContact").fadeOut("slow");
		popupStatus = 0;
		$(".popupTrigger").removeAttr('id');
	}
}

//centering popup
function centerPopup(){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#popupContact").height();
	var popupWidth = $("#popupContact").width();
	//centering
	$("#popupContact").css({
		"position": "absolute",
		"top": windowHeight/2-popupHeight/2,
		"left": windowWidth/2-popupWidth/2
	});
	//only need force for IE6
	
	$("#backgroundPopup").css({
		"height": windowHeight
	});
	
}


//CONTROLLING EVENTS IN jQuery
$(document).ready(function(){
	//Click the trigger
	$(".popupTrigger").click(function(){
		$(this).attr('id', 'changed')
		var id = $(this).parent().siblings(".id").html();
		var priv = $(this).html();
		showPopup(priv, id);
	});

	//Click out event!
	$("#backgroundPopup").click(function(){
		disablePopup();
	});
	//Press Escape event!
	$(document).keypress(function(e){
		if(e.keyCode==27 && popupStatus==1){
			disablePopup();
		}
	});

});
