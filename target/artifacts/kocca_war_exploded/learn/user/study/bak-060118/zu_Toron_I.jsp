<%
//**********************************************************
//  1. ��      ��: TORON INSERT
//  2. ���α׷���: zu_Toron_I.jsp
//  3. ��      ��: ��й� �ǰ߾���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 03
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
    String  v_user_id   = box.getSession("userid");
    String  v_user_name = box.getSession("name");
    String  v_process   = box.getString("p_process");
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");              
    String  v_subjseq  = box.getString("p_subjseq");
    String  v_tpcode    = box.getString("p_tpcode");   
	//DEFINED class&variable END     

    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";	    	   
        
%>
<html>
<head>
<title>::: ��й� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script> 
    <script	language="JavaScript" type="text/JavaScript">
    <!--	   
        function whenToronInsert() {    
            if (blankCheck(document.form1.p_title.value)) {
                alert("�� ���� �Է��ϼ���!");
                document.form1.p_title.focus();
                return;
            }
    
            if (realsize(document.form1.p_title.value) > 100) {
                alert("�� ���� �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
                document.form1.p_title.focus();
                return;
            }

        	if(document.all.use_editor[0].checked) {        
                document.form1.p_adcontent.value = ObjEditor.document.all.tags("html")[0].outerHTML;
        	}else {
    		    document.form1.p_adcontent.value = document.all.txtDetail.value;
    	    }
	        
            //if (blankCheck(document.form1.p_adcontent.value)) {
            //    alert("������ �Է��ϼ���!");
            //    document.form1.p_adcontent.focus();
            //    return;
            //}
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.study.ToronServlet";
            document.form1.p_process.value = "ToronInsert";
            document.form1.submit();
        }    
	    function cancel() {
            history.back(-1);
        }
   -->			
    </script>        
</head>




<body topmargin="0" leftmargin="0">
    <form name = "form1" method = "post">
    <input type="hidden" name="p_aduserid" value="<%=v_user_id%>">
    <input type="hidden" name="p_process">
    <input type="hidden" name="p_subj" value="<%=v_subj%>">
    <input type="hidden" name="p_year" value="<%=v_year%>">
    <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">       
    <input type="hidden" name="p_tpcode" value="<%=v_tpcode%>">
    <input type="hidden" name="p_adcontent"> 



<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr> 
          <td align="center" valign="top" class="body_color"> 
<br>
            <!----------------- Ÿ��Ʋ ���� ----------------->
  <table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    <tr> 
      <td><img src="/images/user/study/discuss_title.gif"></td>
      <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      <td><img src="/images/user/study/gongi_tail.gif"></td>
    </tr>
  </table>         
            <!----------------- Ÿ��Ʋ �� ---------------->
            <br>
            <!----------------- �ǰ߳��� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_vertical_table_out">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="1" class="table2">
				  <tr>
                        <td class="board_color_line" height=2></td>
                        <td class="board_color_line" height=2></td>
                      </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">�� ��</td>
                      <td class="table_text3"> 
                        <input size="90" maxlength="200" name="p_title" class="input">
                      </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">�ۼ���</td>
                      <td class="table_text3"> <%=v_user_name%></td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">�����</td>
                      <td class="table_text3"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2">�ǰ߳���</td>
                      <td class="table_text3"> 
                        <!--<textarea name="p_adcontent" cols="85" rows="15" class="input"></textarea>-->

						<!-- DHTML Editor  -->
			            <%//@ include file="/portal/include/DhtmlEditor.jsp" %>
    		            <%@ include file="/include/DhtmlEditor.jsp" %>
                        <!-- DHTML Editor  -->  
                                                 
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- �ǰ߳��� �� ---------------->
            <br>
            <!----------------- ����, ���, �ݱ� ��ư ���� ----------------->
            <table width="210" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
			    <td width=70%>&nbsp;</td>
                <td align="right"><a href="javascript:whenToronInsert()"><img src="/images/user/button/btn_save.gif"  border="0"></a></td>
				<td witdh=5%></td>
                <td align="right"><a href="javascript:cancel()"><img src="/images/user/button/btn_cancel.gif"  border="0"></a></td>
				<td witdh=5%></td>
                <td align="right"><a href="javascript:self.close()"><img src="/images/user/button/btn_close.gif" border="0"></a></td>
              </tr>
            </table>
            <!----------------- ����, ���, �ݱ� ��ư �� ----------------->
            <br>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>





</body>
</html>
