<%
/**
 * file name : za_Finish_E.jsp
 * date      : 2005/10
 * programmer:
 * function  : ����ó�� ����Ʈ �� ó��
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>


<%
	response.setHeader("Content-Disposition", "inline; filename=FinishList.xls");   
	//response.setHeader("Content-Description", "JSP Generated Data");
	
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getStringDefault("s_grseq","ALL");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
	  String  v_action       = box.getString("p_action");

   	ArrayList list = null;
   	list = (ArrayList)request.getAttribute("CompleteListExcel");
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td>
      <table border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
        <tr>
          <td align="center" bgcolor="#FFFFFF">

            <!----------------- ���հ��� ���κ� ����ó�� ���� ----------------->
			<table border="1" cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td width="5%" class="table_title" rowspan="2">No</td>
            <td class="table_title" rowspan="2">������</a></td>            
            <td width="10%" class="table_title" rowspan="2">�н��Ⱓ</td>
 			      <td width="7%" class="table_title" rowspan="2">�Ѱ����</td>
						<td width="5%" class="table_title" rowspan="2">�԰�<br>�ο�</td>
						<td width="5%" class="table_title" rowspan="2">����<br>�ο�</td>
						<td width="7%" class="table_title" rowspan="2">����<br>����Ƚ��</td>
						<td width="7%" class="table_title" rowspan="2">���ΰԽðǼ�<br>(����/�ڷ�/���)</td>
						<td width="7%" class="table_title" colspan="2">����Ʈ</td>
						<td width="7%" class="table_title" colspan="2">Q & A</td>
						<td width="6%" class="table_title" rowspan="2">�����</td>
            <td width="7%" class="table_title" rowspan="2">����<br>ó����</td>
          </tr>
          <tr> 
            <td class="table_title">����</td>
            <td class="table_title">����</td>            
            <td class="table_title">����</td>
            <td class="table_title">������</td>
          </tr>
<%                                    
	        for( i = 0 ; i < list.size() ; i++ ){
					DataBox dbox = (DataBox)list.get(i);		  
							
					v_subj = dbox.getString("d_subj");  
					v_subjnm = dbox.getString("d_subjnm");  
					v_year = dbox.getString("d_year");
					v_subjseq = dbox.getString("d_subjseq");
					v_seq = dbox.getInt("d_seq");
					v_tuuserid = dbox.getString("d_tuserid");
					v_grayncnt  = dbox.getInt("d_grayncnt");
					v_isclosed  = dbox.getString("d_isclosed");
					v_edustart  = dbox.getString("d_edustart");
					v_eduend  = dbox.getString("d_eduend");
					
					if(v_isclosed.equals("Y")){
							v_grayntxt = String.valueOf(v_grayncnt);
					}else{
					        v_grayntxt = "������";
				    }
	%>
			        <tr height="30"> 
			            <td class="table_02_1"><%=list.size()-i%></td>
			            <td class="table_02_2"><%=dbox.getString("d_subjnm")%></td>
									<td class="table_02_1"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")+" ~ "+FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
			            <td class="table_02_1"><%=dbox.getString("d_ctutorcnt")%></td>
			            <td class="table_02_1"><%=dbox.getString("d_stucnt")%></td>
			            <td class="table_02_1"><%=v_grayntxt%></td>
			            <td class="table_02_1"><%=dbox.getString("d_logincnt")%></td>
			            <td class="table_02_1"><%=dbox.getInt("d_gongcnt")+dbox.getInt("d_datacnt")+dbox.getInt("d_toroncnt")+dbox.getInt("d_torontpcnt")%></td>
			            <td class="table_02_1"><%=dbox.getString("d_repcnt")%></td>
			            <td class="table_02_1"><a href="javascript:projectlist_select('<%=v_subj%>','<%=v_subjnm%>','<%=v_year%>','<%=v_subjseq%>');"><%=dbox.getString("d_noscorecnt")%><a></td>
			            <td class="table_02_1"><%=dbox.getString("d_qcnt")%></td>
									<td class="table_02_1">
										<a href="javascript:whenQnaList('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>');"><%=dbox.getString("d_noanscnt")%><a></td>
			            <td class="table_02_1"><%=dbox.getString("d_pay")%></td>
			            <td class="table_02_1"><%=v_isclosed.equals("Y")?FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy/MM/dd"):""%></td><!--����ó���� Į���� ���� LDATE ��� ������-->
			         </tr>
	<%
         }
         %>
			</table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
