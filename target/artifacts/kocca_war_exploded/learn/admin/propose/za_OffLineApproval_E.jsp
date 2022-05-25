<%
/**
 * file name : za_Approval_E.jsp
 * date      :
 * programmer:
 * function  : ������û ���� ����Ʈ ��ȸȭ��
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>

<%	response.setHeader("Content-Disposition", "inline; filename=za_OffLineApproval_E.xls");
	  response.setHeader("Content-Description", "JSP Generated Data");
	  
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  v_process  = "OffLinelistPage";

    String  ss_grcode          = box.getString("s_grcode");           //�����׷�
    String  ss_gyear           = box.getString("s_gyear");            //�⵵
    String  ss_grseq           = box.getString("s_grseq");            //��������
    String  ss_grseqnm         = box.getString("s_grseqnm");          //����������
    String  ss_mastercd        = box.getString("s_mastercd");         //����&�ڽ�
    String  ss_upperclass      = box.getString("s_upperclass");      //������з�
    String  ss_middleclass     = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass      = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse      = box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq         = box.getString("s_subjseq");          //���� ����
    String  ss_company         = box.getString("s_company");          //ȸ��
    String  ss_selgubun        = box.getString("s_selgubun");
    String  ss_seltext         = box.getString("s_seltext");
    String  ss_seldept         = box.getString("s_seldept");
    String  ss_edustart        = box.getString("s_start");            //����������
    String  ss_eduend          = box.getString("s_end");              //����������
    String  v_isManagerPropose = box.getString("isManagerPropose");              //����������

    int     v_biyong            = 0;           // �ݾ�
    String  v_biyong_view       = "";          // ȭ����¿� �ݾ�(,�߰�)
    int     v_total_biyong      = 0;           // �ѱݾ�
    String  v_total_biyong_view = "";           // ȭ����¿� �ѱݾ�(,�߰�)
    String  v_step      = box.getString("p_step");
    String  v_appstatus = box.getString("p_appstatus");

    String  v_gadmin    = box.getString("s_gadmin");

    String []   stat_k  = {"ALL","B","Y","N"};
    String []   stat_v  = {"��ü","��ó��","����","�ݷ�"};


    String  v_finalString = ""; //�������� select box �±�

    int i=0;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
	<td align="center" height="30"><font size="3"><b>OffLine ������û ����Ʈ</b></font></td>
  </tr>
  <tr>
    <td align="center" valign="top">
        <!----------------- ����������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="5" border="1">
          <tr>
            <td><b>�з�</b></td>
            <td><b>���Ǹ�</b></td>
            <td><b>������û �Ⱓ</b></td>
            <td><b>���� �Ͻ�</b></td>
            <td><b>�ð�</b></td>
            <td><b>ȸ���з�</b></td>
            <td><b>ID</b></td>
            <td><b>����</b></td>
            <td><b>EMAIL</b></td>
            <td><b>�̵���ȭ</b></td>
            <td><b>��������</b></td>
            <td><b>��û�Ͻ�</b></td>
            <td><b>�ֹι�ȣ</b></td>
            <td><b>ȸ���</b></td>
            <td><b>�����з�</b></td>
            <td><b>����о�</b></td>
          </tr>

<%  

		ArrayList  list = (ArrayList)request.getAttribute("OffLineApprovalList");

        
		int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

		String v_gubunNm	= "";
		String v_subjnm		= "";
		String v_propstart	= "";
		String v_propend	= "";
		String v_dday		= "";
		String v_starttime	= "";
		String v_endtime	= "";
		String v_membergubun = "";
		String v_userid		= "";
		String v_superyn	= "";
		String v_status		= "";
		String v_name		= "";
		String v_email		= "";
		String v_handphone  = "";
		String v_ldate		= "";
		String v_seq		= "";
		
		String v_resno		= "";
		String v_comptext   = "";
		String v_jikupnm	= "";
		String v_degreenm   = "";

		for (i=0; i<list.size(); i++) 
		{
            DataBox dbox = (DataBox)list.get(i);

            v_seq			= dbox.getString("d_seq");
			v_gubunNm		= dbox.getString("d_gubunnm");
			v_subjnm		= dbox.getString("d_subjnm");
			v_propstart		= dbox.getString("d_propstart");
			v_propend		= dbox.getString("d_propend");
			v_dday			= dbox.getString("d_dday");
			v_starttime		= dbox.getString("d_starttime");
			v_endtime		= dbox.getString("d_endtime");
			v_membergubun	= dbox.getString("d_membergubun");
			v_userid		= dbox.getString("d_userid");
			v_superyn		= dbox.getString("d_superyn");
			v_status		= dbox.getString("d_status");
			v_name			= dbox.getString("d_name");
			v_email			= dbox.getString("d_email");
			v_handphone		= dbox.getString("d_handphone");
			v_ldate			= dbox.getString("d_ldate");

			//��¥ ó��
			if(v_dday.equals("")){v_dday = "����";}
			else{v_dday     = FormatDate.getFormatDate(v_dday,"yyyy/MM/dd");}
			if(v_propstart.equals("")){v_propstart = "����";}
			else{v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");}
			if(v_propend.equals("")){v_propend = "����";}
			else{v_propend     = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");}
			
			v_resno			= dbox.getString("d_resno");
			v_comptext  	= dbox.getString("d_comptext");
			v_jikupnm		= dbox.getString("d_jikupnm");
			v_degreenm		= dbox.getString("d_degreenm");
			
			if (!v_resno.equals("")) { 
			 if (v_resno.length()==13) {
			 	v_resno = v_resno.substring(0,6) + "-" + v_resno.substring(6,7) + "******";
			 } else {
			 	v_resno = "";
			 }
		    }
%>
            <tr align="left">
                <td ><%=v_gubunNm%></td>
                <td ><%=v_subjnm%></td>
                <td ><%=v_propstart%> ~ <br> <%=v_propend%></td>
                <td ><%=v_dday%></td>
                <td ><%=v_starttime%> �� ~ <br> <%=v_starttime%>��</td>
<%
				if(v_membergubun.equals("C"))
				{
					v_membergubun = "���";
				}
				else if(v_membergubun.equals("U"))
				{
					v_membergubun = "����";
				}
				else
				{
					v_membergubun = "����";
				}

				// ���� ����
				if(v_status.equals("Y"))
				{
					v_status = "����";
				}
				else if(v_status.equals("W"))
				{
					v_status = "��ó��";
				}
				else
				{
					v_status = "����";
				}
%>
                <td ><%=v_membergubun%></td>
                <td style='mso-number-format:"\@";'><%=v_userid%></td>
				<td ><%=v_name%></td>
				<td ><%=v_email%></td>
				<td style='mso-number-format:"\@";'><%=v_handphone%></td>
                <td ><%=v_status %></td>
                <td ><%=FormatDate.getFormatDate(v_ldate,"yyyy-MM-dd HH:mm:ss")%></td>                
                <td style='mso-number-format:"\@";'><%=v_resno		%></td>
				<td ><%=v_comptext  %></td>
				<td ><%=v_degreenm  %></td>
				<td ><%=v_jikupnm	%></td>
            </tr>
<%
		}
%>
        </table>
      </td>
  </tr>
</table>
</body>
</html>