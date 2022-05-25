<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_R.jsp
//  3. ��      ��: �������� �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 8. 10
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
    int     v_pageno   = box.getInt("p_pageno");
    String  v_selcomp  = box.getString("p_selcomp");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_popUpPreview = box.getString("p_popUpPreview");
    String ss_userid =  box.getSession("userid");

    int v_tabseq   = box.getInt("p_tabseq");
    int     v_seq          = box.getInt("p_seq");

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate   = "";           // �˾�����������
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����

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
    String v_realfile = "";
    String v_upfile = "";
    

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
		v_upfile    = dbox.getString("d_upfile");    
		v_realfile  = dbox.getString("d_realfile");  
		v_uselist   = dbox.getString("d_uselist");   
		v_useframe  = dbox.getString("d_useframe");  
		
        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy/MM/dd");
        //v_adcontent  = StringManager.replace(data.getAdcontent(),"\n","<br>");
     }  
     
%>
<%=v_adcontent%>

  <!-- â�׸����� -->
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">
<script language="javascript">

function notice_setCookie( name, value, expiredays )
    {
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
     }


function notice_closeWin() 
{ 
        notice_setCookie( "<%=v_popUpPreview%>", "done" , 1); // 1=�Ϸ��� ����â ���� ����
        self.close(); 
}

function winBlur()
	{
     	 //alert("1111");
		 //self.blur();
		 self.focus();
	}
    <%if(ss_userid.equals("") || ss_userid == null){%>
     setTimeout("winBlur()", 1000); 
    <%}%>��

</script>
<table border="0" cellspacing="0" cellpadding="0" summary="â�׸���">
  <tr valign="bottom">
    <td><input type="checkbox" name="checkbox" onclick="javascript:notice_closeWin()" title="â�׸�����"><font style=font-family:"����","����ü"; font-size: 9pt; color: #666666;line-height:1.4;>�����Ϸ� �� â�� �׸� ���ϴ�.</td>
  </tr>
</table>