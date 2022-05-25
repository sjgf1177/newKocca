<%
//**********************************************************
//  1. ��      ��: Ŭ���� FileToDB
//  2. ���α׷��� : za_cpeduResultinput.jsp
//  3. ��      ��: Ŭ���� FileToDB ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��: 2004/01/29
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "jxl.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.cp.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process   = box.getString("p_process");
	String v_searchtext = box.getString("p_searchtext");
	int v_pageno = box.getInt("p_pageno");
	String v_grcode = box.getString("s_grcode");
	String v_gyear = box.getString("s_gyear");
	String v_year2 = "";
	String v_cp = box.getString("p_cp");
	String v_subj     = box.getString("p_subj");
    String v_subjseq   = box.getString("p_subjseq");
    String v_subjseqgr = box.getString("p_subjseqgr");
    String v_subjseq2 = "";
    String v_grseq = "";
    String v_name = "";
    String v_realFileName = "";
    String v_newFileName = "";
    String v_userid = "";
    String v_notgraduetc = "";
	String v_comp = "";
	String v_jikwi = "";
	String v_jikwinm = "";
	String v_errmsg = "";	//�����޼���
	String v_sangdamtxt = "";
	int v_student = 0;	//��������
	int v_isErr = 1;	//��������
	int v_isErr1 = 1;	//��������1
	int v_isErr2 = 1;	//��������2
	int v_isErr3 = 1;	//��������3
	int v_isErr4 = 1;	//��������4
    int isOK1 = 0;
    int isOK2 = 0;
    int isOK3 = 0;
    int isOK4 = 1;
    int isOK5 = 1;
    int isOK6 = 1;
    int isOK7 = 0;
    String isOK_MSG = "";
    int isOK_Final = 1;
    
	String v_score1 = "";
	String v_score2 = "";
	String v_ispass = "";
	String v_ispass1 = "";
	String v_ispass2 = "";

    String  v_luserid   = box.getSession("userid");

    String  v_year = box.getString("p_year");

	if(v_process.equals("insertFileToDB")){

		//���� db��Ͻ�
	    v_realFileName = box.getString("p_realFile");
	    v_newFileName  = box.getString("p_newFile");
	}
	else{

		//�̸������
	    v_realFileName = box.getRealFileName("p_file");
	    v_newFileName  = box.getNewFileName("p_file");
	}


	
    Cell cell = null;
    Sheet sheet = null;
    Workbook workbook = null;

    CPStoldData   data = null;
    ArrayList  studentlist = new ArrayList();
    int i=0;

    DBConnectionManager connMgr = null;
    PreparedStatement pstmt_select = null;
    PreparedStatement pstmt_update = null;
    PreparedStatement pstmt_insert = null;
    PreparedStatement pstmt_update_student = null;
    PreparedStatement pstmt_select_member  = null;
    PreparedStatement pstmt_insert_sangdam = null;
    ResultSet rs = null;
    
    com.credu.cp.CPSubjseqData subjseqdata = null;
    
    //CPProposeBean proposebean = new CPProposeBean();
    CPFinishBean  finishbean  = new CPFinishBean();
	CPResultBean cpResult = new CPResultBean();
			
    boolean v_isexception = false;
    String   v_return_msg  = "";
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function goback() {
	history.back()
  //document.form2.action = "/servlet/controller.complete.FinishInputServlet";
  //document.form2.p_process.value = "listPage";
  //document.form2.submit();
}

function action(p_process) {  
  document.form2.action = "/servlet/controller.cp.CPEduStatusServlet";
  document.form2.p_process.value = p_process;                              //insertFileToDB,previewFileToDB
  document.form2.p_action.value = "go";
  document.form2.submit();
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
<form name="form2" method="post">
	<input type="hidden" name="p_process" value="">
	<input type="hidden" name="p_action" value="">
	<input type="hidden" name="p_searchtext" value="<%=v_searchtext%>">
	<input type="hidden" name="p_pageno" value="<%=v_pageno%>">
	<input type="hidden" name="s_grcode" value="<%=v_grcode%>">
	<input type="hidden" name="s_gyear" value="<%=v_gyear%>">
	<input type="hidden" name="p_year" value="<%=v_year%>">
	<input type="hidden" name="p_cp" value="<%=v_cp%>">
	<input type="hidden" name="p_subj" value="<%=v_subj%>">
	<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
	
  <input type="hidden" name="p_grcode"     value="<%=v_grcode%>">
  <input type="hidden" name="p_gyear"      value="<%=v_gyear%>">
  <input type="hidden" name="p_grseq"      value="">
  <input type="hidden" name="p_offsubj"    value="<%=v_subj%>">
  <input type="hidden" name="p_offsubjseq" value="<%=v_subjseq%>">
  
  <input type="hidden" name="p_realFile" value="<%=v_realFileName%>">
  <input type="hidden" name="p_newFile" value="<%=v_newFileName%>">
  
</form>
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../images/admin/cp/cp_tit_study.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <br>
      <!----------------- ���ε� �ڷ� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="left" height='35'>


 	  <table width="600" cellpadding="1" cellspacing="0" class="form_table_out">
        <tr> 
          <td><table width="600" cellpadding="0" cellspacing="0" class="form_table_bg">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td align=center> <table width=97% border="0" cellspacing="0" cellpadding="3">
                    <tr> 
                      <td width=20></td>
                      <td colspan="4">������ :  <strong><font color="4F9AE6"><%=GetCodenm.get_subjnm(v_subj)%>(<%=StringManager.toInt(v_subjseqgr)%>��)</font></strong></td>
                      <td width=19></td>
                    </tr>
<%
	if(v_process.equals("insertFileToDB")){
		//���� db��Ͻ�
%>
                    <tr> 
                      <td></td>
                      <td colspan="4" height=35><font color="4F9AE6">���ó���� �Ϸ�Ǿ����ϴ�.</font></td>
                      <td></td>
                    </tr>
<%
	}
	else{
		//�̸������
%>
                    <tr> 
                      <td></td>
                      <td colspan="4" height=35><font color="4F9AE6">�Ʒ��� ��� �����͸� Ȯ���Ͻð� �ϴ��� <FONT COLOR=RED>�����ư</FONT>�� Ŭ���ϼž߸� ���ó���� �Ϸ�˴ϴ�..</font></td>
                      <td></td>
                    </tr>
<%
	}
%>
                    <tr> 
                      <td height=8></td>
                      <td width="165" height=8></td>
                      <td width="164" height=8></td>
                      <td width="93" height=8></td>
                      <td width="119" height=8></td>
                      <td height=8></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
            </table></td>
        </tr>
      </table>
      
          <!--<b><font size="3">������ : <%=GetCodenm.get_subjnm(v_subj)%> / �����⵵ : <%=v_gyear%> / �������� : <%=v_subjseq%></font></b><br>-->
          </td>
        </tr>
<%  try {
        connMgr = new DBConnectionManager();
        connMgr.setAutoCommit(false);

        // �������� �˻�
        //v_year = proposebean.getSubjYear(connMgr, v_grcode, v_gyear, v_grseq, v_subj, v_subjseq);

        // �������� �������� ����(�̼�����,����ġ �� ��������)
        subjseqdata = finishbean.getSubjseqInfo(connMgr, v_subj, v_year, v_subjseq);



        // ��������Ÿ �б�
        workbook = Workbook.getWorkbook(new File(conf.getProperty("dir.upload.default")+v_newFileName));
        sheet = workbook.getSheet(0);


        //Workbook workbook = Workbook.getWorkbook(new File(savePath_temp + box.getNewFileName("filename")));
        //Sheet sheet = workbook.getSheet(0);
        //Cell myCell = null;
            
            
        //tz_student(����������) ���̺� update����
        pstmt_update_student = finishbean.getPreparedStatement(connMgr, "SUBJECT_STUDENT", "update_status");
        
        //tz_sangdam  ������̺� insert����
        pstmt_insert_sangdam = finishbean.getPreparedStatement(connMgr, "SUBJECT_SANGDAM", "insert");
        
        //tz_stold(�������̺�)  ���̺��� ������� ����.
        //pstmt_select = finishbean.getPreparedStatement(connMgr, "SUBJECT_STOLD", "select");        
        //pstmt_update = finishbean.getPreparedStatement(connMgr, "SUBJECT_STOLD", "update");        
        //pstmt_insert = finishbean.getPreparedStatement(connMgr, "SUBJECT_STOLD", "insert");        
        
        //�ش� �������� select ����(name, comp, jikup)
        pstmt_select_member = finishbean.getPreparedStatement(connMgr, "MEMBER", "select");
        
        
%>
        <tr>
          <td align="left"><br>
			<table width="97%" cellpadding="3" bgcolor="#cccccc" border="0" cellspacing="1">
              <tr bgcolor="#eeeeee" align="center">
                <td>����</td>
                <td>��������</td>
                <td>���</td>
                <td>����</td>
                <td>������</td>
                <td>��</td>
                <td>Report</td>
                <!--td>÷������Score</td>
                <td>����ġ����Score</td>
                <td>���Ῡ��</td>
                <td>�Ǽ��Ῡ��</td>
                <td>���̼�����</td-->
              </tr>
<%
		//�������� ��ȸ
		v_student = cpResult.selectStudentCnt(connMgr, v_year, v_subj, v_subjseq);
		
		if(v_student != sheet.getRows()-2)	v_isErr = 0;	//���������� Ʋ���� ������ �ȵǵ��� �Ѵ�.
		
		
		int v_cnt = 1;
		
        for (i=2; i < sheet.getRows() ; i++ ) {
            
            
            //�����⵵ �� ������ �´��� Ȯ���Ѵ�.
            v_year2 = sheet.getCell(0,i).getContents();
            //v_subjseq2 = sheet.getCell(2,i).getContents();
            v_subjseq2 = box.getString("p_subjseq");
            v_sangdamtxt = sheet.getCell(8,i).getContents();
            
            if(!v_year2.equals(v_year)){
            	isOK4 = 0;
            	v_isErr1 = 0;
            	v_errmsg = "�����⵵����";
            }
            else isOK4 = 1;

            if(StringManager.toInt(v_subjseq2) != StringManager.toInt(v_subjseq)){
            	isOK5 = 0;
            	v_isErr2 = 0;
            	v_errmsg = "��������";
            }
            else isOK5 = 1;
            
            
            //���� �������������� üũ
            v_userid = sheet.getCell(3,i).getContents();
            
            //�ҹ��ڷκ���
            v_userid = v_userid.toLowerCase();
            
			isOK6 = cpResult.selectStudent( connMgr, v_year, v_subj, v_subjseq, v_userid);
			
			
			
			if(isOK6 == 0){
            	v_isErr3 = 0;
            	v_errmsg = "������ �ƴ�";
            }

            pstmt_select_member.setString( 1, v_userid.toLowerCase());
            rs =  pstmt_select_member.executeQuery();
            
            if(rs.next()) {                    
				v_name = rs.getString("name");
				v_comp = rs.getString("comp");
				v_jikwi = rs.getString("jikwi");
				v_jikwinm = rs.getString("jikwinm");
            }
            else{
            	v_name = "";
            	v_comp = "";
            	v_jikwi = "";
            	v_jikwinm = "";
            }
            
            data = new CPStoldData();
	            
	            
            if(isOK4*isOK5*isOK6 > 0){
            
	            data.setSubj   (v_subj);
	            data.setYear   (v_year);
	            data.setSubjseq(v_subjseq);
				data.setWstep    (subjseqdata.getWstep());
	            data.setWmtest   (subjseqdata.getWmtest());
	            data.setWftest   (subjseqdata.getWftest());
	            data.setWhtest   (subjseqdata.getWhtest());
	            data.setWreport  (subjseqdata.getWreport());
	            data.setWact     (subjseqdata.getWact());
	            data.setWetc1    (subjseqdata.getWetc1());
	            data.setWetc2    (subjseqdata.getWetc2());
	            data.setGradscore(subjseqdata.getGradscore());
	            data.setGradstep (subjseqdata.getGradstep());
	            data.setEdustart (subjseqdata.getEdustart());
	            data.setEduend   (subjseqdata.getEduend());
            
	            data.setUserid(v_userid); // ���̵�
	            data.setScore(0);
	            data.setTstep(Double.valueOf(sheet.getCell(5,i).getContents()).doubleValue());  // ������(�⼮������)
	            data.setMtest(0);  // �߰�������
	            data.setFtest(Double.valueOf(sheet.getCell(6,i).getContents()).doubleValue());  // ����������
	            data.setHtest(0);  // ����������
	            data.setReport(Double.valueOf(sheet.getCell(7,i).getContents()).doubleValue()); // ����Ʈ����
	            data.setAct(0);	//Activity ����
	            data.setEtc1(0);	//��Ÿ1 ����
	            data.setEtc2(0);	//��Ÿ2 ����                        
	            data.setScoreFile(0);	//���� ����
	            data.setAvtstep(0);
	            data.setAvmtest(0);
	            data.setAvftest(0);
	            data.setAvhtest(0);
	            data.setAvreport(0);
	            data.setAvact(0);
	            data.setAvetc1(0);
	            data.setAvetc2(0);
	            
				data.setName(v_name);
				data.setComp(v_comp);
				data.setJik(v_jikwinm);
				//out.println(v_userid+"<br>");
				//����ġ ���� score ���
				finishbean.calc_subj_score(connMgr, data);
				
				//out.println(" data.getAvtstep : " +  data.getAvtstep());
			    //out.println(" data.getAvreport : " +  data.getAvreport());
			    //out.println(" data.getAvmtest : " +  data.getAvmtest());
			    //out.println(" data.getAvftest : " +  data.getAvftest());
			    //out.println(" data.getAvact : " +  data.getAvact());
			    //out.println(" data.getAvetc1 : " +  data.getAvetc1());
			    //out.println(" data.getAvetc2 : " +  data.getAvetc2()+"<br>");
%>
              <tr bgcolor="#ffffff" align="center">
                <td><%= v_cnt++%></td>
                <td>����</td>
                <td><%=data.getUserid()%></td>
                <td><%=data.getName()%></td>
                <td><%=String.valueOf(data.getTstep())%></td>
                <td><%=String.valueOf(data.getFtest())%></td>
                <td><%=String.valueOf(data.getReport())%></td>
              </tr>
<%          
           //if(true) {
           //  System.out.println("123467890-1234567890");
           //  return;
           //}

				//������ó��
				if (v_process.equals("insertFileToDB") && v_isErr > 0) {
	
	                // 1.tz_student update 
	                isOK2 = finishbean.update_subjstatus_score(pstmt_update_student, data, v_luserid);
	                //out.println("isOK2====>>>>>"+isOK2);
	                if(v_sangdamtxt.trim().equals("") || v_sangdamtxt == null){
	                  isOK7 = finishbean.insert_sangdam(connMgr, pstmt_insert_sangdam, data, v_luserid, v_sangdamtxt);
	                }else{
	                  isOK7 = 1;
	                }

	                isOK_MSG = "" + isOK2;
	                if(isOK_MSG.equals("0")){
	                	isOK_Final = 0;
	                }
	            }
			}
			
			else{
%>
              <tr bgcolor="#ffffff" align="center">
                <td><%= v_cnt++%></td>
                <td><font color="red"><%= v_errmsg%></font></td>
                <td><%=v_userid%></td>
                <td><%=v_name%></td>
                <td><%=sheet.getCell(5,i).getContents()%></td>
                <td><%=sheet.getCell(6,i).getContents()%></td>
                <td><%=sheet.getCell(7,i).getContents()%></td>
              </tr>
<%
			}
        }
%>
			</table>
		  </td>
		</tr>
	  </table>
<%
        if (v_process.equals("insertFileToDB")) {

			//�ܺα���������� ���ϵ�� ��������
			//isOK3 = cpResult.update_cpresult(v_year, v_subj, v_subjseq, v_realFileName, v_newFileName);
			
			isOK3 = cpResult.update_cpstatus(connMgr, v_year, v_subj, v_subjseq, v_realFileName, v_newFileName, v_luserid);
			
        }
        
      	//----------------- ���ε� �ڷ� �� -----------------      	
		} catch (Exception e) {
                        v_isexception = true;
                        v_return_msg = e.getMessage();
%>
        <br>
        <!----------------- �����޼��� ���� ----------------->
        <table cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" ><font color='red'><%=i+1%>��°���� �����Դϴ�.</font></td>
          </tr>
          <tr>
            <td align="left" >���� �޼��� : <%=e.getMessage()%></td>
          </tr>
        </table>
        <!----------------- �����޼��� �� ----------------->
<%      } finally {
						//÷�����ϻ���(�̸������� �����ϹǷ� �������� ����)
						//FileManager.deleteFile(v_newFileName);
                        if(pstmt_select != null) { try { pstmt_select.close(); } catch (Exception e) {} }
                        if(pstmt_update != null) { try { pstmt_update.close(); } catch (Exception e) {} }
                        if(pstmt_insert != null) { try { pstmt_insert.close(); } catch (Exception e) {} }
                        if(pstmt_update_student != null) { try { pstmt_update_student.close(); } catch (Exception e) {} }
                        if(pstmt_select_member  != null) { try { pstmt_select_member.close(); } catch (Exception e) {} }
                
                        if(connMgr != null) { 
                                try { 
                                        if (v_isexception) {
                                                connMgr.rollback();
                                        } else {
                                                connMgr.commit();
                                        }
                                        connMgr.setAutoCommit(true);
                                        connMgr.freeConnection(); 
                                } catch (Exception e10) {} 
                        }
        }
%>
      <br>
      <!----------------- ���, �̸����� ��ư ���� ----------------->
      <table width="630" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
<%
	if(v_process.equals("insertFileToDB")){
		//���� db��Ͻ�
%>
          <a href="javascript:action('')"><img src="/images/admin/button/btn_list.gif"  border="0"></a>
<%
	}
	else{
		//�̸������
		if(!(v_isErr == 0 || v_isErr1*v_isErr2*v_isErr3*v_isErr4 == 0)){
%>
          <a href="javascript:action('insertFileToDB')"><img src="/images/admin/button/btn_apply.gif"  border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;
<%
		}
%>
          <a href="javascript:history.back()"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a>
<%
	}
%>
          </td>
        </tr>
      </table>
      <!--
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" ><a href="javascript:goback()"><img src="/images/admin/homepage/list1_butt.gif" border="0"></a></td>
        </tr>
      </table>
      -->
      <!----------------- ���, �̸����� ��ư �� ----------------->
      <br>
      <br>
      <br>
      <!----------------- ���ǻ��� ���� ----------------->
    </td>
  </tr>
</table>
<%
		if(v_isErr == 0){
%>
<script language="javascript">
alert("���������� ���ε��� �������ϰ� ��ġ���� �ʾ� ����� �� �����ϴ�.\n\nȮ�μ����� �ٽ� ���ε����ּ���.\n\n���� �������� : <%=v_student%>\n������� �������� : <%=sheet.getRows()-2%>");
</script>
<%		
		}
		else if(v_isErr4 == 0){
%>
<script language="javascript">
alert("����� ���������� ���Ῡ�ο� ������ �־� ����� �� �����ϴ�.\n\n���Ῡ�ΰ� ���������� ǥ�õ� �κ��� �ٽ� Ȯ�μ����� �ٽ� ���ε����ּ���.");
</script>
<%		
		}
		else if(v_isErr1*v_isErr2*v_isErr3 == 0){
%>
<script language="javascript">
alert("����� ���� ���Ͽ� ������ �־� �������� �Ұ��մϴ�. �޼����� Ȯ���Ͻð� �ٽ� ���ε����ּ���.");
</script>
<%		
		}
        else if(v_process.equals("insertFileToDB")) {
			if(isOK_Final*isOK3 > 0){
%>
<script language="javascript">
alert("���������� ����Ǿ����ϴ�.");
</script>
<%
        	}
        	else{
%>
<script language="javascript">
alert("������������ ����ó�� �Ǿ����ϴ�.\n\n�Ϻ� ���������Ͱ� ������� �ʾҽ��ϴ�.");
</script>
<%
        	}
		}
%>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
