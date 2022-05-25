<%
//**********************************************************
//  1. ��      ��: ���� ���
//  2. ���α׷���: SubjGongAdminServlet.java
//  3. ��      ��: �������� ������(���հ���) �������� �Է�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 22
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%    
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process    = box.getString("p_process");
    String v_subj       = box.getString("p_subj");
    String v_year       = box.getString("p_year");
    String v_subjseq    = box.getString("p_subjseq");
    String v_isonoff    = box.getString("p_isonoff");
    String v_tutorid    = "";
    String v_tutorname  = "";
    int     i           = 0;    	    
    ArrayList list1     = (ArrayList)request.getAttribute("TutorList");    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript">
$(document).ready(function(){
	$("#p_date").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
    function whenLectureInsert() {
        var date = "";
        if (blankCheck(document.form1.p_date.value)) {
            alert("���ǳ�¥�� �Է��ϼ���!");
            document.form1.p_date.focus();
            return;
        }else{
            date = make_date(form1.p_date.value);                    
        }
  
        if (blankCheck(document.form1.p_lecttime.value)) {
            alert("���ǽð��� �Է��ϼ���!");
            document.form1.p_lecttime.focus();
            return;
        }

        if (blankCheck(document.form1.p_sdesc.value)) {
            alert("���¸��� �Է��ϼ���!");
            document.form1.p_sdesc.focus();
            return;
        }
        if (blankCheck(document.form1.p_tutorid.value)) {
            alert("���縦 �Է��ϼ���!");
            document.form1.p_tutorid.focus();
            return;
        }        
		document.form1.action='/servlet/controller.course.GrseqServlet';
        document.form1.p_process.value = 'lectureInsert';
        document.form1.p_lectdate.value = date;
        document.form1.submit();
    }
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

    <form name = "form1" method = "post">
    <input type="hidden" name="p_process">
	<input type="hidden" name="p_subj"		value="<%=v_subj%>">
	<input type="hidden" name="p_year"		value="<%=v_year%>">
	<input type="hidden" name="p_subjseq"	value="<%=v_subjseq%>">	   
	<input type="hidden" name="p_isonoff"   value="<%=v_isonoff%>"> 
    <input type = "hidden" name="p_lectdate">
  
<table width="600" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr> 
    <td> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            <td align="center" bgcolor="#FFFFFF"> 
              <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/c_title09.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	                <!----------------- title �� ----------------->

              <br>

              <!----------------- ������ �������� �Է� ���� ----------------->
              <table cellspacing="1" cellpadding="5" class="open_table_out">
                <tr> 
                  <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td class="table_title">���ǳ�¥</td>
                  <td class="table_02_2"><input name="p_date" id="p_date" type="text" class="datepicker_input1" size="10"> 
                  </td>
                  <td class="table_title" width="18%">���ǽ��۽ð�</td>
                  <td class="table_02_2">
                        <select name="p_lectsttime1">
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
                        <select name="p_lectsttime2">
                          <option value="00" selected>0��</option>    
                          <option value="05">5��</option>         
                          <option value="10">10��</option>          
                          <option value="15">15��</option>     
                          <option value="20">20��</option>     
                          <option value="25">25��</option>     
                          <option value="30">30��</option>     
                          <option value="35">35��</option>     
                          <option value="40">40��</option>    
                          <option value="45">45��</option>     
                          <option value="50">50��</option>     
                          <option value="55">55��</option>     
                        </select>
                  </td>                  
                </tr>
                <tr>                   
                  <td class="table_title" width="18%">���ǽð�</td>
                  <td class="table_02_2">��
                    <input name="p_lecttime" type="text" class="input" size="5">
                    ��</td>
                  <td class="table_title">����</td>
                  <td class="table_02_2">
                    <select name="p_tutorid">
<%
        for(i = 0; i < list1.size(); i++) {                
            OffSubjLectureData data  = (OffSubjLectureData)list1.get(i);   
            v_tutorid        = data.getTutorid();    
            v_tutorname      = data.getTutorname();  
%>
                      <option value="<%=v_tutorid%>"><%=v_tutorname%></option>
<%      } %>
                    </select>
                  </td>
                </tr>
                <tr> 
                  <td class="table_title">���¸�</td>
                  <td class="table_02_2" colspan="3">
                    <input name="p_sdesc" type="text" class="input" size="60">
                  </td>
                </tr>
              </table>
            <!----------------- ������ �������� �Է� �� ----------------->




<br>


            <!----------------- ���, ����Ʈ, �ݱ� ��ư ���� ----------------->
            <table cellspacing="0" cellpadding="0" >
              <tr> 
                  <td>
                  <a href="javascript:whenLectureInsert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
				  <td width=8></td>
                  <td>
                  <a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
              </tr>
            </table>
            <!----------------- ���, ����Ʈ, �ݱ� ��ư �� ----------------->




            <br>




          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>



</form>
</body>
</html>
