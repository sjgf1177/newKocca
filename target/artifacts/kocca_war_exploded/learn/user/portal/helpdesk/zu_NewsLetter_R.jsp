<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
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
    String  v_search     = box.getString("p_select");

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

    DataBox dbox = (DataBox)request.getAttribute("selectNotice");

    if (dbox != null) {
        v_gubun     = dbox.getString("d_gubun");
        v_startdate = dbox.getString("d_startdate");
        v_enddate   = dbox.getString("d_enddate");
        v_adtitle   = dbox.getString("d_adtitle");
        v_adcontent = dbox.getString("d_adcontent");
        v_addate    = dbox.getString("d_addate");
        v_adname    = dbox.getString("d_adname");
		v_luserid	= dbox.getString("d_luserid");
        v_cnt       = dbox.getInt("d_cnt");
		v_loginyn   = dbox.getString("d_loginyn");
		v_useyn   	= dbox.getString("d_useyn");
		v_grcodecd	= dbox.getString("d_grcodecd");
		v_popwidth	= dbox.getInt("d_popwidth");
		v_popheight = dbox.getInt("d_popheight");
		v_popxpos   = dbox.getInt("d_popxpos");
		v_popypos   = dbox.getInt("d_popypos");
		v_popup     = dbox.getString("d_popup");
		v_upfile    = dbox.getString("d_upfile");
		//v_realfile  = dbox.getString("d_realfile");
		v_uselist   = dbox.getString("d_uselist");
		v_useframe  = dbox.getString("d_useframe");

        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");
        //v_adcontent  = StringManager.replace(data.getAdcontent(),"\n","<br>");


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
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->

<SCRIPT LANGUAGE="JavaScript">

	function listnotice(){
		document.nform2.action = "/servlet/controller.homepage.HomeLetterServlet";
		document.nform2.p_process.value = "List";
        document.nform2.submit();
	}

</SCRIPT>

<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform2" method="post">
<input type = "hidden" name = "p_pageno"        value = "<%=v_pageno %>" >
<input type = "hidden" name = "p_select"        value = "<%=v_search%>">
<input type = "hidden" name = "p_searchtext"    value = "<%=v_searchtext%>">
<input type = "hidden" name = "p_process"       value = "">

            <h2><img src="/images/portal/studying/h2_tit7.gif" alt="��������" class="fl_l" /><p class="category">Home > �н��������� > <strong>��������</strong></p></h2>

            <p><img src="/images/portal/studying/news_borimg.gif" alt="������ ��������� �̸��Ϸ� ���ص帮�� ���������Դϴ�. �������ͼ��Ÿ� ���Ͻø� �����������濡�� �̸��� ���ſ� �������ּ���." /></p>

            <table class="board_view mg_t30">
            <!--[if ie]><colgroup><col width="55px" /><col width="400px" /><col width="25px" /><col width="100px" /></colgroup><![endif]-->
            <colgroup><col width="75px" /><col width="400px" /><col width="45px" /><col width="100px" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="3" class="tit"><%=v_adtitle%></td>
            </tr>
            <tr class="bo">
                <th>�ۼ�����</th>
                <td class="num"><%=v_addate%></td>
                <th>��ȸ</th>
                <td class="fs_s"><%=v_cnt%></td>
            </tr>
            <tr>
                <td colspan="4" class="con">
                <div class="imgtxt">
                    <%=v_adcontent%>
                </div>
                </td>
            </tr>
            <!--tr>
                <td colspan="4" class="con">
                <div class="img">
                    <img src="/images/portal/thumb/newsletter_b.jpg" />
                </div>
                </td>
            </tr-->
            </table>

            <p class="board_btn"><a href="javascript:listnotice();" class="board_blue"><span>���</span></a></p>
            
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->