<%
//**********************************************************
//  1. ��      ��: QNA DATA
//  2. ���α׷���: za_Qna_L.jsp
//  3. ��      ��: ���� admin bean
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ����� 2003. 8. 18
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
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
    String  v_title="", v_contents="",  v_inuserid="",v_inusernm="";
    String  v_indate="";
    int  v_types = 0;
    int  v_nanscnt  =0;
    int     i            = 0;
    ArrayList list1      = null;

    String  v_subj    = box.getString("p_subj");        //�����ڵ�
    String  v_year    = box.getString("p_year");         //�⵵
    String  v_subjseq = box.getString("p_subjseq");       //���� ����
    String  v_lesson  = box.getString("p_lesson");
    int     v_seq     = box.getInt("p_seq");
    //DEFINED in relation to select END
    list1 = (ArrayList)request.getAttribute("qnaDetail");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function qna_input(job,type) {
        document.ff.target = "_self";
        document.ff.p_process.value = job;        
        document.ff.p_types.value = type;
        document.ff.submit();        
    }
    function qna_Delete(type){
            if(!confirm("�����Ͻðڽ��ϱ�?")) {
                 return;
            }       
        document.ff.target = "_self";
        document.ff.p_process.value = "QnaDelete";        
        document.ff.p_types.value = type;
        document.ff.submit();       
    }

    function goQnaListPage() {
      document.ff.submit();
    }
-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="ff" method="post" action="/servlet/controller.study.QnaAdminServlet">
        <input type="hidden" name="p_process" value="QnaList">
        <input type="hidden" name="p_subj"   value="<%=v_subj%>">
        <input type="hidden" name="p_year"   value="<%=v_year%>">
        <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
        <input type="hidden" name="p_lesson"   value="<%=v_lesson%>">
        <input type="hidden" name="p_seq"   value="<%=v_seq%>">
        <input type="hidden" name="p_job"   value="">
        <input type="hidden" name="p_types"   value="">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>  
      <!----------------- title �� ----------------->
      <br>
<!--
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">�����׷� 
            &gt; �⵵ &gt; �������� &gt; �з� &gt; ���� &gt; ���� &gt; ����</td>
        </tr>
      </table>
      <br>
-->
      <!----------------- �亯���, ����Ʈ ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="929" align="right"><a href="javascript:qna_input('QnaInsertPage',0);"><img src="/images/admin/button/btn_replyregist.gif" border="0"></a></td>
		  <td width=9></td>
          <td align="right" width="32"><a href="javascript:goQnaListPage();"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
        <tr> 
          <td height="3"></td>
		  <td height="3"></td>
		  <td height="3"></td>
        </tr>
      </table>
      <!----------------- �亯���, ����Ʈ ��ư �� ----------------->

        <%
            for(i = 0; i < list1.size(); i++) {
                QnaData data= (QnaData)list1.get(i);
                 v_seq     = data.getSeq();
                 //v_types        = data.getTypes();
				 v_types        = data.getKind();
                 v_title   = data.getTitle();
                 v_contents = data.getContents();
                 v_inuserid= data.getInuserid();
                 v_inusernm= data.getInusernm();
                 v_indate  =  FormatDate.getFormatDate(data.getIndate(),"yyyy/MM/dd");
                 v_contents = StringManager.replace(StringManager.replace(v_contents,"\r\n","<br>")," ","&nbsp;");
          System.out.println("v_types===========>>>"+v_types);
                         if(v_types == 0 ){           
        %>      
		                    <a name="<%=v_types%>"/>
                            <!----------------- ���� ���� ----------------->
                            <table cellspacing="1" cellpadding="5" class="table_out">
                              <tr> 
                                <td colspan="2" class="table_top_line"></td>
                              </tr>
                              <tr> 
                                <td colspan="2" height="25" class="table_title"><b>Q. ����</b></td>
                              </tr>
                              <tr> 
                                <td width="20%" height="25" class="table_title"><b>�ۼ���</b></td>
                                <td class="table_02_2"><%=v_inusernm%> (<%=v_indate%>)</td>
                              </tr>
                              <tr> 
                                <td class="table_title" height="25"><b>����</b></td>
                                <td class="table_02_2"><%=v_title%></td>
                              </tr>
                              <tr> 
                                <td class="table_title" height="160"><b>����</b></td>
                                <td class="table_02_2" valign="top"><br><%=v_contents%> </td>
                              </tr>
                            </table>
                            
                            <!----------------- ���� �� ----------------->
                            <br>
                            <br>
<%                      }else{ %>      
		                    <a name="<%=v_types%>"/>
                            <!----------------- �亯 ���� ----------------->
                            <table cellspacing="1" cellpadding="5" class="table_out">
                              <tr> 
                                <td colspan="2" class="table_top_line"></td>
                              </tr>
                              <tr> 
                                <td colspan="2" height="25" class="table_title"><b>A. �亯 <%=v_types%></b></td>
                              </tr>
                              <tr> 
                                <td width="20%" height="25" class="table_title"><b>�ۼ���</b></td>
                                <td class="table_02_2">
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td>�ۼ��� : <%=v_inusernm%> (<%=v_indate%>)</td>
                                      <td align="right" width="40"><a href="javascript:qna_input('QnaUpdatePage',<%=v_types%>);"><img src="/images/admin/button/b_modify.gif" border=0></a></td>
                                      <td align="right" width="44"><a href="javascript:qna_Delete(<%=v_types%>);"><img src="/images/admin/button/b_delete.gif" border=0></a></td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr> 
                                <td class="table_title" height="25"><b>����</b></td>
                                <td class="table_02_2"><%=v_title%></td>
                              </tr>
                              <tr> 
                                <td class="table_title" height="160"><b>����</b></td>
                                <td class="table_02_2" valign="top"><br><%=v_contents%></td>
                              </tr>
                            </table>
                            <!----------------- �亯 �� ----------------->
                            <br>
                            <br>                            
<%                  }
            }     
%>
    <br>

    </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
