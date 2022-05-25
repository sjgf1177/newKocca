<%
//**********************************************************
//  1. ��      ��: PROJECT SUBMIT LIST
//  2. ���α׷���: za_ProjectSubmit_L.jsp
//  3. ��      ��: ����Ʈ �� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 29
//  7. ��      ��:
//***********************************************************
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
    String  v_process   = box.getString("p_process");    
    String  v_subj      = box.getString("p_subj");
    String  v_subjnm    = box.getString("p_subjnm");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_lesson     = "";
    String  v_reptype   = "";
    String  v_reptype_value="";
    String  v_isopen    = "";
    String  v_isopenscore="";
    String  v_title     = "";
    String  v_micnt     = "";   //�׷�����ڼ� -> ���򰡼�
	String  v_pgcnt     = "";	//�򰡼�
	String  v_assigncnt = "";   //������
	String  v_jccnt     = "";   //�����
	    
    int     v_ordseq    =  0;    
	int		v_projseq	=  0;		//����Ʈ ����    
    int     v_score     =  0;    
    int     i           =  0;
	int		v_rowspan 	=  0;	   //����Ʈ ������ ����Ʈ ��
	int		v_rowspanseq=  0;	   //����Ʈ ���� ROOT SEQ
    ArrayList list      = null;
    //DEFINED class&variable END
    
    //DEFINED in relation to select START
	String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getString("s_grseq");            //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");          //����������
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    String  ss_action    = box.getString("s_action");   
    //DEFINED in relation to select END
        ss
    list = (ArrayList)request.getAttribute("projectSubmitList");  
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function projectList() {
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectSubmitAdmin';
        document.form1.submit();
    }    
    function projectDetailList(subj,subjnm,year,subjseq,ordseq,lesson,reptype) {
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectDetailList';
        document.form1.p_subj.value = subj;
        document.form1.p_subjnm.value = subjnm;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_ordseq.value = ordseq;
        document.form1.p_lesson.value = lesson;
        document.form1.p_reptype.value = reptype;
        document.form1.submit();
    } 
    
    function projectlist_select() {
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectSubmitList';
        document.form1.submit();
    }
    
    function projectlist_selectAll() {
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectDetailListAll';
        document.form1.submit();
    }
-->    	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
   <form name="form1" method="post" action="">
    <input type="hidden" name="p_process"		value="<%=v_process%>">
    <input type="hidden" name="s_action"		value="<%=ss_action%>">     <!--in relation to select-->
    <input type="hidden" name="s_grcode"		value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"			value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_grseq"			value="<%=ss_grseq%>">      <!--in relation to select-->
    <input type="hidden" name="s_upperclass"	value="<%=ss_upperclass%>">     <!--in relation to select-->
	<input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>">     <!--in relation to select-->
	<input type="hidden" name="s_lowerclass"	value="<%=ss_lowerclass%>">     <!--in relation to select-->
    <input type="hidden" name="s_subjcourse"	value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"		value="<%=ss_subjseq%>">    <!--in relation to select-->    
    
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
    <input type="hidden" name="p_ordseq">
    <!--input type="hidden" name="p_subj">
    <input type="hidden" name="p_subjnm">
    <input type="hidden" name="p_year">
    <input type="hidden" name="p_subjseq">
    <input type="hidden" name="p_ordseq"-->
    <input type="hidden" name="p_lesson">
    <input type="hidden" name="p_groupcnt">
    <input type="hidden" name="p_reptype">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title08.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>      
        <!----------------- title �� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
            <%=v_subjnm%> ���� &gt; <%=StringManager.cutZero(v_subjseq)%>��</td>
          </tr>
        </table>
        <br>
		<!----------------- �� ���� ----------------->
		<table cellspacing="0" cellpadding="0" class="table1">
          <tr>
            <td width="125" height="23" align="center" valign="middle">

              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="blue_butt_left"></td>
                  <td class="blue_butt_top"></td>
                  <td rowspan="3" class="blue_butt_right"></td>
                </tr>
                <tr>
                  <td class="blue_butt_middle">���� ä���� ������</td>
                </tr>
                <tr>
                  <td class="blue_butt_bottom"></td>
                </tr>
              </table>

            </td>
            <td width="2"></td>
            <td width="125">

              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="black_butt_left"></td>
                  <td class="black_butt_top"></td>
                  <td rowspan="3" class="black_butt_right"></td>
                </tr>
                <tr>
                  <td class="black_butt_middle"><a href="javascript:projectlist_selectAll()" class="c">��ü ������</a></td>
                </tr>
                <tr>
                  <td class="black_butt_bottom"></td>
                </tr>
              </table>

            </td>
            <td align="right" valign="top">
        <!----------------- �߰�, ����Ʈ ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td valign="bottom" height="20">&nbsp;</td>
            <td align="right" width="65">&nbsp;</td>
            <td align="right" width="55">
            <a href="javascript:projectList()"><img src="/images/admin/button/btn_list.gif" border="0"></a>
            </td>
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- �߰�, ����Ʈ ��ư �� ----------------->
         </td>
          </tr>
        </table>
		<!----------------- �� ��   ----------------->
        <!----------------- ����Ʈ ��������Ʈ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="6" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="8%" rowspan="2" class="table_title"><b>����Ʈ ����</b></td>
            <td width="43%" rowspan="2" class="table_title"><b>����</b></td>
            <td width="9%" rowspan="2" class="table_title"><b>������</b></td>
            <td width="9%" rowspan="2" class="table_title"><b>�����</b></td>
            <td colspan="2" class="table_title"><b>����</b></td>
          </tr>
          <tr> 
            <td class="table_title" width="9%"><b>ä��</b></td>
            <td class="table_title" width="10%"><b>��ä��</b></td>
            <!--td class="table_title"><b>����</b></td>
          <td class="table_title"><b>��������</b></td>
          <td class="table_title"><b>����</b></td-->
            <!--td class="table_title"><b>����</b></td-->
          </tr>
          <% 
            for(i = 0; i < list.size(); i++) {
                ProjectData data= (ProjectData)list.get(i);
				v_projseq		= data.getProjseq();
                v_ordseq        = data.getOrdseq();
                v_lesson        = data.getLesson();
                v_reptype       = data.getReptype();
                v_isopen        = data.getIsopen();
                v_isopenscore   = data.getIsopenscore();
                v_title         = data.getTitle();
                v_score         = data.getScore();
                v_micnt         = data.getMicnt();
				v_pgcnt  		= data.getPgcnt();
				v_assigncnt		= data.getAssigncnt();
				v_jccnt			= data.getJccnt();
				v_rowspan		= data.getRowspan();
				v_rowspanseq    = data.getRowspanseq();
				
				
                if(v_reptype.equals("R")){      v_reptype_value="�Ϲ�";     }
                else if(v_reptype.equals("P")){ v_reptype_value="PROJECT";  }
                else if(v_reptype.equals("C")){ v_reptype_value="COP";      }
           %>
          <tr> 
            <% if (v_rowspanseq ==  v_ordseq) { %>
            <td class="table_02_1" rowspan=<%=v_rowspan%>><%=v_projseq%></td>
            <% } %>
            <td class="table_02_1"> 
			<% if (v_assigncnt.equals("0")) { %>
			<a href="javascript:alert('���� ������ �н��ڰ� �����ϴ�.');"><%=v_title%></a>			
			<% } else { %>
			<a href="javascript:projectDetailList('<%=v_subj%>','<%=v_subjnm%>','<%=v_year%>','<%=v_subjseq%>','<%=v_ordseq%>','<%=v_lesson%>','<%=v_reptype%>')"><%=v_title%></a> 
			<% } %>
			</td>
            <td class="table_02_1" align="center"><%=v_assigncnt%></td>
            <td class="table_02_1" align="center"><%=v_jccnt%></td>
            <td class="table_02_1" align="center"><%=v_pgcnt%></td>
            <td class="table_02_1" align="center"><%=v_micnt%></td>
          </tr>
          <%}  
          if(i == 0){ %>
          <tr> 
            <td align="center" class="table_02_1" height="50" colspan="6">��ϵ� 
              ������ �����ϴ�</td>
          </tr>
          <%  } %>
        </table>
        <!----------------- Activity ����Ʈ �� ----------------->
      </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>    
</table>
</form>
</body>
</html>
