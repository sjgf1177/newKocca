<%
//**********************************************************
//  1. ��      ��: �������� �Խ���
//  2. ���α׷��� : gu_Notice_L.jsp
//  3. ��      ��: �������� �Խ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    ArrayList list1 = null;

    int     v_tabseq   = box.getInt("p_tabseq");
    int     v_seq      = box.getInt("p_seq");
    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate   = "";           // �˾�����������
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_luserid   = "";
    String v_gubun_view = "";
    String v_loginyn    = "";           // �α�������
    String v_useyn      = "";           // �������
    String v_grcodecd   = "";           // ��� �����׷�
    int v_popwidth   = 0;               // �˾�����
    int v_popheight  = 0;               // �˾�����
    int v_popxpos    = 0;               // �˾�x��ġ
    int v_popypos    = 0;               // �˾�y��ġ

    String v_popup   = "";               // �˾�����
    String v_uselist = "";               // ����Ʈ���
    String v_useframe= "";               // �����ӻ��

    String v_upfile    ="";
    //String v_realfile  ="";

    Vector v_realfileVector = null;
    Vector v_savefileVector = null;
    Vector v_fileseqVector  = null;

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
    int v_upfilecnt = 0;
    int v_pageno    = box.getInt("p_pageno");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    ArrayList list2 = (ArrayList)request.getAttribute("selectNoticeList");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topCommon.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
    //����Ʈ ��ȸ
    function select() {
        document.nform1.action = "/servlet/controller.homepage.KHomeNoticeServlet";
        document.nform1.p_process.value= "List";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {
        document.nform1.action = "/servlet/controller.homepage.KHomeNoticeServlet";
        document.nform1.p_process.value= "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

    //������ �̵�
    function goPage(pageNum) {
        document.nform1.action = "/servlet/controller.homepage.KHomeNoticeServlet";
        document.nform1.p_process.value= "List";
        document.nform1.p_pageno.value= pageNum;
        document.nform1.submit();
    }

//-->
</SCRIPT>

<form name="nform1" method="post">
    <input type="hidden" name="p_process">
    <input type="hidden" name="p_seq">
    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">

<!-- title -->

        <table width="680" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  class="location" > HOME > ��������</td>
          </tr>
        </table>
        <table width="680" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/images/user/kocca/common/type1/tit_notice.gif"></td>
          </tr>
          <tr>
            <td height="20"></td>
          </tr>
        </table>
        <table width="680" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="88" rowspan="3"><img src="/images/user/kocca/common/i_notice.gif"></td>
            <td width="592" height="10"></td>
          </tr>
          <tr>
            <td height="11"><img src="/images/user/kocca/common/text_botice.gif"></td>
          </tr>
          <tr>
            <td height="12"></td>
          </tr>
          <tr >
            <td height="1" colspan="2" background="/images/user/kocca/common/dot_bg_9.gif"></td>
          </tr>
          <tr >
            <td height="7" colspan="2" ></td>
          </tr>
        </table>
        <table width="680" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="7"></td>
          </tr>
          <tr>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td>&nbsp;</td>
                  <td width="10">
                    <select name="p_search" class="input2">
                        <option value="ALL"       <%if("ALL".equals(v_search)) out.print(" selected");%>>::��ü</option>
                        <option value="adtitle"   <%if("adtitle".equals(v_search)) out.print(" selected");%>>����</option>
                        <option value="adcontent" <%if("adcontent".equals(v_search)) out.print(" selected");%>>����</option>
                    </select></td>
                  <td width="6">&nbsp;</td>
                  <td width="135"><input name="p_searchtext" type="text" class="input4" value="<%=v_searchtext%>">
                  </td>
                  <td width="4"><div align="right"></div></td>
                  <td width="37"><a href="javascript:select()"><img src="/images/user/kocca/button/btn_search.gif"  border="0"></a></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="8"></td>
          </tr>
        </table>
        <!--�Խ��Ǹ�� -->
        <table width="680" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5"><img src="/images/user/kocca/common/bar_fir.gif" width="5" height="33"></td>
            <td width="669" class="tbl_bgcolor_notice"><table width="669" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="30" class="tbl_grc"><img src="/images/user/kocca/common/text_no.gif" width="14" height="10"></td>
                  <td width="351" class="tbl_grc"><img src="/images/user/kocca/common/text_subject.gif" width="20" height="12"></td>
                  <td width="75" class="tbl_grc"><img src="/images/user/kocca/common/text_writer.gif" width="32" height="12"></td>
                  <td width="60" class="tbl_grc"><img src="/images/user/kocca/common/text_search.gif" width="20" height="12"></td>
                  <td width="60" class="tbl_grc"><img src="/images/user/kocca/common/st_add.gif" width="20" height="12"></td>
                  <td width="93" class="tbl_grc"><img src="/images/user/kocca/common/text_writedau.gif" width="31" height="12"></td>
                </tr>
              </table></td>
            <td width="6"><img src="/images/user/kocca/common/bar_tail.gif" width="6" height="33"></td>
          </tr>
          <tr>
            <td height="3" colspan="3"></td>
          </tr>
          <tr>
            <td height="1" colspan="3" class="tbl_bgcolor_notice"></td>
          </tr>
        </table>

        <table width="680" border="0" cellspacing="0" cellpadding="0">

<%
String  v_addate1 = "";
int i = 0;
for(i = 0; i < list2.size(); i++) {

    DataBox dbox = (DataBox)list2.get(i);
    v_seq      = dbox.getInt("d_seq");
    v_cnt      = dbox.getInt("d_cnt");
    v_adtitle  = dbox.getString("d_adtitle");
    v_addate   = dbox.getString("d_addate");
    v_adname   = dbox.getString("d_adname");
    v_upfilecnt = dbox.getInt("d_filecnt");
    v_addate1   = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
    v_dispnum   = dbox.getInt("d_dispnum");
    v_totalpage = dbox.getInt("d_totalpage");
    v_rowcount  = dbox.getInt("d_rowcount");

    System.out.println("jsp v_upfilecnt : "+v_upfilecnt);

    if (!v_searchtext.equals("")&&v_search.equals("adtitle")) {
        v_adtitle = StringManager.replace(v_adtitle, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
    }
    else if(!v_searchtext.equals("")&&v_search.equals("adname")){
        v_adname = StringManager.replace(v_adname, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
    }
    else if(!v_searchtext.equals("")&&v_search.equals("ALL")){
        v_adname = StringManager.replace(v_adname, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
        v_adtitle = StringManager.replace(v_adtitle, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
    }
%>
          <tr>
            <td width="35" class="tbl_grc"><%=v_dispnum%></td>
            <td width="351" class="tbl_gleft"><a href="javascript:selectView(<%=v_seq%>)"><%=v_adtitle%></a><%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_addate, "yyyyMMdd"))){%>&nbsp;<img src="/images/user/kocca/common/ico_new.gif" width="22" height="11"><%}%>
              <!--img src="/images/user/kocca/common/ico_new.gif" width="22" height="11"--></td>
            <td width="75" class="tbl_grc"><%=v_adname%></td>
            <td width="60" class="tbl_grc"><%=v_cnt%></td>
            <td width="60" class="tbl_grc"><%if(v_upfilecnt>0){%><img src="/images/user/kocca/common/ico_add.gif" width="13" height="13" ><%} else {%>-<%}%></td>
            <td width="99" class="tbl_grc"><%=FormatDate.getFormatDate(v_addate,"yyyy-MM-dd")%></td>
          </tr>
<%}%>
          <tr>
            <td height="1" colspan="6" class="linecolor_main01"></td>
          </tr>
        </table>
        <table width="680" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="tbl_bgcolor_notice" height="3"></td>
          </tr>
          <tr>
            <td height="27" class="linecolor_notice">
            <!-- ������ -->
                <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                    <%= PageUtil.printPageListKocca(v_totalpage, v_pageno, 10) %>
                    </td>
                  </tr>
                </table>
            </td>
          </tr>
          <tr>
            <td height="1" class="linecolor_main01"></td>
          </tr>
        </table>

</form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->