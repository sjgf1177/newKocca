function mainmenu(str) {

    switch(Number(str)) {

        case 1: //ȸ�� ����
            var host;
            var hostfirstname;
            host = location.href;

            ori_host = host.split("//");
            url = ori_host[1] ;

            domain = url.substr(0,url.indexOf("/"));
            if (domain.indexOf("mcst.kocca.or.kr") > -1 || domain.indexOf("mcst.edukocca.or.kr") > -1) {
                alert("���̳��縦 ���Ͽ� ������ �ּ���");
                break;
            }

            menuForwardLoginAndPwFind(2);
            break;
        case 2: //��ȣã��
            menuForwardLoginAndPwFind('10');
            break;
        case 3: //�α׾ƿ�
            menuForwardLoginAndPwFind('30');
            break;
        case 4: //ȸ����������
            menuForwardLoginAndPwFind('70');
            break;
        case 5: //�α���
            menuForwardASPLogin('60');
            break;
        case 10: //�¶��ΰ���
            menuMainForward('1','/servlet/controller.homepage.SubMenuMainServlet?p_process=ONLINE_COURSE');
            break;
        case 11:  //��ȹ
            menuForward('1','14');
            break;
        case 12:  //����
            menuForward('1','15');
            break;
        case 13:  //����
            menuForward('1','16');
            break;
        case 14:  //�濵����
            menuForward('1','17');
            break;
        case 15:  //Ư��
            menuForward('1','18');
            break;
        case 16:  //������û�ȳ�
            menuForward('1','13');
            break;
        case 20: //�������ΰ���
            menuMainForward('2','/servlet/controller.homepage.SubMenuMainServlet?p_process=OFFLINE_COURSE');
            break;
        case 21:  //��ۿ���
            menuForward('2','01');
            break;
        case 22:  //��������
            menuForward('2','02');
            break;
        case 23:  //��ȹâ��
            menuForward('2','03');
            break;
        case 24:  //������û �ȳ�
            menuForward('2','07');
            break;
        case 30: //��������
            menuMainForward('5','/servlet/controller.homepage.SubMenuMainServlet?p_process=INFORMATION');
            break;
        case 31:  //���Ŭ����
            menuForward('5','01');
            break;
        case 32:  //�ǹ�����
            menuForward('5','02');
            break;
        case 33:  //�����ڷ��
            menuForward('5','03');
            break;
        case 34:  //�̺�Ʈ
            menuForward('5','05');
            break;
        case 40: //Ŀ�´�Ƽ
            menuMainForward('6','/servlet/controller.community.CommunityIndexServlet?p_process=selectmain');
            break;
        case 41:  //��������
            menuForward('6','01');
            break;
        case 42:  //Ŀ�´�Ƽ �����
            menuForward('6','02');
            break;
        case 50: //��ī���� �Ұ�
            menuMainForward('7','/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage&menuid=01');
            break;
        case 51:  //��������/����
            menuForward('7','02');
            break;
        case 52:  //��������ȳ�
            menuForward('7','05');
            break;
        case 53:  //���ô±�
            menuForward('7','04');
            break;
        case 60: //���ǰ��ǽ�
            menuMainForward('3','/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');
            break;
        case 61:  //�������� ����
            menuForward('3','11');
            break;
        case 62:  //���Ǳ����̷�
            menuForward('3','02');
            break;
        case 63:  //��ٱ���
            menuForward('3','18');
            break;
        case 64:  //������ûȮ��/��ȸ
            menuForward('3','17');
            break;
        case 65:  //���Ǽ���
            menuForward('3','07');
            break;
        case 66:  //���ǻ�㳻��
            menuForward('3','12');
            break;
        case 70: //�н���������
            menuMainForward('4','/servlet/controller.homepage.SubMenuMainServlet?p_process=HELPDESK');
            break;
        case 71:  //��������
            menuForward('4','07');
            break;
        case 72:  //FAQ
            menuForward('4','01');
            break;
        case 73:  //Q&A
            menuForward('4','02');
            break;
        case 74:  //����Ʈ��
            menuForward('4','11');
            break;
        case 75:  //S/W�ٿ�ε�
            menuForward('4','03');
            break;
        case 76:  //�н�ȯ�浵���
            menuForward('4','05');
            break;
        case 80:  //�����ڷ��
            menuForward('5','03');
            break;
        case 81:  //�ǹ�����
            menuForward('5','02');
            break;
        case 110:  //asp �����ȳ� ���������ȳ�
            menuForward('8','01');
            break;
        case 111:  //asp �����ȳ�  ������������
            menuForward('8','02');
            break;
         case 120:  //asp ������û ������û�ȳ�
            menuForward('9','01');
            break;
        case 121:  //asp ������û ������û
            menuForward('9','02');
            break;
        case 122:  //asp ������û ������ûȮ��/���
            menuForward('9','03');
            break;
        case 130:  //asp �н��������� ��������
            menuForward('4','07');
            break;

        case 190:  //asp ��ۿ���
            menuForward2('9','02', 'B0');
            break;
        case 191:  //asp ���Ӱ���
            menuForward2('9','02', 'G0');
            break;
        case 192:  //asp ��ȭ������
           menuForward2('9','02', 'K0');
            break;
        case 193:  //asp ����
            menuForward2('9','02', 'W0');
            break;

        case 990: // �α��� �������� �̵�
            document.topdefaultForm.p_process.value  = "MainLogin";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainServlet";
            document.topdefaultForm.submit();
            break;

        case 991: //����Ȩ������(KOCCA) ȸ�� ����
            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "01";
            document.topdefaultForm.p_process.value  = "MemberJoin";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainMemberJoinServlet";
            document.topdefaultForm.submit();
            break;

        case 992: //���̵�/�н�����ã��
            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "02";
            document.topdefaultForm.p_process.value  = "FindIdPwd";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainMemberJoinServlet";
            document.topdefaultForm.submit();
            break;

        case 993: //ȸ����������

            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "03";
            document.topdefaultForm.p_process.value  = "MemberInfoUpdate";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainMemberJoinServlet";
           // document.topdefaultForm.url.value       = "/servlet/controller.homepage.MainMemberJoinServlet";
            //document.topdefaultForm.p_process.value = "mainForward";
            //document.topdefaultForm.action = "/servlet/controller.system.MenuDataServlet";
            document.topdefaultForm.submit();
            break;

        case 994: //ȸ��Ż��
            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "04";
            document.topdefaultForm.p_process.value  = "MemberWithdraw";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainMemberJoinServlet";
            document.topdefaultForm.submit();
            break

        case 995: //�̿���
            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "05";
            document.topdefaultForm.p_process.value  = "UserAgree";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainMemberJoinServlet";
            document.topdefaultForm.submit();
            break;

        case 996: //����������޹�ħ
            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "06";
            document.topdefaultForm.p_process.value  = "PersonalNew";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainMemberJoinServlet";
            document.topdefaultForm.submit();
            break;

        case 997: //��й�ȣ����
            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "07";
            document.topdefaultForm.p_process.value  = "ChangePwd";
            document.topdefaultForm.action = "/servlet/controller.homepage.MainMemberJoinServlet";
            document.topdefaultForm.submit();
            break;

        case 998: //�α׾ƿ�
            document.topdefaultForm.p_process.value = "gologout";
            document.topdefaultForm.action          = "/servlet/controller.homepage.LoginServlet";
            document.topdefaultForm.submit();
            break;

        case 999: //��й�ȣ����
            document.topdefaultForm.gubun.value     = "90";
            document.topdefaultForm.menuid.value    = "09";
            document.topdefaultForm.p_process.value  = "SiteMap";
            document.topdefaultForm.action = "/servlet/controller.homepage.HomePageHelpServlet";
            document.topdefaultForm.submit();
            break;
    }
}

function notice_getCookie( name ) {
    var nameOfCookie = name + "=";
    var x = 0;
    while ( x <= document.cookie.length )
    {
            var y = (x+nameOfCookie.length);
            if ( document.cookie.substring( x, y ) == nameOfCookie ) {
                    if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                            endOfCookie = document.cookie.length;
                    return unescape( document.cookie.substring( y, endOfCookie ) );
            }
            x = document.cookie.indexOf( " ", x ) + 1;
            if ( x == 0 )
                    break;
    }
    return "";
}

function topClassSearchClickHandler(obj) {
    var span_active     = document.getElementById("span_active");
    var span_inactive   = document.getElementById("search_tit");

    var temp_active     = span_active.innerHTML;
    var temp_inactive   = span_inactive.innerHTML;

    var divSearchTit    = document.getElementById("search_tit");

    if(obj == null) {
        divSearchTit.style.display = "block";
        openBoolean = true;
        return;
    }

    if(!openBoolean) {
        divSearchTit.style.display = "block";
        openBoolean = true;
        return;
    } else {
        if(obj != null && obj == span_active) {
            span_active.innerHTML    = temp_active;
            span_inactive.innerHTML  = temp_inactive;
        } else if(obj != null && obj == span_inactive) {
            span_active.innerHTML    = temp_inactive;
            span_inactive.innerHTML  = temp_active;
        }

        divSearchTit.style.display = "none";

        openBoolean = false;
    }
}

function ssoLogin() {
    location.href = "http://www.wecon.kr/sub/mb/MBLogin.srt?rtnURL=http://edu.kocca.or.kr";
}

function ssoJoin() {
    location.href = "http://www.wecon.kr/sub/kocca/member/ssnNameCk.jsp";
}
//ȸ����������
function ssoUpdate() {
    location.href = "http://www.wecon.kr/sub/kocca/member/userUpd.jsp?rtnURL=http://edu.kocca.or.kr"
}

function ssoLosspwd() {
    location.href = "http://www.wecon.kr/sub/kocca/mb/MBFindIDPassword.srt";
}

function ssoMemberOut() {
     location.href = "http://www.wecon.kr/sub/mb/MBOut.srt?rtnURL=http://edu.kocca.or.kr";
}

function menuForward(gubun, menuid) {

    if(gubun!='999') {  // ������� ���ý� ���ĸ���Ʈ ������ ����
        if(gubun == '5' && menuid == '09') {
            window.open('http://www.culturist.co.kr/front/recruit/recruit_new_list.asp');
            return;
        }

        if(gubun == '90') {
               var tmp_menu = '99'+  menuid.substring(1,2) ;
                mainmenu(tmp_menu);
            return;
         }

        document.topdefaultForm.gubun.value = gubun;
        document.topdefaultForm.menuid.value = menuid;
        document.topdefaultForm.p_process.value  = "writeLog";
        document.topdefaultForm.action = "/servlet/controller.system.MenuCountServlet";
        document.topdefaultForm.submit();
    } else {
        document.topdefaultForm.p_process.value  = "";
        document.topdefaultForm.action = "/servlet/controller.homepage.MainServlet";
        document.topdefaultForm.submit();
    }
}

function menuForward2(gubun, menuid, area ){
    document.topdefaultForm.gubun.value    = gubun;
    document.topdefaultForm.menuid.value   = menuid;
    document.topdefaultForm.p_area.value    = area;
    document.topdefaultForm.p_process.value  = "writeLog";
    document.topdefaultForm.action = "/servlet/controller.system.MenuCountServlet";
    document.topdefaultForm.submit();
}

//ASP �α��� �� ��ȣ ã��
function menuForwardLoginAndPwFind(gubun){
        document.topdefaultForm.gubun.value    = gubun;
        document.topdefaultForm.menuid.value   = "0";
        document.topdefaultForm.p_process.value  = "ASP_Login";
        document.topdefaultForm.action = "/servlet/controller.homepage.MainServlet";
        document.topdefaultForm.submit();
}

function menuForwardASPLogin(gubun){
        var host;
        var hostfirstname;
        host = location.href;

        ori_host = host.split("//");
        url = ori_host[1] ;

        domain = url.substr(0,url.indexOf("/"));
        document.form1.gubun.value    = gubun;
        document.form1.menuid.value   = "0";
        document.form1.p_process.value  = "ASP_Login";


        if ((domain.indexOf("mcst.kocca.or.kr") > -1) || (domain.indexOf("edu1.kocca.or.kr") > -1)) {
            document.form1.action =  "/servlet/controller.homepage.MainServlet";
        } else {
            document.form1.action = https_host() + "/servlet/controller.homepage.MainServlet";
        }
        document.form1.submit();
}

    /**
     * ���� �޴� �̵�
     * @param gubun - ������ (���� ���� ������ ��Ȯ���� ����)
     * @param url - �̵��� url
     */
    function menuMainForward(gubun, url) {
        var menuMainForm = document.topdefaultForm;

        menuMainForm.gubun.value = gubun;
        menuMainForm.url.value = url;
        menuMainForm.menuid.value = "00";
        menuMainForm.p_process.value = "mainForward";
        menuMainForm.action = "/servlet/controller.system.MenuDataServlet";

        menuMainForm.submit();
    }

function menuMainForward2(gubun, menuid, url){
    document.topdefaultForm.gubun.value     = gubun;
    document.topdefaultForm.menuid.value    = menuid;
    document.topdefaultForm.url.value       = url;
    document.topdefaultForm.p_process.value = "mainForward";
    document.topdefaultForm.action = "/servlet/controller.system.MenuDataServlet";
    document.topdefaultForm.submit();
}

function menuMainForward_Total(url){
        document.topdefaultForm.gubun.value     = "9";
        document.topdefaultForm.menuid.value    = "02";
        document.topdefaultForm.url.value       = url;
        document.topdefaultForm.p_process.value = "mainForward";
        document.topdefaultForm.action = "/servlet/controller.system.MenuDataServlet";
        document.topdefaultForm.submit();
}

    //��ü �����˻�
    function totalSubjSearch() {
        var searchText = document.getElementById("topWarp_searchText").value;
        var searchClass = document.getElementsByName("topWarp_searchClass")[0].value
        if(searchClass == "online") {
            var gubun   = "1";
            var url     = "/servlet/controller.propose.ProposeCourseServlet?p_process=TotalSubjectList&s_subjnm="+searchText;
        } else {
            var gubun   = "2";
            var url     = "/servlet/controller.off.ProposeOffServlet?p_process=TotalSubjectList&s_subjnm="+searchText;
        }

        menuMainForward(gubun, url);
    }

    /**
     * ���հ˻� �Է� ���ڿ� �˻�� �Է��ϰ� ����Ű�� ������ ��, �˻� ����
     */
    function searchtotal_enter(e)  {
        if (e.keyCode == "13") {
            totalSubjSearch1();
        }
    }

    /**
     * ��ü �����˻� - ���� �¶���/�������� ���°˻�. ���� ���� �˻� �߰� ����
     */
    function totalSubjSearch1() {
        var searchText = $("#topWarp_searchText").val();

        if ( searchText.replace(/ /gi, "") == "") {
            alert("�˻�� �Է��ϼ���.");
            $("#topWarp_searchText").focus();
            return;
        }

        searchText = replaceBlank( searchText.trim() );

        var gubun = "1";
        var url = "/servlet/controller.propose.MainSubjSearchServlet?p_process=SubjSearch&p_lsearchtext=" + searchText;

        if ( $("#topdefaultForm").length > 0 ) {
            $("#oLsearchtext").val( searchText );
            $("#topdefaultForm").attr("method", "get");
            $("#topdefaultForm").attr("action", "/servlet/controller.propose.MainSubjSearchServlet");
            $("#topdefaultForm").submit();
        } else {
            location.href = url;
        }

        // menuMainForward(gubun, url);
    }

//���� ����Ʈ ��ũ ����Ʈ�ڽ�
function topGoSiteSelect() {
    var link1 = document.getElementById("footer_relatedlink").value;
    var arr = link1.split(':');

    if(arr[2] == "Y"){

        alert("�α��� �� �̿����ּ���");
        return;

    }

    if($("#footer_relatedlink").val()!="���úμ� ����Ʈ") {
        window.open("/learn/user/portal/include/linkSite_Action.jsp?p_grcode="+arr[0]+"&p_seq="+arr[1]);
    }
    else alert("�̵��Ͻ� ����Ʈ�� �����Ͽ� �ֽʽÿ�.");
}

function topGoSiteSelect1() {
    var link1 = document.getElementById("familysite").value;
    location.target ="_blank";
    window.parent.location = link1;
    //var openNewWindow = window.open("about:blank");
    //openNewWindow.location.href = link1;
}

// ��ü�޴� ��ħ/�ݱ�
function openAllMenu() {
    var allmenu = document.getElementById("allmenu");
    var submenus = document.getElementsByName("gnb_sub");
    var submenulen = submenus.length;

    for(var i = 0 ; i < submenulen ; i++) {
            submenus[i].style.display = "none";
    }

    var tempHtml = "<table width='100%'><tr><td><center><img src='/images/portal/common/ajax-loader1.gif'></center></td></tr></table>";

    if ( allmenu.style.display == "none") {
        $('#allmenu').html(tempHtml);
        $('#allmenu').load('/learn/user/portal/include/siteMapPop.jsp');
        allmenu.style.display = "block";
    } else {
        allmenu.style.display = "none";
    }
}

function mainOver(imgs, idx) {
    var imgObj;
    var subObj = document.getElementsByName("gnb_sub");

    var subLength   = document.getElementById("mainListSize").value;

    for(var i = 0 ; i < subLength  ; i++) {
        if(i==(idx-1)) {
            imgObj = document.getElementById("menuImg"+(i+1));

            if(subObj != null && subObj.length > 0 ) subObj[i].style.display = "block";
            imgover(imgObj);

        } else {
            imgObj = document.getElementById("menuImg"+(i+1));

            if(subObj != null && subObj.length > 0 ) subObj[i].style.display = "none";
            imgout(imgObj);
        }
    }
    imgover(imgs);
}

/*
function fnKeyPressEnter(event, fcName) {
    var e = event || window.event;
    var code = e.charCode || e.keyCode;
    if (code == 13) {
        window[fcName]();
        code = 0
        return false;
    }
}
*/
function imgover(imgs) {
    imgs.src = imgs.src.replace("off.gif", "on.gif");
}
function imgout(imgs) {
    imgs.src = imgs.src.replace("on.gif", "off.gif");
}

function MM_findObj(n, d) { //v4.01
      var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
        d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
      if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
      for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
      if(!x && d.getElementById) x=d.getElementById(n); return x;
    }
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function regcheck(num){
   var month='(0[1-9]|1[0-2])';
   var date='(0[1-9]|[1-2][0-9]|3[0-1])';
   var regMonth = new RegExp(month);
   var regDate = new RegExp(date);

   if(!regMonth.test(num.substring(2,4))) {
      alert("�������� �ֹε�Ϲ�ȣ�� �ƴմϴ�");
      return false;
   }

   if(!regDate.test(num.substring(4,6))) {
      alert("�������� �ֹε�Ϲ�ȣ�� �ƴմϴ�");
      return false;
   }

   var tab=[2,3,4,5,6,7,8,9,2,3,4,5];
   var sum=0,i=0;

   for (i=0;i<12;i++) sum+=parseInt(num.charAt(i))*tab[i];

    if (((11-(sum%11))%10!=num.charAt(12))) {
    alert("�������� �ֹε�Ϲ�ȣ�� �ƴմϴ�");
    return false;
    }

   return true;
}

//����������
function topAdminOpenPage() {
    window.self.name = "winSelectView";
    farwindow = window.open("", "openWinAdmin", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width=1800, height=768, top=0, left=0");
    document.topdefaultForm.target = "openWinAdmin"
    document.topdefaultForm.action = "/learn/admin/system/mScreenFset.jsp";
    document.topdefaultForm.submit();

    farwindow.window.focus();
    document.topdefaultForm.target = window.self.name;
}

// ���Ѻ���
function topAuthChange() {
    var sAuth   = document.getElementById("p_topAuth").value;

    document.topdefaultForm.p_auth.value    = sAuth;
    document.topdefaultForm.p_process.value = "authChange";
    document.topdefaultForm.action          = "/servlet/controller.homepage.MainServlet";
    document.topdefaultForm.submit();
}

/**
 * SSL�� ���� HTTPS �� �������� �����´�.
 * @returns {String}
 */
function https_host(){
    var host;
    var hostfirstname;
    host = location.href;

    ori_host = host.split("//");
    url = ori_host[1] ;

    domain = url.substr(0,url.indexOf("/"));
    hostfirstname = domain.substr(0,domain.indexOf("."));

    if (domain.indexOf("edu.kocca.kr") > -1) {
        return "https://"+domain;
    } else if((domain.indexOf("edukocca.or.kr") > -1) || (domain.indexOf("kocca.or.kr") > -1)){ //
        // return "https://"+hostfirstname+".edukocca.or.kr:442";
        return "https://"+domain;
    } else {
        return "http://"+domain;
    }
}


    /**
     * ��������(��������) ����� ���� �з����� ��ȸ�Ѵ�.
     */
    function fnOpenClassList(lectureCls) {
        var url = "/servlet/controller.infomation.GoldClassHomePageServlet";
        var param = "?p_process=mainPage&pageNo=1&p_lecture_cls=" + lectureCls;

        location.href = url + param;

        /*
        var formObj = document.openClassForm;
        if ( formObj == undefined ) {
            formObj = document.topdefaultForm;
        }

        if ( formObj != undefined ) {
            formObj.method = "get";
            formObj.p_process.value = "mainPage";
            formObj.pageNo.value = "1";
            formObj.p_lecture_cls.value = lectureCls;
            formObj.target = "_self";
            formObj.action = "/servlet/controller.infomation.GoldClassHomePageServlet";

            formObj.submit();
        } else {
            alert("��ְ� �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
            location.href = "/";
        }
        */
    }

    /**
     * ��������(��������) ����� ���� �з����� ��ȸ�Ѵ�.
     */
    function fnOpenClassThemeList(lectureCls) {
        var url = "/servlet/controller.infomation.GoldClassHomePageServlet";
        var param = "?p_process=themeMainPage&pageNo=1&p_lecture_cls=" + lectureCls;

        location.href = url + param;

    }


/**
 * SNS�� �����ϱ�
 */
function fnSendSns(sns, url, txt) {
	var o;
    var _url = encodeURIComponent(url);
    var _txt = encodeURIComponent(txt);
    var _br  = encodeURIComponent('\r\n');

    switch(sns)
    {
        case 'facebook':
            o = {
                method:'popup',
                url:'http://www.facebook.com/sharer/sharer.php?u=' + _url
            };
            break;

        case 'twitter':
            o = {
                method:'popup',
                url:'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url
            };
            break;

		default:
            alert('�������� �ʴ� SNS�Դϴ�.');
            return false;
    }

    switch(o.method) {
        case 'popup':
            window.open(o.url);
            break;
    }
}
