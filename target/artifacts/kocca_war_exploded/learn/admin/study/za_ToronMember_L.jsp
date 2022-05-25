<%
//**********************************************************
//  1. ��      ��: Topic List
//  2. ���α׷���: za_Topic_L.jsp
//  3. ��      ��: ��й� ����������Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_grcode    = box.getString("p_grcode");
    String  v_grcodenm  = box.getString("p_grcodenm");
    String  v_gyear     = box.getString("p_gyear");
    String  v_grseq     = box.getString("p_grseq");
    String  v_subj      = box.getString("p_subj");
    String  v_subjnm    = box.getString("p_subjnm");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
	String  v_subjseqgr   = box.getString("p_subjseqgr");
    String  v_tpcode    = "";
    String  v_started   = "";
    String  v_ended     = "";
    String  v_title     = "";
    String  v_addate    = "";
    String  v_finished  = "";
    int     i           = 0;
     ArrayList list     = null;
	//DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");
    //DEFINED in relation to select END

    list = (ArrayList)request.getAttribute("StudentMemberList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function toron_list() {
        document.form1.target = "_self";
    	document.form1.p_process.value='ToronList';
    	document.form1.action='/servlet/controller.study.ToronAdminServlet';
    	document.form1.submit();
    }

    function toron_cal(idx) {
        if (idx=="all") {
        }else{
            document.form1.p_userid[0].value = document.form1.p_userid[idx].value;
            document.form1.p_etc1[0].value = document.form1.p_etc1[idx].value;
        }

        document.form1.target = "_self";
    	document.form1.p_process.value='ToronStudentUpdate';
    	document.form1.action='/servlet/controller.study.ToronAdminServlet';
    	document.form1.submit();
    }
//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <form name="form1" method="post" action="">
    <input type="hidden" name="p_process">
    <input type="hidden" name="s_action"    value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="s_grcode"    value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"     value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_grseq"     value="<%=ss_grseq%>">      <!--in relation to select-->
    <input type="hidden" name="s_uclass"    value="<%=ss_uclass%>">     <!--in relation to select-->
    <input type="hidden" name="s_subjcourse"value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"   value="<%=ss_subjseq%>">    <!--in relation to select-->
    <input type="hidden" name="p_grcode"    value="<%=v_grcode%>">
    <input type="hidden" name="p_grcodenm"  value="<%=v_grcodenm%>">
    <input type="hidden" name="p_gyear"     value="<%=v_gyear%>">
    <input type="hidden" name="p_grseq"     value="<%=v_grseq%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
    <input type="hidden" name="p_subjseqgr"   value="<%=v_subjseqgr%>">
    <input type="hidden" name="p_tpcode">

    <input type="hidden" name="p_userid">
    <input type="hidden" name="p_etc1">

    <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/co_title06.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <!--<td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0"> <%=v_grcodenm%> �����׷�
            &gt; <%=v_gyear%> �⵵ &gt;  <%=v_grseq%> �������� &gt;  <%=v_subjnm%> ���� &gt; <%=StringManager.cutZero(v_subjseqgr)%> ��
          </td>-->
          <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
              <b><%=v_subjnm%> </b>
          </td>
        </tr>
      </table>

      <br>

      <!----------------- ����Ʈ, �������� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="bottom" height="20" class=dir_txt>�� �Ʒ����� ��� ������ ���� �򰡸��� �ּ���.</td>
          <td align="center" width="75">
          <a href="javascript:toron_cal('all')">��ü����</a>
          </td>
          <td align="right" width="65">
          <a href="javascript:toron_list()"><img src="/images/admin/button/btn_list.gif" border="0"></a>
          </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ����Ʈ, �������� ��ư �� ----------------->

              <table cellspacing="1" cellpadding="5" class="box_table_out">
                      <tr>
                        <td colspan="14" class="table_top_line"></td>
                      </tr>
                      <tr>
                        <td class="table_title" width="5%">No</td>
                        <td class="table_title" width="20%">�� ��</td>
                        <td class="table_title" width="20%">���̵�</td>
                        <td class="table_title" width="20%">�۵�ϼ�</td>
                        <td class="table_title" width="20%">����</td>
                        <td class="table_title" width="15%">��������</td>
                      </tr>
<%
        String v_name="", v_userid="";
        int v_total=0, v_etc1=0, v_toronCnt = 0;
	DataBox dbox = null;
	if ( list.size() != 0 ){
	        v_total = list.size();
	        int idx=1;
		for(i = 0; i < v_total; i++) {
				dbox = (DataBox)list.get(i);

				v_name        = dbox.getString("d_name");
				v_userid       = dbox.getString("d_userid");
				v_toronCnt	 = dbox.getInt("d_toroncnt");
				v_etc1	 = dbox.getInt("d_etc1");
%>
                        <tr>
                            <td class="table_01"><%=v_total-i%></td>
                            <td class="table_02_1"><%=v_name%></td>
                            <td class="table_02_1"><%=v_userid%></td>
                            <td class="table_02_1"><%=v_toronCnt%></td>
                            <td class="table_02_1"><input type="hidden" name="p_userid" value="<%=v_userid%>">
                                <input type="text" class="input" name="p_etc1" size="5" maxlength="3" value="<%=v_etc1%>"></td>
                            <td class="table_02_1"><a href="javascript:toron_cal('<%=(idx++)%>')">��������</a></td>
			</tr>
<%
		}
	}else if( list.size() == 0){		//  ������ ���ٸ�
%>
				<tr>
					<td align="center" bgcolor="#F7F7F7" height="50" colspan="6">��ϵ� ������ �����ϴ�</td>
				</tr>
              </table>
<%
	}
%>
                  </td>
                </tr>
              </table>


      <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
