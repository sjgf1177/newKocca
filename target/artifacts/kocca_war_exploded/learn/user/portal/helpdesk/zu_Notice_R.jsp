<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%  
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt   ("p_pageno");
    String  v_userid     = box.getSession("userid");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_tabseq   = box.getInt("p_tabseq");
    int v_seq      = box.getInt("p_seq");

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



    DataBox dbox = (DataBox)request.getAttribute("selectNotice");

    if (dbox != null) {
        v_gubun     = dbox.getString("d_gubun");
        v_startdate = dbox.getString("d_startdate");
        v_enddate   = dbox.getString("d_enddate");
        v_adtitle   = dbox.getString("d_adtitle");
        v_adcontent = dbox.getString("d_adcontent");
        v_addate    = dbox.getString("d_addate");
        v_adname    = dbox.getString("d_adname");
        v_luserid   = dbox.getString("d_luserid");
        v_cnt       = dbox.getInt("d_cnt");
        v_loginyn   = dbox.getString("d_loginyn");
        v_useyn     = dbox.getString("d_useyn");
        v_grcodecd  = dbox.getString("d_grcodecd");
        v_popwidth  = dbox.getInt("d_popwidth");
        v_popheight = dbox.getInt("d_popheight");
        v_popxpos   = dbox.getInt("d_popxpos");
        v_popypos   = dbox.getInt("d_popypos");
        v_popup     = dbox.getString("d_popup");
        v_uselist   = dbox.getString("d_uselist");
        v_useframe  = dbox.getString("d_useframe");

        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");

     }

    if (v_gubun.equals("Y")) v_gubun_view = "��ü";
    else if (v_gubun.equals("N")) v_gubun_view = "�Ϲ�";
    else if (v_gubun.equals("P")) v_gubun_view = "�˾�";

    if (v_uselist.equals("")) v_uselist = "N";
    if (v_useframe.equals("")) v_useframe = "N";

    if(v_loginyn.equals("Y")) v_loginyn = "�α�����";
    else if(v_loginyn.equals("N")) v_loginyn = "�α�����";
    else v_loginyn = "��ü";

    if(v_useyn.equals("Y")) v_useyn = "���";
    else if(v_useyn.equals("N")) v_useyn = "������";


%>

<%@ include file="/learn/user/portal/include/top.jsp"%>


<!-- ��ũ��Ʈ���� -->
<SCRIPT LANGUAGE="JavaScript">
	//rsg20171110
	function copyUrl( seq ){
		var url = '<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()%>/servlet/controller.homepage.HomeNoticeServlet?menuid=07&target=_self&p_process=selectView&p_seq='+seq;
		var IE=(document.all)?true:false;

		//if (IE) {
			//if ( window.clipboardData.setData('Text', url )) 
			//	alert('�����Ͻ� �Խù��� �����ּ�(URL)�� Ŭ�����忡 ����Ǿ����ϴ�.\n\Ctrl+V �Ǵ� �ٿ��ֱ�� ');
		//} else {
			prompt("Ctrl+C�� ���� Ŭ������� �����ϼ���", url);
		//}
	}
    function listnotice(){
    	document.nform2.p_process.value = "List";
        document.nform2.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform2.submit();
    }

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="nform2" method="post">
<input type = "hidden" name = "p_process" >
<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
<input type = "hidden" name = "p_search" value = "<%=v_search %>">

	
	<%if( box.getSession("tem_grcode").equals("N000001")) { %>
	
	<table>
		<tr>
			<td>
	
		 <!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/support/stitle_02.gif" alt="��������" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>��������</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="4" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td width="12%" class="tit_table">����</td>
        <td colspan="3" class="ct_tit_table_lright"><strong><%=v_adtitle%></strong></td>
      </tr>
      <tr>
        <td class="tit_table">�ۼ�����</td>
        <td class="ct_tit_table_left"><%=v_addate%></td>
        <td width="8%" class="tit_table">��ȸ</td>
        <td class="ct_tit_table_right"><%=v_cnt%></td>
      </tr>
      <tr>
        <td colspan="4" class="ct_tit_table_lright"><%=v_adcontent%></td>
      </tr>
      <%
      Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
      Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
      String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
      %>     
      <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
      <tr>
        <td height="1" colspan="4" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="4" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="h_road"><a href="javascript:listnotice()"><img src="/images/portal/homepage_renewal/myclass/btn_list.jpg" alt="���" width="46" height="25" /></a></td>
      </tr>
    </table>    
    <!--Ÿ��Ʋ�κ�//-->    
    </td>
    <td width="20">&nbsp;</td>        
  </tr>
</table>



	
	<%}else{ %>

            <h2><img src="/images/portal/studying/h2_tit1.gif" alt="��������" class="fl_l" /><p class="category">Home > �н��������� > <strong>��������</strong></p></h2>
 
            <p class="boardimg"><img src="/images/portal/studying/studying_notice_txt.gif" alt="�н��������Ϳ� ���Ű��� ȯ���մϴ�.��������������� �˷��帮�� ���ҽİ� �̺�Ʈ�� Ȯ���Ͻ� �� �ֽ��ϴ�." /></p>
            
            <table border="0px" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="padding-bottom:20px;">
                    <table class="board_view mg_t30">
                        <tr>
                            <th width="55px">����</th>
                            <td colspan="3" style="font-weight:bold;"><%=v_adtitle %></td>
                        </tr>
                        <tr class="bo">
                            <th >�ۼ�����</th>
                            <td style="padding:6px 0 5px 20px; font-size:11px; font-family:Tahoma;"> <%=v_addate%></td>
                            <th >��ȸ</th>
                            <td style="font-size:11px !important;"><%=v_cnt%></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><%=v_adcontent%></td>
            </tr>
            </table>
            
            <!-- ����÷�� ���� -->
            <%
                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
            <!-- ����÷�� ����-->
 
            <p class="board_btn">
            	<a href="javascript:listnotice()" class="board_blue"><span>���</span></a>
            	<a href="javascript:copyUrl('<%= v_seq %>')" class="board_blue"><span>��ũ����</span></a>
           	</p>
        </div>
    </div>
    <%} %>
 
</form>
<!-- form �� -->


<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->

