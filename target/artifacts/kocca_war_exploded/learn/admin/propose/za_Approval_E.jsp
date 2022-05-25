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
<%	response.setHeader("Content-Disposition", "inline; filename=za_Approval_E.xls");
	  response.setHeader("Content-Description", "JSP Generated Data");
	  
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  v_process  = "listPage";

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
    int l=0;
    int     v_usercnt   = 0;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
	<tr>
		<td align="center" height="30"><font size="3"><b>������û ����Ʈ</b></font></td>
	</tr>
  <tr>
    <td align="center" valign="top">
        <!----------------- ����������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="5" border="1">
          <tr>
            <td ><b>����</b></td>
            <td><b>����</b></td>
            <td><b>ȸ���з�</b></td>
            <td><b>ID</b></td>
            <td><b>����</b></td>
            <td><b>EMAIL</b></td>
            <td><b>�̵���ȭ</b></td>
            <td><b>�Աݿ���</b></td>
            <td><b>��������</b></td>
            <td><b>��û�Ͻ�</b></td>
            <td><b>�ֹι�ȣ</b></td>
            <td><b>ȸ���</b></td>
            <td><b>�����з�</b></td>
            <td><b>����о�</b></td>
            <td><b>�μ���</b></td>
            <td><b>�ǰ�����</b></td>
            <td><b>������</b></td>
            <td><b>������</b></td>
            <td><b>�������</b></td>
            <td><b>������</b></td>
          </tr>

<%  

        ArrayList  list = (ArrayList)request.getAttribute("ApprovalList");
        System.out.println("list.size() = " + list.size());

        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

		String v_subj		= "";
		String v_subjnm		= "";
		String v_membergubun= "";
		String v_userid		= "";
		String v_uname		= "";
		String v_subjseq	= "";
		String v_appdate	= "";		
		String v_chkfinal	= "";
		String v_edustart	= "";
		String v_isclosed	= "";
		String v_scyear		= "";
		String v_billstat	= "";
		String v_tmp_subj	= "";
		String v_iscourseYn	= "";
		String v_course		= "";
		String v_coursenm	= "";
		int		v_subjcnt	= 0;
		
		String v_email		= "";
		String v_handphone  = "";
		String v_hometel	= "";
		String v_comptel	= "";
		
		String v_resno		= "";
		String v_comptext   = "";
		String v_jikupnm	= "";
		String v_workfieldnm	= "";
		String v_degreenm   = "";
        String v_deptnam    = "";

        String v_paymethod ="";
        String v_paymethodnm ="";
        String v_pgauthdate ="";
        String v_inputdate ="";
        String v_buyername ="";
        String v_inputname ="";       

        for (i=0; i<list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);

			if(dbox != null){

				v_biyong            = dbox.getInt("d_biyong");
				v_biyong_view       = NumberFormat.getInstance().format(v_biyong);
				v_total_biyong     += v_biyong;
				v_finalString = "";
				v_subj			= dbox.getString("d_scsubj");
				v_subjnm		= dbox.getString("d_subjnm");
				v_membergubun	= dbox.getString("d_membergubun");
				v_userid		= dbox.getString("d_userid");
				v_uname			= dbox.getString("d_name");
				v_subjseq		= dbox.getString("d_scsubjseq");
				
				v_appdate		= dbox.getString("d_appdate");			
				v_chkfinal		= dbox.getString("d_chkfinal");
				v_edustart		= dbox.getString("d_edustart");
				v_isclosed		= dbox.getString("d_isclosed");
				v_scyear		= dbox.getString("d_scyear");
				v_billstat		= dbox.getString("d_billstat");

				v_course		= dbox.getString("d_course");
				v_coursenm		= dbox.getString("d_coursenm");
				v_iscourseYn	= dbox.getString("d_isbelongcourse");
				v_subjcnt		= dbox.getInt("d_subjcnt");
				
				v_email			= dbox.getString("d_email");
				v_handphone  	= dbox.getString("d_handphone");
				v_hometel		= dbox.getString("d_hometel");
				v_comptel		= dbox.getString("d_comptel");
				
				//v_resno			= dbox.getString("d_resno");
                v_resno			= dbox.getString("d_resno1") + dbox.getString("d_resno2");
				v_comptext  	= dbox.getString("d_comptext");
				v_jikupnm		= dbox.getString("d_jikupnm");
				v_workfieldnm	= dbox.getString("d_workfieldnm");
				v_degreenm		= dbox.getString("d_degreenm"); 
                v_deptnam		= dbox.getString("d_deptnam");

                v_paymethod	     = dbox.getString("d_paymethod");  
			    v_paymethodnm    = dbox.getString("d_paymethodnm");
                v_pgauthdate 	 = dbox.getString("d_pgauthdate");
                v_inputdate		 = dbox.getString("d_inputdate");
                v_buyername		 = dbox.getString("d_buyername");
                v_inputname	     = dbox.getString("d_inputname");

				if (!v_resno.equals("")) { 
				 if (v_resno.length()==13) {
				 	//v_resno = v_resno.substring(0,6) + "-" + v_resno.substring(6,7) + "******";
				 	v_resno = v_resno.substring(0,6) + "-" + v_resno.substring(6,13);
				 } else {
				 	v_resno = "";
				 }
			    }   
				
				//���� ����
				if(v_billstat.equals(""))
				{
					v_billstat = "�̿Ϸ�";
				}

				//ȸ������
				if(v_membergubun.equals("C")) {v_membergubun = "���";}
				else if(v_membergubun.equals("U")) {v_membergubun = "����";}
				else  {v_membergubun = "����";}

				if(v_isclosed.equals("N"))
				{             
					if (v_chkfinal.equals("Y"))   v_finalString = "����" ;
					else if (v_chkfinal.equals("N"))  v_finalString = "�ݷ�";
					else    v_finalString = "��ó��";

				}else{  //����ó�� �Ϸ�� ���
					v_finalString = "�н�����";

					if (v_chkfinal.equals("B")){
						v_finalString += "(��ó��)";
					}else if (v_chkfinal.equals("Y")){
						v_finalString += "(����)";
					}else if (v_chkfinal.equals("N")){
						v_finalString += "(�ݷ�)";
					}

				}
			}
%>
<% if(v_iscourseYn.equals("Y"))
	{ 
		if(l == v_subjcnt) v_tmp_subj = "";
		
		if(!v_tmp_subj.equals(v_course) && !v_tmp_subj.equals("000000"))
		{
			l = 1;
			
			%>
				
         <tr align="left">
            <td ><%=v_coursenm%></td>
			<td ><%=v_subjseq%></td>
			<!--td ><%//=v_subjnm%></td-->
			<td ><%=v_membergubun%></td>
			<td style='mso-number-format:"\@";'><%=v_userid%></td>
			<td ><%=v_uname%></td>
			<td ><%=v_email%></td>
			<td style='mso-number-format:"\@";'><%=v_handphone%></td>
			<td ><%=v_billstat%></td>
			<td ><%=v_finalString%></td>
			<td ><%=FormatDate.getFormatDate(v_appdate,"yyyy-MM-dd HH:mm:ss")%></td>
			<td style='mso-number-format:"\@";'><%=v_resno		%></td>
			<td ><%=v_comptext  %></td>
			<td ><%=v_degreenm  %></td>
			<td ><%=v_workfieldnm	%></td>
             <td ><%=v_deptnam	%></td>

             <td ><%= dbox.getCommaInt("d_price") %></td>
             <td ><%=dbox.getCommaInt("d_biyong")%></td>
             <td><% if (v_paymethod.equals("Card") || v_paymethod.equals("VCard") || v_paymethod.equals("DirectBank"))  {
					out.print(FormatDate.getFormatDate(v_pgauthdate,"yyyy-MM-dd"));
			      } else if (v_paymethod.equals("BankBook")) {
			   		out.print(FormatDate.getFormatDate(v_inputdate,"yyyy-MM-dd"));
			      }
			    %></td>
             <td ><%=v_paymethodnm%></td>
			<td>
			<% if (v_paymethod.equals("Card") || v_paymethod.equals("VCard") || v_paymethod.equals("DirectBank"))  {
					out.print(v_buyername);
			   } else if (v_paymethod.equals("BankBook")) {
			   		out.println(v_inputname);
			   }
			%>
			</td>

	<%	
			v_tmp_subj = v_course;
		}else{ 
			l++;
		%>
			<!--td ><%//=v_subjnm%></font></td-->
<%		}
	} else { %>

            <td ><%=v_subjnm%></td>			
			<td ><%=v_subjseq%></td>
			<td ><%=v_membergubun%></td>
			<td style='mso-number-format:"\@";'><%=v_userid%></td>
			<td ><%=v_uname%></td>
			<td style='mso-number-format:"\@";'><%=v_email%></td>
			<td style='mso-number-format:"\@";'><%=v_handphone%></td>
			<td ><%=v_billstat%></td>
			<td ><%=v_finalString%></td>
			<td ><%=FormatDate.getFormatDate(v_appdate,"yyyy-MM-dd HH:mm:ss")%></td>
			<td style='mso-number-format:"\@";'><%=v_resno		%></td>
			<td ><%=v_comptext  %></td>
			<td ><%=v_degreenm  %></td>
			<td ><%=v_workfieldnm	%></td>
            <td ><%=v_deptnam	%></td>

             <td ><%= dbox.getCommaInt("d_price") %></td>
             <td ><%=dbox.getCommaInt("d_biyong")%></td>
             <td><% if (v_paymethod.equals("Card") || v_paymethod.equals("VCard") || v_paymethod.equals("DirectBank"))  {
					out.print(FormatDate.getFormatDate(v_pgauthdate,"yyyy-MM-dd"));
			      } else if (v_paymethod.equals("BankBook")) {
			   		out.print(FormatDate.getFormatDate(v_inputdate,"yyyy-MM-dd"));
			      }
			    %></td>
             <td ><%=v_paymethodnm%></td>
			<td>
			<% if (v_paymethod.equals("Card") || v_paymethod.equals("VCard") || v_paymethod.equals("DirectBank"))  {
					out.print(v_buyername);
			   } else if (v_paymethod.equals("BankBook")) {
			   		out.println(v_inputname);
			   }
			%>
			</td>             
            
<% } %>     
                
            </tr>
<%          //}
        }
		if (i == 0)
			{ %>
			<tr>
				<td align="center"  colspan="20">��ϵ� ������ �����ϴ�.</td>
			  </tr>
			<%}
    //}

%>
        </table>
      </td>
  </tr>
</table>
</body>
</html>