<%
//**********************************************************
//  1. ��      ��: PROJECT UPDATE
//  2. ���α׷���: za_ProjectQuestions_U.jsp
//  3. ��      ��: ����Ʈ ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 28
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");        
    String  v_subj      = box.getString("p_subj");
    String  v_subjnm    = box.getString("p_subjnm");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_subjseqgr   = box.getString("p_subjseqgr");
    String  v_lesson     = box.getString("p_lesson");
    String  v_ordseq    = box.getString("p_ordseq");
    String  v_reptype   = "";
    String  v_expiredate= "";
    String  v_title     = "";
    String  v_contents  = "";
    String  v_groupcnt  = "";
    String  v_upfile    = "";
    String  v_upfile2   = ""; 
	String  v_realfile = "";
	String v_realfile2 = "";       
    String  v_upfile_value="";
    String  v_upfile2_value="";       
    int     v_score     = 0;    
	int 	v_projseq	= 2;
    String  v_ansyn     = "";
    String  v_useyn     = "";

	//DEFINED class&variable END
	
    //DEFINED in relation to select START
    String  ss_action    = box.getString("s_action");
    //DEFINED in relation to select END
    
    BPProjectData data = (BPProjectData)request.getAttribute("projectQuestionsUpdatePage");
    v_reptype   = data.getReptype();
    v_expiredate= data.getExpiredate();
//    v_expiredate= FormatDate.getFormatDate(v_expiredate,"yyyy-MM-dd");
    v_title     = data.getTitle();
    v_contents  = data.getContents();
    v_groupcnt  = data.getGroupcnt();
    v_upfile    = data.getUpfile();
    v_upfile2   = data.getUpfile2();
	v_realfile  = data.getRealfile();
	v_realfile2 = data.getRealfile2();
	v_projseq   = data.getProjseq();	
    v_score     = data.getScore();
	v_ansyn     = data.getAnsyn();  // ��� ���� �ɼ�
	v_useyn     = data.getUseyn();  // ��뿩��
    
    if(v_upfile.length() == 0){    v_upfile   = "";    
    }else{  v_upfile_value =  v_realfile;
			//v_title + "1" + v_upfile.substring(v_upfile.lastIndexOf("."));    
	}

    if(v_upfile2.length() == 0){   v_upfile2   = "";    
    }else{  v_upfile2_value = v_realfile2;
		//v_title + "1" + v_upfile2.substring(v_upfile2.lastIndexOf("."));    
	}
	
	//�������� ������ ������,���������� ��������
//    GrseqBean bean = new GrseqBean();
//    SubjseqData subjseqdata = bean.SelectSubjseqData(box);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css"> 
<script language = "javascript" src = "/script/cresys_lib.js"></script> 
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
    <script	language="JavaScript" type="text/JavaScript">
    <!--	   

		// 
        function project_update() {    
//            var expire_date = make_date(document.form1.ex_date.value);     
            
            if (blankCheck(document.form1.p_title.value)) {
                alert("������ �Է��ϼ���!");
                document.form1.p_title.focus();
                return;
            }
                
            if (realsize(document.form1.p_title.value) > 100) {
                alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
                document.form1.p_title.focus();
                return;
            }   
    
            if (blankCheck(document.form1.p_contents.value)) {
                alert("������ �Է��ϼ���!");
                document.form1.p_contents.focus();
                return;
            }
//            document.form1.p_expiredate.value = expire_date;
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.cp.BPProjectAdminServlet?p_file=2";
            document.form1.p_process.value = "ProjectQuestionsUpdate";
            document.form1.submit();
        }    
	    function cancel() {
	        document.form1.target = "_self";
            document.form1.action = "/servlet/controller.cp.BPProjectAdminServlet";
            document.form1.p_process.value = "ProjectQuestionsList";      
            document.form1.submit();	
        }
        
        function delSubj(upfile){
	        document.form1.p_process.value= "DelUpfile";
	        document.form1.p_upfile_type.value=upfile;
	        document.form1.submit();
	    
		}
		
		function project_delete() {
			if (confirm("����Ʈ�� �����Ͻðڽ��ϱ�?")) {
		        document.form1.p_process.value= "ProjectReportDelete";
		        document.form1.action = "/servlet/controller.cp.BPProjectAdminServlet";
		        document.form1.submit();			
			}
		}
   -->			
    </script>        
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' 
ondragstart='return false' onselectstart='return false' 
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
   <form name="form1" method="post" action="" enctype = "multipart/form-data">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="s_action"    value="<%=ss_action%>">     <!--in relation to select-->
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
    <input type="hidden" name="p_subjseqgr"   value="<%=v_subjseqgr%>">
    <input type="hidden" name="p_ordseq"    value="<%=v_ordseq%>">
    <input type="hidden" name="p_upfile"    value="<%=v_upfile%>">
    <input type="hidden" name="p_upfile2"   value="<%=v_upfile2%>">    
	<input type="hidden" name="p_realfile"    value="<%=v_realfile%>">
    <input type="hidden" name="p_realfile2"   value="<%=v_realfile2%>">    
    <input type="hidden" name="p_expiredate">
    <input type="hidden" name="p_upfile_type">
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title07.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table> 
      <!----------------- title �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
          <%=v_subjnm%> ���� &gt; <%=v_subjseq%>��</td>
        </tr>
      </table>
      <br>

      <!----------------- ����Ʈ ���/���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" height="25">��Ʈ��ȣ</td>
            <td class="table_02_2"> <input name="p_projseq" type="text" class="input" size="10" value="<%=v_projseq%>"></td>
          </tr>
          <input type="hidden" name="p_reptype" value="R">
          <input type="hidden" name="p_groupcnt" value="0">
          <input name="p_lesson" type="hidden" value="00">
          <tr> 
            <td class="table_title" height="25">����</td>
            <td class="table_02_2"> <input name="p_title" type="text" class="input" size="72" value="<%=v_title%>"> 
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25">����</td>
            <td class="table_02_2"> <textarea name="p_contents" cols="100" rows="14"><%=v_contents%></textarea> 
            </td>
          </tr>
          <!--tr> 
            <td class="table_title" height="25">�����Ⱓ</td>
            <td class="table_02_2"><%//=FormatDate.getFormatDate(subjseqdata.getEdustart(),"yyyy/MM/dd")%> ~ <%//=FormatDate.getFormatDate(subjseqdata.getEduend(),"yyyy/MM/dd")%></td>
          </tr>
          <tr> 
            <td class="table_title" height="25">���⸶����</td>
            <td class="table_02_2"> <input name="ex_date" type="text" class="input" size="10" value="<%//=v_expiredate%>"  OnClick="MiniCal(this)" readonly> 
            </td>
          </tr-->
          <tr> 
            <td height="25" class="table_title">÷������</td>
            <td class="table_02_2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="90%"> <input type="file" class="input" size="60" name="p_file1"> 
                    <% if(v_upfile.length() > 0){ %>
                    <br><a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile %>&p_realfile=<%= v_upfile_value %>'><%=v_upfile_value%></a> 
					<input type="checkbox" name="p_check1" value="Y"> �������� ����
					<% } %> </td>
                  <td width"50">
                  </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" class="table_title">�������</td>
            <td class="table_02_2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="90%"> <input type="file" class="input" size="60" name="p_file2"> 
                    <% if(v_upfile2.length() > 0){ %>
                    <br><a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile2 %>&p_realfile=<%= v_upfile2_value %>'><%=v_upfile2_value%></a> 
					<input type="checkbox" name="p_check2" value="Y"> �������� ����
					<% } %> </td>
                  <td width"50"> 
                  </td>
                </tr>
              </table></td>
          </tr>
          <tr>
          	<td class="table_title">��� ���� �ɼ�</td>
          	<td class="table_02_2">
			<input type="radio" name="ansyn" value="U" <%if(v_ansyn.equals("U"))out.println("checked");%>>�������������&nbsp;&nbsp;&nbsp;
			<input type="radio" name="ansyn" value="T" <%if(v_ansyn.equals("T"))out.println("checked");%>>TEXT�Է¹��&nbsp;&nbsp;&nbsp;
			<input type="radio" name="ansyn" value="F" <%if(v_ansyn.equals("F"))out.println("checked");%>>���Ͼ��ε�
			</td>
          </tr>
          <tr>
          	<td class="table_title">��뿩��</td>
          	<td class="table_02_2">
			<input type="radio" name="useyn" value="Y" <%if(v_useyn.equals("Y"))out.println("checked");%>>���&nbsp;&nbsp;&nbsp;
			<input type="radio" name="useyn" value="N" <%if(v_useyn.equals("N"))out.println("checked");%>>�̻��</td>
          </tr>
		  <input type="hidden" name="p_score" value="<%=v_score%>">
        </table>
      <!----------------- ����Ʈ ���/���� �� ----------------->
      <br>

      <!----------------- ����, ��� ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center"><a href="javascript:project_update()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
		  <td width=8></td>
		  <td align="center"><a href="javascript:project_delete()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
		  <td width=8></td>
          <td align="center"><a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ����, ��� ��ư �� ----------------->
      <br>
      </td>
  </tr>

  <tr><td></td></tr> 

</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>