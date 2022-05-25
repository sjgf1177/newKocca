<%
//**********************************************************
//  1. ��      ��: ����Ȱ�� ����ȸ
//  2. ���α׷���: za_TutorActDetail_L.jsp
//  3. ��      ��: ����Ȱ�� ����ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �����
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int v_pageno        = box.getInt("p_pageno");

    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_edustart  = box.getString("s_start");            //����������
    String  ss_eduend    = box.getString("s_end");              //����������

    String v_subj = box.getString("p_subj");
    String v_year = box.getString("p_year");
    String v_subjseq = box.getString("p_subjseq");
    String v_userid = box.getString("p_userid");
    String v_subjnm = box.getString("p_subjnm");
    String v_name = box.getString("p_name");
    String v_isclosed = box.getString("p_isclosed");


    DataBox dboxcnt =  (DataBox)request.getAttribute("actcnts");  //Ȱ�� ī��Ʈ
    ArrayList list1 =  (ArrayList)request.getAttribute("actlist");  //Ȱ�� ����Ʈ
    ArrayList list2 =  (ArrayList)request.getAttribute("loginlist");  //�α��� ����Ʈ
    ArrayList list3 =  (ArrayList)request.getAttribute("maillist");  //���Ϲ߼� ����Ʈ

    String v_malevel = "";
    int v_logcnt   = 0;
	int v_gongcnt  = 0;
	int v_qnacnt   = 0;
	int v_datacnt  = 0;
	int v_toroncnt = 0;
	int v_total    = 0;

    if(dboxcnt!=null)
    {
        v_malevel = dboxcnt.getString("d_malevel");
        v_logcnt   = dboxcnt.getInt("d_logincnt");
        v_gongcnt  = dboxcnt.getInt("d_gongcnt");
        v_qnacnt   = dboxcnt.getInt("d_qnacnt");
        v_datacnt  = dboxcnt.getInt("d_datacnt");
        v_toroncnt = dboxcnt.getInt("d_toroncnt") + dboxcnt.getInt("d_torontpcnt");
        v_total    = v_gongcnt + v_qnacnt + v_datacnt + v_toroncnt;
    }

	int i = 0;
%>
<html>
<head><title>����Ȱ�� ����ȸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
//�����Ҷ�
function whenSave(isclosed){
//	var malevel = document.form1.p_malevel.options[document.form1.p_malevel.selectedIndex].value;
	var malevel = document.form1.p_malevel.value;

	if(isclosed == "N"){
		alert("�����߿��� ���縦 ���� �� �����ϴ�.");
		return;
	}

	if(malevel == ""){
		alert("����� ������ �ּ���");
		return;
	}

	document.form1.action = '/servlet/controller.tutor.TutorValuationAdminServlet';
    document.form1.p_process.value = 'calcTutorGrade';
    document.form1.submit();
}
//������
function whenDetail(gubun, tpcode,seq,lesson) {
        window.self.name = "open";
        open_window("opensel","","100","100","600","400","N","yes","yes","yes","yes");
        document.form1.target = "opensel";

        var v_action = "", v_process="";
        if(gubun == "qna"){
        	v_action = '/servlet/controller.study.QnaAdminServlet';
        	v_process = 'QnaDetail';
        }else if(gubun == "torontp"){
            v_action = "/servlet/controller.study.ToronAdminServlet";
        	v_process = "TopicSelect";
        }else if(gubun == "toron"){
            v_action = "/servlet/controller.study.ToronAdminServlet";
        	v_process = "ToronSelect";
        }else if(gubun == "gong"){
            v_action =  "/servlet/controller.course.SubjGongAdminServlet";
        	v_process = "selectView";
        }else if(gubun == "data"){
            v_action = "/servlet/controller.study.StudyAdminDataServlet";
        	v_process = "select";
        }

        document.form1.action = v_action;
        document.form1.p_process.value = v_process;
				document.form1.p_lesson.value = lesson;
        document.form1.p_seq.value = seq;
        document.form1.p_qyear.value = document.form1.p_year.value;
        document.form1.p_qsubjseq.value =  document.form1.p_subjseq.value;
        document.form1.p_tpcode.vlaue = tpcode
        document.form1.submit();
}

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
<input type="hidden" name="p_process"   value="<%=v_process%>">
<input type="hidden" name="s_grcode"    value="<%=ss_grcode%>" >
<input type="hidden" name="s_gyear"      value="<%=ss_gyear%>" >
<input type="hidden" name="s_grseq"      value="<%=ss_grseq%>" >
<input type="hidden" name="s_upperclass" value="<%=ss_upperclass%>" >
<input type="hidden" name="s_subjcourse" value="<%=ss_subjcourse%>" >
<input type="hidden" name="s_subjseq"    value="<%=ss_subjseq%>" >
<input type="hidden" name="s_action"     value="go">
<input type="hidden" name="p_subj"    value="<%=v_subj%>">
<input type="hidden" name="p_year"    value="<%=v_year%>">
<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
<input type="hidden" name="p_userid"  value="<%=v_userid%>">

	<input type="hidden" name="p_lesson"   value="">
	<input type="hidden" name="p_seq"   value="">
	<input type="hidden" name="p_qyear"   value="">
	<input type="hidden" name="p_qsubjseq"   value="">
	<input type="hidden" name="p_tpcode"   value="">


  <table width="700" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">


   <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
            <td><img src="/images/admin/tutor/tit_tutor_testman.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
           <!----------------- title ���� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class=sub_title><img src="/images/admin/common/icon.gif"> ���� Ȱ�� ����ȸ
          </td>
        </tr>
      </table>
      <!----------------- title �� --------------- -->
      <br>

      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="3" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">

                  <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td align="center" valign="middle">
                        [ <%=v_subjnm%> : <%=v_name%> ]
			        </td>
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
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" height="20">&nbsp;</td>
            <td align="right" height="20">&nbsp;��
			<input type="radio" name="p_malevel" value="A" <% if(v_malevel.equals("A")){  %>checked <%}%>>A
			<input type="radio" name="p_malevel" value="B" <% if(v_malevel.equals("B")){  %>checked <%}%>>B
			<input type="radio" name="p_malevel" value="C" <% if(v_malevel.equals("C")){  %>checked <%}%>>C
			<input type="radio" name="p_malevel" value="D" <% if(v_malevel.equals("D")){  %>checked <%}%>>D
			<input type="radio" name="p_malevel" value="F" <% if(v_malevel.equals("F")){  %>checked <%}%>>F
			<!--select name="p_malevel">
            	<option value="" <% if(v_malevel.equals("")){  %>selected <%}%>>��ä��</option>
            	<option value="A" <% if(v_malevel.equals("A")){%>selected <%}%>>A</option>
            	<option value="B" <% if(v_malevel.equals("B")){%>selected <%}%>>B</option>
            	<option value="C" <% if(v_malevel.equals("C")){%>selected <%}%>>C</option>
            	<option value="D" <% if(v_malevel.equals("D")){%>selected <%}%>>D</option>
            	<option value="F" <% if(v_malevel.equals("F")){%>selected <%}%>>F</option>
            </select-->
           <a href="javascript:whenSave('<%=v_isclosed%>');">  <img src="/images/admin/button/btn_save.gif" border="0" align="absmiddle"></a>
          </td>
        </tr>
      </table>
      <br>

      <!----------------- �԰������ȸ ���� ----------------->
      <table  width="700" cellspacing="1" cellpadding="5" class="table_out">
          <tr>
            <td class="table_title">����Ƚ��</td>
            <td class="table_title">����</td>
            <td class="table_title">Q&A</td>
            <td class="table_title">�ڷ��</td>
            <td class="table_title">��н�</td>
            <td class="table_title">�հ�</td>
          </tr>
          <tr>
          	<td class="table_02_1"><%=v_logcnt  %></td>
          	<td class="table_02_1"><%=v_gongcnt %></td>
          	<td class="table_02_1"><%=v_qnacnt  %></td>
          	<td class="table_02_1"><%=v_datacnt %></td>
          	<td class="table_02_1"><%=v_toroncnt%></td>
          	<td class="table_02_1"><%=v_total   %></td>
          </tr>
      </table>
<br>
      <table   width="700" cellspacing="1" cellpadding="1" class="table_out">
      <tr>
            <td class="table_title_02"> �� ��Ȱ�� ����</td></tr>
      <tr><td class="table_02_1">
      <div style='width:680px;height:170px;overflow:auto;visibility:visible;border:1 '>
       <table   width="100%" cellspacing="1" cellpadding="1" class="table_out">
       <tr>
            <td class="table_title" width="10%">�з�</td>
            <td class="table_title" width="45%">����</td>
            <td class="table_title" width="15%">�ۼ���</td>
            <td class="table_title" width="10%">��ȸ��</td>

          </tr>

          <%
          if(list1 != null){
            for(i=0; i<list1.size() ; i++ ) {
          		DataBox dbox = (DataBox) list1.get(i);
          %>
          <tr>
            <td class="table_02_1" ><%=dbox.getString("d_gubunnm")%></td>
            <td class="table_02_1" >
               	    <!-- <a href="javascript:whenDetail('<%=dbox.getString("d_gubun")%>','<%=dbox.getString("d_tpcode")%>','<%=dbox.getString("d_seq")%>','<%=dbox.getString("d_lesson")%>');">-->
               	    <%=dbox.getString("d_title")%></td>
            <td class="table_02_1" ><%=FormatDate.getFormatDate(dbox.getString("d_addate"),"yyyy/MM/dd")%></td>
            <td class="table_02_1" ><%=dbox.getString("d_cnt")%></td>

         </tr>
          <%
          	  }
           }

           if(i == 0){
		  %>
		   			<tr><td class="table_02_1" colspan=6 >��ϵ� ������ �����ϴ�.</td></tr>
		  <%  }  %>

      </table>
      </div>
      </td>
      </tr>
      <tr>
            <td class="table_title_02"> �� ��������</td></tr>
      <tr><td class="table_02_1">
      <div style='width:680px;height:170px;overflow:auto;visibility:visible;border:1 '>
       <table   width="100%" cellspacing="1" cellpadding="1" class="table_out">
       <tr>
            <td class="table_title" width="50">No</td>
            <td class="table_title" width="200">�α���</td>
            <td class="table_title" width="200" >�α׾ƿ�</td>
            <td class="table_title" width="150" >IP</td>
            <td class="table_title" width="100" >�ð�</td>
          </tr>
          <%
              DecimalFormat df = new DecimalFormat("000000");
              String dtime = "";
              if(list2 != null){
          		for( i=0 ; i<list2.size() ; i++ ){
          			DataBox dbox = (DataBox) list2.get(i);
          			//out.println(dbox.getString("d_dtime"));

          			dtime = df.format(dbox.getInt("d_dtime"));

          			%>
		          <tr>
		            <td class="table_02_1" ><%=list2.size()-i%></td>
		            <td class="table_02_1" ><%=FormatDate.getFormatDate(dbox.getString("d_login"),"yyyy-MM-dd HH:mm ss")%></td>
		            <td class="table_02_1" ><%=FormatDate.getFormatDate(dbox.getString("d_logout"),"yyyy-MM-dd HH:mm ss")%></td>
		            <td class="table_02_1" ><%=dbox.getString("d_loginip")%></td>
		            <td class="table_02_1" ><%=FormatDate.getFormatTime(dtime, "HH:mm:ss")%></td>
		         </tr>
		  <%     }
		      }

		      if(i == 0){
		  %>
		   			<tr><td class="table_02_1" colspan=6 >��ϵ� ������ �����ϴ�.</td></tr>
		  <%  }  %>

      </table>
      </div>
      </td>
      </tr>
      <!--tr>
            <td class="table_title_02"> �� ���Ϲ߼� ����</td></tr>
      <tr><td class="table_02_1">
      <div style='width:680px;height:170px;overflow:auto;visibility:visible;border:1 '>
       <table   width="100%" cellspacing="1" cellpadding="1" class="table_out">
       <tr>
            <td class="table_title" width="50">No</td>
            <td class="table_title" width="510">����</td>
            <td class="table_title" width="70" >�߽���</td>
            <td class="table_title" width="70" >�����ο���</td>
          </tr>
          <%
              if(list3 != null){
          		for( i=0 ; i<list3.size() ; i++ ){
          			DataBox dbox = (DataBox) list3.get(i);
          			%>
		          <tr>
		            <td class="table_02_1" ><%=list3.size()-i%></td>
		            <td class="table_02_1" ><%=dbox.getString("d_title")%></td>
		            <td class="table_02_1" ><%=FormatDate.getFormatDate(dbox.getString("d_sdate"),"yyyy-MM-dd")%></td>
		            <td class="table_02_1" ><%=dbox.getString("d_rcnt")%></td>
		         </tr>
		  <%     }
		      }

		      if(i == 0){
		  %>
		   			<tr><td class="table_02_1" colspan=6 >��ϵ� ������ �����ϴ�.</td></tr>
		  <%  }  %>

      </table>
      </div>
      </td>
      </tr-->
      </table>
      <!----------------- �԰���� ��ȸ �� ----------------->
     <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
