<%
//**********************************************************
//  1. ��      ��: ���� > �������� �Խ���
//  2. ���α׷��� : gu_Letter_L.jsp
//  3. ��      ��: ���� > �������� �Խ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.13
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
	box.put("leftmenu","00");                       // �޴� ���̵� ����

	ArrayList list1 = null;
	ArrayList list2 = null;

    int		v_tabseq   = box.getInt("p_tabseq");
    int		v_seq      = box.getInt("p_seq");     
    String  v_process  = box.getString("p_process");

	// �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_select");

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
    String v_loginyn    = "";			// �α�������
    String v_useyn   	= "";			// �������
    String v_grcodecd   = "";           // ��� �����׷�
	int v_popwidth	 = 0;               // �˾�����
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
	int v_rowcount	= 0;
    int v_upfilecnt = 0;
    int v_pageno    = box.getInt("p_pageno");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    list2 = (ArrayList)request.getAttribute("selectLetterList");
   
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topHelpdesk.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
    //����Ʈ ��ȸ
    function select() {
        document.nform1.action = "/servlet/controller.homepage.HomeLetterServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

	//�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.HomeLetterServlet";
		document.nform1.p_process.value = "selectView";
		document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

//-->
</SCRIPT>

<form name="nform1" method="post">
	<input type = "hidden" name = "p_process">
	<input type = "hidden" name = "p_seq"	 >

<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/service/<%=tem_subimgpath%>/tit_letter.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ���� > ��������</td>
  </tr>
  <tr> 
    <td height="20">
      <!-- page sub -->
    </td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td><table border="0" align="right" cellpadding="0" cellspacing="0" align="center">
        <tr> 
          <td width="62">
			<select name="p_select" class="input">
			  <option value="adtitle"   <%if("adtitle".equals(v_search)) out.print(" selected");%>>::����</option>
              <option value="adcontent" <%if("adcontent".equals(v_search)) out.print(" selected");%>>����</option>
              <option value="adname"	<%if("ALL".equals(v_search)) out.print(" selected");%>>�ۼ���</option>
            </select></td>
          <td width="135"> 
            <input name="p_searchtext" type="text" class="input"> 
          </td>
          <td width="48"><a href="javascript:select()"><img src="/images/user/game/button/btn_seatch.gif" width="48" height="21"></td>
        </tr>
      </table>
      <div align="right"></div></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="4" height="27" valign="top" background="/images/user/game/mystudy/ba_bg02.gif"><img src="/images/user/game/service/ba_f.gif" width="3" height="27"></td>
    <td width="712" align="center" valign="bottom" background="/images/user/game/service/ba_bg.gif"> 
      <table width="710" height="23" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr> 
          <td width="40" align="center"  ><img src="/images/user/game/service/text_num.gif" width="12" height="10"></td>
          <td width="1" valign="bottom"  ><img src="/images/user/game/service/vline.gif" width="1" height="8"></td>
          <td width="358" align="center"  ><img src="/images/user/game/service/text_subject.gif" width="19" height="11"></td>
          <td width="1" valign="bottom" ><img src="/images/user/game/service/vline.gif" width="1" height="8"></td>
          <td width="92" align="center" ><img src="/images/user/game/service/text_wirter.gif" width="30" height="11"></td>
          <td width="1" valign="bottom"  ><img src="/images/user/game/service/vline.gif" width="1" height="8"></td>
          <td width="64" align="center"  ><img src="/images/user/game/service/text_search.gif" width="18" height="11"></td>
          <td width="1" valign="bottom" ><img src="/images/user/game/service/vline.gif" width="1" height="8"></td>
          <td width="65" align="center"  ><img src="/images/user/game/service/text_add.gif" width="19" height="11"></td>
          <td width="1" align="center" valign="bottom"  ><img src="/images/user/game/service/vline.gif" width="1" height="8"></td>
          <td width="91" align="center"  ><img src="/images/user/game/service/text_write_day.gif" width="28" height="11"></td>
        </tr>
      </table></td>
    <td width="4" align="right" valign="top" background="/images/user/game/mystudy/ba_bg02.gif"><img src="/images/user/game/service/ba_tail.gif" width="3" height="27" ></td>
  </tr>
  <tr> 
    <td height="5" colspan="3"></td>
  </tr>
  <tr > 
    <td height="1" colspan="3" class="linecolor_ser3"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="3">&nbsp;</td>
    <td><table width="714" border="0" cellspacing="0" cellpadding="0" align="center">
<%

if(list2.size() != 0){
  for( int i = 0; i < list2.size(); i++) {

	DataBox dbox = (DataBox)list2.get(i);
	v_seq      = dbox.getInt("d_seq");
	v_cnt      = dbox.getInt("d_cnt");
	v_adtitle  = dbox.getString("d_adtitle");
	v_addate   = dbox.getString("d_addate");
	v_adname   = dbox.getString("d_adname");
	v_upfilecnt = dbox.getInt("d_filecnt");
	v_dispnum   = dbox.getInt("d_dispnum");
    v_totalpage = dbox.getInt("d_totalpage");
    v_rowcount  = dbox.getInt("d_rowcount");
	
	if (!v_searchtext.equals("")&&v_search.equals("adtitle")) {
		v_adtitle = StringManager.replace(v_adtitle, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
	} 
	else if(!v_searchtext.equals("")&&v_search.equals("adname")){
		v_adname = StringManager.replace(v_adname, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
	}
%>
        <tr> 
          <td width="42" class="tbl_grc" ><%=v_dispnum%></td>
          <td name="p_seq" width="354" class="tbl_gleft" value="<%=v_seq%>"><a href="javascript:selectView(<%=v_seq%>)"><%=v_adtitle%></td>
          <td width="93" class="tbl_grc" ><%=v_adname%></td>
          <td width="65" class="tbl_grc" ><%=v_cnt%></td>
          <td width="64" class="tbl_grc" ><%if(v_upfilecnt>0){%><img src="/images/user/game/service/i_add.gif" width="13" height="13"><%} else {%>-<%}%></td>
          <td width="96" class="tbl_grc" ><%=FormatDate.getFormatDate(v_addate, "yyyy-MM-dd")%></td>
        </tr>
<%		}
	}else{%>

	  <tr> 
		<td class="board_text1" colspan ='5' align='center' height="25">��ϵ� ������ �����ϴ�.</td>
	  </tr>
<%  }   %>
        
      </table></td>
    <td width="3">&nbsp;</td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td height="2" class="lcolor"></td>
  </tr>
  <tr> 
    <td height="2" class="linecolor_ser4"></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td align="center" valign="bottom"> 
      <!-- page -->
	  <table width="540" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
			<td>
			<%= PageUtil.printPageListGame(v_totalpage, v_pageno, 10) %>
			</td>
		  </tr>
		</table>
	</td>
  </tr>
  <tr> 
    <td height="5" ></td>
  </tr>
  <tr> 
    <td height="2"class="linecolor_ser4"></td>
  </tr>
</table>

</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
