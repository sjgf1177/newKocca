<%
//**********************************************************
//  1. ��      ��: COMPLETE MEMBER LIST
//  2. ���α׷���: za_CompleteMember_L.jsp
//  3. ��      ��: ��������ȸ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 26
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int v_pageno        = box.getInt("p_pageno");
    
    String  v_grseq     =  "";
    String  v_course    =  "";
    String  v_cyear     =  "";
    String  v_courseseq =  "";
    String  v_coursenm  =  "";
    String  v_subj      =  "";
    String  v_year      =  "";
    String  v_subjnm    =  "";
    String  v_subjseq   =  "";
    String  v_subjseqgr =  "";
    String  v_isonoff   =  "";
    String  v_compnm    =  "";
    String  v_companynm =  "";    
    String  v_jikwinm   =  "";
    String  v_jikupnm   =  "";
    String  v_userid    =  "";
    String  v_cono      =  "";
    String  v_name      =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_isgraduated= "";
    String  v_email     =  "";
    String  v_ismailing =  "";
    String  v_place     =  "";
    String  v_isnewcourse= "";
    String  v_isonoff_value="";    
    int     v_tstep     =  0;
    int     v_avtstep   =  0;
    int     v_mtest     =  0;
    int     v_ftest     =  0;
    int     v_htest     =  0;
    int     v_report    =  0;
    int     v_act       =  0;
    int     v_etc1      =  0;
    int     v_score     =  0;
    int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;

    ArrayList list      = null;
    //DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getStringDefault("s_grseq","ALL");            //��������
    String  ss_upperclass  = box.getString("s_upperclass");     //�����з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����з�
    String  ss_lowerclass  = box.getString("s_lowerclass");     //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    String  ss_company   = box.getString("s_company");          //ȸ��    
    String  ss_selgubun  = box.getString("s_selgubun");
    String  ss_seltext   = box.getString("s_seltext");
    String  ss_seldept   = box.getString("s_seldept");

    String  ss_edustart  = box.getString("s_start");            //����������
    String  ss_eduend    = box.getString("s_end");              //����������
    
    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";
    //DEFINED in relation to select END

    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("CompleteMemberList");
    }
     
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<SCRIPT LANGUAGE="JavaScript">
<!--          
    function whenSelection(p_action) {
        if (p_action=="go"){
            if (chkParam() == false) {
                return;
            }
            top.ftop.setPam();
        }  
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.complete.CompleteStatusAdminServlet';
        document.form1.p_process.value = 'CompleteMemberList';  
        document.form1.submit();
    }
    
    function whenSelection2(p_action, p_type) {
        if (p_action=="go"){
            top.ftop.setPam();
        } 
        if (p_type == 'selgubun')
        document.form1.s_seltext.value = 'ALL';
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.complete.CompleteStatusAdminServlet';
        document.form1.p_process.value = 'CompleteMemberList';  
        document.form1.submit();
    }
    
	function whenOrder(column) {
	    if (document.form1.p_orderType.value == " asc") {
	        document.form1.p_orderType.value = " desc";
	    } else {
	        document.form1.p_orderType.value = " asc";
	    }
	
	    document.form1.s_action.value = "go";
	
	    document.form1.p_orderColumn.value = column;
	    whenSelection("go");
	}
    
	//�˻����� üũ
	function chkParam() {
	  if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
	    alert("�����׷��� �����ϼ���.");
	    return false;
	  }
	  if (document.form1.s_gyear.value == "" || document.form1.s_gyear.value == '----') {
	      alert("������ �����ϼ���.");
	      return false;
	    }
	  if (document.form1.s_grseq.value == "" || document.form1.s_grseq.value == '----') {
	    alert("���������� �����ϼ���.");
	    return false;
	  }
	}
	
    function whenExcel() {
        if(document.form1.s_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
      }
        window.self.name = "CompleteMemberList";     
        open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");  
        document.form1.target = "openExcel";               
        document.form1.action='/servlet/controller.complete.CompleteStatusAdminServlet';
        document.form1.p_process.value = 'CompleteMemberExcel';   
        document.form1.submit();
    }    

    function chkSelected() {
      var selectedcnt = 0;
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            if (document.form1.p_checks[i].checked == true) {
              selectedcnt++;
            }
          }
        } else {
          if (document.form1.p_checks.checked == true) {
            selectedcnt++;
          }
        }
      }
      return selectedcnt; 
    }
    function whenAllSelect() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = true;
          }
        } else {
          document.form1.p_checks.checked = true;
        }
      } 
    }
    
    function whenAllSelectCancel() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = false;
          }
        } else {
          document.form1.p_checks.checked = false;
        }
      }
    }

    function whenFormMail() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }
      document.form1.target = "_self";
      document.form1.action='/servlet/controller.complete.CompleteStatusAdminServlet';
      document.form1.p_process.value = 'SendFormMail';
      document.form1.submit();
    }
    
    function whenFreeMail() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }
      window.self.name = "ProposeMemberList";     
      open_window("openFreeMail","","100","100","640","550");  
      document.form1.target = "openFreeMail";
      document.form1.action='/servlet/controller.complete.CompleteStatusAdminServlet';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();
    }   
        
    function go(index) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.complete.CompleteStatusAdminServlet';
         document.form1.p_process.value = "CompleteMemberList";     
         document.form1.submit();
    }            
    function goPage(pageNum) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.complete.CompleteStatusAdminServlet';
         document.form1.p_process.value = "CompleteMemberList";     
         document.form1.submit();
    }
    function whenMemberInfo(userid) {    
        window.self.name = "ProposeMemberList";     
        open_window("openMember","","100","100","600","260");  
        document.form1.target = "openMember";               
        document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
        document.form1.p_process.value = 'memberInfo';   
        document.form1.submit();
        document.form1.target = window.self.name; 
    }     
-->     
</SCRIPT>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' 
ondragstart='return false' onselectstart='return false' 
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">    
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->   
    <input type="hidden" name="p_rprocess" value="CompleteMemberList">      
    
    <input type="hidden" name="p_orderColumn">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">

  <table width="1100" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="left" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="1000" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title13.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>        
      <!----------------- title �� ----------------->
      <br>
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<!----------------- form ���� ----------------->
      <table  width="1000" border=0 cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="left">

            <table border=0 cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="left">

                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="_srchT">
							<tr>
								<td width="10%" class="_tdT"><font color="red">��</font>�����׷�</td>
								<td width="15%" class="_tdS">
								
								<kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= ss_grcode %>" isLoad="true" />
								</td>
								<td width="10%" class="_tdT"><font color="red">��</font>����</td>
								<td width="15%" class="_tdS">
<%
    if ( !ss_gyear.equals("") ) {
%>
                                                            <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" param="<%= ss_grcode %>" sqlID="selectBox.grYearList" selectedValue="<%= ss_gyear %>" isLoad="true" />
<%
    } else {
%>
                                                            <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" isLoad="false" />
<%
    }
%>								
								</td>
								<td width="10%" class="_tdT"><font color="red">��</font>��������</td>
								<td width="15%" class="_tdS">
<%
    if ( !ss_grseq.equals("") ) {
%>
                                                            <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="== ���� ==" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear %>" sqlID="selectBox.grSeqList" selectedValue="<%= ss_grseq %>" isLoad="true" />
<%
    } else {
%>
                                                            <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="== ���� ==" type="sqlID" isLoad="false" />
<%
    }
%>								
								</td>
							</tr>
							<tr>
                                <td class="_tdT">��з�</td>
                                <td class="_tdS">
                                    <kocca:selectBox name="s_upperclass" id="oUpperclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" />
                                </td>
                                <td class="_tdT">�ߺз�</td>
                                <td class="_tdS">
<%
    if ( !ss_middleclass.equals("") ) {
%>
									<kocca:selectBox  name="s_middleclass" id="oMiddleclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttMiddleList" param="<%= ss_upperclass %>" selectedValue="<%= ss_middleclass %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_middleclass" id="oMiddleclass">
                                    	<option value="">== ��ü ==</option>
                                    </select>
<%
    }
%>
                                </td>
                                <td class="_tdT">�Һз�</td>
                                <td class="_tdS" colspan="2">
<%
    if ( !ss_lowerclass.equals("") ) {
%>
                                    <kocca:selectBox name="s_lowerclass" id="oLowerclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttLowerList" param="<%= ss_upperclass + ',' + ss_middleclass %>" selectedValue="<%= ss_lowerclass %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_lowerclass" id="oLowerclass">
                                        <option value="">== ��ü ==</option>
                                    </select>
<%
    }
%>
                                </td>
                            </tr>
                            <tr>
                            <% String s_subjsearchkey = box.getString("s_subjsearchkey"); %>
                                <td class="_tdT">�����˻�</td>
                                <td class="_tdS">
                                    <input type="text" id="oSubjSearchKey" name="s_subjsearchkey" id="oSubjSearchKey" size="17" onkeypress="if(event.keyCode=='13') fnSubjSearchByName();" value="<%=s_subjsearchkey%>">
                                    <a href="javascript:fnSubjSearchByName()" ><img src="/images/admin/button/search3_butt.gif" border="0" align="absmiddle"></a>                                                        </td>
                                <td class="_tdT">����</td>
                                <td colspan="4" class="_tdS">
<%
    if ( !ss_subjcourse.equals("") ) {
        s_subjsearchkey = ( s_subjsearchkey.equals("") ) ? "%" : s_subjsearchkey;
%>
                                	<kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="== ��ü ==" optionTitleValue="ALL" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear + ',' + ss_grseq + ',' + s_subjsearchkey %>" sqlID="selectBox.subjList" selectedValue="<%= ss_subjcourse %>" isLoad="true" />
<%
    } else {
%>
                                    <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="== ��ü ==" optionTitleValue="ALL" type="sqlID" isLoad="false" />
<%
    }
%>
                                </td>
                            </tr>
							<tr>
                            	<td class="_tdT">��������</td>
                               	<td class="_tdS">
<%
    if ( !ss_subjseq.equals("") ) {
%>
                                	<kocca:selectBox name="s_subjseq" id="oSubjseq" optionTitle="== ��ü ==" optionTitleValue="ALL" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear + ',' + ss_grseq + ',' + ss_subjcourse %>" sqlID="selectBox.subjSeqList" selectedValue="<%= ss_subjseq %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_subjseq" id="oSubjseq">
                                    	<option value="">== ��ü ==</option>
                                    </select>
<%
    }
%>
			                    </td>
			                    <% String s_user = box.getString("s_user"); %>                            
								
                               	<td class="_tdT">ID �Ǵ� ����</td>
								<td class="_tdS"><input type="text" name="s_user" size="24" value="<%= s_user %>"></td>
								<td align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td>
                                
                            </tr>			       
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
      
      
      <br>
      <br>

      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
            <td align="right" height="20">&nbsp;</td>
            <td align="right" width="65">
            <%//<!--a href="javascript:whenFormMail()"><img src="/images/admin/button/btn_dogmail.gif" border="0"></a-->%>
            </td>
            <td width=4></td>
            <td align="right" width="65">
            <%//<!--a href="javascript:whenFreeMail()"><img src="/images/admin/button/btn_mail.gif" border="0"></a-->%>
            </td>   
            <td width=4></td>        
            <td align="right" width="65">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
            </td>
            <!--td width=4></td>
            <td align="right" width="65">
            <a href="javascript:whenAllSelect()"><img src="/images/admin/button/select1_butt.gif" border="0"></a>
            </td> 
            <td width=4></td> 
            <td align="right" width="65">
            <a href="javascript:whenAllSelectCancel()"><img src="/images/admin/button/select_cancel1_butt.gif" border="0"></a>
            </td-->
        </tr>
        <tr> 
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->
      <!----------------- ��������ȸ ���� ----------------->
        <table width='1000' border=0 cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td colspan="18" class="table_top_line"></td>
          </tr>
          <tr>
            <td rowspan="2" class="table_title">NO</td>
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('compnm')" class="e">ȸ��</a></td>              
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('subjnm')" class="e">����</a></td>
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('userid')" class="e">ID</a></td>
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('name')" class="e">����</a></td>
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('compnm')" class="e">�μ�</a></td>            
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('jikwinm')" class="e">����</a></td>
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('subjseqgr')" class="e">����</a></td>
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('isonoff')" class="e">����</a></td>
            <td rowspan="2" class="table_title"> <a href="javascript:whenOrder('edustart')" class="e">�����Ⱓ</a></td>            
            <td colspan="6" class="table_title">�� ��</td>
            <td rowspan="2" class="table_title">���<br>
              ����</td>
            <td rowspan="2" class="table_title">����<br>
              ����</td>
            <!--td rowspan="2" class="table_title">����</td-->
          </tr>
          <tr> 
            <!--td class="table_title"><a href="javascript:whenOrder('cono')" class="e">���</td-->
            <td class="table_title">������<br>
              (����)</td>
            <td class="table_title">�߰�<br>
              ��</td>
            <td class="table_title">����<br>
              ��</td>
            <td class="table_title">����<br>��</td>
            <td class="table_title">����Ʈ</td>
            <td class="table_title">��Ÿ</td>
          </tr>
          <%                          
            if (ss_action.equals("go")) {    //go button ���ýø� list ���
                v_total = list.size();
                for(i = 0; i < v_total; i++) {                                    
                    CompleteStatusData data  = (CompleteStatusData)list.get(i);
                    
                    v_grseq         = data.getGrseq();       
                    v_course        = data.getCourse();      
                    v_cyear         = data.getCyear();       
                    v_courseseq     = data.getCourseseq();   
                    v_coursenm      = data.getCoursenm();    
                    v_subj          = data.getSubj();        
                    v_year          = data.getYear();        
                    v_subjnm        = data.getSubjnm();      
                    v_subjseq       = data.getSubjseq();
                    v_subjseqgr       = data.getSubjseqgr();     
                    v_isonoff       = data.getIsonoff();
                    v_compnm        = data.getCompnm();      
                    v_companynm        = data.getCompanynm();                     
                    v_jikwinm       = data.getJikwinm();     
                    v_jikupnm       = data.getJikupnm();
                    v_userid        = data.getUserid();      
                    v_cono          = data.getCono();        
                    v_name          = data.getName();        
                    v_edustart      = data.getEdustart();    
                    v_eduend        = data.getEduend();     
                    v_tstep         = data.getTstep();
                    v_avtstep       = data.getAvtstep();
                    v_mtest         = data.getMtest();
                    v_ftest         = data.getFtest();
                    v_htest         = data.getHtest();
                    v_report        = data.getReport();
                    v_act           = data.getAct();
                    v_etc1          = data.getEtc1();
                    v_score         = data.getScore();
                    v_isgraduated   = data.getIsgraduated();
                    v_email         = data.getEmail();
                    v_ismailing     = data.getIsmailing();
                    v_place         = data.getPlace();
                    v_isnewcourse   = data.getIsnewcourse();
                    v_rowspan       = data.getRowspan();
                    v_totalpage     = data.getTotalPageCount();
                    v_rowcount      = data.getRowCount();
                    v_edustart   = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                    v_eduend     = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");
                    if(v_isonoff.equals("ON")){     v_isonoff_value="���̹�";   }
                    else                      {     v_isonoff_value="����";     }
                    if(v_place == null) v_place = "";
               %>
          <tr>
            <td class="table_01"><%= i+1 %></td>
            <td class="table_02_2"><%=v_companynm%></td>              
            <%  if(v_course.equals("000000")){   %>
            <!-- ������ ��� -->
            <td class="table_02_2"> <%=v_subjnm%> </td>
            <% }else if(v_isnewcourse.equals("Y")){ %>
            <!-- �ڽ��̸鼭 ���� �ڽ��� ��ġ���� �ʴ°�� -->
            <!--td class="table_02_1" rowspan="<%=v_rowspan%>"> 
              <font class="text_color03">[�ڽ�] <%=v_coursenm%><%=v_courseseq%></font> </td-->
            <% } %>
            <%  if(!v_course.equals("000000")){   %>
            <!-- �ڽ��� ��� -->
            <!--td class="table_02_1"> <font class="text_color04"><%=v_subjnm%></font> </td-->
            <% } %>
            <td class="table_02_1"><!--a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"--><%= v_userid %><!--/a--></td>
            <td class="table_02_1"><%= v_name %></td>
            <td class="table_02_1"><%=v_compnm%></td>
            <td class="table_02_1"><%=v_jikwinm%></td>            
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td class="table_02_1"><%=v_isonoff_value%></td>
            <td class="table_02_1"><%= v_edustart %>~<br> <%= v_eduend %></td>            
            <td class="table_02_1"><%=v_tstep%>(<%=v_avtstep%>)</td>
            <td class="table_02_1"><%=v_mtest%></td>
            <td class="table_02_1"><%=v_ftest%></td>
            <td class="table_02_1"><%=v_htest%></td>
            <td class="table_02_1"><%=v_report%></td>
            <td class="table_02_1"><%=v_etc1%></td>
            <td class="table_02_1"><%=v_score%></td>
            <td class="table_02_1"><%=v_isgraduated%></td>
            <!--td class="table_02_1"> <input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_subj%>,<%=v_year%>,<%=v_subjseq%>"
            </td-->
          </tr>
          <%
               } 
            }
         if(i == 0 && ss_action.equals("go")){ %>
          <tr> 
            <td align="center" bgcolor="#FFFFFF" height="50" colspan="18">�������� �����ϴ�.</td>
          </tr>
        </table>          
        <% } else{ %>   </table> <% } %>
        
        
       <%  if(i > 0){ %>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
          </tr>
        </table>  
        <br>        
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right">��<b> TOTAL : <%=v_total%>��</b></td>
          </tr>
        </table>             
        <% } %>  
      <!----------------- ������ ��ȸ �� ----------------->
     <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
</form>
</body>
</html>
