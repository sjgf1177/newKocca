<%
//**********************************************************
//  1. ��      ��: �м� > �н��� ��κм�
//  2. ���α׷���:  za_Route_L.jsp
//  3. ��      ��: �н��ڰ�� �м�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_grcode        = box.getStringDefault("s_grcode","ALL");        //�����׷�
    String  v_subj          = box.getString("s_subjcourse");
    String  v_gyear         = box.getString("s_gyear");
    String  v_subjseq       = box.getString("s_subjseq");
    int     v_sulpapernum   = box.getInt("s_sulpapernum");
    String  v_action    = box.getString("p_action");
    int i = 0 ;
    
 // ����Ʈ �˻� ���� (09.12.10)
    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����

    //int     v_replycount    = box.getInt("p_replycount");

    int     v_replycnt      = 0;
    double  v_replyrate     = 0;


    String  s_gadmin = box.getSession("gadmin");

    String v_tab_color1 = "black";
    String v_tab_color2 = "black";
    String v_tab_color3 = "black";
    String v_tab_color4 = "blue";
    String v_tab_color5 = "black";
    DecimalFormat  df = new DecimalFormat("0.00");


    String v_comlcnt  = "";
    String v_ncomlcnt = "";
    int v_educnt_i = 0; //�����ο�
    int v_educnt_total = 0; //�����ο� ����
    int v_comlcnt_i = 0;    //�����ο�
    int v_comlcnt_total = 0;    //�����ο� ����
    int v_ncomlcnt_i = 0;   //�̼��� �ο�
    int v_ncomlcnt_total = 0;   //�̼����ο� ����
    double v_suryopercen = 0;   //������
    double v_suryopercen_total = 0; //������ ����
    double re1 = 0;

    // ���κ�
    ArrayList list1      = null;
    DataBox data1        = null;
    list1 = (ArrayList)request.getAttribute("ResultMemberList");

    // ������
    ArrayList studentlist = null;

    if ( v_action.equals("go") ) {
        ArrayList textlist = (ArrayList)request.getAttribute("ResultTextList");
    }
%>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �˻�
    function whenSelection(v_action) {
        if (v_action=="go"){
            top.ftop.setPam();
            if (chkParam() == false) {
                return;
            }
        }
        document.form1.p_action.value = v_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.analysis.InclinationAdminServlet';
        document.form1.p_process.value = 'routeList';
        document.form1.submit();
    }

    // ����
    function whenOrder(column) {
        if (document.form1.p_orderType.value == " asc") {
            document.form1.p_orderType.value = " desc";
        } else {
            document.form1.p_orderType.value = " asc";
        }

        document.form1.p_orderColumn.value = column;
        whenSelection("go");
    }

    // ���� ���
    function whenExcel() {
        if(document.form1.p_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
      }
        //window.self.name = "StudyTotalList";
        //open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        //document.form1.target = "openExcel";
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.analysis.InclinationAdminServlet';
        document.form1.p_process.value = 'routeListExcel';
        document.form1.submit();
    }

    // �Ķ���� üũ
    function chkParam() {
      if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
        alert("�����׷��� �����ϼ���.");
        return false;
      }
      if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grseq.value == '----') {
        alert("���������� �����ϼ���.");
        return false;
      }
/*
      if (document.form1.s_upperclass.value == 'ALL') {
        alert("�з��� �����ϼ���.");
        return false;
      }
*/
/*
      if (document.form1.s_subjcourse.value == 'ALL' || document.form1.s_subjcourse.value == '----') {
        alert("������ �����ϼ���.");
        return false;
      }
      if (document.form1.s_subjseq.value == 'ALL' || document.form1.s_subjseq.value == '----') {
        alert("������ �����ϼ���.");
        return false;
      }
*/
    }

// �ο������� �˾�
function open_detailList() {
    window.self.name = "JobRouteList";     //opener ��ü�� name �� �����Ѵ�
//  open_window("openJobDetailList","","100","0","800","600","1");
    farwindow = window.open("", "openJobRouteList", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 680, height = 567, top=0, left=0");
    document.form1.target = "openJobRouteList";
    document.form1.action = "/servlet/controller.analysis.InclinationAdminServlet";
    document.form1.p_process.value = "jobRouteList";
    document.form1.submit();
    document.form1.target = window.self.name;

}

//-->
</SCRIPT>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
  <form name="form1" method="post" action="/servlet/controller.analysis.InclinationAdminServlet">
    <input type="hidden" name="p_process"       value="">
    <input type="hidden" name="p_action"        value="<%=v_action%>">
    <input type="hidden" name="p_grcode"        value="<%=v_grcode%>">
    <input type="hidden" name="p_gyear"         value="<%=v_gyear%>">
    <input type="hidden" name="p_subj"          value="<%=v_subj%>">
    <input type="hidden" name="p_subjsel"       value="<%=v_subj%>">
    <input type="hidden" name="p_subjseq"       value="<%=v_subjseq%>">
    <input type="hidden" name="p_sulpapernum"   value="<%=v_sulpapernum%>">
    <input type="hidden" name="p_gubun"         value="">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
       <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/analysis/tit_analysis_stu2.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>



      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td height=25><script type="text/javascript">
                        var startup = 0;
                        function Main_s_subjseq(){
                            if (startup > 1)
                                changes_grseq(document.form1.s_grcode.value, document.form1.s_gyear.value);
                        }
                        function Main_subjcourse(){
                            if(startup > 1) 
                                changes_subjcourse(document.form1.s_grcode.value, document.form1.s_upperclass.value, document.form1.s_middleclass.value, document.form1.s_lowerclass.value, document.form1.s_grseq.value,'' );
                            startup++;
                        }
                        </script>
                        <font color="red">��</font> 
				                        �����׷� <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" "
				                        onChange="changes_gyear(this.value);" attr=" " selectedValue="<%= ss_grcode %>" isLoad="true" all="false" />
                        <font color="red">��</font> 
				                        ���� <kocca_select:select name="s_gyear" sqlNum="course.year"  param="<%= ss_grcode %>"
				                                onChange="changes_grseq(s_grcode.value, this.value);" afterScript="Main_subjcourse" attr=" " selectedValue="<%= ss_gyear %>" isLoad="true" all="false" />
                        <font color="red">��</font>                                         
                                                                �������� <kocca_select:select name="s_grseq" sqlNum="course.subjseq"
                                param="<%=ss_grcode%>" param2="<%=ss_gyear%>"
                                attr=" style='width:130px;'" onChange="Main_subjcourse();" afterScript="" selectedValue="<%= ss_grseq %>" isLoad="true" all="true" />
                                                                ��з� <kocca_select:select name="s_upperclass" sqlNum="course.0002"  param=" "
                                onChange="changes_middleclass(this.value);Main_subjcourse();" attr=" "  selectedValue="<%= ss_upperclass %>" isLoad="true" all="true" />
                                                                �ߺз� <kocca_select:select name="s_middleclass" sqlNum="course.0003"  param="<%= ss_upperclass %>"
                                onChange="changes_lowerclass(s_upperclass.value, this.value);Main_subjcourse();" attr=" " selectedValue="<%= ss_middleclass %>" isLoad="true" all="true" />
                                                                �Һз� <kocca_select:select name="s_lowerclass" sqlNum="course.0004"  param="<%= ss_upperclass %>"  param2="<%= ss_middleclass %>"
                                onChange="Main_subjcourse();" attr=" " selectedValue="<%= ss_lowerclass %>" isLoad="true" all="true" />
                       </td>
                     </tr>
                     <tr>
                       <td height=25>
                       <font color="red">��</font> 
                                                            ���� <kocca_select:select name="s_subjcourse" sqlNum="subjlist1|subjlist2|subjlist3|subjlist4|subjlist5|subjlist6|subjlist7|subjlist8|subjlist9"
                                        param="<%=ss_grcode%>"param4="<%=ss_upperclass%>"param5="<%=ss_middleclass%>"param6="<%=ss_lowerclass%>"
                                        param7="<%=ss_grseq%>" param9=""
                                        onChange="changes_subjseq(s_grcode.value, s_grseq.value, s_subjcourse.value, s_gyear.value)" attr=" " selectedValue="<%= ss_subjcourse %>" isLoad="true" all='<%= box.getSession("isSubjAll") %>' />
                      <font color="red">��</font>                                 
                                                             ���� <kocca_select:select name="s_subjseq" sqlNum="subjectSeq1|subjectSeq2|subjectSeq3|subjectSeq4"
                                        param="<%=ss_grcode%>" param2="<%=ss_grseq %>" param3="<%=ss_subjcourse%>" param4="<%=ss_gyear%>"
                                        onChange="" attr=" " selectedValue="<%= ss_subjseq %>" isLoad="true" all="true" />
                      <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                      </td>
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
      <!----------------- form �� ----------------->

      <br>
      <br>

      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <!--td align="right" width="65">
            <a href="javascript:whenAllSelect()"><img src="/images/admin/button/select1_butt.gif"  border="0"></a>
            </td>
            <td width=4></td>
            <td align="right" width="65">
            <a href="javascript:whenAllSelectCancel()"><img src="/images/admin/button/select_cancel1_butt.gif"  border="0"></a>
            </td>
            <td width=4></td-->
            <td align="right" height="20">&nbsp;
            <!--a href="javascript:whenFormMail()"><img src="/images/admin/button/btn_dogmail.gif"  border="0"></a-->
            </td>
            <td width="4"></td>
            <td align="right" width="65">
            </td>
            <td width=4></td>
            <td align="right" width="65">
            </td>
            <td width=4></td>
            <td align="right" width="200">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
            </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->

      <!----------------- ������ �н���Ȳ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="23" class="table_top_line"></td>
        </tr>
        <tr>
          <td  class="table_title" width="5%" >N0</td>
          <td  class="table_title">���԰��</td>
          <td  class="table_title">�����ο�</td>
          <td  class="table_title">�����ο�</td>
          <td  class="table_title">�̼����ο�</td>
          <td  class="table_title">������</td>
        </tr>

<%  ArrayList    list     = (ArrayList)request.getAttribute("SulmunResultList");
    ArrayList    textlist = (ArrayList)request.getAttribute("ResultTextList");

        String v_answers  = "";
        String v_seltext  = "";
        int v_suryo     = 0;
        int v_nosuryo       = 0;
        int v_total     = 0;

if( list.size() != 0 ){

   int suryo          =0;
   int nosuryo        =0;
   int total          =0;
   double suryopercen =0;

/*select seltext, selnum from tz_sulsel where subj='REGIST' and grcode = 'N000001' and sulnum = '1' */
    for ( i=0; i < textlist.size(); i++) {
        DataBox t_dbox = (DataBox)textlist.get(i);

        String t_seltext = t_dbox.getString("d_seltext");
        String t_selnum  = t_dbox.getString("d_selnum");

        suryo = 0;    nosuryo = 0;    total = 0;      suryopercen = 0;

            for (int j=0; j < list.size(); j++) {
                DataBox dbox = (DataBox)list.get(j);

                 v_answers = dbox.getString("d_answers");
                 v_seltext = dbox.getString("d_seltext");
                 v_suryo   = dbox.getInt("d_comlcnt");
                 v_nosuryo = dbox.getInt("d_ncomlcnt");
                 v_total   = v_suryo+ v_nosuryo;

                 v_suryopercen = ((v_total - v_nosuryo) /(double)v_total) * 100;

                if( t_selnum.equals(v_answers) ){

                  suryo       = v_suryo;
                  nosuryo     = v_nosuryo;
                  total       = v_suryo + v_nosuryo;
                  suryopercen = v_suryopercen;
%>

<%              }
            }
%>

                    <tr>
                      <td width="7%" class="table_01"><%=i+1%></td>
                      <td width="35%" style="padding-left=6" class="table_02_2"><%=t_seltext%></td>
                      <td width="11%" class="table_02_1"><a href="javascript:open_detailList()"><%=total%>��</td>
                      <td width="11%" class="table_02_1"><%=suryo%>��</td>
                      <td width="11%" class="table_02_1"><%=nosuryo%>��</td>
                      <td width="11%" class="table_02_1"><%=suryopercen%>%</td>
                    </tr>

<%  }
}
%>

<%if( list.size() == 0 ){%>
                    <tr class="table_01" height="35">
                        <td colspan="6"> ��κм��� ���� �򰡰� �����ϴ�. </td>
                    </tr>
<%}
%>
</table>
      <!----------------- ������ �н���Ȳ �� ----------------->
     <br>
    </td>
  </tr>


  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>

</table>
</form>
