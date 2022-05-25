//<[CDATA[

/**
*��ǻ�Ϳ� activeX��ġ�Ǿ��ִ��� ���θ� Ȯ�� 
*��ġ�������� return true
*/

function isInstalledActiveX() {/*{{{*/
	var isInstall = false;
	try {
		var obj = new ActiveXObject("ClearAdjust.CTAdjust.1");
	
		if(obj)
			isInstall = true;
		else
			isInstall = false;
	} catch(ex) {
		isInstall = false;
	}
	var ua = navigator.userAgent;
	var un = navigator.appName;
	if(un == 'Microsoft Internet Explorer') {
		//IE .
		if(ua.indexOf('MSIE 7.0') > 0) {
			isInstall = true;		
		}
	}
    return isInstall;
}/*}}}*/
/**
*onload �̺�Ʈ�� function�� �߰��ϴ� function
*/
function addOnload(func) {/*{{{*/
    if(typeof window.onload == 'function') {
        loadfunc = window.onload;
        window.onload = function() {
            loadfunc();
            func();
        }
    } else {
        window.onload = func;    
    }
}/*}}}*/

/**
*onload�ÿ� �����Ͽ� �ʿ��� �̹�Ʈ ����
*/
function startUp() {/*{{{*/
    var inst_btn = document.getElementById('inst_active');
    inst_btn.onclick = inst_activex;
    var no_inst = document.getElementById('no_inst');
    //no_inst.onclick = closePanel;
	no_inst.onclick = removeFor;
    var period_rm = document.getElementById('period_rm');
    period_rm.onclick = removeFor;
    var adjust_font = document.getElementById('adjust_font');
    adjust_font.onclick = adjustFontExec;
	//adjust_font.onclick = removeButton1;
	var cancel_font = document.getElementById('cancel_font');
    cancel_font.onclick =  cancelFont;
	//cancel_font.onclick = removeButton2;
	
}/*}}}*/

/**
*activeX��ġ���� �� ��ġ�� �ϴ��� �������� ���ÿ� ���� ������ �ٸ��� �Ѵ�
*/
function checkActiveX() {/*{{{*/
    if(isInstalledActiveX()) {
        //�̹� activeX��ġ�� ������ �ÿ� Ŭ����Ÿ������ ��ȯ
        var obj = new ActiveXObject("ClearAdjust.CTAdjust");
        if(obj.SmoothType != 2) obj.SmoothType = 2;
        adjustFont();
    } else {
        // �Ⱥ��� ýũ�� �������� activeX ��ġ���� â�� ����
        if(getCookie('period_rm') != 'yes') {
            document.getElementById('quest_panel').style.display = 'block';
        }
        // activeX�� ��ġ�Ѵٰ� �����ÿ� ���ε�� â�� ����� �ʰ� activeX�ε�
        if(getCookie('inst') == 'yes') {
            document.getElementById("ax_container").innerHTML = 
                '<OBJECT id="CTAdjust" ' + 
                'codeBase="http://download.microsoft.com/download/7/E/6/7E6A8567-DFE4-4624-87C3-163549BE2704/clearadj.cab#version=1,0,0,4" ' +
                'classid="CLSID:DE22A7AB-A739-4C58-AD52-21F9CD6306B7" VIEWASTEXT> ' + 
                '</OBJECT>';
        deleteCookie('inst');
		adjustFontExec();
        }
    }
}/*}}}*/

// activeX��ġ Ŭ���ÿ� activeX�� �ε�
function inst_activex() {/*{{{*/
    document.getElementById("ax_container").innerHTML = 
        '<OBJECT id="CTAdjust" ' + 
        'codeBase="http://download.microsoft.com/download/7/E/6/7E6A8567-DFE4-4624-87C3-163549BE2704/clearadj.cab#version=1,0,0,4" ' +
        'classid="CLSID:DE22A7AB-A739-4C58-AD52-21F9CD6306B7" VIEWASTEXT> ' + 
        '</OBJECT>';
    setCookie('inst', 'yes', 1);
    CTAdjust.onerror = function() { 
        alert('activex�� ��ġ���ּ���');
    }
    return false;
}/*}}}*/

/*
* activeX��ġ�� ���� â �ݱ�, ������ �ܼ��� ������ �ʰ� �� ��
* �Ը���� ó���ϸ� �� :P
*/
function closePanel() {/*{{{*/
    document.getElementById('quest_panel').style.display = 'none';
    return false;
}/*}}}*/

/*
* X�ϰ� �Ⱥ��⿡ ���� ��Ű ����
*/
function removeFor() {/*{{{*/
    var length = document.getElementById('length');
    var period = length.getAttribute('value');
    setCookie('period_rm', 'yes', period);
    document.getElementById('quest_panel').style.display = 'none';
	//setCookie('fontRm', 'yes', period);
	document.getElementById('adjust_font').style.display = 'none';

}/*}}}*/

/*
* activeX �� ����Ͽ� ������ ���� �ٲٱ�
* SmoothType1 = grayscale
* SmoothType2 = cleartype
*/
function check_ctadjust() {/*{{{*/
    var CTAdjust = document.getElementById('CTAdjust');
    var ua = navigator.userAgent;
    var un = navigator.appName;

    if(CTAdjust && (CTAdjust.SmoothType == 0 || CTAdjust.SmoothType == 1 || CTAdjust.SmoothType ==2)) {
        //$("#msg").html('Microsoft���� �����Ǵ� Cleartype Tuner ���α׷��� ��ġ�Ǿ����ϴ�.');
        if(ua.indexOf('Windows NT 5.1') > 0) {
            //XP�� ���.
            if(CTAdjust.SmoothType == 2) {
               adjustFont();
            } else {
               CTAdjust.SmoothType = 2; 
               adjustFont();
            }
        } else {
               CTAdjust.SmoothType = 1; 
               adjustFont();
        }
        closePanel();
    } else {
        timer = setTimeout("check_ctadjust()", 500);
    }
}/*}}}*/

/*
* onload�ÿ� ����, ��Ȳ�� ���� ������ �ٲٱ� ���� :P
*/
function init() {/*{{{*/
    var ua = navigator.userAgent;
    var un = navigator.appName;

    if(un == 'Microsoft Internet Explorer') {
        //IE�� ���.
        if(ua.indexOf('MSIE 7.0') > 0) {
            //IE7.0�� ���-AX ��ġ���ʿ����. 
            /* 0319 
            *document.getElementById('info').innerHTML = document.getElementById('msie7').innerHTML;  
            *������ ie7�϶� �޽��� ��ﶧ ���� ��, ������ �ش� ������Ʈ�� ��� ���� �����߻������� ������
            */
            /*0319 ie7 �Ͻÿ� ������ �ٷ� �����Ų��.*/
            adjustFont();
        } else {
            //IE7.0���Ϲ���.

            if(ua.indexOf('Windows 98') > 0) {
                //98
                document.location.href = 'index_win98.html';
                return false;
            } else if(ua.indexOf('Windows NT 5.1') > 0) {
                checkActiveX();
            } else if(ua.indexOf('Windows NT 5.0')) {
                checkActiveX();
            } else {
                //other os.
            }


        }

    } else {
        //document.getElementById('quest_panel').style.display = 'block';
        //IE�� �ƴѰ��.
        //$('#info').html($('#not_ie').html());
        //document.location.href = 'index_non_ie.html';
        //return false;
    }

    check_ctadjust();

}/*}}}*/

/*
* ����Ʈ ���� Ŭ���� ������ �����Ų��, �����
* Ư�� ������Ʈ�� class�� ������ CSS�� ��Ʈ�� �����Ű�� ��� �����
*/
function adjustFont() {/*{{{*/

	if(getCookie('fontRm') == 'no'){
		//nd�߰� ��Ʈ ������Ű üũ..
		 document.getElementById('cancel_font').style.display = 'none';
		 document.getElementById('adjust_font').style.display = 'block';
	} else if(getCookie('fontRm') == 'yes'){
		adjustFontExec();	
		document.getElementById('adjust_font').style.display = 'none';
		document.getElementById('cancel_font').style.display = 'block';
	}else{
		setCookie('fontRm', 'yes', 1);
		adjustFontExec();
		document.getElementById('cancel_font').style.display = 'block';
		document.getElementById('adjust_font').style.display = 'none';
	}
}
/*}}}*/

/*
* ����Ʈ ����
*/
function adjustFontExec(){

	setCookie('fontRm', 'yes', 1);	
		
	 if(isInstalledActiveX()) {
		//var font_panel = document.getElementById('font_panel');
	   // font_panel.setAttribute('className', 'webfont');
		/*����*/var font_title	   = document.getElementById('font_title');
		font_title.setAttribute('className', 'webfont1');
		/*������*/var font_subtitle  = document.getElementById('font_subtitle');
		font_subtitle.setAttribute('className', 'webfont2');
		/*��¥*/var font_date	   = document.getElementById('font_date');
		font_date.setAttribute('className', 'webfont3');
		/*�̸���*/var font_email	   = document.getElementById('font_email');
		font_email.setAttribute('className', 'webfont4');
		/*����*/var articleBody	   = document.getElementById('articleBody');
		articleBody.setAttribute('className', 'webfont5');
		/*����*/var font_reporter	   = document.getElementById('font_reporter');
		font_reporter.setAttribute('className', 'webfont6');
		/*ī��*/var font_copy	   = document.getElementById('font_copy');
		font_copy.setAttribute('className', 'webfont7');

		if( document.getElementById('font_imgdown') ){
			 /*�̹����ؿ���*/var font_imgdown   = document.getElementById('font_imgdown');
			font_imgdown.setAttribute('className', 'webfont8');
		}
		 document.getElementById('adjust_font').style.display = 'none';
		 document.getElementById('cancel_font').style.display = 'block';
	
	} else {
		document.getElementById('quest_panel').style.display = 'block';
	}
		
		return false;
}
/*
*����Ʈ ���� ����, ����� ����Ʈ�� �����ϴ� Ŭ������ �����ϴ°����μ� ����
*/
function cancelFont() {/*{{{*/
  
	/*����*/var font_title	   = document.getElementById('font_title');
	font_title.setAttribute('className', 'webfont10');
	/*������*/var font_subtitle  = document.getElementById('font_subtitle');
	font_subtitle.setAttribute('className', 'webfont11');
	/*��¥*/var font_date	   = document.getElementById('font_date');
	font_date.setAttribute('className', 'webfont12');
	/*�̸���*/var font_email	   = document.getElementById('font_email');
	font_email.setAttribute('className', 'webfont13');
	/*����*/var articleBody	   = document.getElementById('articleBody');
	articleBody.setAttribute('className', 'webfont14');
	/*����*/var font_reporter	   = document.getElementById('font_reporter');
	font_reporter.setAttribute('className', 'webfont15');
	/*ī��*/var font_copy	   = document.getElementById('font_copy');
	font_copy.setAttribute('className', 'webfont16');
   /*�̹����ؿ���*/
   if( document.getElementById('font_imgdown') ){
	   var font_imgdown   = document.getElementById('font_imgdown');
		font_imgdown.setAttribute('className', 'webfont17');
   }

	document.getElementById('adjust_font').style.display = 'block';
	document.getElementById('cancel_font').style.display = 'none';
	setCookie('fontRm', 'no', 1);

    return false;
}/*}}}*/

/*
function buttonInsFun(){
	if(getCookie('fontRm') == 'no'){
		
	var cancel_font = document.getElementById('adjust_font').style.display = 'block';

		//document.getElementById("buttonINS").innerHTML = '<td><a href=\"#\" id=\"adjust_font\" >
		//<img src=\"/webfont/images/font_ok.gif\" width=\"65\" height=\"16\" border=\"0\"></a></td>
	//</td>';

	} else {
	
	var adjust_font = document.getElementById('cancel_font').style.display = 'block';

		//buttonINS.InnerHTML = "<td><a href=+"#"+ id=+"cancel_font"+ >
		//<img src=\"/webfont/images/font_no.gif\" width=\"65\" height=\"16\" border=\"0\"></a></td>
	//</td>";
	}
}
*/
//if(getCookie('inst') != 'yes'){
	
	//addOnload(buttonInsFun);
	//addOnload(startUp);
	//addOnload(init);
//}

//]]>
