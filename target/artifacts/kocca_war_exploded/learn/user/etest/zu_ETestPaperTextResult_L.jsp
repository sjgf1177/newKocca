<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.etest.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

        ArrayList    blist = (ArrayList)request.getAttribute("UserPaperResult");

        ArrayList    blist2 = (ArrayList)request.getAttribute("UserPaperResult2");
		DataBox v_box = (DataBox)blist2.get(0);
		Vector v_answer = (Vector)blist2.get(1);
		Vector v_corrected = (Vector)blist2.get(2);
		
		String v_isopenanswer = v_box.getString("d_isopenanswer");
		String v_isopenexp = v_box.getString("d_isopenexp");

%>
<html>
<head>
<title>::: ���信���ý����� :::</title>    
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<!--<link rel="STYLESHEET" type="text/css" href="/css/style_myhome.css">-->
 <link href='/css/user_style_study.css' rel='stylesheet' type='text/css'> 
<script src="/script/cafe_select.js" language="JavaScript"></script>
</head>
<body leftmargin='0' topmargin='0' bottommargin='0' marginwidth='0' marginheight='0' onload="opener.EtestReload();">
<%
if(!(v_box.getString("d_isopenexp")).equals("Y")&& !(v_box.getString("d_isopenanswer")).equals("Y")){
%>	
<script language="JavaScript">self.close();</script>
<% }else{ %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align=left>
<!----------------- Ÿ��Ʋ   ---------------->                                           
  <tr>                                                                                   
    <td >  &nbsp;  &nbsp; &nbsp; <img src='/images/user/etest/eTest_pop01.gif' alt="E-TEST���"></td>
  </tr>                                                                                  
  <tr>                                                                                   
    <td>&nbsp;</td>                                                                      
  </tr>                                                                                  
<!----------------- Ÿ��Ʋ ��  ---------------->                                         

  <tr>
    <td align="left"> <table border="0" cellpadding="0" cellspacing="0" width="630">
        <tr> 
          <td><table width="100%" border="0" cellspacing="1" cellpadding="0" class=testbox_out>
              <tr> 
                <td class=testbox_con>[�׽�Ʈ��] : <%=v_box.getString("d_etesttext")%> / [����] : <%=v_box.getString("d_year")%> <br>
                    ���ýð� : <%=FormatDate.getFormatDate( v_box.getString("d_started"),"yyyy-MM-dd HH:mm:ss")%> ~ <%=FormatDate.getFormatDate( v_box.getString("d_ended"),"yyyy-MM-dd HH:mm:ss")%></td>
              </tr>
            </table></td>
        </tr>
		<tr> 
          <td height=8></td>
        </tr>
		<tr> 
          <td height=8></td>
        </tr>
<% 
    //if((v_box.getString("d_isopenanswer")).equals("Y")){
    if((v_box.getString("d_isopenexp")).equals("Y")){

	for (int i=0; i < blist.size(); i++) {
        ArrayList list = (ArrayList)blist.get(i);  
        DataBox dbox = (DataBox)list.get(0);  
%>
        <tr> 
          <td><table width="630" border="0" cellspacing="1" cellpadding="0" class=boardskin1_out>
              <tr> 
                <td colspan="2" class=boardskin1_textb_q><font color="blue"><% if("Y".equals(v_isopenexp)){ %><% if(((String)v_corrected.get(i)).equals("1")){ %>(O)<% }else{ %>(X)<% } %><% } %></font>&nbsp;<%="["+String.valueOf(i+1)+"]" + dbox.getString("d_etesttext")%></td>
                <td width="49" class=boardskin1_textb>���̵�</td>
                <td width="41" class=boardskin1_textb>����</td>
              </tr>
<%      if (dbox.getString("d_etesttype").equals(ETestBean.OBJECT_QUESTION)) {   // ���ϼ��� 
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>

              <tr> 
                <td  class=boardskin1_textn>
				<%if(dbox.getString("d_isanswer").equals("Y")){
				      if(dbox.getInt("d_selnum") < 10){
                %>
				<img src="/images/user/etest/Qnum0<%=dbox.getInt("d_selnum")%>_check.gif">����					     
				<%
					  }else{       
				%>
				<img src="/images/user/etest/Qnum<%=dbox.getInt("d_selnum")%>_check.gif">		
				<%}%>
				<%}else{
				      if(dbox.getInt("d_selnum") < 10){
                %>
				<img src="/images/user/etest/Qnum0<%=dbox.getInt("d_selnum")%>.gif">					     
				<%
					  }else{       
				%>
				<img src="/images/user/etest/Qnum<%=dbox.getInt("d_selnum")%>.gif">		
				<%}%>
				<%}%>
				</td>
                <td width="497" class=boardskin1_textn>
				<%
					int v_answersel = 0;
				    if(!((String)v_answer.get(i)).equals("")){
				    	try { 
				      v_answersel = Integer.parseInt((String)v_answer.get(i));
				     	} catch (Exception e10) {}	 
				    }
					if(dbox.getInt("d_selnum") == v_answersel) {
				%>
				<font color = 'red'><%=dbox.getString("d_seltext")%></font>
				<%}else{%>
				<%=dbox.getString("d_seltext")%>
				<%}%>
				</td>
                <%if(j==0){%>
                <td rowspan="<%=list.size()%>" class=skin_tb1><%=dbox.getString("d_levelsnm")%></td>
                <td rowspan="<%=list.size()%>" class=skin_tb1>
				<%if(((String)v_corrected.get(i)).equals("1")){%>
				<%=v_box.getInt("d_etestpoint")%>��
				<%}else{%>0��<%}%>
				</td>
                <%}%> 
              </tr>
<%              } 
            }
        } else if (dbox.getString("d_etesttype").equals(ETestBean.SUBJECT_QUESTION)) {  // �ְ���  %>
              <tr> 
                <td  class=boardskin1_textn>���δ�</td>
                <td width="497" class=boardskin1_textn><font color='blue'><%=(String)v_answer.get(i)%></font></td>
                <td rowspan="<%=list.size()+1%>" class=skin_tb1><%=dbox.getString("d_levelsnm")%></td>
                <td rowspan="<%=list.size()+1%>" class=skin_tb1>
				<%if(((String)v_corrected.get(i)).equals("1")){%>
				<%=v_box.getInt("d_etestpoint")%>��
				<%}else{%>0��<%}%>
				</td>
              </tr>
<%
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { 
%>
              <tr> 
                <td  class=boardskin1_textn>����<%=j+1%></td>
                <td width="497" class=boardskin1_textn><%=dbox.getString("d_seltext")%></td>
				</td>
              </tr>
<%
				}
		   }
%>
<%             
            
        } else if (dbox.getString("d_etesttype").equals(ETestBean.MULTI_QUESTION)) {  // �ٴ��
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
              <tr> 
                <td  class=boardskin1_textn></td>
                <td width="497" class=boardskin1_textn></td>
                <td rowspan="4" class=skin_tb1></td>
                <td rowspan="4" class=skin_tb1></td>
              </tr>

<%         }
		}
	 }
%>
<%
    //if((v_box.getString("d_isopenexp")).equals("Y")){	
%>
              <tr> 
                <td  class=skin_tb1  width="49">�ؼ�</td>
                <td colspan="4" class=skin_tb1 align="left">
				<%/* if(((String)v_corrected.get(i)).equals("1")){%>
				<font color="red">�¾ҽ��ϴ�.</font><br>
				<%}else{%><font color="red">Ʋ�Ƚ��ϴ�.</font><br><%} */ %>
				<%=dbox.getString("d_exptext")%></td>
              </tr>
<%
     //}	
%>
            </table></td>
        </tr>
		<tr> 
          <td height=6></td>
        </tr>
<%
	}
%>	
		<tr> 
          <td height=15><table width="630" border="0" cellspacing="1" cellpadding="0" class=boardskin1_out>
              <tr> 
                <td width="532" class=boardskin1_textb_r>��</td>
                <td width="96" class=apoint_ok><%=v_box.getInt("d_score")%></td>
              </tr>
            </table></td>
        </tr>
<% 

//�ؼ����� Y if end 
 } else if((v_box.getString("d_isopenanswer")).equals("Y")){
//���� Y if d_isopenanswer
%>
		<tr> 
          <td height=15><table width="630" border="0" cellspacing="1" cellpadding="0" class=testbox_out>
              <tr> 
                <td width="532"  class=testbox_con>���� : <%=v_box.getInt("d_score")%></td>
              </tr>
            </table></td>
        </tr>
<%

	
 }
%>
		<tr> 
          <td height=15></td>
        </tr>
        <tr> 
          <td class=dotline height=1></td>
        </tr>
		<tr> 
          <td height=15></td>
        </tr>
        <tr> 
          <td align="right"><table border="0" cellspacing="0" cellpadding="0">
                <td><a href="javascript:self.close()"><img src="/images/user/study/close_butt.gif" alt="�ݱ�" border="0"></a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<% }%>
</body>
</html>
