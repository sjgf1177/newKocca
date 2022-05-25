<%
//**********************************************************
//  1. ��      ��: ���� ����
//  2. ���α׷���: za_Lecture_U.jsp
//  3. ��      ��: �������� ������(���հ���) �������� ����
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
    String v_lecture    = box.getString("p_lecture");
    String v_lectdate   = "";
    String v_lectsttime = "";
    String v_lectsttime1= "";
    String v_lectsttime2= "";
    String v_lecttime   = "";
    String v_sdesc      = "";
    String v_tutorid    = "";
    String v_tutorname  = "";
    int     i           = 0;    	    
    OffSubjLectureData data = (OffSubjLectureData)request.getAttribute("selectLecture");   
    v_lectdate          = data.getLectdate();      
    v_lectsttime        = data.getLectsttime();    
    v_lecttime          = data.getLecttime();      
    v_sdesc             = data.getSdesc();         
    v_tutorid           = data.getTutorid();       
    v_tutorname         = data.getTutorname();          
    v_lectdate          = FormatDate.getFormatDate(v_lectdate,"yyyy-MM-dd");
    v_lectsttime1       = v_lectsttime.substring(0,2);
    v_lectsttime2       = v_lectsttime.substring(2);
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
    function whenLectureUpdate() {
        var date = make_date(form1.p_date.value);
        document.form1.action='/servlet/controller.course.GrseqServlet';
        document.form1.p_process.value = 'lectureUpdate';
        document.form1.p_lectdate.value = date;
        document.form1.submit();
    }
    function whenLectureDelete() {
        document.form1.action='/servlet/controller.course.GrseqServlet';
        document.form1.p_process.value = 'lectureDelete';
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
	<input type="hidden" name="p_lecture"   value="<%=v_lecture%>">
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
                  <td class="table_title_01">���ǳ�¥</td>
                  <td class="table_02_2"><input name="p_date" id="p_date" type="text" class="datepicker_input1" size="10" value="<%=v_lectdate%>"> 
                  </td>
                  <td class="table_title_01" width="18%">���ǽ��۽ð�</td>
                  <td class="table_02_2">
                        <select name="p_lectsttime1">
                          <option value="01" <% if(v_lectsttime1.equals("01")){%> selected<%}%>>1��</option>     
                          <option value="02" <% if(v_lectsttime1.equals("02")){%> selected<%}%>>2��</option>     
                          <option value="03" <% if(v_lectsttime1.equals("03")){%> selected<%}%>>3��</option>     
                          <option value="04" <% if(v_lectsttime1.equals("04")){%> selected<%}%>>4��</option>     
                          <option value="05" <% if(v_lectsttime1.equals("05")){%> selected<%}%>>5��</option>     
                          <option value="06" <% if(v_lectsttime1.equals("06")){%> selected<%}%>>6��</option>     
                          <option value="07" <% if(v_lectsttime1.equals("07")){%> selected<%}%>>7��</option>    
                          <option value="08" <% if(v_lectsttime1.equals("08")){%> selected<%}%>>8��</option>     
                          <option value="09" <% if(v_lectsttime1.equals("09")){%> selected<%}%>>9��</option>     
                          <option value="10" <% if(v_lectsttime1.equals("10")){%> selected<%}%>>10��</option>     
                          <option value="11" <% if(v_lectsttime1.equals("11")){%> selected<%}%>>11��</option>     
                          <option value="12" <% if(v_lectsttime1.equals("12")){%> selected<%}%>>12��</option>     
                          <option value="13" <% if(v_lectsttime1.equals("13")){%> selected<%}%>>13��</option>     
                          <option value="14" <% if(v_lectsttime1.equals("14")){%> selected<%}%>>14��</option>     
                          <option value="15" <% if(v_lectsttime1.equals("15")){%> selected<%}%>>15��</option>     
                          <option value="16" <% if(v_lectsttime1.equals("16")){%> selected<%}%>>16��</option>     
                          <option value="17" <% if(v_lectsttime1.equals("17")){%> selected<%}%>>17��</option>     
                          <option value="18" <% if(v_lectsttime1.equals("18")){%> selected<%}%>>18��</option>     
                          <option value="19" <% if(v_lectsttime1.equals("19")){%> selected<%}%>>19��</option>     
                          <option value="20" <% if(v_lectsttime1.equals("20")){%> selected<%}%>>20��</option>     
                          <option value="21" <% if(v_lectsttime1.equals("21")){%> selected<%}%>>21��</option>     
                          <option value="22" <% if(v_lectsttime1.equals("22")){%> selected<%}%>>22��</option>     
                          <option value="23" <% if(v_lectsttime1.equals("23")){%> selected<%}%>>23��</option>     
                          <option value="24" <% if(v_lectsttime1.equals("24")){%> selected<%}%>>24��</option>                          
                        </select>
                        <select name="p_lectsttime2">
                          <option value="00" <% if(v_lectsttime2.equals("00")){%> selected<%}%>>0��</option>    
                          <option value="05" <% if(v_lectsttime2.equals("05")){%> selected<%}%>>5��</option>         
                          <option value="10" <% if(v_lectsttime2.equals("10")){%> selected<%}%>>10��</option>          
                          <option value="15" <% if(v_lectsttime2.equals("15")){%> selected<%}%>>15��</option>     
                          <option value="20" <% if(v_lectsttime2.equals("20")){%> selected<%}%>>20��</option>     
                          <option value="25" <% if(v_lectsttime2.equals("25")){%> selected<%}%>>25��</option>     
                          <option value="30" <% if(v_lectsttime2.equals("30")){%> selected<%}%>>30��</option>     
                          <option value="35" <% if(v_lectsttime2.equals("35")){%> selected<%}%>>35��</option>     
                          <option value="40" <% if(v_lectsttime2.equals("40")){%> selected<%}%>>40��</option>    
                          <option value="45" <% if(v_lectsttime2.equals("45")){%> selected<%}%>>45��</option>     
                          <option value="50" <% if(v_lectsttime2.equals("50")){%> selected<%}%>>50��</option>     
                          <option value="55" <% if(v_lectsttime2.equals("55")){%> selected<%}%>>55��</option>     
                        </select>
                  </td>                  
                </tr>
                <tr>                   
                  <td class="table_title_01" width="18%">���ǽð�</td>
                  <td class="table_02_2">��
                    <input name="p_lecttime" type="text" class="input" size="5" value="<%=v_lecttime%>">
                    ��</td>
                  <td class="table_title_01">����</td>
                  <td class="table_02_2">
                    <select name="p_tutorid">
<%
        for(i = 0; i < list1.size(); i++) {                
            OffSubjLectureData data1  = (OffSubjLectureData)list1.get(i);   
%>
                      <option value="<%=data1.getTutorid()%>" <% if(data1.getTutorid().equals(v_tutorid)){%> selected<%}%>><%=data1.getTutorname()%></option>
<%      } %>
                    </select>
                  </td>
                </tr>
                <tr> 
                  <td class="table_title_01">���¸�</td>
                  <td class="table_02_2" colspan="3">
                    <input name="p_sdesc" type="text" class="input" size="60" value="<%=v_sdesc%>">
                  </td>
                </tr>
              </table>
            <!----------------- ������ �������� �Է� �� ----------------->
<br>
            <!----------------- ���, ����Ʈ, �ݱ� ��ư ���� ----------------->
            <table cellspacing="0" cellpadding="0">
              <tr> 
                  <td>
                  <a href="javascript:whenLectureUpdate()"><img src="/images/admin/button/btn_save.gif" border="0"></a>
                  </td>
                  <td width=8></td>
                  <td>
                  <a href="javascript:whenLectureDelete()"><img src="/images/admin/button/btn_del.gif" border="0"></a>
                  </td>
                  <td width=8></td>
                  <td>
                  <a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a>
                  </td>
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
