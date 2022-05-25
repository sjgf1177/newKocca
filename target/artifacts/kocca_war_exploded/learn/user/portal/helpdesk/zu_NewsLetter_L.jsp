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
    
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
	int v_rowcount	= 0;
    int v_upfilecnt = 0;
    int v_pageno    = box.getInt("p_pageno");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    list2 = (ArrayList)request.getAttribute("selectLetterList");
   
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->

<SCRIPT LANGUAGE="JavaScript">
<!--
    //����Ʈ ��ȸ
    function select() {
        document.nform1.action = "/servlet/controller.homepage.HomeLetterServlet";
        document.nform1.p_pageno.value = "1";
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

  //������ �̵�
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.HomeLetterServlet";
        document.nform1.p_process.value = "";
        document.nform1.submit();
    }

    //������ �̵�
    function goPage(pageNum) {
         document.nform1.p_pageno.value = pageNum;
         document.nform1.action = "/servlet/controller.homepage.HomeLetterServlet";
         document.nform1.p_process.value = "";
         document.nform1.submit();
    }

//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post">
	<input type = "hidden" name = "p_process">
	<input type = "hidden" name = "p_seq"	 >
	<input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">

            <h2><img src="/images/portal/studying/h2_tit7.gif" alt="��������" class="fl_l" /><p class="category">Home > �н��������� > <strong>��������</strong></p></h2>

            <p><img src="/images/portal/studying/news_borimg.gif" alt="������ ��������� �̸��Ϸ� ���ص帮�� ���������Դϴ�. �������ͼ��Ÿ� ���Ͻø� �����������濡�� �̸��� ���ſ� �������ּ���." /></p>
            
            
            <p class="board_serach">
                <select>
                    <option>����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/>
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" />
                <input type="hidden" name="p_select" value = "adtitle">
            </p>

            <table class="board_list">
            <colgroup><col width="63px" /><col width="460px" /><col width="106px" /><col width="62px" /></colgroup>
            <thead>
            <tr>
                <th><p>��ȣ</p></th>
                <th><p>����</p></th>
                <th><p>�ۼ�����</p></th>
                <th class="end"><p>��ȸ��</p></th>
            </tr>
            </thead>
            <tbody>
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
			<tr onmouseover="className='over'" onmouseout="className=' '">
                <td><%=v_dispnum%></td>
                <td class="ta_l"><a href="javascript:selectView(<%=v_seq%>)"><%=v_adtitle%></a></td>
                <td class="num"><%=FormatDate.getFormatDate(v_addate, "yyyy.MM.dd")%></td>
                <td class="fs_s"><%=v_cnt%></td>
            </tr>
			<%		}
				}else{%>
			
			<tr> 
			     <td colspan ='5' >��ϵ� ������ �����ϴ�.</td>
			</tr>
			<%  }   %>
            </tbody>
            </table>
        
            </tbody>
            </table>

        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
            </form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
