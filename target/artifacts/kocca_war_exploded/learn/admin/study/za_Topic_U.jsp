<%
//**********************************************************
//  1. ��      ��: TOPIC INSERT
//  2. ���α׷���: za_Topic_U.jsp
//  3. ��      ��: ��й� ���� ����
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
<%@ page import = "com.dunet.common.util.*" %>   
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_user_id   = box.getSession("userid");
    String  v_user_name = box.getSession("name");
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
    String  v_tpcode    = box.getString("p_tpcode");   
    int v_pageno         = box.getInt("p_pageno");
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

    String  v_started   = "";
    String  v_startedtime="";
    String  v_ended     = "";
    String  v_endedtime = "";
    String  v_title     = "";
    String  v_addate    = "";
    String  v_adcontent = "";
    String  v_name      = "";
    String  v_userid    = "";
    int     v_cnt       =  0;
    int     i           =  0;
    ToronData data     = null;
    //DEFINED class&variable END

    data = (ToronData)request.getAttribute("topicSelect");
    v_started   = data.getStarted();
    v_ended     = data.getEnded();
    v_title     = data.getTitle();
    v_addate    = data.getAddate();
    v_adcontent = data.getAdcontent();
    v_userid    = data.getAduserid();
    v_name      = data.getName();
    v_cnt       = data.getCnt();
    v_addate    = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
    if(v_started.length() > 0){
        v_startedtime=v_started.substring(8);
        v_started   = v_started.substring(0,8);
    }
    if(v_ended.length() > 0){
        v_endedtime = v_ended.substring(8);
        v_ended     = v_ended.substring(0,8);
    }

    String content  = StringManager.replace(v_adcontent, "&nbsp;","&amp;nbsp;");    
    String width    = "540";
    String height   = "250";    
    
  	String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name; 

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
    <script language="JavaScript" type="text/JavaScript">
    $(document).ready(function(){
    	$("#p_sdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    	$("#p_ldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    });
    <!--
       
        function topic_insert() {
            var checkcnt = 0;
            var st_date = make_date(form1.p_sdate.value);
            var ed_date = make_date(form1.p_ldate.value);

            if (blankCheck(document.form1.p_title.value)) {
                alert("��������� �Է��ϼ���!");
                document.form1.p_title.focus();
                return;
            }

            if (realsize(document.form1.p_title.value) > 200) {
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

            //if (blankCheck(document.form1.p_adcontent.value)) {
            //    alert("��г����� �Է��ϼ���!");
            //    document.form1.p_adcontent.focus();
            //    return;
            //}

            document.form1.p_adcontent.value = document.form1.Wec.MIMEValue;	            
            document.form1.target = "_self";
            document.form1.p_started.value = st_date;
            document.form1.p_ended.value   = ed_date;

            document.form1.action = "/servlet/controller.study.ToronAdminServlet";
            document.form1.p_process.value = "TopicUpdate";
            document.form1.submit();
        }
        function cancel() {
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.study.ToronAdminServlet";
            document.form1.p_process.value = "TopicList";
            document.form1.submit();
        }
    -->
    </script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

    <form name = "form1" method = "post">
    <input type="hidden" name="p_aduserid" value="<%=v_user_id%>">
    <input type="hidden" name="p_process">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">    
    <input type="hidden" name="s_action"    value="<%=ss_action%>">     <!--in relation to select-->
    <input type="hidden" name="s_grcode"    value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"     value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_grseq"     value="<%=ss_grseq%>">      <!--in relation to select-->
    <input type="hidden" name="s_uclass"    value="<%=ss_uclass%>">     <!--in relation to select-->
    <input type="hidden" name="s_subjcourse"value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"   value="<%=ss_subjseq%>">    <!--in relation to select-->
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
	<input type="hidden" name="p_subjseqgr"   value="<%=v_subjseqgr%>">
    <input type="hidden" name="p_tpcode"    value="<%=v_tpcode%>">
    <input type="hidden" name="p_started"   value="<%=v_started%>">
    <input type="hidden" name="p_ended"     value="<%=v_ended%>">
    <input type="hidden" name="p_pageno"  value="<%=v_pageno%>">
	<input type= "hidden" name= "p_adcontent"  id= "p_adcontent"  value= "<%=StringUtil.convertHtmlchars(content)%>">       
	
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
          <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0"> 
              <b><%=v_subjnm%> </b>
          </td> 
        </tr>
      </table>
      <br>

      <!----------------- ��й� ���� ���� ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="15">
        <tr>
          <td colspan="2" class="table_top_line"></td>
        </tr>
          <tr>
            <td colspan="2" class="table_title"><b>������� ����</b></td>
        </tr>

        <tr>
            <td class="table_01"><b>��бⰣ</b></td>
            <td class="table_02_2">

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="180">��н����� : <input name="p_sdate" id="p_sdate" type="text" class="datepicker_input1" size="10" value="<%= FormatDate.getFormatDate(v_started,"yyyy-MM-dd") %>">
                </td>
                <td width="20">
                  <select name="p_stime">
                      <option value="01" <% if(v_startedtime.equals("01") || v_startedtime.equals("")){ %> selected<%}%>>1��</option>
                      <option value="02" <% if(v_startedtime.equals("02")){ %> selected<%}%>>2��</option>
                      <option value="03" <% if(v_startedtime.equals("03")){ %> selected<%}%>>3��</option>
                      <option value="04" <% if(v_startedtime.equals("04")){ %> selected<%}%>>4��</option>
                      <option value="05" <% if(v_startedtime.equals("05")){ %> selected<%}%>>5��</option>
                      <option value="06" <% if(v_startedtime.equals("06")){ %> selected<%}%>>6��</option>
                      <option value="07" <% if(v_startedtime.equals("07")){ %> selected<%}%>>7��</option>
                      <option value="08" <% if(v_startedtime.equals("08")){ %> selected<%}%>>8��</option>
                      <option value="09" <% if(v_startedtime.equals("09")){ %> selected<%}%>>9��</option>
                      <option value="10" <% if(v_startedtime.equals("10")){ %> selected<%}%>>10��</option>
                      <option value="11" <% if(v_startedtime.equals("11")){ %> selected<%}%>>11��</option>
                      <option value="12" <% if(v_startedtime.equals("12")){ %> selected<%}%>>12��</option>
                      <option value="13" <% if(v_startedtime.equals("13")){ %> selected<%}%>>13��</option>
                      <option value="14" <% if(v_startedtime.equals("14")){ %> selected<%}%>>14��</option>
                      <option value="15" <% if(v_startedtime.equals("15")){ %> selected<%}%>>15��</option>
                      <option value="16" <% if(v_startedtime.equals("16")){ %> selected<%}%>>16��</option>
                      <option value="17" <% if(v_startedtime.equals("17")){ %> selected<%}%>>17��</option>
                      <option value="18" <% if(v_startedtime.equals("18")){ %> selected<%}%>>18��</option>
                      <option value="19" <% if(v_startedtime.equals("19")){ %> selected<%}%>>19��</option>
                      <option value="20" <% if(v_startedtime.equals("20")){ %> selected<%}%>>20��</option>
                      <option value="21" <% if(v_startedtime.equals("21")){ %> selected<%}%>>21��</option>
                      <option value="22" <% if(v_startedtime.equals("22")){ %> selected<%}%>>22��</option>
                      <option value="23" <% if(v_startedtime.equals("23")){ %> selected<%}%>>23��</option>
                      <option value="24" <% if(v_startedtime.equals("24")){ %> selected<%}%>>24��</option>
                  </select>
                </td>
                <td width="20">&nbsp;&nbsp;~</td>
                <td width="180">��и����� : <input name="p_ldate" id="p_ldate" type="text" class="datepicker_input1" size="10" value="<%= FormatDate.getFormatDate(v_ended,"yyyy-MM-dd") %>">
                </td>
                <td width="20">
                  <select name="p_ltime">
                          <option value="01" <% if(v_endedtime.equals("01") || v_endedtime.equals("")){ %> selected<%}%>>1��</option>
                          <option value="02" <% if(v_endedtime.equals("02")){ %> selected<%}%>>2��</option>
                          <option value="03" <% if(v_endedtime.equals("03")){ %> selected<%}%>>3��</option>
                          <option value="04" <% if(v_endedtime.equals("04")){ %> selected<%}%>>4��</option>
                          <option value="05" <% if(v_endedtime.equals("05")){ %> selected<%}%>>5��</option>
                          <option value="06" <% if(v_endedtime.equals("06")){ %> selected<%}%>>6��</option>
                          <option value="07" <% if(v_endedtime.equals("07")){ %> selected<%}%>>7��</option>
                          <option value="08" <% if(v_endedtime.equals("08")){ %> selected<%}%>>8��</option>
                          <option value="09" <% if(v_endedtime.equals("09")){ %> selected<%}%>>9��</option>
                          <option value="10" <% if(v_endedtime.equals("10")){ %> selected<%}%>>10��</option>
                          <option value="11" <% if(v_endedtime.equals("11")){ %> selected<%}%>>11��</option>
                          <option value="12" <% if(v_endedtime.equals("12")){ %> selected<%}%>>12��</option>
                          <option value="13" <% if(v_endedtime.equals("13")){ %> selected<%}%>>13��</option>
                          <option value="14" <% if(v_endedtime.equals("14")){ %> selected<%}%>>14��</option>
                          <option value="15" <% if(v_endedtime.equals("15")){ %> selected<%}%>>15��</option>
                          <option value="16" <% if(v_endedtime.equals("16")){ %> selected<%}%>>16��</option>
                          <option value="17" <% if(v_endedtime.equals("17")){ %> selected<%}%>>17��</option>
                          <option value="18" <% if(v_endedtime.equals("18")){ %> selected<%}%>>18��</option>
                          <option value="19" <% if(v_endedtime.equals("19")){ %> selected<%}%>>19��</option>
                          <option value="20" <% if(v_endedtime.equals("20")){ %> selected<%}%>>20��</option>
                          <option value="21" <% if(v_endedtime.equals("21")){ %> selected<%}%>>21��</option>
                          <option value="22" <% if(v_endedtime.equals("22")){ %> selected<%}%>>22��</option>
                          <option value="23" <% if(v_endedtime.equals("23")){ %> selected<%}%>>23��</option>
                          <option value="24" <% if(v_endedtime.equals("24")){ %> selected<%}%>>24��</option>
                  </select>
                </td>
                <td width="580">&nbsp;</td>
              </tr>
            </table>

          </td>
        </tr>
        <tr>
            <td class="table_01" width="16%"><b>������</b></td>
            <td class="table_02_2" width="81%"><%=v_user_name%></td>
        </tr>
        <tr>
            <td class="table_01"><b>�������</b></td>
            <td class="table_02_2">
            <input name="p_title" type="text" class="input" size="50" value='<%=v_title%>'>
            </td>
        </tr>        
        <tr>
            <td class="table_01"><b>����</b></td>
            <td class="table_02_2"><br><br>
            <!--<textarea name="p_adcontent" cols="100" rows="15"><%=v_adcontent%></textarea>-->
                <!-- ���� Editor  -->
                <p align="center">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";namoActiveInitCompleted("p_adcontent");</script>
                <script language="javascript">object_namoActivepatch('684','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
                 </p>
                <!-- ���� Editor  -->               
            </td>
        </tr>
      </table>
      <!----------------- ��й� ���� ���� �� ----------------->
      <br>
      <!----------------- ���, ��� ��ư ���� ----------------->
      <table  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
          <a href="javascript:topic_insert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
		  <td width=8></td>
          <td align="center">
          <a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
        </tr>
      </table>
        <!----------------- ���, ��� ��ư �� ----------------->
        <br>
      </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
