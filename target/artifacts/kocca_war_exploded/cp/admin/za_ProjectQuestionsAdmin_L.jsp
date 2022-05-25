<%
//**********************************************************
//  1. ��      ��: PROJECT QUESTION ADMIN LIST
//  2. ���α׷���: za_ProjectQuestionsAdmin_L.jsp
//  3. ��      ��: ����Ʈ ���� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process		= box.getString("p_process");
	String  v_searchtext	= box.getString("p_searchtext");  
    String  v_year			= box.getString("p_year");

    String  v_subj			= "";
    String  v_subjnm		= "";
	String  v_year1			= "";
	String  v_subjseq		= "";
    String  v_isonoff		= "";
    String  v_onoff_value	= "";  
	int 	v_projseqcnt	= 0;
	int     v_ordseqcnt		= 0;   
    int     v_rowspan		= 0;    
    int     i				= 0;
    ArrayList list1			= null;
    //DEFINED class&variable END
    String  ss_action    = box.getString("s_action");
        
    if(ss_action.equals("go")){    //go button ���ýø� list ���
        list1 = (ArrayList)request.getAttribute("projectQuestionsAList");
    }    
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

	int t_year = Integer.parseInt(FormatDate.getDate("yyyy"))-1;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function whenSelection(ss_action) {
       if (ss_action=="go")	{
			if (document.form1.p_cp.value == "----"){
				alert("������ü�� �����ϼ���!");
				return;
			}
            top.ftop.setPam();
      }
      document.form1.s_action.value = ss_action;
      document.form1.action='/servlet/controller.cp.BPProjectAdminServlet';
      document.form1.p_process.value = 'ProjectQuestionsAdmin';      
      document.form1.submit();
    }
    
    // ����Ʈ ����Ʈ ���� 
    function projectlist_select(subj,subjnm,year,subjseq) {
        document.form1.action='/servlet/controller.cp.BPProjectAdminServlet';
        document.form1.p_process.value = 'ProjectQuestionsList';
        document.form1.p_subj.value = subj;        
        document.form1.p_subjnm.value = subjnm;        
        document.form1.p_year1.value = year;     
        document.form1.p_subjseq.value = subjseq;  
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
-->    	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <form name="form1" method="post" action="">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->    
    <input type="hidden" name="p_subj">
    <input type="hidden" name="p_subjnm">
    <input type="hidden" name="p_year1">
    <input type="hidden" name="p_subjseq">
    
    <input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">              

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/beta/tit_report.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>    
      <!----------------- title �� ----------------->
        <br>
            <!-- �����׷�, �⵵ ���� -->
        <table width="97%" class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table width="97%" cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7"></td>
              </tr>
			  <tr>
                <td align="center">
				  <table border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td>�����⵵</td>
					  <td>&nbsp; <%= CPCommonBean.getYear(box, true, true, t_year+"","p_year")%><!-- getCompany(RequestBox, isChange, isALL)    ����  --></td>
					  <td>&nbsp;</td><td  align="right">&nbsp;</td>
					  <td>������ü</td> 
					  <td> &nbsp;<%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    �������  --></td>
					  <td width=20></td>
					  <td>������</td>
					  <td width=6></td>
					  <td><input name="p_searchtext" type="text" class="input" style="width:180" value="<%=v_searchtext %>"></td>
					  <td width=6></td>
					  <td><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
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
      <!-- �����׷�, �⵵ �� -->
        <br>
        <br>

        <!----------------- Activity ������� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" class="table_title""><b>NO</b></td>          
            <td width="10%" class="table_title"><a href="javascript:whenOrder('isonoff')" class="e">����</a></td>          
            <td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">����</a></td>
            <td width="10%" class="table_title" width="9%"><a href="javascript:whenOrder('subjseq')" class="e">��������</a></td>
            <td width="15%" class="table_title" width="15%"><b>����Ʈ list ��ȸ</b></td>
            <td width="10%" class="table_title" width="10%"><a href="javascript:whenOrder('projseqcnt')" class="e">����Ʈ<br>��Ʈ ����</a></td>
            <td width="10%" class="table_title" width="10%"><a href="javascript:whenOrder('ordseqcnt')" class="e">����Ʈ<br>���� ����</a></td>
          </tr>
          <% 
            if(ss_action.equals("go")){    //go button ���ýø� list ���
                for(i = 0; i < list1.size(); i++) {
                    BPProjectData data= (BPProjectData)list1.get(i);
                    v_subj          = data.getSubj();     
                    v_subjnm        = data.getSubjnm(); 
                    v_year1	        = data.getYear(); 
                    v_subjseq       = data.getSubjseq(); 
					v_projseqcnt    = data.getProjseqcnt();
					v_ordseqcnt     = data.getOrdseqcnt();
                    v_isonoff       = data.getIsonoff();  
                    if(v_isonoff.equals("ON"))      {  v_onoff_value  = "���̹�����"; }
                    else if(v_isonoff.equals("OFF")){  v_onoff_value  = "���հ���";   } 
               %>
          <tr> 
            <td class="table_01"><%= list1.size() - i %></td>
            <td class="table_02_1"><%=v_onoff_value%></td>           
            <td class="table_02_2"> <%=v_subjnm%> </td>
            <td class="table_02_1"><%=v_subjseq%></td>
            <td class="table_03_1"> <a href="javascript:projectlist_select('<%=v_subj%>','<%=v_subjnm%>','<%=v_year1%>','<%=v_subjseq%>')"><img src="/images/admin/button/b_reportlist.gif" border="0"></a> 
            </td>
            <td class="table_02_1"><%=v_projseqcnt%></td>
            <td class="table_02_1"><%=v_ordseqcnt%></td>
          </tr>
          <%             
              } 
          }  
          if(ss_action.equals("go") && i == 0){ %>
          <tr> 
            <td class="table_02_1" colspan="7">��ϵ� ������ �����ϴ�</td>
          </tr>
          <%  } %>
        </table>
        <!----------------- Activity ������� �� ----------------->
        <br>
     </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>    
</table>
</form>
</body>
</html>
