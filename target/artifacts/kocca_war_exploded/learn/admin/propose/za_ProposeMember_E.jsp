<%
/**
 * file name : za_ProposeMember_E.jsp
 * date      :
 * programmer:
 * function  : ��û��� ����Ʈ ��ȸȭ��
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>
<%	response.setHeader("Content-Disposition", "inline; filename=za_ProposeMember_E.xls");
	  response.setHeader("Content-Description", "JSP Generated Data");
	  
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	String  v_grseq     =  "";
    String  v_grseqnm   =  "";
    String  v_course    =  "";
    String  v_cyear     =  "";
    String  v_courseseq =  "";
    String  v_coursenm  =  "";
    String  v_subj      =  "";
    String  v_year      =  "";
    String  v_subjnm    =  "";
    String  v_subjseq   =  "";
    String  v_subjseqgr =  "";
    String  v_userid    =  "";
    String  v_name      =  "";
    String  v_appdate   =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_isproposeapproval =  "";
    String  v_chkfirst  =  "";
    String  v_chkfinal  =  "";
    String  v_email     =  "";
    String  v_ismailing =  "";
    String  v_isnewcourse= "";
    String  v_chkfirst_value  =  "";
    String  v_chkfinal_value  =  "";
    String  v_mapproval_value  =  "";
    String  v_isonoff   =  "";
    String  v_isonoff_value="";

	String v_membergubun = "";
	String v_dispnum	= "";
	String v_iscourseYn	= "";
	String v_tmp_subj	= "";

    int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;
    int     j           =  0;
	int		v_subjcnt	= 0;
	int		v_usercnt = 0;

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���

    ArrayList list      = null;

    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getString("s_grseq");            //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");          //����������
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    String  ss_selgubun  = box.getString("s_selgubun");
    String  ss_seltext   = box.getString("s_seltext");
    String  ss_edustart  = box.getString("s_start");            //����������
    String  ss_eduend    = box.getString("s_end");              //����������

    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
	<tr>
		<td align="center" height="30"><font size="3"><b>��û��� ����Ʈ</b></font></td>
	</tr>
  <tr>
    <td align="center" valign="top">
        <!----------------- ����������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="5" border="1">          
          <tr>
            <td ><b>No</b></td>
            <td width="20%" ><b>����</b></td>
            <td width="10%"><b>��������</b></td>
            <td width="13%"><b>ȸ������</b></td>
            <td width="5%"><b>ID</b></td>
            <td width="7%"><b>����</b></td> 
            <td width="5%"><b>����<br>����</b></td>
            <td width="7%"><b>����</b></td> 
            <td ><b>��û��</b></td>
            <td ><b>�����Ⱓ</b></td>
            <td width="7%"><b>��������</b></td>
          </tr>
        <%
            String v_grdvalue = "";
            String v_grd_value = "";
            String v_rejectpossible = "";   //�ݷ����ɿ���

            if (ss_action.equals("go")) {    //go button ���ýø� list ���
			list = (ArrayList)request.getAttribute("ProposeMemberExcel");
                v_total = list.size();
                for(i = 0; i < list.size(); i++) 
				{
					DataBox dbox = (DataBox)list.get(i);

                    v_grseq         = dbox.getString("d_grseq");
                    v_grseqnm       = dbox.getString("d_grseqnm");
                    v_course        = dbox.getString("d_course");
                    v_cyear         = dbox.getString("d_cyear");
                    v_courseseq     = dbox.getString("d_courseseq");
                    v_coursenm      = dbox.getString("d_coursenm");
                    v_subj          = dbox.getString("d_subj");
                    v_year          = dbox.getString("d_year");
                    v_subjnm        = dbox.getString("d_subjnm");
                    v_subjseq       = dbox.getString("d_subjseq");
                    v_subjseqgr     = dbox.getString("d_subjseqgr");
                    v_userid        = dbox.getString("d_userid");
                    v_name          = dbox.getString("d_name");
                    v_appdate       = dbox.getString("d_appdate");
                    v_edustart      = dbox.getString("d_edustart");
                    v_eduend        = dbox.getString("d_eduend");
                    v_chkfirst      = dbox.getString("d_chkfirst");
                    v_chkfinal      = dbox.getString("d_chkfinal");
                    v_email         = dbox.getString("d_email");
                    v_ismailing     = dbox.getString("d_ismailing");
                    v_isnewcourse   = dbox.getString("d_isnewcourse");
                    v_isonoff       = dbox.getString("d_isonoff");
                    v_membergubun	= dbox.getString("d_membergubun");
					v_iscourseYn	= dbox.getString("d_isbelongcourse");
                    v_subjcnt	    = dbox.getInt("d_subjcnt");

					v_dispnum		= dbox.getString("d_dispnum");
                    v_totalpage     = dbox.getInt("d_totalpage");
                    v_rowcount      = dbox.getInt("d_rowcount");
					

                    v_appdate    = FormatDate.getFormatDate(v_appdate,"yyyy/MM/dd HH:mm:ss");
                    v_edustart   = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                    v_eduend     = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");

					//ȸ������
					if(v_membergubun.equals("C")) {v_membergubun = "���";}
					else if(v_membergubun.equals("U")) {v_membergubun = "����";}
					else  {v_membergubun = "����";}

                    if(v_chkfirst.equals("Y"))               {  v_chkfirst_value = "����";    }
                    else if(v_chkfirst.equals("N"))          {  v_chkfirst_value = "�̽���";  }
                    
                    if(v_chkfinal.equals("Y"))               {  v_chkfinal_value = "����";    }
                    else if(v_chkfinal.equals("N"))          {  v_chkfinal_value = "�̽���";  }
                    else if(v_chkfinal.equals("B"))          {  v_chkfinal_value = "��ó��";  }
                    else if(v_chkfinal.equals("M"))          {  v_chkfinal_value = "-";  }
                    
                    if(v_isonoff.equals("ON"))               {     v_isonoff_value="���̹�";   }
                    else                                     {     v_isonoff_value="����";     }
               %>
<% if(v_iscourseYn.equals("Y"))
	{ 
	   if(j == v_subjcnt) v_tmp_subj = "";
		if(!v_tmp_subj.equals(v_course) && !v_tmp_subj.equals("000000"))
		{
			v_usercnt++;
			 j = 1;
			%>
		
        <tr align="left">
            <td ><%= v_usercnt%></td>
            <td ><%=v_coursenm%></td>
			<!--td ><%//=v_subjnm%></td-->
			<td ><%= v_grseqnm %></td>
            <td ><%= v_membergubun %></td>
            <td ><%= v_userid %></td>
            <td ><%= v_name %></td>   
            <td ><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td ><%=v_isonoff_value%></td>
            <td ><%= v_appdate %></td>
            <td ><%= v_edustart %>~ <%= v_eduend %></td>
            <td ><%= v_chkfinal_value %></td>   
        </tr>         
	<%	
			v_tmp_subj = v_course;
		}else{ 
			j++;
		%>
			<!--td ><%//=v_subjnm%></td>
            <td><%//=v_appdate %></td>
            <td ><%//=v_edustart %>~ <%= v_eduend %></td-->
<%		}
	} else { 
			v_usercnt++;%>

        <tr align="left">
            <td ><%= v_usercnt%></td>
            <td ><%=v_subjnm%></td>
			<td ><%= v_grseqnm %></td>
            <td ><%= v_membergubun %></td>
            <td ><%= v_userid %></td>
            <td ><%= v_name %></td>   
            <td ><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td ><%=v_isonoff_value%></td>
            <td ><%= v_appdate %></td>
            <td ><%= v_edustart %>~ <%= v_eduend %></td>
            <td ><%= v_chkfinal_value %></td>
        </tr>

<% } %>
            
         <%
               }
			}
         if(i == 0 && ss_action.equals("go")){ %>
              <tr>
                <td colspan="11">��ϵ� ������ �����ϴ�</td>
              </tr>
			 <% } %>
        </table>
      </td>
  </tr>
</table>
</body>
</html>