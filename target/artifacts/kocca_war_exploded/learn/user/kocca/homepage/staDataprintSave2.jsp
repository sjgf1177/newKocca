<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>

<%@ page import com.credu.homepage.* %>
<%@ page import com.credu.common.* %>
<%@ page import com.credu.system.* %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	DBConnectionManager dbconnectionmanager = null;
	ListSet listset = null;
    String s = "";

	RequestBox box = RequestManager.getBox(request);
	
	String strColumnCount = box.getString("pColumnCount");
	String strDataQuery = box.getString("pDataQuery");
	String strAction = box.getString("pAction");


%>


<html>
<head>
<title>����ڷ� ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<script language="JavaScript">
<!--
	function getQuery() {
		var frm = document.frmList;

		if(frm.pDataQuery.value.toUpperCase().indexOf("INSERT ") >= 0) {
			alert("INSERT���� ����� �� �����ϴ�.");
			return;

		} else if(frm.pDataQuery.value.toUpperCase().indexOf("UPDATE ") >= 0) {
			alert("UPDATE���� ����� �� �����ϴ�.");
			return;

		} else if(frm.pDataQuery.value.toUpperCase().indexOf("DELETE ") >= 0) {
			alert("DELETE���� ����� �� �����ϴ�.");
			return;

		} else if(frm.pDataQuery.value.toUpperCase().indexOf("SELECT") != 0) {
			alert("�ݵ�� SELECT������ �����ؾ� �մϴ�.");
			return;

		} else {
			frm.pAction.value = "SELECT";
			frm.submit();
		}

	}
//-->
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="30" topmargin="30" rightmargin="0" marginwidth="11" marginheight="30">

<table border="0" cellspacing="0" cellpadding="0">		
	<tr>
		<td>	
			<!-----Ÿ��Ʋ----->
   	        <table border=0 cellspacing=0 cellpadding=0 class="TABLE70B">
   	        	<tr height=2>
   	            	<td colspan=7 class="TLINE"></td>
   	            </tr>
   	            <tr height=23>
   	            	<td width=1 class="TLINE"></td>
   	                <td width=100 class="TITNEW"></td>
   	                <td width=5 bgcolor=#FFFFFF></td>
   	                <td align=center bgcolor=#FFFFFF>
						<font color="#003366"><b>����ڷ� ���</b></font></td>
   	                <td width=5 bgcolor=#FFFFFF></td>
   	                <td width=100 class="TITNEW"></td>
   	                <td width=1 class="TLINE"></td>
   	            </tr>
   	            <tr height=4>
   	                <td colspan=7 class="TLINE"></td>
   	            </tr>
   	        </table><br><br>
			<!-----Ÿ��Ʋ ��----->
           	
			<!--------�˻�-------->
			<table border="0" cellspacing="1" cellpadding="0" class="TABLE70B">
				<tr>
					<td colspan="2"></td>
				</tr>
               	<tr height=30 class="LISTNEW">
                   	<td class="SUB12L">����</td>
                   	<td class="SUB58R" align="left">
						<font color="red">
						* SELECT ���� ���డ���մϴ�. INSERT, UPDATE, DELETE���� ������ �� �����ϴ�.<br>
						* '�÷� ����'�� �ݵ�� �Է��ϼž� �մϴ�.<br>
						* SELECT�� �÷� ���� '�÷� ����'�� �ݵ�� ��ġ�ؾ� �մϴ�.<br>
						* �������� �߸��� ��� �����ͺ��̽��� LOCK�� �ɸ� �� �����Ƿ� �����Ͻñ� �ٶ��ϴ�.<br>
						* ���� ����Ÿ�� �������� ��� �ð��� ���� �ɸ� �� �ֽ��ϴ�.
						</font>  	                            	
                   	</td>
               	</tr>             
               	<tr>
					<td colspan="2"></td>
				</tr>
			</table><br><br>
          	<!--------�˻���-------->
<form name=frmList method=post action="staDataprintSave2.jsp">
<input type="hidden" name="pAction" value = "" >
			<!--------����-------->			
			<table border="0" cellspacing="1" cellpadding="0" class="TABLE70B">
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr height="25">
					<td class="SUB12L">�÷� ����</td>
					<td class="SUB58R" align=left><input type=text name="pColumnCount" value="1" class="COL_NUM" maxlength="3" ></td>
				</tr>

				<tr>
					<td class="SUB12L">������</td>
					<td class="SUB58R"><textarea name=pDataQuery rows=15 cols=75>SELECT</textarea></td>
				</tr>	
				<tr>
					<td colspan="2"></td>
				</tr>				
			</table>
           	<!--------������-------->
            <br><br>

            <!----- ��ư ----->
			<table border="0" cellspacing="0" cellpadding="0" class="TABLE70F">
				<tr height=25>
					<td align="right">
			            <a href="javascript:getQuery();"> ���� </a>
			    	</td>
				</tr>
			</table>    	
          	<!-----��ư �� ----->
            
		</td>
	</tr>
</table>
</form>
<%
	if( strAction.equals("SELECT") ) {

	try
        {
            dbconnectionmanager = new DBConnectionManager();
            s = strDataQuery;

			listset = dbconnectionmanager.executeQuery(s);

%>	
			<table border="0" cellspacing="1" cellpadding="0" class="TABLE70B">
				<tr>
					<td colspan="<%= strColumnCount %>"></td>
				</tr>
				<tr height="25" class="LISTNEW">
					<td width="30">��ȣ</td>
				<% for(int i = 0; i < Integer.parseInt(strColumnCount); i++) { %>
					<td><%= i+1 %></td>
				<% } %>
				</tr>

				<% 
					if(listset != null ) { 
						int j = 0;

						while(listset.next()) {
				%>
				<tr height="25" class="LIST1"> 
						<td><%= j+1 %></td>
				<%
							for(int i = 0; i < Integer.parseInt(strColumnCount); i++) { 
				%>
						<td><%= listset.getString(i+1) %></td>
				<% 
							}

							j++;
				%>
				</tr> 
				<%
						}
					} 
				%>

				<tr>
					<td colspan="<%= strColumnCount %>"></td>
				</tr>				
			</table>
           	<!--------������-------->
            <br><br>
<%
        }
        catch(Exception exception1)
        {
            //ErrorManager.getErrorStackTrace(exception1, requestbox, s);
            throw new Exception("sql = " + s + "\r\n" + exception1.getMessage());
        }
        finally
        {
            if(listset != null)
                try
                {
                    listset.close();
                }
                catch(Exception _ex) { }
            if(dbconnectionmanager != null)
                try
                {
                    dbconnectionmanager.freeConnection();
                }
                catch(Exception _ex) { }
        }
		} else {
		}
%>
		</td>
	</tr>
</table>			

</body>
</html>

