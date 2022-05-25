<%
//**********************************************************
//  1. ��      ��: TUTOR HISTORY EXCEL
//  2. ���α׷���: za_TutorHistory_E.jsp
//  3. ��      ��: ���� �̷� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel; name=My_Excel; Charset=KSC5601" %> 
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%	response.setHeader("Content-Disposition", "inline; filename=TutorHistory.xls");   
	response.setHeader("Content-Description", "JSP Generated Data");
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process        = box.getString("p_process");    
    String v_userid         = "";   
    String v_name           = "";
    String v_comp           = "";
    String v_dept           = "";
    String v_handphone      = "";
    String v_email          = "";
    String v_isgubun        = "";
    String v_subj           = "";
    String v_subjnm         = "";
    String v_isgubun_value  = "";
    String v_sdesc          = "";
    String v_lectlevel      = "";
    int    v_lecture        =  0;    
    int     i               =  0;
    //DEFINED class&variable END

    ArrayList list = (ArrayList)request.getAttribute("tutorHistoryList");
%>
<html>
<head>
<title>���� �̷� Excel����</title>
</head>

<body>

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
        <!----------------- ������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="0" border="1">
          <tr> 
            <td align="center"><b>No</b></td>
            <td align="center"><b>�����</b></td>
            <td align="center"><b>�ֹε�Ϲ�ȣ</b></td>
            <td align="center"><b>ȸ��</b></td>
            <td align="center"><b>�μ�</b></td>
            <td align="center"><b>����ó</b></td>
            <td align="center"><b>E-mail</b></td>
            <td align="center"><b>������</b></td>
            <td align="center"><b>����</b></td>
            <td align="center"><b>����</b></td>
            <td align="center"><b>���</b></td>
          </tr>
        <%                                                                                                                                             
            for(i = 0; i < list.size(); i++) {
                TutorData data  = (TutorData)list.get(i);        
                v_userid        = data.getUserid();       
                v_name          = data.getName();         
                v_comp          = data.getComp();         
                v_dept          = data.getDept();         
                v_handphone     = data.getHandphone();    
                v_email         = data.getEmail();        
                v_isgubun       = data.getIsgubun();      
                v_subj          = data.getSubj();         
                v_subjnm        = data.getSubjnm();       
                v_sdesc         = data.getSdesc();        
                v_lectlevel     = data.getLectlevel();    
                v_lecture       = data.getLecture();                                   
                if( v_handphone.length() <= 3 )     {	v_handphone = "";       }
                if(v_isgubun.equals("1")){
                    v_isgubun_value = "�系����";
                }else if(v_isgubun.equals("2")){
                    v_isgubun_value = "��ܰ���";
                }                              
        %>                    
                    
          <tr> 
            <td><%= list.size() - i %></td>
            <td>
                <a href = "javascript:tutor_select('<%=v_userid%>')"><%=v_name%></a>
            </td>
            <td><%=v_userid%></td>
            <td><%=v_comp%></td>
            <td><%=v_dept%></td>
            <td><%=v_handphone%></td>
            <td><%=v_email%></td>
            <td><%=v_subjnm%></td>
            <td><%=v_sdesc%></td>
            <td><%=v_isgubun_value%></td>
            <td><%=v_lectlevel%></td>
          </tr>
          <%}%>          
        </table>
        <!----------------- ������ȸ �� ----------------->
      </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     
</table>
</body>
</html>
