<%
/**
 * file name : za_DamunCommonMemberFilToDB_P.jsp
 * date      : 2003/09/03
 * programmer:
 * function  : �ٸ��� ����� �ϰ�ó��
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "jxl.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.multiestimate.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    DBConnectionManager connMgr = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
    ResultSet rs = null;
	ResultSet rs2 = null;
    String sql1 = "";
    String sql2 = "";
	String sql3 = "";
    int isOk = 0;
    int cnt = 0;
    int next = 0;
    int i    = 0;

    String  v_realFileName = box.getRealFileName("p_file");
    String  v_newFileName  = box.getNewFileName("p_file");
    String s_userid = box.getSession("userid");

    String  ss_upperclass  = box.getStringDefault("s_upperclass","ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass","ALL");
    String  ss_subjcourse  = box.getStringDefault("s_subjcourse","ALL");

    String  ss_grcode       = box.getString("s_grcode");
	String  ss_gyear       = box.getString("s_gyear");
	int  ss_damunpapernum       = box.getInt("s_damunpapernum");
    String  ss_subjseq    = box.getString("s_subjseq");
	
    String  v_action     = box.getString("p_action");
    String  v_process = box.getString("p_process");

    String  v_userid = "";

    Cell cell = null;
    Sheet sheet = null;
    Workbook workbook = null;

%>
<html>
<head>
<title>�ٸ��� ����� ȭ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function list() {
        opener.ReloadPage('go');
        document.form1.action = "/servlet/controller.multiestimate.DamunCommonMemberServlet";
        document.form1.p_process.value = "DamunMemberFileToDB";
        document.form1.submit();
    }

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<!----------------- form ���� ----------------->
<form name="form1" method="post" >
    <input type="hidden" name="p_process"    value="">
    <input type="hidden" name="p_action"     value="<%=v_action%>">

        <input type="hidden" name="s_grcode"       value="<%=ss_grcode%>">
        <input type="hidden" name="s_subj"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="s_subjcourse"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="s_gyear"       value="<%=ss_gyear%>">
        <input type="hidden" name="s_subjseq"    value="<%=ss_subjseq%>">
        <input type="hidden" name="s_upperclass"       value="<%=ss_upperclass%>">
        <input type="hidden" name="s_damunpapernum"       value="<%=ss_damunpapernum%>">
        <input type="hidden" name="p_grcode"       value="<%=ss_grcode%>">
        <input type="hidden" name="p_subj"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="p_gyear"       value="<%=ss_gyear%>">
        <input type="hidden" name="p_subjseq"    value="<%=ss_subjseq%>">
        <input type="hidden" name="p_upperclass"       value="<%=ss_upperclass%>">
        <input type="hidden" name="p_damunpapernum"       value="<%=ss_damunpapernum%>">


<table width="770" border="0" cellspacing="0" cellpadding="0" height="580">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td background="/images/admin/multiestimate/title_bg.gif"><img src="/images/admin/multiestimate/m_title08.gif" width="151" height="36" border="0"></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->

        <br>

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
<%
        int v_count = 2;

        try {
            String v_dirKey = conf.getDir(conf.getProperty("dir.upload"), FileManager.getServletName(v_newFileName));
            workbook = Workbook.getWorkbook(new File(conf.getProperty("dir.upload." + v_dirKey), v_newFileName));
            sheet = workbook.getSheet(0);

           connMgr = new DBConnectionManager();
           connMgr.setAutoCommit(false);

            if (v_process.equals("insertFileToDB")) {

            sql1 = "select userid from TZ_DAMUNMEMBER";
            sql1+=  " where subj = ? and grcode = ? and year = ? and subjseq = ? and damunpapernum = ? and userid = ?  "; 
            pstmt1 = connMgr.prepareStatement(sql1);   
            
            sql2 =  "insert into TZ_DAMUNMEMBER(subj, grcode, year, subjseq, damunpapernum, userid, luserid, ldate) ";
            sql2+=  " values (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt2 = connMgr.prepareStatement(sql2);

			sql3 = "select userid from tz_member where userid = ? and office_gbn = 'Y'";
			pstmt3 = connMgr.prepareStatement(sql3);

            }

            for (i=1; i < sheet.getRows() ; i++ ) {
    		     v_count = i;
                cell      = sheet.getCell(0,i);      // ���̵�
                v_userid  = cell.getContents();

                if (v_process.equals("previewFileToDB")) {
%>
        <tr>
          <td align="left">
            <%= (i) + " ��°  :  ��� " + v_userid%>
          </td>
        </tr>
<%
	            }

                if (v_process.equals("insertFileToDB")) {

                pstmt1.setString( 1, ss_subjcourse);   
                pstmt1.setString( 2, ss_grcode);   				
                pstmt1.setString( 3, ss_gyear);       
                pstmt1.setString( 4, ss_subjseq);
                pstmt1.setInt( 5, ss_damunpapernum);   				
                pstmt1.setString( 6, v_userid);

				pstmt3.setString( 1, v_userid);

				rs2 = pstmt3.executeQuery();
				if(rs2.next()) {

                    try {
                        rs = pstmt1.executeQuery();
                        
                        if(!rs.next()) {     //     ���ſ� ��ϵ� userid �� Ȯ���ϰ� ���� ��쿡�� ���          
                        pstmt2.setString( 1, ss_subjcourse);      
                        pstmt2.setString( 2, ss_grcode);       
                        pstmt2.setString( 3, ss_gyear);       
                        pstmt2.setString( 4, ss_subjseq);
                        pstmt2.setInt( 5, ss_damunpapernum);    
                        pstmt2.setString( 6, v_userid);				
                        pstmt2.setString( 7, v_userid);
                        pstmt2.setString( 8, FormatDate.getDate("yyyyMMddHHmmss"));
                            
                            isOk = pstmt2.executeUpdate();
                            cnt += isOk;
                            next++;
                if(isOk > 0) {
%>
          <tr> 
            <td align="left"> 
            <%= (i) + " ��°  : ��� " + v_userid  %>�� ���������� ��ϵǾ����ϴ�.
            </td>
          </tr>
<%    
	            } else {
%>
          <tr> 
            <td align="left" ><font color='red'><%=i%>��°���� �����Դϴ�.</font></td>
          </tr>
          <tr> 
            <td align="left" >���� �޼��� : <%//=e.getMessage()%></td>
          </tr>
<%
                }
                    
						} else {
%>
          <tr> 
            <td align="left"> 
            <%= (i) + " ��°  :  ��� " + v_userid  %>�� �̹� ����ڷ� ��� �Ǿ� �ֽ��ϴ�.
            </td>
          </tr>
<%     
                        }
                    }catch(Exception e) {} 
                    finally { if (rs != null) { try { rs.close(); } catch (Exception e) {} }}           
                }
			    else {		//		ȸ���� �ƴѰ��
%>
          <tr> 
            <td align="left"> 
            <%= (i) + " ��°  :  ��� " + v_userid  %>�� ȸ���� �ƴմϴ�.
            </td>
          </tr>
<%		    }
			  if (rs2 != null) { try { rs2.close(); } catch (Exception e) {} }
            }
			}
            if(next == cnt) connMgr.commit();
            else connMgr.rollback();
%>

        </table>
        <!----------------- ���ε� �ڷ� �� ----------------->

<%

        } catch (Exception e) {
            connMgr.rollback();
%>
        <br>
        <!----------------- �����޼��� ���� ----------------->
        <table class="table_out" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="left" ><font color='red'><%=v_count%>��°���� �����Դϴ�.</font></td>
          </tr>
          <tr> 
            <td align="left" >���� �޼��� : <%=e.getMessage()%></td>
          </tr>
          
        </table>
        <!----------------- �����޼��� �� ----------------->
<%
        } finally {
            //÷�����ϻ���
            FileManager.deleteFile(conf.getProperty("dir.upload.default")+v_realFileName);
            if(pstmt1 != null) { try { pstmt1.close(); } catch (Exception e1) {} }
            if(pstmt2 != null) { try { pstmt2.close(); } catch (Exception e1) {} }
			if(pstmt3 != null) { try { pstmt3.close(); } catch (Exception e1) {} }
            if(connMgr != null) { try { connMgr.setAutoCommit(true); }catch (Exception e10) {} }
            if(connMgr != null) { try { connMgr.freeConnection(); }catch (Exception e10) {} }
        }
%>
        <br>
        <!----------------- ���, �̸����� ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" ><a href="javascript:list()"><img src="/images/admin/multiestimate/list1_butt.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ���, �̸����� ��ư �� ----------------->

        <br>
        <br>
        <!----------------- ���ǻ��� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class=dir_txt ><b><font size="3">(���ǻ���)</font></b></td>
        </tr>
        <tr>
          <td height="8"></td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >1. �������� ����� ���� �������� �����Ͽ� ����� ��</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >2. �������� �ۼ��� <font color="#A661D7">[<b>���</b>]</font>�� ������ ���� ��.</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >3. <font color="#E60873">���� ��� ���� �����ҽ� ġ������ ������ �߻��մϴ�.</font></td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >4. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=Sample_DamunMember.xls&p_realfile=Sample_DamunMember.xls'><b>��������</b></a>)</td>
          </tr>
        </table>
        <!----------------- ���ǻ��� �� ----------------->

      <br>
    </td>
  </tr>
</table>
</form>
<!----------------- form �� ----------------->
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
