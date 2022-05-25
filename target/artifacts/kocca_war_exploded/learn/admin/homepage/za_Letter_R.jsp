<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Letter_R.jsp
//  3. ��      ��: �������� �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    
    String  s_userid = box.getSession("userid");
    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");
    String  v_selcomp  = box.getString("p_selcomp");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_tabseq     = box.getInt("p_tabseq");
    int v_seq        = box.getInt("p_seq");
    int v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate   = "";           // �˾�����������
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_aduserid  = "";           // userid

    String v_gubun_view = "";
    String v_loginyn    = "";			// �α�������
    String v_useyn   	= "";			// �������
    String v_compcd	    = "";           // ���ȸ��
	int v_popwidth	 = 0;               // �˾�����
    int v_popheight  = 0;               // �˾�����
    int v_popxpos    = 0;               // �˾�x��ġ
    int v_popypos    = 0;               // �˾�y��ġ
    
    String v_popup   = "";               // �˾�����
    String v_uselist = "";               // ����Ʈ���
    String v_useframe= "";               // �����ӻ��
    String v_isall   = "";
    String v_grcodecd = "";
    

    //NoticeData data = (NoticeData)request.getAttribute("selectNotice");
    
    DataBox dbox = (DataBox)request.getAttribute("selectNotice");
    
    if (dbox != null) {
        v_gubun     = dbox.getString("d_gubun");            
        v_startdate = dbox.getString("d_startdate"); 
        v_enddate   = dbox.getString("d_enddate");   
        v_adtitle   = dbox.getString("d_adtitle");  
        v_adcontent = dbox.getString("d_adcontent");
        v_addate    = dbox.getString("d_addate");   
        v_adname    = dbox.getString("d_adname");   
        v_cnt       = dbox.getInt("d_cnt");      
		v_loginyn   = dbox.getString("d_loginyn");   
		v_useyn   	= dbox.getString("d_useyn");     
		v_compcd	= dbox.getString("d_compcd");    
		v_popwidth	= dbox.getInt("d_popwidth");     
		v_popheight = dbox.getInt("d_popheight");    
		v_popxpos   = dbox.getInt("d_popxpos");      
		v_popypos   = dbox.getInt("d_popypos");      
		v_popup     = dbox.getString("d_popup");     
		v_uselist   = dbox.getString("d_uselist");   
		v_useframe  = dbox.getString("d_useframe");  
		v_isall     = dbox.getString("d_isall");  
		v_grcodecd  = dbox.getString("d_grcodecd");  
		v_aduserid  = dbox.getString("d_aduserid");
		
        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy/MM/dd");
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
     
//���ȸ��
	int tmplen= 0;
	String compcd="'1'";
	if(!v_compcd.equals("")) {
		compcd=v_compcd.substring(0, v_compcd.length()-1);
		compcd=StringManager.replace(compcd, ",", "','");
		compcd="'"+compcd+"'";
	}
	
	String grcodecd="'1'";
	if(!v_grcodecd.equals("")) {
		grcodecd=v_grcodecd.substring(0, v_grcodecd.length()-1);
		grcodecd=StringManager.replace(grcodecd, ",", "','");
		grcodecd="'"+grcodecd+"'";
	}
	
	//out.println("v_compcd===>>>>"+compcd);
	
	LetterAdminBean bean = new LetterAdminBean();
	ArrayList compList = bean.selectCompany(box, compcd);
	ArrayList grcodeList = bean.selectGrcode(box, grcodecd);
	
	
	String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
	
%>

<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function modify_notice() {
        document.mainForm1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.mainForm1.p_process.value = "updatePage";
        document.mainForm1.submit();
    }

    function delete_notice() {
        document.mainForm1.p_searchtext.value = "";
        document.mainForm1.p_search.value     = "";
        document.mainForm1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.mainForm1.p_process.value = "delete";
        document.mainForm1.submit();
    }

    function list_notice() {
        document.mainForm1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.mainForm1.p_process.value = "select";
        document.mainForm1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="mainForm1" method="post">
    <input type="hidden" name="p_process"    value="<%= v_process %>"/>
    <input type="hidden" name="p_pageno"     value="<%=v_pageno %>"/>
    <input type="hidden" name="p_pagesize"   value= "<%=v_pagesize %>"/>
    <input type="hidden" name="p_search"     value="<%=v_search %>"/>
    <input type="hidden" name="p_searchtext" value="<%=v_searchtext %>"/>
    <input type="hidden" name="p_tabseq"     value="<%=v_tabseq %>"/>
    <input type="hidden" name="p_seq"        value="<%=v_seq %>"/>
    <input type="hidden" name="p_selcomp"    value="<%=v_selcomp%>"/>
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="/images/admin/homepage/tit_news.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%= v_adname %></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= v_addate %></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>��ü��������</strong></td>
            <td height="25" class="table_02_2"><%= v_isall %></td>
          </tr>
          <%if(!v_gadmin.equals("K")){   //ȸ������ڰ� �ƴҶ�%>
          <tr class="table_02_2"> 
            <td height="25" class="table_title" ><strong>�α�������</strong></td>
            <td height="25" class="table_02_2"><%=v_loginyn%></td>
          </tr>
          <tr class="table_02_2"> 
            <td height="25" class="table_title" ><strong>������׷�</strong></td>
            <td height="25" class="table_02_2">
            <% for(int i=0;i<grcodeList.size();i++){
	          DataBox dbox1   = (DataBox)grcodeList.get(i);
	          out.print(dbox1.getString("d_grcodenm"));
	          %>&nbsp;&nbsp;       
            <%}%>
            </td>
          </tr>
          <%}%>
          <!--tr> 
            <td width="15%" class="table_title"><strong>���ȸ�翩��</strong></td>
            <td height="25" class="table_02_2"><%= v_gubun_view %></td>
          </tr>
          <tr class="table_02_2"> 
            <td height="25" class="table_title" ><strong>���ȸ��</strong></td>
            <td height="25" class="table_02_2">
            <% for(int i=0;i<compList.size();i++){
	          NoticeData compnm   = (NoticeData)compList.get(i);
	          out.print(compnm.getCompnm());
	          %>&nbsp;&nbsp;	          
            <%}%>
			</td>
          </tr-->
          <tr> 
            <td width="15%" class="table_title"><strong>�˾�����</strong></td>
            <td height="25" class="table_02_2"><%= v_popup %></td>
          </tr>
          <%if(v_popup.equals("Y")){%>
          <tr>
            <td height="25" class="table_title"><b>�˾�����</b></td>
            <td class="table_02_2"><%=FormatDate.getFormatDate(v_startdate,"yyyy/MM/dd")%>  ~<%=FormatDate.getFormatDate(v_enddate,"yyyy/MM/dd")%>
			<br>������ : ����&nbsp; <%=v_popwidth%> / ����&nbsp; <%=v_popheight%>
			<br>��ġ   : x&nbsp;  <%=v_popxpos%> /  y&nbsp; <%=v_popypos%>
			<br>�ۼ����븸���̱� : <%=v_useframe%> Ȩ����������Ʈ��� <%=v_uselist%>
            </td>
          </tr>
          <%}%>
          <tr> 
            <td width="15%" class="table_title"><strong>�������</strong></td>
            <td height="25" class="table_02_2"><%=v_useyn%></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%= v_adtitle %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="50" class="table_02_2"><br><%= v_adcontent %><br></td>
          </tr>
		  <tr>
			<td class = "table_title" align = "center">÷������</td>
			<td class = "table_02_2"  align = "left" >
                  <%
                  Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                  Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach_R.jsp" %> 
			</td>
		  </tr>
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table width="16%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
          <%if(v_gadmin.equals("A") || v_gadmin.equals("B") || ( s_userid.equals(v_aduserid) && (v_gadmin.equals("H") || v_gadmin.equals("K"))) ){%>
            <td align="center"><a href="javascript:modify_notice()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>&nbsp;</td>
            <td align="center"><a href="javascript:delete_notice()"><img src="/images/admin/button/btn_del.gif" border="0"></a>&nbsp;</td>
          <%}%>
            <td align="center"><a href="javascript:list_notice()"><img src="/images/admin/button/btn_list.gif" border="0"></a>&nbsp;</td>
          </tr>
        </table>
        <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->


      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
