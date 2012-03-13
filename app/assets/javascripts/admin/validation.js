$(document).ready(function(){

	var jVal = {
		'password' : function() {

			$('body').append('<div id="passInfo" class="info"></div>');

			var passInfo = $('#passInfo');
			var ele = $('#password');
			var pos = ele.offset();

			passInfo.css({
				top: pos.top-1,
				left: pos.left+ele.width()+25
			});

			if(ele.val().length < 6) {
					jVal.errors = true;
					passInfo.removeClass('correct').addClass('error').html('&larr; at least 6 characters').show();
					ele.removeClass('normal').addClass('wrong');
			} else {
					passInfo.removeClass('error').addClass('correct').html('Ok !').show();
					ele.removeClass('wrong').addClass('normal');
			}
		},
		
		'checkEmptyFName' : function() {

			$('body').append('<div id="checkEmptyFname" class="info"></div>');
			
			var checkEmpty = $('#checkEmptyFname');
			var ele = $('#fname');
			var pos = ele.offset();
			
			checkEmpty.css({
				top: pos.top-1,
				left: pos.left+ele.width()+25
			});
			
			if(!$.trim(ele.val())){
				jVal.errors = true;
				checkEmpty.removeClass('correct').addClass('error').html('&larr; Please enter something !').show();
				ele.removeClass('normal').addClass('wrong');
			}else{
				checkEmpty.removeClass('error').addClass('correct').html('Ok !').show();
				ele.removeClass('wrong').addClass('normal');
			}
		},
		
						
		'matchPassword' : function (){
			
			$('body').append('<div id="matchPassInfo" class="info"></div>');
			
			var matchPassInfo = $('#matchPassInfo');
			var pass = $('#password');
			var ele = $('#password2');
			var pos = ele.offset();
			
			matchPassInfo.css({
				top: pos.top-1,
				left: pos.left+ele.width()+25
			});
			
			if(ele.val() != pass.val()){
				jVal.errors = true;
				matchPassInfo.removeClass('correct').addClass('error').html('&larr; Not Match').show();
				ele.removeClass('normal').addClass('wrong');
			}else{
				matchPassInfo.removeClass('error').addClass('correct').html('Match !').show();
				ele.removeClass('wrong').addClass('normal');
			}
			
		},

		'birthDate' : function (){

			$('body').append('<div id="birthInfo" class="info"></div>');

			var birthInfo = $('#birthInfo');
			var ele = $('#birthday');
			var pos = ele.offset();

			birthInfo.css({
				top: pos.top-3,
				left: pos.left+ele.width()+15
			});

			var patt = /^[0-9]{2}\-[0-9]{2}\-[0-9]{4}$/i;

			if(!patt.test(ele.val())) {
				jVal.errors = true;
					birthInfo.removeClass('correct').addClass('error').html('&larr; type in date in correct format').show();
					ele.removeClass('normal').addClass('wrong');
			} else {
					birthInfo.removeClass('error').addClass('correct').html('&radic;').show();
					ele.removeClass('wrong').addClass('normal');
			}
		},


		'email' : function() {

			$('body').append('<div id="emailInfo" class="info"></div>');

			var emailInfo = $('#emailInfo');
			var ele = $('#email');
			var pos = ele.offset();

			emailInfo.css({
				top: pos.top-1,
				left: pos.left+ele.width()+25
			});

			var patt = /^.+@.+[.].{2,}$/i;

			if(!patt.test(ele.val())) {
				jVal.errors = true;
					emailInfo.removeClass('correct').addClass('error').html('&larr; give me a valid email adress, ok?').show();
					ele.removeClass('normal').addClass('wrong');
			} else {
					emailInfo.removeClass('error').addClass('correct').html('Ok !').show();
					ele.removeClass('wrong').addClass('normal');
			}
		},

	
		'checkEmptyPhone' : function(){
			
			$('body').append('<div id="checkEmpty" class="info"></div>');
			
			var checkEmpty = $('#checkEmpty');
			var ele = $('#phone');
			var pos = ele.offset();
			
			checkEmpty.css({
				top: pos.top-1,
				left: pos.left+ele.width()+25
			});
			
			if(!$.trim(ele.val())){
				jVal.errors = true;
				checkEmpty.removeClass('correct').addClass('error').html('&larr; Please enter something !').show();
				ele.removeClass('normal').addClass('wrong');
			}else{
				checkEmpty.removeClass('error').addClass('correct').html('Ok !').show();
				ele.removeClass('wrong').addClass('normal');
			}
		},
		

		'sendIt' : function (){
			if(!jVal.errors) {
				$('.validateThis').submit();
			}
		}
	};

// ====================================================== //

	$('#save-userprofile').click(function (){
		var obj = $.browser.webkit ? $('body') : $('html');
		obj.animate({ scrollTop: $('.validateThis').offset().top }, 750, function (){
			jVal.errors = false;
			jVal.password();
			jVal.email();
			jVal.matchPassword();								
		});
		return false;
	});
	
	$('#save-manuprofile').click(function (){
		var obj = $.browser.webkit ? $('body') : $('html');
		obj.animate({ scrollTop: $('.validateThis').offset().top }, 750, function (){
			jVal.errors = false;		
			jVal.email();					
		});
		return false;
	});

	$('#password').change(jVal.password);	
	$('#password2').change(jVal.matchPassword);	
	$('#email').change(jVal.email);
	$('#fname').blur(jVal.checkEmptyFname);	
	$('#phone').blur(jVal.checkEmptyPhone);
	$('#addr').blur(jVal.checkEmptyAddr);
	
});
