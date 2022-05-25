<%@ page contentType = "text/html;charset=euc-kr" %>
<%
/**
 * file name : za_DiplomaAdmin_E.jsp
 * date      :
 * programmer:
 * function  : ������ ���� ��ȸȭ��
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.polity.*" %>

<%	
    response.setHeader("Content-Disposition", "attachment; filename=za_DiplomaAdmin_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	String  v_process  = "selectList";

    String  ss_grcode			= box.getString("s_grcode");		//�����׷�
    String  ss_gyear			= box.getString("s_gyear");			//�⵵
    String  ss_grseq			= box.getString("s_grseq");			//��������
    String  ss_grseqnm			= box.getString("s_grseqnm");		//����������
    String  ss_mastercd			= box.getString("s_mastercd");		//����&�ڽ�
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_subjcourse		= box.getString("s_subjcourse");	//����&�ڽ�
    String  ss_subjseq			= box.getString("s_subjseq");		//���� ����
    String  ss_accountstart		= box.getString("s_accountstart");	//��û������
    String  ss_accountend		= box.getString("s_accountend");	//��û������
    String  ss_accountstat		= box.getString("s_accountstat");	//�Աݻ���
	
    String  v_action    = box.getString("p_action");

	String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
	String v_dispnum	= "";

	int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="1" cellspacing="0" cellpadding="0" height="663">
	<tr>
		<td align="center" height="30"><font size="3"><b>������ ���� ����Ʈ</b></font></td>
	</tr>
  <tr>
    <td align="center" valign="top">
        <%
        String v_ispropose          ="";
        String v_proposetype        ="";
        String v_isedutarget        ="";
        String v_educnt             ="";
        String v_mastercd           ="";
        String v_masternm           ="";

        %>

        <!----------------- ����������ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5" border="1">	
          <tr>
			<td ><b>No</b></td>
			<td width="10%"><b>����</b></td>
			<td ><b>ȸ������</b></td>
			<td width="10%"><b>ID</b></td>
			<td width="5%"><b>����</b></td>
			<td width="10%"><b>����</b></td>
			<td ><b>����</b></td>
			<td ><b>�����Ⱓ</b></td>
			<td ><b>���Ῡ��</a></td>
          </tr>

<%  
        if (v_action.equals("go")) {
        ArrayList  list = (ArrayList)request.getAttribute("selectList");

        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

		String v_subj		= "";
		String v_subjnm		= "";
		String v_membergubun= "";
		String v_userid		= "";
		String v_uname		= "";
		String v_subjseq	= "";
		String v_scyear		= "";
		String v_edustart	= "";
		String v_eduend 	= "";
		String v_isonoff	= "";
		String v_isgradu	= "";
		
        for (i=0; i<list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);

			v_subj			= dbox.getString("d_subj");
			v_subjnm		= dbox.getString("d_subjnm");
			v_userid		= dbox.getString("d_userid");
			v_uname			= dbox.getString("d_name");
			v_subjseq		= dbox.getString("d_subjseq");
			v_scyear		= dbox.getString("d_year");
			v_edustart		= dbox.getString("d_edustart");
			v_eduend		= dbox.getString("d_eduend");
			v_isonoff		= dbox.getString("d_isonoff");
			v_isgradu		= dbox.getString("d_isgraduated");
			v_membergubun	= dbox.getString("d_membergubun");

			v_dispnum		= dbox.getString("d_dispnum");

			if(v_isonoff.equals("ON")){     v_isonoff="���̹�";   }
            else                      {     v_isonoff="����";     }

			if(v_isgradu.equals("Y")) 
			{
				v_isgradu = "����";
			}
			else 
			{
				v_isgradu = "�̼���";
			}

			if(v_membergubun.equals("C")) {v_membergubun = "���";}
			if(v_membergubun.equals("U")) {v_membergubun = "����";}
			else {v_membergubun = "����";}


%>
            <tr align="left">
				<td ><%=(i + 1) %></td>
                <td ><%=v_subjnm %></td>
                <td ><%=v_membergubun %></td>
                <td><%=v_userid%></td>
                <td ><%=v_uname  %></td>
                <td ><%=v_subjseq %></td>
                <td ><%=v_isonoff %></td>
                <td ><%=FormatDate.getFormatDate(v_edustart,"yyyy-MM-dd")%> ~<br><%=FormatDate.getFormatDate(v_eduend,"yyyy-MM-dd")%></td>
                <td><%=v_isgradu %></td>
                
            </tr>
<%          //}
        }
		if (i == 0)
			{ %>
			<tr>
				<td align="center" bgcolor="#FFFFFF" height="100" colspan="10">��ϵ� ������ �����ϴ�.</td>
			  </tr>
			<%}
    }

%>
           
        </table>
      </td>
  </tr>
</table>
</body>
</html>