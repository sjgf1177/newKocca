<%
//**********************************************************
//  1. ��      ��: TORIC INSERT
//  2. ���α׷���: zu_Topic_I.jsp
//  3. ��      ��: ��й� ��������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 02
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
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
    <script	language="JavaScript" type="text/JavaScript">
    $(document).ready(function(){
    	$("#p_sdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    	$("#p_ldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    });
    <!--	   
        function whenTopicInsert() {
            var checkcnt = 0;
            var st_date = make_date(form1.p_sdate.value);
            var ed_date = make_date(form1.p_ldate.value);
    
            if (blankCheck(document.form1.p_title.value)) {
                alert("��������� �Է��ϼ���!");
                document.form1.p_title.focus();
                return;
            }
    
            if (realsize(document.form1.p_title.value) > 100) {
                alert("��������� �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
                document.form1.p_title.focus();
                return;
            }
    
            if(blankCheck(document.form1.p_sdate.value)){
                alert("��� �������� �Է��ϼ���.");
                return;
            }
    
            if(blankCheck(document.form1.p_ldate.value)){
                alert("��� �������� �Է��ϼ���.");
                return;
            }
    
            if(st_date > ed_date) {
                alert("��н������� �����Ϻ��� Ů�ϴ�.");
                return;
            }
    
        	if(document.all.use_editor[0].checked) {        
                document.form1.p_adcontent.value = ObjEditor.document.all.tags("html")[0].outerHTML;
        	}else {
    		    document.form1.p_adcontent.value = document.all.txtDetail.value;
    	    }
            document.form1.target = "_self";
            document.form1.p_started.value = st_date;
            document.form1.p_ended.value   = ed_date;
    
            document.form1.action = "/servlet/controller.study.ToronServlet";
            document.form1.p_process.value = "TopicInsert";
            document.form1.submit();
        }    
	    function cancel() {
	        document.form1.target = "_self";
            document.form1.action = "/servlet/controller.study.ToronServlet";
            document.form1.p_process.value = "";      
            document.form1.submit();	
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
    <input type = "hidden" name="p_started">
	<input type = "hidden" name="p_ended">    
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
            <!----------------- �������� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_vertical_table_out">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="1" class="table2">
				  <tr>
                        <td class="board_color_line" height=2></td>
                        <td class="board_color_line" height=2></td>
                      </tr>
                    <tr> 
                      <td class="board_title_bg2">�������</td>
                      <td class="table_text3" colspan="3"> 
                        <input size="90" maxlength="100" name="p_title" class="input">
                      </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="15%">�ۼ���</td>
                      <td class="table_text3" colspan="3"> <%=v_user_name%></td>
                    </tr>
                    <tr>                       
                      <td class="board_title_bg2">��бⰣ����</td>
                      <td class="table_text3" colspan="3">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="180">��н����� : <input name="p_sdate" id="p_sdate" type="text" class="datepicker_input1" size="10">                                
                            </td>
                            <td width="20">
                              <select name="p_stime">
                                      <option value="01" selected>1��</option>     
                                      <option value="02">2��</option>     
                                      <option value="03">3��</option>     
                                      <option value="04">4��</option>     
                                      <option value="05">5��</option>     
                                      <option value="06">6��</option>     
                                      <option value="07">7��</option>    
                                      <option value="08">8��</option>     
                                      <option value="09">9��</option>     
                                      <option value="10">10��</option>     
                                      <option value="11">11��</option>     
                                      <option value="12">12��</option>     
                                      <option value="13">13��</option>     
                                      <option value="14">14��</option>     
                                      <option value="15">15��</option>     
                                      <option value="16">16��</option>     
                                      <option value="17">17��</option>     
                                      <option value="18">18��</option>     
                                      <option value="19">19��</option>     
                                      <option value="20">20��</option>     
                                      <option value="21">21��</option>     
                                      <option value="22">22��</option>     
                                      <option value="23">23��</option>     
                                      <option value="24">24��</option>                          
                                    </select>
                            </td>
                            <td width="20">&nbsp;&nbsp;~</td>
                            <td width="180">��и����� : <input name="p_ldate" id="p_ldate" type="text" class="datepicker_input1" size="10">
                            </td>
                            <td width="20">
                              <select name="p_ltime">
                                      <option value="01" selected>1��</option>     
                                      <option value="02">2��</option>     
                                      <option value="03">3��</option>     
                                      <option value="04">4��</option>     
                                      <option value="05">5��</option>     
                                      <option value="06">6��</option>     
                                      <option value="07">7��</option>    
                                      <option value="08">8��</option>     
                                      <option value="09">9��</option>     
                                      <option value="10">10��</option>     
                                      <option value="11">11��</option>     
                                      <option value="12">12��</option>     
                                      <option value="13">13��</option>     
                                      <option value="14">14��</option>     
                                      <option value="15">15��</option>     
                                      <option value="16">16��</option>     
                                      <option value="17">17��</option>     
                                      <option value="18">18��</option>     
                                      <option value="19">19��</option>     
                                      <option value="20">20��</option>     
                                      <option value="21">21��</option>     
                                      <option value="22">22��</option>     
                                      <option value="23">23��</option>     
                                      <option value="24">24��</option>                          
                                    </select>                
                            </td>  
                            <td width="200">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2">�� ��</td>
                      <td class="table_text3" colspan="3"> 
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
            <!----------------- �������� �� ---------------->
            <br>
            <!----------------- ����, ���, �ݱ� ��ư ���� ----------------->
            <table width="210" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td align="center">
                <a href="javascript:whenTopicInsert()"><img src="/images/user/button/btn_save.gif"  border="0"></a></td>
                <td align="center">
                <a href="javascript:cancel()"><img src="/images/user/button/btn_cancel.gif"  border="0"></a></td>
                <td align="center">
                <a href="javascript:self.close()"><img src="/images/user/button/btn_close.gif"  border="0"></a></td>
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


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>

</body>
</html>
