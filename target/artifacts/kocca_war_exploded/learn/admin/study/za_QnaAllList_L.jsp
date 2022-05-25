<%
//**********************************************************
//  1. ��      ��: QNA All DATA
//  2. ���α׷���: za_QnaAllList_L.jsp
//  3. ��      ��: ����������ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.6.25 ������
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  ss_grcode   = box.getString("s_grcode");        //�����׷�
    String  v_process   = box.getString("p_process");
    String  ss_action   = box.getString("s_action");
	int     v_seq       = 0;
	String  v_title     = "";
	int     v_kind      = 0;
	String  v_inuserid  = "";
	String  v_indate    = "";
    String  v_subjnm    = "";
    String  v_subj      = "";
    String  v_year      = "";
    String  v_subjseq   = "";
    String  v_lesson    = "";
	String  v_subjseqint= "";
	int     i           = 0;
    ArrayList list1     = (ArrayList)request.getAttribute("qnaAllList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
	// �������� ������ ����
    function qna_select(subj, year, subjseq, lesson, seq, kind) {    	  
        document.form1.target = "_self";        
		document.form1.action="/servlet/controller.study.QnaAdminServlet?#"+kind
        document.form1.p_process.value = "QnaDetail";
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_lesson.value = lesson;
        document.form1.p_seq.value = seq;
        document.form1.submit();
    }

    // GO ��ư �����
    function whenSelection(ss_action) {
      document.form1.s_action.value = ss_action;
      document.form1.target = "_self";
      document.form1.action='/servlet/controller.study.QnaAdminServlet';
      document.form1.p_process.value = 'QnaAllList';
      document.form1.submit();
    }
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
	<input type="hidden" name="p_process">
	<input type="hidden" name="p_subj">
	<input type="hidden" name="p_year">
	<input type="hidden" name="p_subjseq">
	<input type="hidden" name="p_lesson">
	<input type="hidden" name="p_seq">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
		<tr><td colspan=2 height=10></td></tr>
        <tr> 
          <td class=sub_title colspan=2><img src="/images/admin/common/icon.gif" > ����������ȸ</td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <!-- �����׷� ���� -->
        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
                      
                        <!------------------- ���ǰ˻� ���� ------------------------->
                         <table cellspacing="0" cellpadding="0" width="99%">
                            <tr>
                                <td>
                                    <table border="0" cellspacing="0" cellpadding="0" width="99%">
                                        <tr>
                                            <td width="25%">
                                            <!-- �����׷� ���� -->
                                                <%= SelectEduBean.getGrcode(box, true, true)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                                            <!-- �����׷� ���� -->
                                            </td>
                                            <td width="75%">
                                                <%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') -->
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="3"></td>
                            </tr>
                        </table>
                        <!-------------------- ���ǰ˻� �� ---------------------------->
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!-- �����׷� �� -->
        <br>

        <!----------------- list ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="0">
          <tr> 
            <td colspan="6" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" class="table_title">NO</td>
            <td class="table_title">����</td>
            <td class="table_title">�ۼ���</td>
            <td class="table_title">�ۼ���</td>
            <td class="table_title">������</td>
            <td class="table_title">����</td>
          </tr>
          <%
            if(ss_action.equals("go")){    //go button ���ýø� list ���
                for( i = 0; i < list1.size(); i++ ) {
                    QnaData data = (QnaData)list1.get(i);
					v_seq        = data.getSeq();
                    v_title      = data.getTitle();
					v_kind       = data.getKind();
                    v_inuserid   = data.getInuserid();
                    v_indate     = data.getIndate();
                    v_subjnm     = data.getSubjnm();
					v_subj       = data.getSubj();
					v_year       = data.getYear();
					v_subjseq    = data.getSubjseq();
					v_lesson     = data.getLesson();
					v_subjseqint = StringManager.cutZero(v_subjseq);
          %>
          <tr> 
            <td class="table_01"><%= list1.size()-i %></td>
            <td class="table_02_2">
			<% if(v_kind != 0 ) { %>&nbsp;&nbsp;<img src="/images/board/re.gif" ><%}%>
			<a href="javascript:qna_select('<%=v_subj%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_lesson%>', <%=v_seq%>, <%=v_kind%>);"><%=v_title%></a>
			</td>
            <td class="table_02_1"><%=v_inuserid%></td>
            <td class="table_02_1"><%=v_indate%></td>
            <td class="table_02_1"><%=v_subjnm%></td>
            <td class="table_02_1"><%=v_subjseqint%></td>
          </tr>
          <%
				}
			}
				
			if(ss_action.equals("go") && i == 0){
          %>
          <tr> 
            <td class="table_02_1" height="50" colspan="6">��ϵ� ������ �����ϴ�</td>
          </tr>
		  <%
			}
		  %>
        </table> 

		<br>
	</td>
</tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
