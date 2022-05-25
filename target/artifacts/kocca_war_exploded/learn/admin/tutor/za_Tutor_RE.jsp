<%
//**********************************************************
//  1. ��      ��: TUTOR SELECT
//  2. ���α׷���: za_Tutor_R.jsp
//  3. ��      ��: ���� ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>

<%
	response.setHeader("Content-Disposition", "inline; filename=TutorInfo.xls");   
	response.setHeader("Content-Description", "JSP Generated Data");
     //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process       = box.getString("p_process");
    String v_search         = box.getString("p_search");        //�����о߰˻�
    String v_select         = box.getString("p_select");        //�˻��׸�(������1,�����2)
    String v_selectvalue    = box.getString("p_selectvalue");   //�˻���
	
	String v_frompage		= box.getString("p_frompage");	//������Ȳ���� �Ѿ���� "TutorStatus"
	
	    String  v_tutorgubun   = box.getStringDefault("s_tutorgubun","ALL");//���籸��(I:�系����,O:��ܰ���,C:�������)
    String  v_srchsubjnm = box.getStringDefault("p_srchsubjnm","");		//������
    
    String  s_subjclass   = box.getString("p_subjclass");    //���Ǻо�
    String  v_tutorname   = box.getStringDefault("p_tutorname","");    //�����
    
	
    String v_userid         = "";
    String v_resno          = "";
    String v_name           = "";
    String v_sex            = "";
    String v_post1          = "";
    String v_post2          = "";
    String v_add1           = "";
    String v_phone          = "";
    String v_handphone      = "";
    String v_fax            = "";
    String v_email          = "";
    String v_comp           = "";
    String v_dept           = "";
    String v_jik            = "";
    String v_academic       = "";
    String v_intro          = "";
    String v_major          = "";
    String v_isadd          = "";
    String v_iscyber        = "";
    String v_isgubun        = "";
    String v_isgubuntype    = "";
    String v_isstatus       = "";
    String v_istutor        = "";    
    String v_license        = "";
    String v_career         = "";
    String v_book           = "";
    String v_grcode         = "";
    String v_charge         = "";
    String v_isinfo         = "";
    String v_professional   = "";
    String v_etc            = "";
    String v_subjnm         = "";
    String v_photo          = "";
    String v_userid_value   = "";
    String v_sex_value      = "";
    String v_isgubun_value  = "";
    String v_isgubuntype_value="";
    String v_fmon           = "";
    String v_tmon           = "";
    String v_manager_value  = "";
    String v_iscyber_value  = "";
    String v_subjclass     = "";
    String v_ismanager		= "";
    String v_loginid  = "";
    String v_loginpw  = "";
    String v_subjclassnm  = "";
    
    String v_subj     = "";
    
    int v_managerchk        = 0;
    int v_careeryear        = 0;        
    int i                   = 0;
    //DEFINED class&variable END

    //TutorData data          = (TutorData)request.getAttribute("tutorSelect");
    DataBox dbox = (DataBox)request.getAttribute("tutorSelect");
    ArrayList list2 = (ArrayList)request.getAttribute("tutorSubjHistoryList");
    
    v_userid                = dbox.getString("d_userid");
    v_name                  = dbox.getString("d_name");
    v_sex                   = dbox.getString("d_sex");
    v_subjclassnm		    = dbox.getString("d_subjclassnm");
    v_post1                 = dbox.getString("d_post1");
    v_post2                 = dbox.getString("d_post2");
    v_add1                  = dbox.getString("d_add1");
    v_phone                 = dbox.getString("d_phone");
    v_handphone             = dbox.getString("d_handphone");
    v_fax                   = dbox.getString("d_fax");
    v_email                 = dbox.getString("d_email");
    v_comp                  = dbox.getString("d_comp");
    v_dept                  = dbox.getString("d_dept");
    v_jik                   = dbox.getString("d_jik");
    v_academic              = dbox.getString("d_academic");
    v_major                 = dbox.getString("d_major");
    v_isadd                 = dbox.getString("d_isadd");
    v_iscyber               = dbox.getString("d_iscyber");
    v_isgubun               = dbox.getString("d_isgubun");
    v_isgubuntype           = dbox.getString("d_isgubuntype");
    v_isstatus              = dbox.getString("d_isstatus");
    v_istutor               = dbox.getString("d_istutor");
    v_careeryear            = dbox.getInt   ("d_careeryear");
    v_license               = dbox.getString("d_license");
    v_career                = dbox.getString("d_career");
    v_book                  = dbox.getString("d_book");
    v_grcode                = dbox.getString("d_grcodenm");
    v_professional          = dbox.getString("d_professional");
    v_charge                = dbox.getString("d_charge");
    v_isinfo                = dbox.getString("d_isinfo");
    v_etc                   = dbox.getString("d_etc");
    v_photo                 = dbox.getString("d_photo");
    v_fmon                  = dbox.getString("d_fmon");        
    v_tmon                  = dbox.getString("d_tmon");   
    v_intro                 = dbox.getString("d_intro");   
    v_subjclass            = dbox.getString("d_subjclass"); 
    v_ismanager             = dbox.getString("d_ismanager");
    v_loginid               = dbox.getString("d_loginid");
    v_loginpw               = dbox.getString("d_loginpw");
    v_resno                 = dbox.getString("d_resno");
    
    
    v_managerchk            = dbox.getInt("d_managerchk");
    
    
    if( v_isgubun.equals("2"))  {
        //������ �ִ� ���
        //if (v_ismanager.equals("Y")) {
    		if (v_resno.length()==13) {
    			//v_userid_value = v_resno.substring(0, 6)+"-"+v_resno.substring(6); 
    			v_userid_value = v_resno.substring(0, 6)+"-"+v_resno.substring(6, 7) + "******";
    		} else {
    			v_userid_value = v_userid;
	    	}
	    //} else {
	    //	v_userid_value = v_userid;
	    //}
    } else {
    	v_userid_value = v_userid;
   	}
   	
    if(v_sex.equals("1")){  v_sex_value = "����";     }
    else                 {  v_sex_value = "����";     }
//  v_professional_value   =  CodeConfigBean.getCodeName("tutorProfessional",v_professional);
    if(v_isgubun.equals("1"))       {   v_isgubun_value = "�系����";   }
    else if(v_isgubun.equals("2"))  {   v_isgubun_value = "��ܰ���";   }
    
    if(v_isgubuntype.equals("1"))   {   v_isgubuntype_value = "����";   }
    else if(v_isgubuntype.equals("2")){ v_isgubuntype_value = "Part Time";}
    else if(v_isgubuntype.equals("3")){ v_isgubuntype_value = "��������";}
    else if(v_isgubuntype.equals("4")){ v_isgubuntype_value = "��Ÿ";   }
    
    
    if(v_ismanager.equals("Y")){      
        v_manager_value = "Y";   
        if(v_fmon.length() > 0) v_fmon  = FormatDate.getFormatDate(v_fmon,"yyyy/MM/dd");          
        if(v_tmon.length() > 0) v_tmon  = FormatDate.getFormatDate(v_tmon,"yyyy/MM/dd");          
    }else{                      
        v_manager_value = "N";   
        v_fmon = "";
        v_tmon = "";
    }

    if (v_iscyber.equals("1"))      v_iscyber_value = "���ձ�������";
    else if (v_iscyber.equals("2")) v_iscyber_value = "���̹���������";
    else if (v_iscyber.equals("3")) v_iscyber_value = "���ձ������� / ���̹���������";
    else                            v_iscyber_value = "";

        
    ArrayList list = (ArrayList)request.getAttribute("tutorSubjList");
    
    
    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

	
		  <table width="235" height="43" border=1 cellpadding="0" cellspacing="0"><tr>
                <td width="231" align=center colspan=8> <font size="6" face="����ü"><strong>���� ������</strong></font></td>
              </tr>
		  </table>


<p>&nbsp;</p>
<table width="699" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td width="695" align="center" valign="top"> 
      <br>
	 <!-------------������ ����-------------------------->
 		
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class=sub_title colspan=8><font size="5">��������</font></td>
        </tr>
      </table>
	  
	</td>
   </tr>
   <tr><td>

        <!--------------������ ��---------------------------->
	 <!----------------- ������ ���� ----------------->
        
      <table width="97%"  cellspacing="1" cellpadding="5" border="1">
        <tr> 
          <td colspan="2" height="40" width="80" class="table_title"><b>���籸��</b></td>
          <td  colspan="6" class="table_02_2"> <% if(v_isgubun.equals("1")){ %>
            �系���� 
            <%} %> <% if(v_isgubun.equals("2")){ %>
            ��ܰ��� 
            <%} %> </td>
        </tr>
        <tr> 
          <td colspan="2" height="40" class="table_title"><b>���Ǻо�</b></td>
          <td height="16" colspan="6" class="table_02_2"> <%=v_subjclassnm%> </td>
        </tr>
        <tr> 
		  <% if(v_isgubun.equals("2")){ %>
          <td colspan="2" height="40" class="table_title" width="15%"><b>����</b></td>
          <td width="36%" class="table_02_2" colspan="2" > <%=v_name%></td>
          <td width="17%" class="table_title"> <b>�������</b></td>
          <td width="32%" colspan="3" class="table_02_2">
		  <% if (v_resno.length()==13) { %>
		  &nbsp;<%=v_resno.substring(0,2)%> �� <%=v_resno.substring(2,4)%> �� <%=v_resno.substring(4,6)%> ��
		  <% } %>
		  </td>
		  <% } else { %>
          <td colspan="2" height="40" class="table_title" width="15%"><b>����</b></td>
          <td width="36%" class="table_02_2" colspan="6" > <%=v_name%></td>
		  <% } %>
        </tr>
        <tr> 
          <td colspan="2" height="40" class="table_title"><b>�ּ�</b></td>
          <td class="table_02_2" colspan="6"> <% if (!v_post1.equals("")) { %>
            (<%=v_post1%>-<%=v_post2%>) 
            <% } %> <% if (!v_add1.equals("")) { %> <%=v_add1%> <% } %> </td>
        </tr>
        <tr> 
          <td colspan="2" height="40" class="table_title"><b>��ȭ��ȣ</b></td>
          <td colspan="2" class="table_02_2"> <%=v_phone%> </td>
          <td height="40" class="table_title"><b>�޴�����ȣ</b></td>
          <td colspan="3" class="table_02_2"> <%=v_handphone%> </td>
        </tr>
        <tr> 
          <td colspan="2" height="40" class="table_title"><b>�Ҽ�</b></td>
          <td colspan="2" class="table_02_2"> 
            <!-- ��ܰ��� �������� -->
            <%=v_comp%> </td>
          <td class="table_title"><b>E-mail</b></td>
          <td colspan="3" class="table_02_2"> 
            <!-- ��ܰ��� �������� -->
            <%=v_email%> </td>
        </tr>
        <tr> 
          <td colspan="2" height="40" class="table_title"><b>����</b></td>
          <td colspan="6" class="table_02_2"> <%=v_jik%> </td>
        </tr>
        <tr> 
          <td colspan="2" class="table_title"><b>�з�</b></td>
          <td colspan="6" class="table_02_2"> <%=StringManager.replace(v_academic,"\r","<br>")%> </td>
        </tr>
        <tr> 
          <td colspan="2" class="table_title"><b>���</b></td>
          <td colspan="6" class="table_02_2"> <%=StringManager.replace(v_career,"\r","<br>")%> </td>
        </tr>
        <tr> 
          <td colspan="2" class="table_title"><b>����</b></td>
          <td colspan="6" class="table_02_2"><%=StringManager.replace(v_book,"\r","<br>")%> </td>
        </tr>
      </table>
        <!----------------- ������ �� ----------------->
	 
	 	 
	 
	 
        <!----------------- ������������ �� ----------------->

		<br>
		
		<!-------------������ ����-------------------------->
 		<table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class=sub_title colspan=8><font size="5">�����̷���Ȳ</font></td>
        </tr>
      </table> <br>
        <!--------------������ ��---------------------------->
        
		<!--- ���� �̷º��� ���� -->
		<table width="97%" cellspacing="1" cellpadding="5"  border="1">
          <tr> 
            
          <td width="3%" class="table_title">NO</td>
            
          <td width="14%" align=center><b>�����ְ�</b></td>
            
          <td width="15%" align=center><strong>������</strong></td>
            
          <td width="13%" align=center><strong>�Ⱓ</strong></td>
            
          <td width="21%" align=center><strong>�� �� ��</strong></td>
          <td width="12%" align=center><strong>�����ð�/1����</strong></td>
          <td width="14%" align=center><strong>�ð��簭���<br>
            /hr</strong></td>
			
          <td width="8%" class="table_02_2"><strong>����</strong></td>
          </tr>
		  <% 
            for(i = 0; i < list2.size(); i++) {
				DataBox dbox2 = (DataBox)list2.get(i); %>
          <tr> 
            <td class="table_02_2"><%=i+1%></td>
            <td class="table_02_2"><%=dbox2.getString("d_inusercompnm")%></td>
            <td class="table_02_2"><%=dbox2.getString("d_subjnm")%></td>
            <td class="table_02_2"><%=dbox2.getString("d_edustart")%>~<%=dbox2.getString("d_eduend")%></td>
            <td class="table_02_2"><%=dbox2.getString("d_lessonnm")%></td>
            <td class="table_02_1_r" style="padding-right:10px;"><%=dbox2.getInt("d_eduhr")%></td>
            <td class="table_02_1_r" style="padding-right:10px;">&nbsp;\<%=dbox2.getInt("d_price")%></td>
            <td class="table_02_2">&nbsp;<%=dbox2.getDouble("d_grade")%></td>
          </tr>
		  <% } %>
		  
		  <% if (list2.size()==0) { %>
		  <tr><td colspan=8 align=center>�����̷� ������ �����ϴ�.</td></tr>
		  <% } %>
        </table>
		<!-- ���� �̷º��� �� -->

        <br>



      </td>
  </tr>
</table>



</body>
</html>
