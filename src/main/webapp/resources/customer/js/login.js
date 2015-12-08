$(function(){
	
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		});
        if(getParam("a")=='0')
        {
	        $('#switch_login').trigger('click');
        }

	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  


var reMethod = "GET",

	pwdmin = 6;

$(document).ready(function() {


	$('#reg').click(function() {

		if ($('#user').val() == "") {
			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}

		if ($('#user').val().length < 4 || $('#user').val().length > 16) {

			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名位4-16字符</b></font>");
			return false;

		}

		if ($('#passwd').val().length < pwdmin) {
			$('#passwd').focus();
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			return false;
		}
		if ($('#passwd2').val() != $('#passwd').val()) {
			$('#passwd2').focus();
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		}

		var sqq =/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;

		if (!sqq.test($('#qq').val())) {
			$('#qq').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×邮箱格式不正确</b></font>");
            return false;
		} else {
			$('#qq').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
		}

        if($("#captcha_input").val()==null||$("#captcha_input").val()==""){
            $('#captcha_input').focus().css({
                border: "1px solid red",
                boxShadow: "0 0 2px red"
            });
            $('#userCue').html("<font color='red'><b>×验证码不能为空</b></font>");
            return false;
        }else{
            $('#captcha_input').css({
                border: "1px solid #D7D7D7",
                boxShadow: "none"
            });
        }


        //校验用户名、邮箱、验证码是否存在
        var username = $('#user').val();
        var email = $('#qq').val();
        var captcha = $("#captcha_input").val();
        var data = {
            username : username,
            email    : email,
            captcha  : captcha
        }
        $.ajax({
            type:       'get',
            url:        '/user/validateLogin',
            data:       data,
            success:    function(data){
                var result = data.result;
                if(result==0||result==-1){
                    $('#userCue').html("<font color='red'><b>×"+data.msg+"</b></font>");
                }else{
                   $('#regUser').submit();
                }
            }
        })

	});

    var opts = {
        beforeSubmit:  showRequest,  //提交前处理
        success:       showResponse,  //处理完成
        resetForm:     true,
        url:           '/user/register',
        dataType:      'json'
    };
    $('#regUser').submit(function() {
        $(this).ajaxSubmit(opts);
        // !!! Important !!!
        // always return false to prevent standard browser submit and page navigation
        return false;
    });
    function showRequest(formData, jqForm, options) {
        return true;
    }
    function showResponse(responseText, statusText,xhr, $form)  {
        alert(responseText.msg)
    }


});