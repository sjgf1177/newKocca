<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import = "com.credu.homepage.LinkSiteBean" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    // ��������
    ArrayList<DataBox> noticeListTop = (ArrayList) request.getAttribute("noticeListTop");

    // �˾� ��������
    ArrayList<DataBox> noticeListPopup = (ArrayList) request.getAttribute("noticePopup");

    // �������� �α����
    ArrayList<DataBox> offLineSubjList   = (ArrayList)request.getAttribute("offLineSubjList");

    // �¶��� �α����
    ArrayList<DataBox> onLineSubjList   = (ArrayList)request.getAttribute("onLineSubjList");

    // �˸��� �α����
    ArrayList<DataBox> eventList   = (ArrayList)request.getAttribute("eventList");
    
    // ���Ŭ���� ����Ʈ
    ArrayList<DataBox> goldClassList = (ArrayList)request.getAttribute("goldClassList");

    //���úμ� ����Ʈ
    LinkSiteBean site = new LinkSiteBean();
    ArrayList bolist = site.SelectList(box);

    String courseImgPath = "";

    HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>

    upperMap   = ClassifySubjectBean.getMenuId(box);

    String footerUrl = "/servlet/controller.homepage.HomePageHelpServlet";

    String mainTabSwMore=box.getString("p_mainTabSwMore");
    if(mainTabSwMore.equals(""))
        mainTabSwMore="0";
%>

<%@ include file="/learn/user/portal/include/topMain.jsp" %>
<%if( box.getSession("tem_grcode").equals("N000001")) { %>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	left:1133px;
	top:166px;
	width:30px;
	height:365px;
	z-index:1;
	overflow: visible;
}
-->
</style>
<%}else{ %>
<style type="text/css">
<!--
#Layer1 {
	position:relative;
    left:-280px;
	top:-30px;
	width:105px;
	z-index:9999;
}
--> 
</style>
<%} %>

<script type="text/javascript">
    var clickSw=0;
    var mainImgSw=0;

    // ������ �˾�
function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable) {
    toolbar_str = toolbar ? 'yes' : 'no';
    menubar_str = menubar ? 'yes' : 'no';
    statusbar_str = statusbar ? 'yes' : 'no';
    scrollbar_str = scrollbar ? 'yes' : 'no';
    resizable_str = resizable ? 'yes' : 'no';
    window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar=no,menubar=no,status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
}

    function popupView() /* �˾� ���� ��ũ��Ʈ */
    {
    var  width  = 0;
    var  height = 0;
    var  left   = 0;
    var  top    = 0;

    <%  for(int i=0; i < noticeListPopup.size(); i++){
            DataBox dbox =    noticeListPopup.get(i);  %>
      width  = <%=dbox.getString("d_popwidth")%>;
      height = <%=dbox.getString("d_popheight")%>;
      left   = <%=dbox.getString("d_popxpos")%>;
      top    = <%=dbox.getString("d_popypos")%>;
      url    = "/servlet/controller.homepage.MainServlet?p_process=popupview&p_seq=<%=dbox.getString("d_seq")%>&p_useframe=<%=dbox.getString("d_useframe")%>&p_popUpPreview=popUpPreview<%=dbox.getString("d_seq")%>";

        if ( notice_getCookie( "popUpPreview<%=dbox.getString("d_seq")%>" ) != "done" ){
          open_window("popUpPreview<%=dbox.getString("d_seq")%>",url,left,top,width,height, "no","no","no","yes","no");
        }
    <%  }  %>
    }

    function trhidden(obj,nowTrName,sw,classStr,allHideTr)
    {
        var obj_parents=$("."+allHideTr);
        $(".hiddenYesNo",obj_parents).hide();
//        $("[name='"+nowTrName+"']").attr("class","");

        if(sw=="t")
        {
            $(".hiddenYesNo",obj).show();
//            $(obj).attr("class",classStr);
        }
    }

    // �������α���� ��û �ٷΰ���
    function gotoOffLinePropose() {
      document.form1.action = "/servlet/controller.off.ProposeOffServlet";
      document.form1.p_process.value = "SubjectList";
      document.form1.gubun.value = "2";
      document.form1.menuid.value = "01";
      document.form1.p_upperclass.value = "";
      document.form1.target = "_self";
      document.form1.submit();
    }

    // ��������� ��ȸ/���ο� �������� ������ �ٷ� ����
    function gotoOffLineCoin() {
       document.form1.action = "/servlet/controller.study.MyClassBillServlet";
       document.form1.p_process.value = "MyOffClassBillListPage";
       document.form1.menuid.value = "19";
       document.form1.gubun.value = "3";
//       document.form1.p_seq.value= seq;
       document.form1.target = "_self";
       document.form1.submit();
    }

    // �������� �󼼺���
    function viewNotice(seq) {
       document.form1.action = "/servlet/controller.homepage.HomeNoticeServlet";
       document.form1.p_process.value = "selectView";
       document.form1.menuid.value = "07";
       document.form1.gubun.value = "4";
       document.form1.p_seq.value= seq;
       document.form1.target = "_self";
       document.form1.submit();
    }

    // �̺�Ʈ �󼼺���
    function viewEvents(seq) {
       document.form1.action = "/servlet/controller.homepage.EventHomePageServlet";
       document.form1.p_process.value = "selectView";
       document.form1.menuid.value = "12";
       document.form1.gubun.value = "4";
       document.form1.p_seq.value= seq;
       document.form1.target = "_self";
       document.form1.submit();
    }

    //�ǽð� ������� �ý���(����������)
    /*function gotoRisk()
    {
       document.form1.action = "/servlet/controller.homepage.EventHomePageServlet";
       document.form1.p_process.value = "selectView";
       document.form1.menuid.value = "05";
       document.form1.gubun.value = "5";
       document.form1.p_seq.value= seq;
       document.form1.target = "_self";
       document.form1.submit();
    }
    */

    // ���� ���뺸��
    function view_On_Subj(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq, menuid){
        var p_process="";
        var action="";
        var gubun="";
        if(courseyn=="ON")
        {
            p_process="SubjectPreviewPage";
            action="/servlet/controller.propose.ProposeCourseServlet";
            gubun="1";
        }
        else
        {
            p_process="SubjectPreviewPage";
            action="/servlet/controller.off.ProposeOffServlet";
            gubun="2";
        }

	    document.form1.p_subj.value = subj;
	    document.form1.p_subjnm.value = subjnm;
	    document.form1.p_iscourseYn.value = courseyn;
	    document.form1.p_upperclass.value = upperclass;
	    document.form1.p_upperclassnm.value = upperclassnm;
	    document.form1.p_year.value = year;
	    document.form1.p_subjseq.value = subjseq;
        $("[name='p_seq']").val(upperclassnm);
	    document.form1.menuid.value = menuid;
	    document.form1.gubun.value = gubun;
	    document.form1.p_process.value = "SubjectPreviewPage";
	    document.form1.p_rprocess.value = 'SubjectList';
	    document.form1.action=action;
	    document.form1.target = "_self";
	    document.form1.submit();
    }
/* ������� �ּ�ó��..
    //��ư Ȱ��ȭ/��Ȱ��
    function changeLayerBtn(str,obj)
    {
        var imgPath1="/images/newmain_20100625/focus_btn_0";
        var imgPath2="_o.png";
        var imgPath3=".png";

        var p=$("#Layer1").find("table");

        var p1=$("td:eq(0)",p).find("img");
        $(p1).attr("id",$(p1).attr("id").substr(0,8));
        $(p1).attr("src",imgPath1+1+imgPath3);

        var p2=$("td:eq(2)",p).find("img");
        $(p2).attr("id",$(p2).attr("id").substr(0,8));
        $(p2).attr("src",imgPath1+2+imgPath3);

        var p3=$("td:eq(4)",p).find("img");
        $(p3).attr("id",$(p3).attr("id").substr(0,8));
        $(p3).attr("src",imgPath1+3+imgPath3);

        var r=$(obj).attr("id");
        $(obj).attr("id",r+"A");
        $(obj).attr("src",imgPath1+str+imgPath2);
    }

    //����ȭ�� �÷��� Ȥ�� �̹����� �ٲ�
    function changeMainFlash(str,tableId,obj)
    {
        clickSw=1;
        changeLayerBtn(str,obj);

        var flash=$(tableId).find("td:eq(0)");
        var img0=$(tableId).find("td:eq(1)");
        var img1=$(tableId).find("td:eq(2)");

        switch(str)
        {
            case '1':
                $(img0).hide();
                $(img1).hide();
                $(flash).show();
                break;
            case '2':
                $(img0).show();
                $(img1).hide();
                $(flash).hide();
                break;
            case '3':
                $(img0).hide();
                $(img1).show();
                $(flash).hide();
                break;
        }
    }
*/
/* 
    $(document).ready(function(){

        var r=$("[name='onlinesubjtr']:eq(0)");

        //$(r).attr("class","onover");
        $(".hiddenYesNo:eq(0)",r).show();
        $(".hiddenYesNo:eq(1)",r).show();

        r=$("[name='offlinesubjtr']:eq(0)");

 		//$(r).attr("class","offover");
        $(".hiddenYesNo:eq(0)",r).show();
        $(".hiddenYesNo:eq(1)",r).show();
*/
//        var tabSw="<%=mainTabSwMore%>";
/*
        if(tabSw=="0")
        {
            $("#Image48").attr("src","/images/newmain_20100625/notice_tab_o.gif");
            $("#Image47").attr("src","/images/newmain_20100625/event_tab_a.gif");
        }
        else if(tabSw=="1")
        {
            $("#Image48").attr("src","/images/newmain_20100625/notice_tab_a.gif");
            $("#Image47").attr("src","/images/newmain_20100625/event_tab_o.gif");
        }

        //���� ȭ�� �̹��� �������� ����
        var random=Math.floor(Math.random() * 4+1) ;
        mainImgSw=random;
        changeMainFlash(random.toString(),$('#layer1Parent'),$("#Image"+(99+random)));

        timerStart();

        //�˾�
        popupView();
    });
*/


    function timerStart()
    {
        $("#layer1Parent").everyTime(3000,"abc1", function() {
             mainImgSw++;
            if(mainImgSw>3)
                mainImgSw=1;

            changeMainFlash(mainImgSw.toString(),$('#layer1Parent'),$("#Image"+(99+mainImgSw)));
        });
    }

    function timerStop(str)
    {
        $("#layer1Parent").stopTime("abc1");
    }

    function mainTabSw(str)
    {
        switch(str.charAt(0))
        {
            case '0':
                $("[name='p_mainTabSwMore']").val(str);
                document.form1.action="/servlet/controller.homepage.MainServlet";
                document.form1.submit();
                break;
            case '1':            	
                $("[name='p_mainTabSwMore']").val(str);
                document.form1.action="/servlet/controller.homepage.MainServlet";
               document.form1.submit();
               
                break;
            case '2':
                if($("[name='p_mainTabSwMore']").val()=="0")
                    menuForward('4','07');
              //  else
              //      menuForward('5','05');
               break;
            case '3':
            	if($("[name='p_mainTabSwMore']").val()=="1")
                    menuForward('4','12');
        }
    }

 // ���� ����Ʈ ��ũ ����Ʈ�ڽ�
    function goSiteSelect() {
    	var link1 = document.form1.relatedlink.value;
    	var arr = link1.split(':');

    	if(arr[2] == "Y"){
    	
    		alert("�α��� �� �̿����ּ���");
    		return;
    	
    	}
    	if(link1 != ""){
    	window.open("/learn/user/homepage/zu_LinkSite_Action.jsp?p_grcode="+arr[0]+"&p_seq="+arr[1], "SiteLink", "toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=700,height=480,left=80,top=100");
    	}
    }
// 2���߼� ���� - ����
    //function gotest(){
    //	window.open("/2012_academy_popup.jsp", "SiteLink", "toolbar=no,location=no,directories=yes,status=no,menubar=no,scrollbars=yes,resizable=no,width=400,height=500,left=80,top=100");    	
    //}
    //gotest();
// ��

// �α���ó���� topVisual.jsp ó��..

    /* �н����� ����Ű üũ */
/*    function password_enter(e) {
        if (e.keyCode =='13'){  login();  }
    }

    // �α���
    function login() {
        if (input_chk(form1)){
            form1.p_process.value   = "login";
            form1.p_topuserid.value = form1.p_userid.value;
            form1.p_toppwd.value =  form1.p_pwd.value;

            form1.action            = "/servlet/controller.homepage.LoginServlet";
            form1.submit();
        }
    }

    // �Է� üũ
    function input_chk(form1)  {
        if (document.form1.p_userid.value == "" || document.form1.p_userid.value == null )
        {
            document.form1.p_userid.value="";  //��â�� NULL�� ����
            //alert( "���̵��� �Է��Ͻʽÿ�.");
            document.form1.p_userid.focus();
            return(false);
        }
        if (document.form1.p_pwd.value == "" || document.form1.p_pwd.value == null )
        {
            document.form1.p_pwd.value="";  //��â�� NULL�� ����
            //alert( "��й�ȣ �Է��Ͻʽÿ�.");
            document.form1.p_pwd.focus();
            return(false);
        }
        return(true);
    }
*/

    //�������� ������ ���� ����..(�̸��� Ȯ���� ���� �����ؾ� �ϸ�, ���� ������ ���� �� �� ����� ������ ����.)
<% if( box.getString("p_eduservicesul").equals("Y") && box.getString("p_eduServiceSulCheck").equals("Y") ) { //�������� ������ ���� Ư���ο��� ���� ����..  %>
    window.onload = function () { sulMove();  }
<% } %>    
	window.onload = function () { popupView(); }
    
    //�������� ������ ���� ����..
    function sulMove(test){

        window.self.name = "";
        open_window("openSulmun","","","","620","700");
        document.form1.target = "openSulmun";
        document.form1.action = "/servlet/controller.study.MyClassServlet";
        document.form1.p_process.value = "SulmunMove";
        document.form1.p_edusulUserid.value = "<%=box.getString("p_userid") %>";

        document.form1.submit();
    }

    //���޴�
    function initMoving(target, position, topLimit, btmLimit) {
    	if (!target)
    	return false;

    	var obj = target;
    	obj.initTop = position;
    	obj.topLimit = topLimit;
    	obj.bottomLimit = document.documentElement.scrollHeight - btmLimit;

    	obj.style.position = "absolute";
    	obj.top = obj.initTop;
    	obj.left = obj.initLeft;

    	if (typeof(window.pageYOffset) == "number") {
    	obj.getTop = function() {
    	return window.pageYOffset;
    	}
    	} else if (typeof(document.documentElement.scrollTop) == "number") {
    	obj.getTop = function() {
    	return document.documentElement.scrollTop;
    	}
    	} else {
    	obj.getTop = function() {
    	return 0;
    	}
    	}

    	if (self.innerHeight) {
    	obj.getHeight = function() {
    	return self.innerHeight;
    	}
    	} else if(document.documentElement.clientHeight) {
    	obj.getHeight = function() {
    	return document.documentElement.clientHeight;
    	}
    	} else {
    	obj.getHeight = function() {
    	return 500;
    	}
    	}

    	obj.move = setInterval(function() {
    	if (obj.initTop > 0) {
    	pos = obj.getTop() + obj.initTop;
    	} else {
    	pos = obj.getTop() + obj.getHeight() + obj.initTop;
    	//pos = obj.getTop() + obj.getHeight() / 2 - 15;
    	}

    	if (pos > obj.bottomLimit)
    	pos = obj.bottomLimit;
    	if (pos < obj.topLimit)
    	pos = obj.topLimit;

    	interval = obj.top - pos;
    	obj.top = obj.top - interval / 3;
    	obj.style.top = obj.top + "px";
    	}, 30)
    	}

  // ���Ŭ���� ��ȭ�� �������� �̵�
    function viewContent(seq) {
    	//document.form1.p_prePage.value   = "Main";
        document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        //document.form1.target="_self";
        document.form1.gubun.value = "5";
        document.form1.p_process.value   = "selectView";
        document.form1.p_seq.value       = seq;
        document.form1.submit();
    }

</script>

 <form name="form1" method="post" id="form1" style="margin-top: -206px;">
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" name="p_rprocess" value="" />
    <input type="hidden" name="menuid" value="" />
    <input type="hidden" name="gubun" value="" />
    <input type="hidden" name="p_seq" value="" />

    <input type="hidden" name="p_subj" value="" />
    <input type="hidden" name="p_subjnm" value="" />
    <input type="hidden" name="p_iscourseYn" value="" />
    <input type="hidden" name="p_upperclass" value="" />
    <input type="hidden" name="p_upperclassnm" value="" />
    <input type="hidden" name="p_year" value="" />
    <input type="hidden" name="p_subjseq" value="" />
    <input type="hidden" name="p_mainTabSwMore" value="<%=mainTabSwMore%>" />

    <input type="hidden" name="p_topuserid"	value=""/>
    <input type="hidden" name="p_toppwd"	value=""/>

    <input type="hidden" name="p_edusulUserid" values="" />
    
    <input type = "hidden" name = "p_prePage"     value = "">
    
    	<%if( box.getSession("tem_grcode").equals("N000001")) { %>
	
      	
      	<!--��� �޴��κ�-->
<!--��� �޴��κ�//-->

<table width="995" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="271" valign="top">
    
    <!--�α��� �޴��κ�-->
    <table width="995" border="0" cellspacing="0" cellpadding="0">
      <tr>
      
      
        <td width="995" height="278" valign="top" bgcolor="#000099">
        	<script>jsFlash('/images/portal/homepage_renewal/swf/main.swf','995','278','','','', '');</script>
        </td>
        <td width="0" valign="top"><table width="0" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td valign="top">
              <!-- ���޴� -->
<div id="gotop" style="margin-left: -75px; margin-top: -26px"> 	
  <table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="10">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="/images/portal/homepage_renewal/common/title_quickmu.png" alt="QUICK MEMU" /></td>
    </tr>
    <tr>
      <td><a href="javascript:menuMainForward('3','/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','/images/portal/homepage_renewal/common/btn_quickmu_on1.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_quickmu_off1.gif" alt="���ǰ��ǽ�" name="Image1" id="Image1" /></a></td>
    </tr>
    <tr>
      <td><a href="javascript:menuForward('3', '02');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','/images/portal/homepage_renewal/common/btn_quickmu_on2.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_quickmu_off2.gif" alt="���������" name="Image21" id="Image21" /></a></td>
    </tr>
    <tr>
      <td height="80" valign="bottom" background="/images/portal/homepage_renewal/common/btn_quickmu_on3.gif"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="26" align="center"><a href="javascript:menuMainForward('1','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList')"><img src="/images/portal/homepage_renewal/common/qu_on.gif" width="29" height="23" id="Image2" onmouseover="MM_swapImage('Image2','','/images/portal/homepage_renewal/common/qu_on2.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
          <td align="center"><a href="javascript:menuMainForward('2','/servlet/controller.off.ProposeOffServlet?p_process=SubjectList')"><img src="/images/portal/homepage_renewal/common/qu_off2.gif" width="30" height="23" id="Image3" onmouseover="MM_swapImage('Image3','','/images/portal/homepage_renewal/common/qu_off.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td><a href="javascript:gotoOffLineCoin();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','/images/portal/homepage_renewal/common/btn_quickmu_on4.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_quickmu_off4.gif" alt="�������ΰ���" name="Image31" id="Image31" /></a></td>
    </tr>
  </table>
 </div>
 <script type="text/javascript">initMoving(document.getElementById("gotop"), 200, 1, 0);</script>
<!-- ���޴� -->
              </td>
            </tr>
        </table></td>
      </tr>
    </table>
    <!--�α��� �޴��κ�//-->
    <!--��ܹ�� �޴��κ�-->
    <!--��ܹ�� �޴��κ�//-->    </td>
  </tr>

  <tr>
    <td height="23"></td>
  </tr>
</table>
<table width="995" border="0" align="center" cellpadding="0" cellspacing="0">
<tr></tr>
<tr>
  <td width="14" rowspan="3" valign="top"></td>
  <td width="260" rowspan="3" valign="top"><table width="260" border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <td width="25%" valign="middle" height="40"><a href="javascript:mainTabSw('0');" ><img src="<%  if(mainTabSwMore.equals("0")||mainTabSwMore.equals("2")){%>/images/portal/homepage_renewal/common/btn_notice_on1.gif<%}else if(mainTabSwMore.equals("1")){ %>/images/portal/homepage_renewal/common/btn_notice_off1.gif<%} %>" name="Image48" width="68" height="21" border="0" id="Image48" alt="��������" /></a></td>
      <td width="27%" valign="middle" height="40"><img src="<%  if(mainTabSwMore.equals("0")||mainTabSwMore.equals("2")){%>/images/portal/homepage_renewal/common/btn_event_off1.gif<%}else if(mainTabSwMore.equals("1")){ %>/images/portal/homepage_renewal/common/btn_event_on1.gif<%} %>" name="Image47" width="73" height="21" border="0" id="Image47" alt="�̺�Ʈ" onclick="mainTabSw('1')" style="CURSOR:POINTER"/></td>
      <td width="48%" height="30"><div align="right"><a href="<%  if(mainTabSwMore.equals("0")||mainTabSwMore.equals("2")){%>javascript:mainTabSw('2');<%}else if(mainTabSwMore.equals("1")){ %>javascript:mainTabSw('3');<%} %>"><img src="/images/portal/homepage_renewal/common/btn_more.gif" width="33" height="10" alt="more"/></a></div></td>
    </tr>
  </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <%  if(mainTabSwMore.equals("0"))
                                                                                    {
                                                                                        if(noticeListTop.size()!=0)
                                                                                        {
                                                                                            for(int i=0;i<noticeListTop.size();i++)
                                                                                            {
                                                                                                if(i==5)
                                                                                                    break;
                                                                                                DataBox dbox =  noticeListTop.get(i);
                                                                                                out.print("<tr>");
                                                                                                out.print("<td height='18'>");                                                                                                
                                                                                                out.print("<a href=\"javascript:viewNotice('"+dbox.getString("d_seq").trim()+"')\">"+StringManager.formatTitle(StringManager.removeHTML(dbox.getString("d_adtitle")), 27)+"</a>");
                                                                                                out.print("</td>");
                                                                                                out.print("<td class='h_road'>");
                                                                                                out.print(dbox.getString("d_addate").substring(0,4)+"/"+dbox.getString("d_addate").substring(4,6)+"/"+dbox.getString("d_addate").substring(6,8));
                                                                                                out.print("</td>");
                                                                                                out.print("</tr>");
                                                                                            }

                                                                                            out.print("<tr>");
                                                                                            out.print("<td colspan='2'>&nbsp;</td>");
                                                                                            out.print("</tr>");
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            out.print("<tr>");
                                                                                            out.print("<td height='18'>�ش� ������ �������� �ʽ��ϴ�.</td>");
                                                                                            out.print("</tr>");
                                                                                            out.print("<tr>");
                                                                                            out.print("<td colspan='2'>&nbsp;</td>");
                                                                                            out.print("</tr>");
                                                                                        }
                                                                                    }
                                                                                    else if(mainTabSwMore.equals("1"))
                                                                                    {
                                                                                        if(eventList.size()!=0)
                                                                                        {
                                                                                            for(int i=0;i<eventList.size();i++)
                                                                                            {
                                                                                                if(i==5)
                                                                                                    break;
                                                                                                DataBox dbox =  eventList.get(i);
                                                                                                out.print("<tr>");
                                                                                                out.print("<td height='18'>");   
                                                                                                out.print("<a href=\"javascript:viewEvents('"+dbox.getString("d_seq").trim()+"')\">"+StringManager.formatTitle(StringManager.removeHTML(dbox.getString("d_title")), 20)+"</a>");
                                                                                                out.print("</td>");
                                                                                                out.print("<td class='h_road'>");
                                                                                                out.print(dbox.getString("d_STRDATE").substring(0,4)+"/"+dbox.getString("d_STRDATE").substring(4,6)+"/"+dbox.getString("d_STRDATE").substring(6,8));
                                                                                                out.print("</td>");
                                                                                                out.print("</tr>");
                                                                                            }
                                                                                            out.print("<tr>");
                                                                                            out.print("<td colspan='2'>&nbsp;</td>");
                                                                                            out.print("</tr>");
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                        	out.print("<tr>");
                                                                                            out.print("<td height='18'>�ش� ������ �������� �ʽ��ϴ�.</td>");
                                                                                            out.print("</tr>");
                                                                                            out.print("<tr>");
                                                                                            out.print("<td colspan='2'>&nbsp;</td>");
                                                                                            out.print("</tr>");
                                                                                        }
                                                                                    }%>
    </table></td>
  <td width="20" rowspan="3" valign="top"><!--Ÿ��Ʋ�κ�-->
    <!--Ÿ��Ʋ�κ�//-->
    <!--�Ǻκ�-->
    <!--�Ǻκ�//-->
    <!--���̺�κ�-->
    <!--����¡�κ�-->
    <!--����¡�κ�//--></td>
  <td width="1" valign="top" bgcolor="#DDDDDD"></td>
  <td width="10" rowspan="3" valign="top">&nbsp;</td>
  <td width="270" rowspan="3" valign="top"><table width="260" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="260" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="40"><img src="/images/portal/homepage_renewal/common/txt_best.gif" width="94" height="15" /></td>
          <td class="h_road"><a href="javascript:menuMainForward('1','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList')"><img src="/images/portal/homepage_renewal/common/on_btn01.jpg" width="94" height="25" /></a></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <%  if(onLineSubjList.size()!=0)
                                                                                                    {
                                                                                                        for(int i=0;i<onLineSubjList.size();i++)
                                                                                                        {
                                                                                                            DataBox dbox =  onLineSubjList.get(i);
                                                                                                            String biyong="";
                                                                                                            String aHref_SubjValues="";
                                                                                                            DecimalFormat df = new DecimalFormat("#,###");

                                                                                                            String tmp=upperMap !=null && upperMap.get(dbox.get("d_scupperclass")) != null ?  upperMap.get(dbox.get("d_scupperclass")).toString() : "00";
                                                                                                            aHref_SubjValues=dbox.get("d_subj")+"\",\""+dbox.get("d_subjnm")+"\",\""+dbox.get("d_isonoff")+"\",\""+dbox.get("d_scupperclass")+"\",\""+dbox.get("d_uclassnm")+"\",\""+dbox.get("d_scyear")+"\",\""+dbox.get("d_subjseq")+"\",\"";
                                                                                                            aHref_SubjValues+=tmp;

                                                                                                            out.print("<tr>");
                                                                                                            out.print("<td height='18'>");
                                                                                                            out.print("<a href='javascript:view_On_Subj(\""+aHref_SubjValues+"\")'>");
                                                                                                            out.print(StringManager.formatTitle(dbox.get("d_subjnm"), 22));
                                                                                                            out.print("</a></td>");
                                                                                                            out.print("<td class='h_road'>");
                                                                                                            out.print(dbox.getString("d_EDUSTART").replace('.','/'));
                                                                                                            out.print("</td>");
                                                                                                            out.print("</tr>");
                                                                                                        }

                                                                                                    } else {
                                                                                                        out.print("<tr>");
                                                                                                        out.print("<td height='18'>���� ��û ������ ���°� �����ϴ�.</td>");
                                                                                                        out.print("</tr>");
                                                                                                        out.print("<tr>");
                                                                                                        out.print("<td colspan='2'>&nbsp;</td>");
                                                                                                        out.print("</tr>");
                                                                                                    }%>          
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </table></td>
  <td width="15" rowspan="3">&nbsp;</td>
  <td width="1" rowspan="3" bgcolor="#DDDDDD"></td>
  <td width="15" rowspan="3">&nbsp;</td>
  <td width="272" rowspan="3" valign="top"><table width="260" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="260" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="40"><img src="/images/portal/homepage_renewal/common/txt_offline_list.gif" width="117" height="15" /></td>
          <td class="h_road"><a href="javascript:menuMainForward('2','/servlet/controller.off.ProposeOffServlet?p_process=SubjectList')"><img src="/images/portal/homepage_renewal/common/off_btn01.jpg" width="97" height="25" /></a></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<%  if(offLineSubjList.size()!=0)
                                                                                                    {
                                                                                                        for(int i=0;i<offLineSubjList.size();i++)
                                                                                                        {
                                                                                                            DataBox dbox =  offLineSubjList.get(i);
                                                                                                            out.print("<tr class='offa2'>");
                                                                                                            String biyong="";
                                                                                                            String aHref_SubjValues="";
                                                                                                            DecimalFormat df = new DecimalFormat("#,###");

                                                                                                            aHref_SubjValues=dbox.get("d_subj")+"\",\""+dbox.get("d_subjnm")+"\",\""+dbox.get("d_isonoff")+"\",\""+dbox.get("d_scupperclass")+"\",\""+dbox.get("d_seq")+"\",\""+dbox.get("d_scyear")+"\",\""+dbox.get("d_subjseq")+"\",\"";
                                                                                                            aHref_SubjValues+=dbox.get("d_scupperclass");

                                                                                                            out.print("<tr>");
                                                                                                            out.print("<td height='18'>");
                                                                                                            out.print("<a href='javascript:view_On_Subj(\""+aHref_SubjValues+"\")'>");
                                                                                                            out.print(StringManager.formatTitle(dbox.get("d_subjnm"), 22));
                                                                                                            out.print("</a></td>");
                                                                                                            out.print("<td class='h_road'>");
                                                                                                            out.print(dbox.getString("d_edustart").substring(0,4)+"/"+dbox.getString("d_edustart").substring(4,6)+"/"+dbox.getString("d_edustart").substring(6,8));
                                                                                                            out.print("</td>");
                                                                                                            out.print("</tr>");
                                                                                                        }

                                                                                                    } else {
                                                                                                    	out.print("<tr>");
                                                                                                        out.print("<td height='18'>���� ��û ������ ���°� �����ϴ�.</td>");
                                                                                                        out.print("</tr>");
                                                                                                        out.print("<tr>");
                                                                                                        out.print("<td colspan='2'>&nbsp;</td>");
                                                                                                        out.print("</tr>");
                                                                                                    }%>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </table></td>
  <td width="85" rowspan="3">&nbsp;</td>
</tr>
<tr>
  <td valign="top" bgcolor="#DDDDDD"></td>
</tr>
<tr>
  <td valign="top" bgcolor="#DDDDDD"></td>
</tr>
<tr>
  <td rowspan="2" valign="top"></td>
  <td><img src="/images/portal/homepage_renewal/common/ask_title.gif" width="258" height="21" align="middle" /></td>
  <td colspan="3" rowspan="2" valign="top">&nbsp;</td>
  <td height="35" colspan="3"><img src="/images/portal/homepage_renewal/common/gold_title.gif" width="276" height="21" /></td>
  <td rowspan="2">&nbsp;</td>
  <td align="center"><img src="/images/portal/homepage_renewal/common/go_title.gif" width="272" height="21" align="middle" /></td>
</tr>
<tr>
  <td><img src="/images/portal/homepage_renewal/common/main_ask.gif" width="258" height="76" /></td>
  <td colspan="3">
  <%  if(goldClassList.size()!=0){
	  	int i = (int)(Math.random()*(goldClassList.size()));
	  	DataBox dbox		= goldClassList.get(i);
		String v_seq		= dbox.getString("d_seq");
		String v_vodimg		= dbox.getString("d_vodimg");
		String v_lecnm		= StringUtil.getByteString(dbox.getString("d_lecnm"),22); 
		String v_tutornm	= dbox.getString("d_tutornm");
		String v_intro		= StringUtil.getByteString(dbox.getString("d_intro"),26); 
  %>
  <table width="280" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="35%" rowspan="3"><table border="0" cellpadding="0" cellspacing="1" bgcolor="B4B4B4">
        <tr>
          <td><a href="javascript:viewContent( <%=v_seq%>);"><img src="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_vodimg%>" width="95" height="71" /></a></td>
        </tr>
      </table></td>
      <td width="4%" class="type03">&nbsp;</td>
      <td width="61%" class="type03"><img src="/images/portal/homepage_renewal/common/arr_blet.gif" alt="" width="3" height="11" /> <strong><%=v_lecnm %></strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><strong><img src="/images/portal/homepage_renewal/common/arr_blet.gif" alt="" width="3" height="11" /></strong><a href="javascript:viewContent(<%=v_seq%>);"> ����� : <%=v_tutornm%></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><strong><img src="/images/portal/homepage_renewal/common/arr_blet.gif" width="3" height="11" /></strong><a href="javascript:viewContent(<%=v_seq%>);"> ���� : <%=v_intro%></a></td>
    </tr>
  </table>
  <%} %>
  </td>
  <td><table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><a href="javascript:menuForward('4', '01');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image30','','/images/portal/homepage_renewal/common/btn_msinfo_on01.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_msinfo_off01.gif" name="Image30" width="42" height="74" border="0" id="Image30" alt="FAQ"/></a></td>
      <td><a href="javascript:menuForward('4', '02');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image32','','/images/portal/homepage_renewal/common/btn_msinfo_on02.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_msinfo_off02.gif" name="Image32" width="46" height="74" border="0" id="Image32" alt="Q&A"/></a></td>
      <td><a href="javascript:menuForward('4', '09');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image33','','/images/portal/homepage_renewal/common/btn_msinfo_on03.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_msinfo_off03.gif" name="Image33" width="42" height="74" border="0" id="Image33" alt="1:1����"/></a></td>
      <td><a href="javascript:menuForward('4', '03');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image34','','/images/portal/homepage_renewal/common/btn_msinfo_on04.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_msinfo_off04.gif" name="Image34" width="47" height="74" border="0" id="Image34" alt="S/W �ٿ�ε�"/></a></td>
      <td><a href="javascript:menuForward('4', '05');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image35','','/images/portal/homepage_renewal/common/btn_msinfo_on05.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_msinfo_off05.gif" name="Image35" width="48" height="74" border="0" id="Image35" alt="�н�ȯ�� �����"/></a></td>
      <td><a href="javascript:menuForward('4', '10');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image36','','/images/portal/homepage_renewal/common/btn_msinfo_on06.gif',1)"><img src="/images/portal/homepage_renewal/common/btn_msinfo_off06.gif" name="Image36" width="42" height="74" border="0" id="Image36" alt="����ȳ�"/></a></td>      
    </tr>
  </table></td>
</tr>
</table>

<!--�ϴܺκ�-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="/images/portal/homepage_renewal/common/footer_bg.jpg"><table width="995" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22">&nbsp;</td>
      </tr>
      <tr>
        <td height="22" background="/images/portal/homepage_renewal/common/bg_btm.gif"><table width="995" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="112"><a href="javascript:menuForward('90','06')"><img src="/images/portal/homepage_renewal/common/btn_btm_01.gif" alt="��������ó����ħ" /></a></td>
              <td width="66"><a href="javascript:menuForward('90', '05')"><img src="/images/portal/homepage_renewal/common/btn_btm_02.gif" alt="�̿���" /></a></td>
              <td width="111"><a href="javascript:menuMainForward('99', '<%=footerUrl %>?p_process=Footer&p_code=FOOTER_EMAIL')"><img src="/images/portal/homepage_renewal/common/btn_btm_03.gif" alt="�̸��� ���ܼ��� �ź�" /></a></td>
              <td width="65"><a href="javascript:mainmenu('999');"><img src="/images/portal/homepage_renewal/common/btn_btm_04.gif" alt="����Ʈ��" /></a></td>
              <td><div align="right"><img src="/images/portal/homepage_renewal/common/txt_familysite.gif" alt="Family Site" /></div></td>
              <td width="150" style="padding-right:10px;"><div align="right">
                  <select name="relatedlink" onChange="goSiteSelect()" title="���û���Ʈ�ٷΰ���">
                                                                <option>:: ���û���Ʈ�ٷΰ���</option>
                                                                <%
                                                                    for( int ii = 0 ; ii < bolist.size() ; ii++ ){
                                                                        DataBox ddbox = (DataBox)bolist.get(ii);

                                                                        int vv_seq      = ddbox.getInt("d_seq");
                                                                        int vv_sort     = ddbox.getInt("d_sort");
                                                                        String vv_sitenm   = ddbox.getString("d_sitenm");
                                                                        String vv_url      = ddbox.getString("d_url");
                                                                        String vv_isuse    = ddbox.getString("d_isuse");
                                                                        String vv_islogin  = ddbox.getString("d_islogin");
                                                                        String vv_ldate    = ddbox.getString("d_ldate");
                                                                        String vv_grcode   = ddbox.getString("d_grcode");
                                                                        String vv_banner   = ddbox.getString("d_banner");
                                                                %>
                                                                            <option value='<%=vv_grcode%>:<%=vv_seq%>:<%=vv_islogin%>'><%=vv_sitenm%></option>
                                                                <%  }
                                                                %>
                                                                </select>
              </div></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td>
        	<table width="995" border="0" cellspacing="0" cellpadding="0">
        		<tr>
        			<td>
			        	<img src="/images/portal/homepage_renewal/common/copyright.gif" alt="���� ��õ�� �񵿵��� 203-1 ���ȸ�� 8�� | ��ǥ��ȭ: 02-2161-0077(�¶��� ����), 02-2161-0072(�������� ����) �ѽ�: 02-3219-5723 | ����ڵ�Ϲ�ȣ: 117-82-04412 | ����Ǹž��Ű��ȣ: ��õ 00471 �ѱ������������(��) ���� ����� copyright (c) 2011  kocca  all rights reserved" />
					</td>
					<td>
						<img src="http://edu.kocca.or.kr/contents/temp/i_safe_mark.gif" border="0" alt="I_Safe" style="cursor:hand" Onclick="javascript:window.open('http://edu.kocca.or.kr/contents/temp/i_safe.html','mark','scrollbars=no,resizable=no,width=700,height=965');">
					</td>
					<td>
						<img src="http://edu.kocca.or.kr/contents/temp/eprivacy_mark.gif" border="0" alt="ePrivacy" style="cursor:hand" Onclick="javascript:window.open('http://edu.kocca.or.kr/contents/temp/eprivacy.html','mark','scrollbars=no,resizable=no,width=700,height=965');">
					</td>
					<td>
						<img src="http://edu.kocca.or.kr/contents/temp/gsc_mark.jpg" border="0" alt="Good Content Service" style="cursor:hand" Onclick="javascript:window.open('http://edu.kocca.or.kr/contents/temp/gcs.html','mark','scrollbars=no,resizable=no,width=715,height=900');">
					</td>
					<td>
						<img src="https://mark.inicis.com/img/mark_new/inipoint/mark_circle_blue_s.gif" border="0" alt="Ŭ���Ͻø� �̴Ͻý� �����ý����� ��ȿ���� Ȯ���Ͻ� �� �ֽ��ϴ�." style="cursor:hand" Onclick=javascript:window.open("https://mark.inicis.com/mark/popup_v1.php?no=19844&amp;st=1322725008","mark","scrollbars=no,resizable=no,width=530,height=670");>
					</td>
				</tr>
			</table>		
		</td>		
      </tr>
    </table></td>
  </tr>
</table>



      	<%}else{ %>
    

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="68" valign="top" background="/images/newmain_20100625/topnavi_bgbg.gif" style="background-position:bottom;background-repeat:no-repeat;"><!--ž�׺���̼� ����-->
                        <script>jsFlash('/flash/topnavi.swf','960','68','','','', '');</script></td>
                        <!--������ġ ǥ���Ҷ� <td height="68" valign="top"><script>jsFlash('flash/topnavi.swf?pageNum=1&subNum=1','960','68','','','', '');</script></td>-->
                        <td valign="top">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <!-- ���γ������-->
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td colspan="2" valign="top"><img src="/images/newmain_20100625/main_bgimg_01.gif" alt="" width="960" height="7" /></td>
                                </tr>
                                <tr>
                                    <td width="301" valign="top" background="/images/newmain_20100625/left_bg_02.gif">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td><img src="/images/newmain_20100625/left_bg_01.gif" alt="" width="301" height="22" /></td>
                                            </tr>
                                            <tr>
                                                <td height="107" valign="top" <% if(topWarp_usernm.equals("")) {out.print("background='/images/newmain_20100625/left_bg_03.gif'");} else {out.print("background='/images/newmain_20100625/left_bg_05.gif'");} %>>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="51">&nbsp;</td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td height="23" ></td>
                                                                  </tr>

                                                                    <% if(topWarp_usernm.equals("")) {%>
                                                                  <tr>
                                                                    <td height="42" ><table width="100%" border="0" cellspacing="0" cellpadding="0" sumamry="�α���">
                                                                      <tr>
                                                                        <td width="38">&nbsp;</td>
                                                                        <td><label for="p_userid"></label><span style="padding-top:5px">
                                                                          <input name="p_userid" type="text" class="inp_txt_01" title="���̵�" id="p_userid" onkeypress="password_enter(event)" size="16" tabindex="1" />
                                                                        </span></td>
                                                                        <td width="61" rowspan="2"><a href="javascript:login();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image86','','/images/newmain_20100625/login_bn_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image86','','/images/newmain_20100625/login_bn_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/login_bn_a.gif" name="Image86" width="61" height="44" border="0" id="Image86" alt="�α���" tabindex="3" /></a></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td>&nbsp;</td>
                                                                        <td><label for="p_pwd"></label><span style="padding-top:5px">
                                                                        <input name="p_pwd" type="password" class="inp_txt_01" id="p_pwd"  title="�н�����" onkeypress="password_enter(event)" size="16" tabindex="2" />
                                                                        </span></td>
                                                                        </tr>
                                                                    </table></td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td height="30" ><table border="0" cellspacing="0" cellpadding="0" summary="ȸ�����Թٷΰ���">
                                                                      <tr>
                                                                        <td width="10"><img src="/images/newmain_20100625/top_ico.gif" alt=""/></td>
                                                                        <td><a href="javascript:mainmenu('991');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','/images/newmain_20100625/top_m3_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image21','','/images/newmain_20100625/top_m3_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/top_m3_a.gif" alt="ȸ������" name="Image21" width="37" height="11" border="0" id="Image21" /></a></td>
                                                                        <td width="20">&nbsp;</td>
                                                                        <td width="10"><img src="/images/newmain_20100625/top_ico.gif" alt=""/></td>
                                                                        <td ><a href="javascript:mainmenu('992')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','/images/newmain_20100625/btn_search_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image31','','/images/newmain_20100625/btn_search_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/btn_search_a.gif" alt="���̵�/�н�����ã��"  name="Image31" width="90" height="11" border="0" id="Image31" /></a></td>
                                                                      </tr>
                                                                    </table></td>
                                                                  </tr>
                                                                 <%} else {%>
                                                                 <tr>
                                                                    <td height="33" align="center"class="fs_12"  ><%=topWarp_usernm%>��, ȯ���մϴ�.</td>
                                                                 </tr>
                                                                  <tr>
                                                                    <td height="35"  align="center"><a href="javascript:menuMainForward('3', '/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image62','','/images/newmain_20100625/btn_myroom_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image62','','/images/newmain_20100625/btn_myroom_o.gif',1)">
                                                                        <img src="/images/newmain_20100625/btn_myroom_a.gif" alt="���ǰ��ǽ�"  name="Image62" width="90" height="25" border="0" id="Image62" /></a>
                                                                        <a href="javascript:menuForward('90', '07');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image63','','/images/newmain_20100625/btn_pwdchange_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image63','','/images/newmain_20100625/btn_pwdchange_o.gif',1)">
                                                                        <img src="/images/newmain_20100625/btn_pwdchange_a.gif" alt="��й�ȣ����"  name="Image63" width="90" height="25" border="0" id="Image63" /></a></td>
                                                                  </tr>
                                                                   <%}%>
                                                                    
                                                                </table></td>
                                                            <td width="31">&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="117" valign="top">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="38">&nbsp;</td>
                                                            <td width="245">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="��������">
                                                                                <tr>
                                                                                    <td width="92"><img src="/images/newmain_20100625/notice_tab_o.gif" alt="��������"  name="Image48" id="Image48" width="92" height="22" onclick="mainTabSw('0')" style="CURSOR:POINTER"/></td>
                                                                                    <td width="91"><img src="/images/newmain_20100625/event_tab_a.gif" alt="�̺�Ʈ"  name="Image47" width="91" height="22" border="0" id="Image47"  onclick="mainTabSw('1')" style="CURSOR:POINTER"/></td>
                                                                                    <td align="right"><img src="/images/newmain_20100625/notice_more_bn.gif" alt="more"  width="21" height="22" onclick="mainTabSw('2')" style="CURSOR:POINTER"/></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="95" valign="top" background="/images/newmain_20100625/left_bg_04_n.gif"  style="background-repeat:no-repeat;">     <%--background="/images/newmain_20100625/left_bg_04.gif"--%>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="�������׳���">
                                                                                <%  if(mainTabSwMore.equals("0"))
                                                                                    {
                                                                                        if(noticeListTop.size()!=0)
                                                                                        {
                                                                                            for(int i=0;i<noticeListTop.size();i++)
                                                                                            {
                                                                                                if(i==5)
                                                                                                    break;
                                                                                                DataBox dbox =  noticeListTop.get(i);
                                                                                                out.print("<tr>");
                                                                                                out.print("<td height='7'></td>");
                                                                                                out.print("<td width='185' height='22' align='left'>");
                                                                                                out.print("<img src='/images/newmain_20100625/bullet_01.gif' alt='' style='margin-bottom:-2px'/><span class='fs_11 fc_gray1 ls'>");
                                                                                                out.print("<a href=\"javascript:viewNotice('"+dbox.getString("d_seq").trim()+"')\">"+StringManager.formatTitle(StringManager.removeHTML(dbox.getString("d_adtitle")), 20)+"</a>");
                                                                                                out.print("</td>");
                                                                                                out.print("<td align='left'><span class='fs_11 fc_gray2'>");
                                                                                                out.print(dbox.getString("d_addate").substring(0,4)+"/"+dbox.getString("d_addate").substring(4,6)+"/"+dbox.getString("d_addate").substring(6,8));
                                                                                                out.print("</span></td>");
                                                                                                out.print("</tr>");
                                                                                                out.print("<tr>");
                                                                                                out.print("<td colspan='3' style='background-image:url(/images/newmain_20100625/left_line_gr.gif);'></td>");
                                                                                                out.print("</tr>");
                                                                                            }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            out.print("<tr>");
                                                                                            out.print("<td height='22'><span class='fs_11 fc_gray1 ls'>�ش� ������ �������� �ʽ��ϴ�.</span></td>");
                                                                                            out.print("</tr>");
                                                                                            out.print("<tr>");
                                                                                            out.print("<td style='background-image:url(/images/newmain_20100625/left_line_gr.gif);'></td>");
                                                                                            out.print("</tr>");
                                                                                            out.print("<tr>");
                                                                                            out.print("<td height='93'></td>");
                                                                                            out.print("</tr>");
                                                                                        }
                                                                                    }
                                                                                    else if(mainTabSwMore.equals("1"))
                                                                                    {
                                                                                        if(eventList.size()!=0)
                                                                                        {
                                                                                            for(int i=0;i<eventList.size();i++)
                                                                                            {
                                                                                                if(i==5)
                                                                                                    break;
                                                                                                DataBox dbox =  eventList.get(i);
                                                                                                out.print("<tr>");
                                                                                                out.print("<td height='7'></td>");
                                                                                                out.print("<td width='185' height='21' align='left'>");
                                                                                                out.print("<img src='/images/newmain_20100625/bullet_01.gif' alt='' style='margin-bottom:-2px'/><span class='fs_11 fc_gray1 ls'>");
                                                                                                out.print("<a href=\"javascript:viewEvents('"+dbox.getString("d_seq").trim()+"')\">"+StringManager.formatTitle(StringManager.removeHTML(dbox.getString("d_title")), 20)+"</a>");
                                                                                                out.print("</td>");
                                                                                                out.print("<td align='left'><span class='fs_11 fc_gray2'>");
                                                                                                out.print(dbox.getString("d_STRDATE").substring(0,4)+"/"+dbox.getString("d_STRDATE").substring(4,6)+"/"+dbox.getString("d_STRDATE").substring(6,8));
                                                                                                out.print("</span></td>");
                                                                                                out.print("</tr>");
                                                                                            }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            out.print("<tr>");
                                                                                            out.print("<td height='22'><span class='fs_11 fc_gray1 ls'>�ش� ������ �������� �ʽ��ϴ�.</span></td>");
                                                                                            out.print("</tr>");
                                                                                            out.print("<tr>");
                                                                                            out.print("<td style='background-image:url(/images/newmain_20100625/left_line_gr.gif);'></td>");
                                                                                            out.print("</tr>");
                                                                                            out.print("<tr>");
                                                                                            out.print("<td height='93'></td>");
                                                                                            out.print("</tr>");
                                                                                        }
                                                                                    }%>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="109" align="left" valign="bottom" style="padding-left:38px"><img src="/images/newmain_20100625/left_banner_service.gif" alt="�¶��α������� ����09:00~18:00 02-2161-0077"  width="245" height="99" /></td>
                                            </tr>
                                            <tr>
                                                <td height="159" valign="bottom" >
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="38">&nbsp;</td>
                                                            <td width="245">
                                                                <table width="245" border="0" cellspacing="0" cellpadding="0" summary="�н���������">
                                                                    <tr>
                                                                        <td colspan="3"><img src="/images/newmain_20100625/left_banner_center_01.gif" alt="�н���������"  width="245" height="27" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><a href="javascript:menuForward('4', '01');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','/images/newmain_20100625/center_m1_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image51','','/images/newmain_20100625/center_m1_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/center_m1_a.gif" alt="FAQ"  name="Image51" width="84" height="62" border="0" id="Image51" /></a></td>
                                                                        <td><a href="javascript:menuForward('4', '02');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image53','','/images/newmain_20100625/center_m2_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image53','','/images/newmain_20100625/center_m2_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/center_m2_a.gif" alt="Q&A"  name="Image53" width="78" height="62" border="0" id="Image53" /></a></td>
                                                                        <td><a href="javascript:menuForward('4', '09');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image54','','/images/newmain_20100625/center_m3_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image54','','/images/newmain_20100625/center_m3_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/center_m3_a.gif" alt="1:1�����"  name="Image54" width="83" height="62" border="0" id="Image54" /></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><a href="javascript:menuForward('4', '05');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image55','','/images/newmain_20100625/center_m4_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image55','','/images/newmain_20100625/center_m4_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/center_m4_a.gif" alt="�н�ȯ��"  name="Image55" width="84" height="64" border="0" id="Image55" /></a></td>
                                                                        <td><a href="javascript:menuForward('4', '03');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image56','','/images/newmain_20100625/center_m5_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image56','','/images/newmain_20100625/center_m5_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/center_m5_a.gif" alt="�ٿ�ε�"  name="Image56" width="78" height="64" border="0" id="Image56" /></a></td>
                                                                        <td><a href="javascript:menuForward('4', '10');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image57','','/images/newmain_20100625/center_m6_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image57','','/images/newmain_20100625/center_m6_o.gif',1)">
                                                                            <img src="/images/newmain_20100625/center_m6_a.gif" alt="���繮��"  name="Image57" width="83" height="64" border="0" id="Image57" /></a></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="106" valign="bottom">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="������������">
                                                        <tr>
                                                            <td width="38">&nbsp;</td>
                                                            <td width="245"><a href="javascript:menuForward('5', '06');"><img src="/images/newmain_20100625/left_banner_etc_01.gif" alt="������������"  width="245" height="51" /></a><a href="javascript:menuForward('5', '08');"><img src="/images/newmain_20100625/left_banner_etc_02.gif" width="245" height="50" /></a></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="53" valign="bottom">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="�ǽð� ��������ý���">
                                                        <tr>
                                                            <td width="38">&nbsp;</td>
                                                            <td width="245"><a href="javascript:viewNotice('1338');"><img src="/images/newmain_20100625/left_banner_etc_04.gif" alt="��� ���� �̺�Ʈ"  width="245" height="48" /></a></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    <!-- Left������ ����-->
                                    </td>
                                    <td valign="top" background="/images/newmain_20100625/main_bg.gif"><!-- Main������ ����-->
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td align="left">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="layer1Parent" summary="��ʿ���">
                                                                    <tr>
                                                                        <td width="638"><script>jsFlash('/flash/focusimg.swf','638','202','','','', '');</script></td>      <%--<img src="/images/newmain_20100625/focusimg1.gif" usemap="#map3">--%>                                                                        
                                                                        <td width="638" style="display:none"><img src="/images/newmain_20100625/focusimg2.gif" alt="�¶��ΰ���������û�ȳ�"  usemap="#map1"></td>
                                                                        <td width="638" style="display:none"><img src="/images/newmain_20100625/focusimg3.gif" alt="â�������� ���/���θ���"  usemap="#map2"></td>
                                                                        <td valign="top"><img src="/images/newmain_20100625/focus_right_img.gif" width="21" height="53" /></td>
                                                                    </tr>
                                                                </table>
                                                                <div id="Layer1" style="height:14px">
                                                                  <table border="0" cellspacing="0" cellpadding="0" summary="">
                                                                    <tr>
                                                                      <td><img src="/images/newmain_20100625/focus_btn_01.png"  alt="1" width="17" height="17" id="Image100" onmouseout="timerStart();{clickSw==0 ? MM_swapImgRestore():clickSw=0;}" onmouseover="timerStop();MM_swapImage('Image100','','/images/newmain_20100625/focus_btn_01_o.png',1)" onclick="javascript:changeMainFlash('1',$('#layer1Parent'),this)" style="CURSOR:POINTER"/></td>
                                                                      <td width="3">&nbsp;</td>
                                                                      <td><img src="/images/newmain_20100625/focus_btn_02.png"  alt="2" width="17" height="17" border="0" id="Image101" onmouseout="timerStart();{clickSw==0 ? MM_swapImgRestore():clickSw=0;}" onmouseover="timerStop();MM_swapImage('Image101','','/images/newmain_20100625/focus_btn_02_o.png',1)" onclick="javascript:changeMainFlash('2',$('#layer1Parent'),this)" style="CURSOR:POINTER"/></td>
                                                                      <td width="3">&nbsp;</td>
                                                                      <td><img src="/images/newmain_20100625/focus_btn_03.png"  alt="3" width="17" height="17" border="0" id="Image102" onmouseout="timerStart();{clickSw==0 ? MM_swapImgRestore():clickSw=0;}" onmouseover="timerStop();MM_swapImage('Image102','','/images/newmain_20100625/focus_btn_03_o.png',1)" onclick="javascript:changeMainFlash('3',$('#layer1Parent'),this)" style="CURSOR:POINTER" /></td>
                                                                    </tr>
                                                                  </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr><td height="10">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td><!--�̴��� ��õ���� ����-->
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td height="20" align="left" valign="top" style="padding-left:29px"><img src="/images/newmain_20100625/title_img_01.gif" alt="�̴�����õ����"  width="104" height="20" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="212">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="29">&nbsp;</td>
                                                                                    <td width="290" height="212" valign="top" background="/images/newmain_20100625/course_online_bg.gif">
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="�¶�����õ����">
                                                                                            <%  if(onLineSubjList.size()!=0)
                                                                                                    {
                                                                                                        for(int i=0;i<onLineSubjList.size();i++)
                                                                                                        {
                                                                                                            DataBox dbox =  onLineSubjList.get(i);
                                                                                                            out.print("<tr class='ona1'>");
                                                                                                            String biyong="";
                                                                                                            String aHref_SubjValues="";
                                                                                                            DecimalFormat df = new DecimalFormat("#,###");

                                                                                                            if(dbox.getInt("d_biyong")==0)
                                                                                                                biyong="����";
                                                                                                            else
                                                                                                                biyong=(String)df.format(dbox.getInt("d_biyong"));

                                                                                                            String tmp=upperMap !=null && upperMap.get(dbox.get("d_scupperclass")) != null ?  upperMap.get(dbox.get("d_scupperclass")).toString() : "00";
                                                                                                            aHref_SubjValues=dbox.get("d_subj")+"\",\""+dbox.get("d_subjnm")+"\",\""+dbox.get("d_isonoff")+"\",\""+dbox.get("d_scupperclass")+"\",\""+dbox.get("d_uclassnm")+"\",\""+dbox.get("d_scyear")+"\",\""+dbox.get("d_subjseq")+"\",\"";
                                                                                                            aHref_SubjValues+=tmp;

                                                                                                            out.print("<td style='padding-top:3px'>");
                                                                                                            out.print("<table width='98%' border='0' cellspacing='0' cellpadding='0' summary='��õ������'>");
                                                                                                            out.print("<tr onmouseover=\"trhidden(this,'onlinesubjtr','t','onover','ona1')\" onmouseout=\" \" name='onlinesubjtr'>");
                                                                                                            out.print("<td valign='top' style='padding-top:4px;padding-bottom:4px;'>");
                                                                                                            out.print("<table width='100%' border='0' cellspacing='0' cellpadding='0' summary='��õ��������'>");
                                                                                                            out.print("<tr>");
                                                                                                            out.print("<td width='33px' align='left'><img src='/images/newmain_20100625/ico_online.gif' alt='' width='33' height='16' /></td>");
                                                                                                            out.print("<td align='left' style='padding-left:5px'><span class='b'><a href='javascript:view_On_Subj(\""+aHref_SubjValues+"\")'>");
                                                                                                            out.print(StringManager.formatTitle(dbox.get("d_subjnm"), 22));
                                                                                                            out.print("</a></span></td>");
                                                                                                            out.print("</tr>");
                                                                                                            out.print("<tr class='hiddenYesNo' style='display:none'>");
                                                                                                            out.print("<td></td>");
                                                                                                            out.print("<td style='padding-left:5px;text-align:left'><span class='fc_blue2 fs_11 lh_20'><img src='/images/newmain_20100625/bullet_02.gif' alt='' style='margin-bottom:-3px'/>");
                                                                                                            out.print("������ : " + biyong);
                                                                                                            out.print("&nbsp;&nbsp;      <img src='/images/newmain_20100625/bullet_02.gif' alt='' style='margin-bottom:-3px'  />");
                                                                                                            out.print("�������� : "+ dbox.get("d_studentlimit"));
                                                                                                            out.print("</span></td>");
                                                                                                            out.print("</tr>");
                                                                                                            out.print("<tr class='hiddenYesNo' style='display:none'>");
                                                                                                            out.print("<td></td>");
                                                                                                            out.print("<td style='padding-left:5px;text-align:left'><span class='fs_11 fc_gray1 lh_20'>");
                                                                                                            out.print(StringManager.formatTitle(dbox.getString("d_intro"), 50));
                                                                                                            out.print("</span></td></tr>");
                                                                                                            out.print("</table></td></tr></table></td>");
                                                                                                            out.print("</tr>");
                                                                                                            out.print("<tr>");
                                                                                                            out.print("<td><img src='/images/newmain_20100625/course_line.gif' alt='' height='1'/></td>");
                                                                                                            out.print("</tr>");
                                                                                                        }

                                                                                                    } else {
                                                                                                        out.print("<tr class='ona1'>");
                                                                                                        out.print("<td style='padding-top:3px'>");
                                                                                                        out.print("<table width='98%' border='0' cellspacing='0' cellpadding='0' summary='��õ������'>");
                                                                                                        out.print("<tr onmouseover=\"trhidden(this,'onlinesubjtr','t','onover','ona1')\" onmouseout=\" \" name='onlinesubjtr'>");
                                                                                                        out.print("<td valign='top' style='padding-top:4px;padding-bottom:4px;'>");
                                                                                                        out.print("<table width='100%' border='0' cellspacing='0' cellpadding='0' summary='��õ��������'>");
                                                                                                        out.print("<tr>");
                                                                                                        out.print("<td width='33px' align='left'><img src='/images/newmain_20100625/ico_online.gif' alt='' width='33' height='16' /></td>");
                                                                                                        out.print("<td align='left' style='padding-left:5px'><span class='b'>���� ��û ������ ���°� �����ϴ�.</span></td>");
                                                                                                        out.print("</tr>");
                                                                                                        out.print("</table>");
                                                                                                        out.print("</td></tr></table>");
                                                                                                        out.print("</td></tr>");
                                                                                                    }%>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="5">&nbsp;</td>
                                                                                    <td width="290" valign="top" background="/images/newmain_20100625/course_offline_bg.gif">
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <%  if(offLineSubjList.size()!=0)
                                                                                                    {
                                                                                                        for(int i=0;i<offLineSubjList.size();i++)
                                                                                                        {
                                                                                                            DataBox dbox =  offLineSubjList.get(i);
                                                                                                            out.print("<tr class='offa2'>");
                                                                                                            String biyong="";
                                                                                                            String aHref_SubjValues="";
                                                                                                            DecimalFormat df = new DecimalFormat("#,###");

                                                                                                            if(dbox.getInt("d_biyong")==0)
                                                                                                                biyong="����";
                                                                                                            else
                                                                                                                biyong=(String)df.format(dbox.getInt("d_biyong"));

                                                                                                            aHref_SubjValues=dbox.get("d_subj")+"\",\""+dbox.get("d_subjnm")+"\",\""+dbox.get("d_isonoff")+"\",\""+dbox.get("d_scupperclass")+"\",\""+dbox.get("d_seq")+"\",\""+dbox.get("d_scyear")+"\",\""+dbox.get("d_subjseq")+"\",\"";
                                                                                                            aHref_SubjValues+=dbox.get("d_scupperclass");

                                                                                                            out.print("<td style='padding-top:3px'>");
                                                                                                            out.print("<table width='98%' border='0' cellspacing='0' cellpadding='0' summary='����������õ����'>");
                                                                                                            out.print("<tr onmouseover=\"trhidden(this,'offlinesubjtr','t','offover','offa2')\" onmouseout=\" \" name='offlinesubjtr'>");
                                                                                                            out.print("<td valign='top' style='padding-top:4px;padding-bottom:4px;'>");
                                                                                                            out.print("<table width='100%' border='0' cellspacing='0' cellpadding='0'>");
                                                                                                            out.print("<tr>");
                                                                                                            out.print("<td width='42px' align='left'><img src='/images/newmain_20100625/ico_offline.gif' alt='' width='42' height='16' /></td>");
                                                                                                            out.print("<td align='left' style='padding-left:5px'><span class='b'><a href='javascript:view_On_Subj(\""+aHref_SubjValues+"\")'>");
                                                                                                            out.print(StringManager.formatTitle(dbox.get("d_subjnm"), 22));
                                                                                                            out.print("</a></span></td>");
                                                                                                            out.print("</tr>");
                                                                                                            out.print("<tr class='hiddenYesNo' style='display:none'>");
                                                                                                            out.print("<td></td>");
                                                                                                            out.print("<td style='padding-left:5px;text-align:left'><span class='fc_blue2 fs_11 lh_20'><img src='/images/newmain_20100625/bullet_02.gif' alt='' style='margin-bottom:-3px'/>");
                                                                                                            out.print("������ : " + biyong);
                                                                                                            out.print("&nbsp;&nbsp;      <img src='/images/newmain_20100625/bullet_02.gif' alt='' style='margin-bottom:-3px'  />");
                                                                                                            out.print("�������� : "+ dbox.get("d_studentlimit"));
                                                                                                            out.print("</span></td>");
                                                                                                            out.print("</tr>");
                                                                                                            out.print("<tr class='hiddenYesNo' style='display:none'>");
                                                                                                            out.print("<td></td>");
                                                                                                            out.print("<td style='padding-left:5px;text-align:left'><span class='fs_11 fc_gray1 lh_20'>");
                                                                                                            out.print(StringManager.formatTitle(dbox.getString("d_intro"), 50));
                                                                                                            out.print("</span></td></tr>");
                                                                                                            out.print("</table></td></tr></table></td>");
                                                                                                            out.print("</tr>");
                                                                                                            out.print("<tr>");
                                                                                                            out.print("<td><img src='/images/newmain_20100625/course_line.gif' alt='' height='1'/></td>");
                                                                                                            out.print("</tr>");
                                                                                                        }

                                                                                                    } else {
                                                                                                        out.print("<tr class='offa2'>");
                                                                                                        out.print("<td style='padding-top:3px'>");
                                                                                                        out.print("<table width='98%' border='0' cellspacing='0' cellpadding='0' summary='����������õ����'>");
                                                                                                        out.print("<tr onmouseover=\"trhidden(this,'offlinesubjtr','t','offover','offa2')\" onmouseout=\" \" name='offlinesubjtr'>");
                                                                                                        out.print("<td valign='top' style='padding-top:4px;padding-bottom:4px;'>");
                                                                                                        out.print("<table width='100%' border='0' cellspacing='0' cellpadding='0'>");
                                                                                                        out.print("<tr>");
                                                                                                        out.print("<td width='42px' align='left'><img src='/images/newmain_20100625/ico_offline.gif' alt='' width='42' height='16' /></td>");
                                                                                                        out.print("<td align='left' style='padding-left:5px'><span class='b'>���� ��û ������ ���°� �����ϴ�.</span></td>");
                                                                                                        out.print("</tr>");
                                                                                                        out.print("</table>");
                                                                                                        out.print("</td></tr></table>");
                                                                                                        out.print("</td></tr>");
                                                                                                    }%>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td>&nbsp;</td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="10"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="166">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="���������Ŀ���">
                                                                    <tr>
                                                                        <td width="29">&nbsp;</td>
                                                                        <!-- ������ ���� ����-->
                                                                        <td width="350" height="166" valign="top">
                                                                            <iframe src="http://www.kocca.kr/contents.html" frameborder="0" width="350" height="166" scrolling="no" title="����������"></iframe>
                                                                        </td>
                                                                        <td width="6">&nbsp;</td>
                                                                        <td width="229" valign="top">
                                                                            <iframe src="http://www.culturist.or.kr/front/recruit_top5.asp" frameborder="0" width="229" height="166" scrolling="no" title="Today's ä������"></iframe>
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="10"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="46">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="��������������">
                                                                    <tr>
                                                                        <td width="29">&nbsp;</td>
                                                                        <td width="585" height="46">
                                                                            <iframe src="http://kocca.kr/c_news.html" frameborder="0" width="100%" height="46" scrolling="no" title="Today's ����������"></iframe>
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" valign="top"><img src="/images/newmain_20100625/main_bgimg_02.gif" alt="" width="960" height="42" /></td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" style="padding-top:7px">
                            <table width="74" border="0" cellspacing="0" cellpadding="0" summary="Quick Menu����">
                                <tr>
                                    <td><img src="/images/newmain_20100625/quick_tit.gif" alt="Quick Menu"  width="74" height="57" /></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:menuForward('3', '18');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image26','','/images/newmain_20100625/quickm1_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image26','','/images/newmain_20100625/quickm1_o.gif',1)">
                                        <img src="/images/newmain_20100625/quickm1_a.gif" alt="�¶��ΰ���"  name="Image26" width="74" height="62" border="0" id="Image26" /></a></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:gotoOffLineCoin();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/newmain_20100625/quickm2_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image45','','/images/newmain_20100625/quickm2_o.gif',1)">
                                        <img src="/images/newmain_20100625/quickm2_a.gif" alt="�������ΰ���"  name="Image45" width="74" height="54" border="0" id="Image45" /></a></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:menuForward('3', '11');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image52','','/images/newmain_20100625/quickm3_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image52','','/images/newmain_20100625/quickm3_o.gif',1)">
                                        <img src="/images/newmain_20100625/quickm3_a.gif" alt="�������ΰ���"  name="Image52" width="74" height="55" border="0" id="Image52" /></a></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:gotoOffLinePropose();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image200','','/images/newmain_20100625/quickm5_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image200','','/images/newmain_20100625/quickm5_o.gif',1)">
                                        <img src="/images/newmain_20100625/quickm5_a.gif" alt="�������ΰ�����û"  name="Image200" width="74" height="66" border="0" id="Image200" /></a></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:menuForward('4', '01');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image61','','/images/newmain_20100625/quickm4_o.gif',1)" onblur="MM_swapImgRestore()" onfocus="MM_swapImage('Image61','','/images/newmain_20100625/quickm4_o.gif',1)">
                                        <img src="/images/newmain_20100625/quickm4_a.gif" alt="FAQ����"  name="Image61" width="74" height="64" border="0" id="Image61" /></a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td background="/images/portal/homepage_renewal/offline/footer_bg.jpg"><table width="995" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22">&nbsp;</td>
      </tr>
      <tr>
        <td height="22" background="/images/portal/homepage_renewal/common/bg_btm.gif"><table width="995" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="112"><a href="javascript:menuForward('90','06')"><img src="/images/portal/homepage_renewal/common/btn_btm_01.gif" alt="��������ó����ħ" /></a></td>
            <td width="66"><a href="javascript:menuMainForward('99', '<%=footerUrl %>?p_process=Footer&p_code=FOOTER_SERVICE')"><img src="/images/portal/homepage_renewal/common/btn_btm_02.gif" alt="�̿���" /></a></td>
            <td width="111"><a href="javascript:menuMainForward('99', '<%=footerUrl %>?p_process=Footer&p_code=FOOTER_EMAIL')"><img src="/images/portal/homepage_renewal/common/btn_btm_03.gif" alt="�̸��� ���ܼ��� �ź�" /></a></td>
            <td><div align="right"><img src="/images/portal/homepage_renewal/common/txt_familysite.gif" alt="Family Site" /></div></td>
            <td width="150" style="padding-right:10px;"><div align="right">
              <select name="relatedlink" onChange="goSiteSelect()" title="���û���Ʈ�ٷΰ���">
                                                                <option>:: ���û���Ʈ�ٷΰ���</option>
                                                                <%
                                                                    for( int ii = 0 ; ii < bolist.size() ; ii++ ){
                                                                        DataBox ddbox = (DataBox)bolist.get(ii);

                                                                        int vv_seq      = ddbox.getInt("d_seq");
                                                                        int vv_sort     = ddbox.getInt("d_sort");
                                                                        String vv_sitenm   = ddbox.getString("d_sitenm");
                                                                        String vv_url      = ddbox.getString("d_url");
                                                                        String vv_isuse    = ddbox.getString("d_isuse");
                                                                        String vv_islogin  = ddbox.getString("d_islogin");
                                                                        String vv_ldate    = ddbox.getString("d_ldate");
                                                                        String vv_grcode   = ddbox.getString("d_grcode");
                                                                        String vv_banner   = ddbox.getString("d_banner");
                                                                %>
                                                                            <option value='<%=vv_grcode%>:<%=vv_seq%>:<%=vv_islogin%>'><%=vv_sitenm%></option>
                                                                <%  }
                                                                %>
                                                                </select>
            </div></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/common/copyright.gif" alt="���� ��õ�� �񵿵��� 203-1 ���ȸ�� 8�� | ��ǥ��ȭ: 02-3219-5483(�¶��� ����), 02-2161-0072(�������� ����) �ѽ�: 02-3219-5723 | ����ڵ�Ϲ�ȣ: 117-82-04412 | ����Ǹž��Ű��ȣ: ��õ 00471 �ѱ������������(��) ���� �����
copyright (c) 2011  kocca  all rights reserved" width="995" height="77" /></td>
      </tr>
    </table></td>
  </tr>
</table>
            </td>
        </tr>
    </table>
    
    <%} %>
</form>
<map name="map1">
    <area alt="�¶��ΰ���������û�ȳ�" shape="rect" coords="433,152,540,181" href="javascript:viewNotice('1388');" >
</map>
<map name="map2">
    <area alt="â�������� ���/���θ���" shape="rect" coords="497,150,600,180" href="javascript:open_window('','http://www.culturist.or.kr/front/intern/intern_2011.asp','100','100','1000','800','no','no','no','yes','yes')">
</map>
<map name="map3">
    <!--<area shape="rect" coords="330,150,435,169" href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectPreviewPage&gubun=2&menuid=02&p_subj=SB10040&p_year=2010&p_subjseq=1&p_seq=1&tem_grcode=N000001">-->
        <area alt="" shape="rect" coords="460,148,590,170" href="javascript:viewNotice('1184');">
</map>
</body>
</html>



