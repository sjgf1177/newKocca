<%
//**********************************************************
//  1. ��      ��: ����
//  2. ���α׷���: za_SulmunAllPaper_L.java
//  3. ��      ��: ��ü���� - ����������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	String v_tem_grcode = box.getSession("tem_grcode");

    String  v_process      = box.getString("p_process");
    String  v_action       = box.getString("p_action");

    //String  v_grcode       = "ALL";        //�����׷�
    String  v_grcode       = box.getString("s_grcode");        //�����׷�
    String  v_gyear        = box.getString("s_gyear"); 

    String  v_gubun        = "ALL";
  
    String  s_gadmin = box.getSession("gadmin");

    String v_title_img = ""; 
    if (v_gubun.equals("COMMON"))     v_title_img = "3";
    else if (v_gubun.equals("SUBJ"))  v_title_img = "4";
    else if (v_gubun.equals("WHOLE")) v_title_img = "5";

    String v_tab_color1 = "black";
    String v_tab_color2 = "black";
    String v_tab_color3 = "black";
	String v_tab_color4 = "black";
    String v_tab_color5 = "blue";

    ArrayList blist = (ArrayList)request.getAttribute("SulmunPaperListPage");
    
%>

<html>
<head>
<title>������-����Ʈ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language="JavaScript">
<!--
// �ٸ� ������ �޴� �̵�
function changeTabpage(p_gubun) {

	if (p_gubun == "TARGET") {
      document.form2.action = "/servlet/controller.research.SulmunTargetPaperServlet";
    } else if (p_gubun == "COMMON") {
      document.form2.action = "/servlet/controller.research.SulmunCommonPaperServlet";
	} else if (p_gubun == "ALL") {
      document.form2.action = "/servlet/controller.research.SulmunALLPaperServlet";
	} else if (p_gubun == "REGIST") {
      document.form2.action = "/servlet/controller.research.SulmunRegistPaperServlet";
	} 
	document.form2.p_action.value = 'change';
	document.form2.p_gubun.value = p_gubun;
    document.form2.s_grcode.value = "";
	document.form2.p_process.value = 'SulmunPaperListPage';
    document.form2.target="_self";
	document.form2.submit();
}

// �����з� ��ȸ ����
function whenSelection(p_action) {

    var v_grcode = "<%=v_grcode%>";
	var v_gubun, v_subj, v_distcode, v_upperclass, v_middleclass, v_lowerclass;

	v_grcode        = document.form2.s_grcode.options[document.form2.s_grcode.selectedIndex].value;
	v_gubun       = document.form2.p_gubun.value;


	if (document.form2.s_grcode.value == '') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}

    if (p_action=="go") {
     document.form2.p_process.value = 'SulmunPaperListPage';
     document.form2.p_action.value  = p_action;
     document.form2.p_grcode.value  = v_grcode;
	 document.form2.submit();		

	}else {
     document.form2.p_process.value = 'SulmunPaperListPage';
     document.form2.p_action.value  = p_action;
     document.form2.p_grcode.value  = v_grcode;
	 //document.form2.s_distcode.value = "All";
	 document.form2.submit();
	}
}


// ������ ���
function InsertPaperPage() {
	if (document.form2.s_grcode.value == '') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}

//		window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 1000, height = 667, top=0, left=0");
        document.form2.target = "openWinQuestion";
		document.form2.action = "/servlet/controller.research.SulmunAllPaperServlet";
		document.form2.p_process.value = "SulmunPaperInsertPage";
		document.form2.p_action.value = "go";
        //document.form2.p_subjnm.value = p_subjnm;
		document.form2.submit();

        farwindow.window.focus();
//        document.form2.target = window.self.name;
}

// ������ ���뺸��,����
function UpdatePaperPage(p_progress, p_sulpapernum, p_sulpapernm, p_subj) {
	if (document.form2.s_grcode.value == '') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}

//        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 1000, height = 667, top=0, left=0");
        document.form2.target = "openWinQuestion";
		document.form2.action = "/servlet/controller.research.SulmunAllPaperServlet";
        document.form2.p_progress.value = p_progress;		
        document.form2.p_sulpapernum.value = p_sulpapernum;
        document.form2.p_sulpapernm.value = p_sulpapernm;
		document.form2.p_subj.value = p_subj;
        document.form2.p_process.value = 'SulmunPaperUpdatePage';
		document.form2.submit();

        farwindow.window.focus();
//        document.form2.target = window.self.name;

}

// �̸�����
function PreviewPaper(p_grcode, p_subj, p_sulpapernum, p_sulpapernm) {
	if (document.form2.s_grcode.value == '') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}

//  window.self.name = "winSelectView";
  farwindow =   window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=678, height=600, top=0, left=0");
  document.form3.target = "openWinQuestion";
  document.form3.p_process.value = "SulmunPaperPreviewPage";
  document.form3.p_grcode.value  = p_grcode;
  document.form3.p_subj.value    = p_subj; 
  document.form3.p_sulpapernum.value= p_sulpapernum; 
  document.form3.p_sulpapernm.value= p_sulpapernm;
  document.form3.submit();
 
  farwindow.window.focus();
//  document.form2.target = window.self.name;
}
function ReloadPage() {
  document.form2.p_grcode.value = 'SulmunPaperListPage';
  document.form2.p_process.value = 'SulmunPaperListPage';
  document.form2.submit();
}
    // select box ����
    $(function() {
        $("#oGrcode").bind("change", function(){
            var param = "type=sqlID&sqlID=selectBox.grYearList&param=" + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetGrYear
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });
    });
    /**
     * ���� �׷캰 ���� selectbox ����
     */
    function fnSetGrYear( result ) {
        $("#oGyear").empty();
        $("#oGrseq").empty();
        $("#oSubjcourse").empty();
        $("#oSubjseq").empty();
        $("#oGyear").append("<option value=\"\">== ���� ==</option>");
        $("#oGrseq").append("<option value=\"\">== ���� ==</option>");
        $("#oSubjcourse").append("<option value=\"ALL\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"ALL\">== ��ü ==</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oGyear").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form2" method="post" action="/servlet/controller.research.SulmunAllPaperServlet">
	<input type="hidden" name="p_process"     value="<%=v_process%>">
	<input type="hidden" name="p_action"      value="<%=v_action%>">
	<input type="hidden" name="p_grcode"      value="<%=v_grcode%>">
	<input type="hidden" name="p_gyear"       value="<%=v_gyear%>">
	<input type="hidden" name="p_sulpapernum" value="">
	<input type="hidden" name="p_subj"        value="">
	<input type="hidden" name="p_sulpapernm"  value="">
	<input type="hidden" name="p_progress"  value="">
	<input type="hidden" name="p_gubun"       value="<%=v_gubun%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/r_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <table cellspacing="0" cellpadding="0" class="table1">
        <tr> 
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color5%>_butt_left"></td>
                <td class="<%=v_tab_color5%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color5%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color5%>_butt_middle">��������</td>
              </tr>
              <tr>
                <td class="<%=v_tab_color5%>_butt_bottom"></td>
              </tr>
            </table>
          </td>	
          <td width="2"></td>
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color3%>_butt_left"></td>
                <td class="<%=v_tab_color3%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color3%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color3%>_butt_middle"><a href="javascript:changeTabpage('COMMON')" class="c">�Ϲݼ���</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color3%>_butt_bottom"></td>
              </tr>
            </table>
          </td>
          <td width="2"></td>
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color2%>_butt_left"></td>
                <td class="<%=v_tab_color2%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color2%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color2%>_butt_middle"><a href="javascript:changeTabpage('TARGET')" class="c">����ڼ���</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color2%>_butt_bottom"></td>
              </tr>
            </table>
          </td>

          <td width="2"></td>
		  <td width="85">
           <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color4%>_butt_left"></td>
                <td class="<%=v_tab_color4%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color4%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color4%>_butt_middle"><a href="javascript:changeTabpage('REGIST')" class="c">���԰��</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color4%>_butt_bottom"></td>
              </tr>
            </table>
          </td>

         <td>&nbsp;</td>
        </tr>
      </table>
      <table cellspacing="0" cellpadding="0" class="table_out">
        <tr> 
          <td bgcolor="#636563"> 
            <table cellspacing="1" cellpadding="0" class="s_table">
              <tr> 
                <td bgcolor="#FFFFFF" align="center" valign="top"> 
                  <!----------------- form ���� ----------------->
				  <br>
                  <table cellspacing="0" cellpadding="1" class="form_table_out">
                    <tr>
                      <td bgcolor="#C6C6C6" align="center">
                        <table cellspacing="0" cellpadding="0" class="form_table_bg">
                          <tr>
                            <td height="7"></td>
                          </tr>
                          <tr>
                            <td align="center">
                              <table width="99%" cellspacing="0" cellpadding="0" class="form_table" border="0">
                                <tr>
                                    <td  width="10%"> 
                                        <font color="red">��</font>�����׷�
                                    </td>
                                    <td  width="20%">
                                        <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= v_grcode %>" isLoad="true" />
                                    </td>
                                    <td  width="5%">
                                        ����
                                    </td>
                                    <td>
<%
    if ( !v_gyear.equals("") || !v_grcode.equals("") ) {
%>
                                        <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" param="<%= v_grcode %>" sqlID="selectBox.grYearList" selectedValue="<%= v_gyear %>" isLoad="true" />
<%
    } else {
%>
                                        <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" isLoad="false" />
<%
    }
%>
                                    </td>
                                    <td align='right'>
                                   <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td height="7"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>

                  </table>
                  <!----------------- form �� ----------------->
                  <br>
                  <!----------------- �߰���ư ���� ----------------->
                  <table cellpadding="0" cellspacing="0" class="table1">
                    <tr> 
                      <td align="right"><a href="javascript:InsertPaperPage()"><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td height="3"></td>
                    </tr>
                  </table>
                  <!----------------- �߰���ư �� ----------------->
                  <!----------------- ������ ����-��� ���� ----------------->
                  <table cellspacing="1" cellpadding="5" class="table_out">

                    <tr> 
                      <td colspan="4" class="table_top_line"></td>
                    </tr>
                    <tr> 
                      <td width="5%" class="table_title">NO</td>
					  <td class="table_title">��������</td>
					  <td width="12%" class="table_title">������</td>
					  <td width="10%" class="table_title">���</td>
                    </tr>
<%
         for (int i=0; i<blist.size(); i++) {
            DataBox dbox = (DataBox)blist.get(i);   

%>
                    <tr> 
                      <td class="table_01"><%=i+1%></td>
                      <td class="table_02_1"><a href="javascript:UpdatePaperPage('<%=dbox.getString("d_progress")%>','<%=String.valueOf(dbox.getInt("d_sulpapernum"))%>','<%=dbox.getString("d_sulpapernm")%>','ALL')"><%=dbox.getString("d_sulpapernm")%></a></td>
                      <td class="table_02_1"><%=dbox.getInt("d_totcnt")%></td>
					  <td class="table_03_1">
                      <a href="javascript:PreviewPaper('<%=v_grcode%>','<%=dbox.getString("d_subj")%>','<%=String.valueOf(dbox.getInt("d_sulpapernum"))%>','<%=dbox.getString("d_sulpapernm")%>')"><img src="/images/admin/button/b_preview.gif" border="0"></a>
                      </td>
                    </tr>
<%    
        } 
%>
                 </table>
				 <br>
                  <!----------------- ������ ����-��� �� ----------------->
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
    </td>
  </tr>
</table>
</form>
<form name="form3" method="post" action="/servlet/controller.research.SulmunAllPaperServlet">
  <input type="hidden" name="p_process"     value="">
  <input type="hidden" name="p_grcode"      value="">
  <input type="hidden" name="p_subj"        value="">
  <input type="hidden" name="p_sulpapernum" value="">
  <input type="hidden" name="p_sulpapernm" value="">
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>

</html>


