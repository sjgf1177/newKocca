<%
//**********************************************************
//  1. ��      ��: ��� Qna ����Ʈ
//  2. ���α׷��� : za_Qna_L.jsp
//  3. ��      ��: Qna ����Ʈ ��ȸȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.7.7 �̿���
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box        = (RequestBox)request.getAttribute("requestbox");
    String  v_process     = box.getString("p_process");
    String  v_type        = box.getStringDefault("p_type", "ALL");
    String  v_action      = box.getString("p_action");
    String  s_grtype      = box.getSession("grtype");
    
    
          //�����׷�
    int v_pageno = box.getInt("p_pageno");
    if (v_pageno == 0) {
        v_pageno = 1;
    }
    String startDate = FormatDate.getRelativeDate(-90);
    String endDate = FormatDate.getDate("yyyyMMdd");

    String searchStart = "";
    String searchEnd   = "";
    int v_replystate= 0;

    String  v_inuserid   = "";
    String  v_name       = "";
    String  v_indate     = "";
    String  v_title      = "";
    int     v_seq        = 0;
    String  v_types      = "";
    String  v_scsubjnm   = "";
    String  v_subjseqgr  = "";
    String  v_subj       ="";
    String  v_year       = "";
    String  v_subjseq    = "";
    String  v_repstatus  = "";

    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    searchStart = FormatDate.getFormatDate(startDate,"yyyy-MM-dd");
    searchEnd   = FormatDate.getFormatDate(endDate,"yyyy-MM-dd");

    String  v_searchStart    = box.getStringDefault("p_searchStart",searchStart);
    String  v_searchEnd      = box.getStringDefault("p_searchEnd",searchEnd);
    String  v_startdate      = box.getString("p_startdate");
    String  v_enddate        = box.getString("p_enddate");
    String  s_grcode         = box.getStringDefault("p_grcode","ALL");
    String  v_searchtext     = box.getString("p_searchtext");
    String  v_select         = box.getString("p_select");
    String  v_search         = box.getString("p_search");
    String  v_categorycd     = box.getString("p_categorycd");

    String  ss_grcode        = box.getString("s_grcode");                  //�����׷�
    String  s_gadmin         = box.getSession("gadmin");
    String  v_gadmin         = StringManager.substring(s_gadmin, 0, 1);
    String  isAll            = !v_gadmin.equals("A") ? "false" : "true";
    String  v_selGroup       = box.getStringDefault("p_selGroup", "ALL");
    String  ss_gyear         = box.getString("s_gyear");                   //�⵵
    String  ss_grseq         = box.getStringDefault("s_grseq","");         //��������
    String  ss_upperclass    = box.getString("s_upperclass");              //������з�
    String  ss_middleclass   = box.getString("s_middleclass");             //�����ߺз�
    String  ss_lowerclass    = box.getString("s_lowerclass");              //�����Һз�
    String  ss_subjcourse    = box.getString("s_subjcourse");              //����&�ڽ�
    String  ss_subjseq       = box.getString("s_subjseq");                 //���� ����
    String  s_subjsearchkey   = box.getString("s_subjsearchkey");
    String  v_orderType      = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_order      = box.getString("p_order"); //����
    
    String s_categorycd = box.getStringDefault("p_categorycd","00");	//ī�װ� �˻�

    int v_cnt = 0;
    String s_userid = box.getSession("userid");
    String s_usernm = box.getSession("name");
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1;
    ArrayList list = (ArrayList)request.getAttribute("selectListView");

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
	$("#p_searchStart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_searchEnd").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
//type���� �Ѱܼ� ����Ʈ �˻�
function selectType()
{
    whenSelection('go');

}

//�˻�
function whenSelection(p_action) {
    document.form1.p_action.value = p_action;
        if (p_action == 'go') {
        top.ftop.setPam();
    }
    document.form1.p_startdate.value = make_date(document.form1.p_searchStart.value);
    document.form1.p_enddate.value = make_date(document.form1.p_searchEnd.value);

    if(document.form1.p_type.value=='SUBJ'){//���������� ����������

        document.form1.action='/servlet/controller.homepage.QnaAdminServlet';
        document.form1.p_process.value = 'selectListCourse';
        document.form1.submit();

//ALL�˻� ������ ��������Ʈ�� ����������
    }else{
          document.form1.action='/servlet/controller.homepage.QnaAdminServlet';
          document.form1.p_process.value = 'selectList';
          document.form1.submit();
    }
}

//������ �̵�
function go(index) {

    document.form1.p_action.value = "go";
    document.form1.p_pageno.value = index;
    document.form1.action = "/servlet/controller.homepage.QnaAdminServlet";
    document.form1.p_process.value = "selectListCourse";
    document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {

     document.form1.p_action.value = "go";
     document.form1.p_pageno.value = pageNum;
     document.form1.action = "/servlet/controller.homepage.QnaAdminServlet";
     document.form1.p_process.value = "selectListCourse";
     document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq,subj,year,subjseq) {
    document.form1.action = "/servlet/controller.homepage.QnaAdminServlet";
    document.form1.p_process.value = "selectViewCourse";
    document.form1.p_seq.value     = seq;
    document.form1.p_subj.value    = subj;
    document.form1.p_year.value    = year;
    document.form1.p_subjseq.value = subjseq;
    //document.form1.pp_type.value    = type;
    document.form1.submit();
}

// ����
function ordering(column) {
    if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }
    document.form1.p_order.value = column;
    whenSelection("go");
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

//-->
</script>

<script type="text/javascript">
var startup = 0;
function Main_s_subjseq(){
    if (startup > 1)
        changes_grseq(document.all.s_grcode.value, document.all.s_gyear.value);
}
function Main_subjcourse(){
    if(startup > 1)
        changes_subjcourse(document.all.s_grcode.value, document.all.s_upperclass.value, document.all.s_middleclass.value, document.all.s_lowerclass.value, document.all.s_grseq.value, null );
    startup++;
}
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/homepage/homepage_title12.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

        <!------------------------------------- form ���� ------------------------------------->
        <form name = "form1" method = "post">
        <input type="hidden" name ="p_process"   value = "<%= v_process %>">
        <input type="hidden" name ="p_pageno"    value = "<%=v_pageno%>">
        <input type="hidden" name ="p_seq"       value = "">
        <input type="hidden" name ="p_userid"    value = "">
        <input type="hidden" name ="p_types"     value = "">
        <input type="hidden" name ="p_action"    value = "">
        <input type="hidden" name ="pp_type"     value = "">
        <input type="hidden" name ="p_grcodenm"  value = "">
        <input type="hidden" name ="p_order"     value="<%=v_order%>">
        <input type="hidden" name ="p_orderType" value="<%=v_orderType%>">
        <input type="hidden" name ="p_subj"      value = "">
        <input type="hidden" name ="p_year"      value = "">
        <input type="hidden" name ="p_subjseq"   value = "">
        
		<input type = "hidden" name = "p_startdate" value = "<%=v_startdate %>">
		<input type = "hidden" name = "p_enddate"   value = "<%=v_enddate %>">


        <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
<!-- �����׷� -->
                    <tr>
                      <td width="30%" align="left"  valign="middle">
						<!-- �����׷� ���� -->                                                                                            
						<%= !v_gadmin.equals("A") ? "<font color=\"red\">��</font>":"" %>                                                 
						                       �����׷� <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" "              
						      onChange="whenSelection('go')" attr=" " selectedValue="<%= ss_grcode %>" isLoad="true" all="<%= isAll %>" />
						<!-- �����׷� ���� -->    
                      </td>

                      <td width="60%" colspan="2">
                        <select name = "p_select" class = "input">
                            <option value="name" <% if (v_search.equals("name")) out.print("selected"); %>>�ۼ���</option>
                            <option value="title" <% if (v_search.equals("title")) out.print("selected"); %>>����</option>
                            <option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>����</option>
                        </select>
                         <input type="text"  onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'"
                name = "p_searchtext" value = "<%=v_searchtext %>" size = "25" maxlength = "30">
                      </td>

                    </tr>
<!-- �����׷� -->
                      <tr>
                        <td height="9"></td>
                      </tr>
                    </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
<!-- ���� -->
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td width="60%" >
                        <font color="red">��</font> ����
                        <select name = "p_type" class = "input" onchange="selectType()">
                            <option value="ALL" <%if(v_type.equals("ALL")){out.println("selected");}%> >ALL</option>
                            <option value="PQ" <%if(v_type.equals("PQ")){out.println("selected");}%>>Ȩ������</option>
                            <option value="MM" <%if(v_type.equals("MM")){out.println("selected");}%>>1:1����</option>
                            <option value="SUBJ"  <%if(v_type.equals("SUBJ")){out.println("selected");}%>>����������</option>
                            <!-- 
<%if( s_grtype.equals("KGDI") ){%>
                            <option value="PQ" <%if(v_type.equals("PQ")){out.println("selected");}%>>Ȩ������</option>
                            <option value="BU" <%if(v_type.equals("BU")){out.println("selected");}%>>���׽Ű�</option>
                            <option value="CU" <%if(v_type.equals("CU")){out.println("selected");}%>>��ڿ���</option>
                            <option value="MM" <%if(v_type.equals("MM")){out.println("selected");}%>>1:1����</option>
<%}else if( s_grtype.equals("KOCCA") ){%>
                            <option value="OO" <%if(v_type.equals("OO")){out.println("selected");}%>>1vs1���</option>
                            <option value="MM" <%if(v_type.equals("MM")){out.println("selected");}%>>1:1����</option>
<%}else{%>
                            <option value="PQ" <%if(v_type.equals("PQ")){out.println("selected");}%>>Ȩ������</option>
                            <option value="BU" <%if(v_type.equals("BU")){out.println("selected");}%>>���׽Ű�</option>
                            <option value="CU" <%if(v_type.equals("CU")){out.println("selected");}%>>��ڿ���</option>
                            <option value="OO" <%if(v_type.equals("OO")){out.println("selected");}%>>1vs1���</option>
                            <option value="MM" <%if(v_type.equals("MM")){out.println("selected");}%>>1:1����</option>
<%}%>
                            <option value="SUBJ"  <%if(v_type.equals("SUBJ")){out.println("selected");}%>>����������</option>
                             -->
                         </select>
							&nbsp;
						<select name='p_categorycd' onChange = "javascript:whenSelection('change')">
							<option value='00' <%if(s_categorycd.equals("00")){out.println("selected");}%>>����</option>
							<option value='03' <%if(s_categorycd.equals("03")){out.println("selected");}%>>�����ó�Ʈ</option>
						</select>
                      </td>
                      <td width="40%" colspan="2">��ȸ�Ⱓ
                        <input name="p_searchStart" id="p_searchStart" type="text" class="datepicker_input1" size="10" value="<%=v_searchStart%>"> �� ~
                        <input name="p_searchEnd" id="p_searchEnd" type="text" class="datepicker_input1" size="10" value="<%=v_searchEnd%>"> ��
                      </td>
                    </tr>
                  </table>
<!-- ���� -->
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                        <td colspan="3">
                         <!-- �����⵵, �з� ���� -->
						    ���� <kocca_select:select name="s_gyear" sqlNum="course.year"  param="<%= ss_grcode %>"
						        onChange="changes_grseq(s_grcode.value, this.value);" afterScript="Main_subjcourse" attr=" " selectedValue="<%= ss_gyear %>" isLoad="true" all="false" />
						    �������� <kocca_select:select name="s_grseq" sqlNum="course.subjseq"
						        param="<%=ss_grcode%>" param2="<%=ss_gyear%>"
						        attr="" onChange="changes_subjcourse('<%=ss_grcode%>','<%=ss_upperclass%>','<%=ss_middleclass%>','<%=ss_lowerclass%>','<%=ss_grseq%>','<%=s_subjsearchkey%>')" afterScript="Main_subjcourse" selectedValue="<%= ss_grseq %>" isLoad="true" all="true" />
						    ��з� <kocca_select:select name="s_upperclass" sqlNum="course.0002"  param=" "
						        onChange="changes_middleclass(this.value);Main_subjcourse();" attr=" "  selectedValue="<%= ss_upperclass %>" isLoad="true" all="true" />
						    �ߺз� <kocca_select:select name="s_middleclass" sqlNum="course.0003"  param="<%= ss_upperclass %>"
						        onChange="changes_lowerclass(s_upperclass.value, this.value);Main_subjcourse();" attr=" " selectedValue="<%= ss_middleclass %>" isLoad="true" all="true" />
						    �Һз� <kocca_select:select name="s_lowerclass" sqlNum="course.0004"  param="<%= ss_upperclass %>"  param2="<%= ss_middleclass %>"
						        onChange="whenSelection('go')" attr=" " selectedValue="<%=ss_lowerclass %>" isLoad="true" all="true" />
                    </tr>
                      <tr>
                        <td height="9"></td>
                      </tr>
                    <tr>
                        <td colspan="3">
                        <!-- ����,���� ���� -->
				                              ���� <kocca_select:select name="s_subjcourse" sqlNum="subjlist1|subjlist2|subjlist3|subjlist4|subjlist5|subjlist6|subjlist7|subjlist8|subjlist9"
				                param="<%=ss_grcode%>"param4="<%=ss_upperclass%>"param5="<%=ss_middleclass%>"param6="<%=ss_lowerclass%>"
				                param7="<%=ss_grseq%>" param9="<%=s_subjsearchkey%>"
				                onChange="changes_subjseq('<%=ss_grcode%>', '<%=ss_grseq%>', '<%=ss_subjcourse%>', '<%=ss_gyear%>')" attr=" " selectedValue="<%= ss_subjcourse %>" isLoad="true" all='<%= box.getSession("isSubjAll") %>' />
				                    �������� <kocca_select:select name="s_subjseq" sqlNum="subjectSeq1|subjectSeq2|subjectSeq3|subjectSeq4"
				                param="<%=ss_grcode%>"param2="<%=ss_grseq%>"param3="<%=ss_subjcourse%>"param4="<%=ss_gyear%>"
				                onChange="whenSelection('go')" attr=" " selectedValue="<%= ss_subjseq %>" isLoad="true" all="true" />
                         <!-- ����,���� ���� -->
                        </td>
                    </tr>
                    <tr>
                        <td width="10%" align="right"><a href = "javascript:whenSelection('go','ALL')"><img src = "/images/admin/button/b_go.gif" border = "0" align="absmiddle"></a></td>
                    </tr>
                  </table>
                   </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
    </table><br>


      <!----------------- form �� ----------------->
      </form>

        <!----------------- ��ν���, ��ν������, Ȯ�� ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td  class=sub_title>Q&A ��ȸ</td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ��ν���, ��ν������, Ȯ�� ��ư �� ----------------->

        <!----------------- ����������ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="13" class="table_top_line"></td>
          </tr>

<form name="ff" method="post" >
   <input type="hidden" name="p_process"    value="">

          <tr>
            <td class="table_title" width="3%"><b>NO</b></td>
            <td class="table_title" width="10%"><b>����</b></td>
            <td class="table_title" width="12%"><b><a href="javascript:ordering('scsubjnm')" class="e">������</b></td>
            <td class="table_title" width="5%"><b><a href="javascript:ordering('subjseqgr')" class="e">����</b></td>
            <td class="table_title" width="17%"><a href="javascript:ordering('title')" class="e">����</b></td>
            <td class="table_title" width="8%"><b><a href="javascript:ordering('name')" class="e">����</b></td>
            <td class="table_title" width="7%"><b><a href="javascript:ordering('indate')" class="e">�����</b></td>
            <td class="table_title" width="5%"><b><a href="javascript:ordering('okyn1')" class="e">�亯����</b></td>
          </tr>

<%
        if(v_action.equals("go")){
            int i = 0;
            for(i = 0; i < list.size(); i++) {
                DataBox dbox = (DataBox)list.get(i);
                v_dispnum = dbox.getInt("d_dispnum");
                v_inuserid   = dbox.getString("d_inuserid");
                v_name   = dbox.getString("d_name");
                v_cnt = dbox.getInt("d_cnt");
                v_indate    = dbox.getString("d_indate");
                v_title    = dbox.getString("d_title");
                v_seq      = dbox.getInt("d_seq");
                v_types      = dbox.getString("d_types");
                v_categorycd = dbox.getString("d_categorycd");
                v_replystate = Integer.parseInt(dbox.getString("d_replystate"));
                v_totalpage = dbox.getInt("d_totalpage");
                v_rowcount = dbox.getInt("d_rowcount");
                v_type = dbox.getString("d_type");
                v_scsubjnm = dbox.getString("d_scsubjnm");
                v_subjseqgr= dbox.getString("d_subjseqgr");
                v_subj     = dbox.getString("d_subj");
                v_year     = dbox.getString("d_year");
                v_subjseq     = dbox.getString("d_subjseq");
                
                v_repstatus     = dbox.getString("d_okyn1").equals("") ? "1" : dbox.getString("d_okyn1");
                
                if (v_repstatus.equals("1")){
                    v_repstatus    = "������";
                } else if (v_repstatus.equals("2")){
                    v_repstatus    = "�亯�غ���";
                } else if (v_repstatus.equals("3")){
                    v_repstatus    = "�亯�Ϸ�";
                } 

%>
          <tr class="table_02_1">
            <td class="table_02_1"><%=v_dispnum%></td>
            <td class="table_02_1">
<%
                 if(v_type.equals("PQ")){
                    out.print("Ȩ������");
                 }else if(v_type.equals("CU")){
                     out.print("��ڿ���");
                 }else{
                     out.print("����������");
                 }
%>
                 <input type = "hidden" name = "pp_type" value="<%=v_type%>">
            </td>
            <td class="table_02_2"><font class="text_color04"><%=v_scsubjnm%></font></td>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td class="table_02_1"><a href="javascript:select('<%=v_seq%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')"><%=v_title%></a></td>
            <td class="table_02_1"><%=v_name%></td>
            <td class="table_02_1"><%=FormatDate.getFormatDate(v_indate,"yyyy/MM/dd")%></td>
            <td class="table_02_1">
              <%=v_repstatus%>
            </td>
          </tr>
<%
            }
            if (i == 0){
%>
          <tr>
            <td colspan='15' class="table_02_1">��� �� ������ �����ϴ�. </td>
          </tr>
<%
            }
        }
%>

</form>
        </table>

        <!----------------- total ���� ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageList(v_totalpage, v_pageno, row) %>
            </td>
          </tr>
        </table>
        <!----------------- total �� ----------------->

      </td>
  </tr>

</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
