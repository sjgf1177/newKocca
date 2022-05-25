<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷��� : gu_KnowBoard_L.jsp
//  3. ��      ��: ���İ��� �ֱ����� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.03
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","05");
    String v_process= box.getString("p_process");
    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0) v_pageno = 1;
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_select      = box.getString("p_select");

    int v_seq = 0, v_readcnt = 0,  i = 0,  v_cnt = 0;
    String  v_inuserid    = "", v_position = "", v_indate = "", v_title = "", tLink = "",  v_types = "" ,v_name="";
    String  v_categorycd     = box.getString("p_categorycd");
    String s_userid          = box.getSession("userid");
    String s_usernm          = box.getSession("name");
    String v_classname1      = "";
    String v_classname2      = "";

    ArrayList list = (ArrayList)request.getAttribute("selectLastList");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topMystudy.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--
//�Է��������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "InsertPage";
    //document.form1.p_pageno.value = "<%= v_pageno %>";
    document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
    document.form1.submit();
}


//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList(tab) {
    if (form1.p_searchtext.value == ""){
        alert("�˻� �� ������ �Է��� �ּ���");
    }else{
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "MyQnaListPage";
    document.form1.p_pageno.value = "1";
    document.form1.submit();
    showTab(tab);
    }
}

//������ �̵�
//function goPage(pageNum, tab) {
//  document.form1.p_pageno.value = pageNum;
//  document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
//  document.form1.p_process.value = "MyQnaListPage";
//  document.form1.submit();
//  g_showTab(tab, 2);
//}


//������ �̵�
function goPage(pageNum) {

    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.submit();

}


// Tab ���ý� ����
function showTab(clickTab)
{
   //alert(clickTab);
    g_showTab(clickTab, 2);
}

function g_showTab(tabNo, count)
{

    var clickTabNo = new Number(tabNo);
    var tabCount   = new Number(count);

    if( clickTabNo == 0 || tabCount == 0 ) return;

    for(i=1; i<=tabCount; i++)
    {
        div = document.all["tab_"+i];

        if(!div) return;

        if( clickTabNo == i ) {
            // Ȱ��ȭ�� tab Ŭ���� return
            if(div.style.display == "") return;
            div.style.display = ""
        }
        else {
            // ���õ��� �ʴ� �ǵ��� ������ ����.
            if(div.style.display != "none") {
                div.style.display = "none";
            }
        }
    }
}
//-->
</script>

          <!-- �Խ��� ���� -->
          <form name = "form1" method = "post">
          <input type = "hidden" name = "p_process"     value = "<%=v_process%>">
          <input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
          <input type = "hidden" name = "p_seq"         value = "">
          <input type = "hidden" name = "p_userid"      value = "">
          <input type = "hidden" name = "p_upfilecnt"   value = "">
          <input type = "hidden" name = "p_types"       value = "">
          <input type = "hidden" name = "p_categorycd"  value = "<%=v_categorycd%>">

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="720" height="35" align="right"  background="/images/user/game/mystudy/<%=tem_subimgpath%>/tit_joint.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> HOME > ���� ���ι� > ���İ����Խ���</td>
  </tr>
  <tr>
    <td height="20">
      <!-- page sub -->
    </td>
  </tr>
</table>
<!-- ������ȸ -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="720"><img src="/images/user/game/mystudy/st_su_edu.gif" width="58" height="16"></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="4" height="27" valign="top" background="/images/user/game/mystudy/ba_bg02.gif"><img src="/images/user/game/mystudy/ba_f.gif"></td>
    <td width="712" align="center" valign="bottom" background="/images/user/game/mystudy/ba_bg02.gif">
      <table width="710" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="38" align="center"  ><img src="/images/user/game/mystudy/text_t_num02.gif"></td>
          <td width="1" valign="bottom"  ><img src="/images/user/game/mystudy/vline.gif"></td>
          <td width="75" align="center"  ><img src="/images/user/game/mystudy/text_t_bun.gif"></td>
          <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
          <td width="350" align="center" ><img src="/images/user/game/mystudy/text_t_subject.gif"></td>
          <td width="1" valign="bottom"  ><img src="/images/user/game/mystudy/vline.gif"></td>
          <td width="77" align="center"  ><img src="/images/user/game/mystudy/text_t_writer.gif"></td>
          <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
          <td width="80" align="center"  ><img src="/images/user/game/mystudy/text_t_openday.gif"></td>
          <td width="1" valign="bottom"  ><img src="/images/user/game/mystudy/vline.gif"></td>
          <td width="49" align="center"  ><img src="/images/user/game/mystudy/text_add_file.gif"></td>
          <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
          <td width="35" align="center"  ><img src="/images/user/game/mystudy/text_t_view.gif"></td>
        </tr>
      </table></td>
    <td width="4" align="right" valign="top" background="/images/user/game/mystudy/ba_bg02.gif"><img src="/images/user/game/mystudy/ba_tail.gif" ></td>
  </tr>
  <tr>
    <td height="5" colspan="3"></td>
  </tr>
  <tr class="linecolor_board3">
    <td height="1" colspan="3"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10" colspan="7"></td>
  </tr>

<%
        if(list.size() != 0){
            for(i = 0; i < list.size(); i++) {
                   DataBox dbox = (DataBox)list.get(i);
                   v_dispnum    = dbox.getInt   ("d_dispnum");
                   v_inuserid   = dbox.getString("d_inuserid");
                   v_name       = dbox.getString("d_name");
                   v_cnt        = dbox.getInt   ("d_cnt");
                   v_indate     = dbox.getString("d_indate");
                   v_title      = dbox.getString("d_title");
                   v_seq        = dbox.getInt   ("d_seq");
                   v_types      = dbox.getString("d_types");
                   v_readcnt    = dbox.getInt   ("d_readcnt");
                   v_upfilecnt  = dbox.getInt   ("d_filecnt");
                   v_totalpage  = dbox.getInt   ("d_totalpage");
                   v_rowcount   = dbox.getInt   ("d_rowcount");

                    // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
                    if (!v_searchtext.equals("")&&v_select.equals("title")) {
                        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                    } else if(!v_searchtext.equals("")&&v_select.equals("name")){
                        v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                    }

%>

  <tr>
    <td width="43" class="tbl_grc"><%=v_dispnum%></td>
    <td width="77" class="tbl_grc"><%=dbox.getString("d_categorynm")%></td>
    <td width="351" class="tbl_bleft">
        <%if (Integer.parseInt(v_types) > 0) {%>
            &nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/user/game/button/btn_re.gif" border="0">
        <% } %>
        <a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_inuserid%>','<%=v_types%>')"><%=v_title%></a>

        <%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
            <IMG src="/images/user/game/button/btn_new.gif" border="0">
        <% } %>
    </td>
    <td width="78" class="tbl_grc"><%=v_name%></td>
    <td width="81" class="tbl_grc"><%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%></td>
    <td width="49" class="tbl_grc"><% if( v_upfilecnt>0){ %>
        <img src="/images/user/game/mystudy/i_add.gif" width="13" height="13">
        <%}else{%>
        <%}%>
    </td>
    <td width="41" class="tbl_grc"><%=v_cnt%></td>
  </tr>

  <%}%>
<%}else{%>

    <tr>
      <td colspan="7" align=center valign=top>��ϵ� ������ �����ϴ�. </td>
    </tr>
<%}%>

  <tr>
    <td height="1" colspan="7" class="linecolor_board4"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="2" class="lcolor"></td>
  </tr>
  <tr>
    <td height="2" class="linecolor_board3"></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
  <tr>
    <td align="center" valign="bottom">

    <table width="720" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="650" align="center">
              <table width="540" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>
                    <%=PageUtil.printPageListGame(v_totalpage, v_pageno, row) %>
                    </td>
                  </tr>
                </table>
            </td>
            <td width="70"><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=InsertPage"><img src="/images/user/game/button/btn_edu_input.gif" ></td>
        </tr>
      </table>
      <!-- page -->
    </td>
  </tr>
  <tr>
    <td height="5" ></td>
  </tr>
  <tr>
    <td height="2"class="linecolor_board3"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10" colspan="5">&nbsp;</td>
  </tr>
  <tr>
    <td width="238">&nbsp;</td>
    <td width="90"> <div align="center">
        <select name="p_select" class="input2">
          <option value="title"  >:: �� �� </option>
          <option value="content">:: �� �� </option>
          <option value="name"   >:: �� �� </option>
        </select>
      </div></td>
    <td width="105"> <div align="left">
        <input name="p_searchtext" type="text" class="input2" size="15" maxlength="30">
      </div></td>
    <td width="48"><a href="javascript:selectList()"><img src="/images/user/game/button/btn_j.gif" width="48" height="21"></td>
    <td width="273">&nbsp;</td>
  </tr>
</table>

</form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->

