<%
/**
 * file name : za_SulmunTargetMemberFilToDB_P.jsp
 * date      : 2003/09/03
 * programmer:
 * function  : ����� ���� ����� �ϰ�ó��
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
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    DBConnectionManager connMgr = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    String sql1 = "";
    String sql2 = "";
    int isOk = 0;
    int cnt = 0;
    int next = 0;
    int i    = 0;

    String  v_realFileName = box.getRealFileName("p_file");
    String  v_newFileName  = box.getNewFileName("p_file");
    String s_userid = box.getSession("userid");

    String  v_subjnm    = box.getString("p_subjnm");

    String  ss_upperclass= box.getString("s_upperclass");
    String  ss_subj      = box.getString("s_subj");
    String  ss_grcode       = box.getString("s_grcode");
    String  ss_year       = box.getString("s_gyear");
    String  ss_subjseq    = "0001";
    int  v_sulpapernum = box.getInt("s_sulpapernum");
    String  v_action     = box.getString("p_action");
    String  v_process = box.getString("p_process");

    String  v_userid = "";

    Cell cell = null;
    Sheet sheet = null;
    Workbook workbook = null;

  //  DataBox dbox = (DataBox)request.getAttribute("ETestMasterData");

%>
<html>
<head>
<title>����� ���� - ����� �ϰ�ó��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function list() {
        opener.ReloadPage('go');
        document.form1.action = "/servlet/controller.research.SulmunTargetMemberServlet";
        document.form1.p_process.value = "SulmunMemberFileToDB";
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

    <input type="hidden" name="s_subj"       value="TARGET">
    <input type="hidden" name="s_grcode"       value="<%=ss_grcode%>">
    <input type="hidden" name="s_sulpapernum"       value="<%=v_sulpapernum%>">
    <input type="hidden" name="s_gyear"       value="<%=ss_year%>">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/r_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
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

            sql1 = "select userid from TZ_SULMEMBER";
            sql1+=  " where subj = ? and grcode = ? and year = ? and subjseq = ? and sulpapernum = ? and userid = ? and isdel = ? "; 
            pstmt1 = connMgr.prepareStatement(sql1);   
            
            sql2 =  "insert into TZ_SULMEMBER(subj, grcode, year, subjseq, sulpapernum, userid, luserid, ldate, isdel) ";
            sql2+=  " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt2 = connMgr.prepareStatement(sql2);

            }

            for (i=2; i < sheet.getRows() ; i++ ) {

               v_count = i;
                cell      = sheet.getCell(0,i);      // ���̵�
                v_userid  = cell.getContents();

                if (v_process.equals("insertFileToDB")) {

                pstmt1.setString( 1, ss_subj);   
                pstmt1.setString( 2, ss_grcode);   				
                pstmt1.setString( 3, ss_year);       
                pstmt1.setString( 4, ss_subjseq);
                pstmt1.setInt( 5, v_sulpapernum);   				
                pstmt1.setString( 6, v_userid);
                pstmt1.setString( 7, "N");   

                    try {
                        rs = pstmt1.executeQuery();
                        
                        if(!rs.next()) {     //     ���ſ� ��ϵ� userid �� Ȯ���ϰ� ���� ��쿡�� ���          
                        pstmt2.setString( 1, ss_subj);      
                        pstmt2.setString( 2, ss_grcode);       
                        pstmt2.setString( 3, ss_year);       
                        pstmt2.setString( 4, ss_subjseq);
                        pstmt2.setInt( 5, v_sulpapernum);    
                        pstmt2.setString( 6, v_userid);				
                        pstmt2.setString( 7, s_userid);
                        pstmt2.setString( 8, FormatDate.getDate("yyyyMMddHHmmss"));
                        pstmt2.setString( 9, "N");         
                            
                            isOk = pstmt2.executeUpdate();
                            cnt += isOk;
                            next++;
%>
          <tr> 
            <td align="left"> 
            <%= (i-1) + " ��°  : " + v_userid  %>
            </td>
          </tr>
<%                        
						} else {
%>
          <tr> 
            <td align="left"> 
            <%= (i-1) + " ��°  : " + v_userid  %>�� �̹� ����ڷ� ��� �Ǿ� �ֽ��ϴ�.
            </td>
          </tr>
<%          
						}
                    }catch(Exception e) {} 
                    finally { if (rs != null) { try { rs.close(); } catch (Exception e) {} }}           

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
            <td align="left" ><font color='red'><%=v_count-1%>��°���� �����Դϴ�.</font></td>
          </tr>
          <tr> 
            <td align="left" >���� �޼��� : <%=e.getMessage()%></td>
          </tr>
          
        </table>
        <!----------------- �����޼��� �� ----------------->
<%
        } finally {
            //÷�����ϻ���
            FileManager.deleteFile(conf.getProperty("dir.upload.sulmun")+v_realFileName);
            if(pstmt1 != null) { try { pstmt1.close(); } catch (Exception e1) {} }
            if(pstmt2 != null) { try { pstmt2.close(); } catch (Exception e1) {} }
            if(connMgr != null) { try { connMgr.setAutoCommit(true); }catch (Exception e10) {} }
            if(connMgr != null) { try { connMgr.freeConnection(); }catch (Exception e10) {} }
        }
%>
        <br>
        <!----------------- ���, �̸����� ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" ><a href="javascript:list()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ���, �̸����� ��ư �� ----------------->

        <br>
        <br>
        <!----------------- ���ǻ��� ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><b><font size="3">(���ǻ���)</font></b></td>
          </tr>
          <tr>
            <td height="8"></td>
          </tr>
        <tr>
          <td height="20">1. �������� ����� ���� �������� �����Ͽ� ����� ��.</td>
        </tr>
        <tr>
          <td height="20">2. �������� �ۼ��� [<b><font color="#003AEA">ID</font></b>]�� ������ ���� ��.</td>
        </tr>
        <tr>
          <td height="20">3. <font color="red">���� ��� ���� �����ҽ� ġ������ ������ �߻��մϴ�.</font></td>
        </tr>
          <tr>
            <td height="20">4. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=Etestmember.xls&p_realfile=Etestmember.xls'><b>��������</b></a>)</td>
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
