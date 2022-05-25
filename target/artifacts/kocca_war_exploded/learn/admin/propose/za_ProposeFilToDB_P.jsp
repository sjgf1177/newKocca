<%
//**********************************************************
//  1. ��      ��: �԰� FileToDB
//  2. ���α׷��� : za_ProposeFileToDB_P.jsp
//  3. ��      ��: �԰� FileToDB ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��: ��â�� 2004.11.20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=MS949" %>
<%@page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jxl.*" %>
<%@ page import="com.credu.homepage.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.propose.*" %>
<%@ page import="com.credu.complete.FinishBean" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    DBConnectionManager connMgr = null;

    PreparedStatement propose_pstmt = null;
    PreparedStatement student_pstmt = null;

    String propose_sql = "";
    String student_sql = "";

    ProposeBean proposebean = null;
    Hashtable inputdata  = new Hashtable();
    Hashtable outputdata = null;

    int isOk = 0;
    int isOk1 = 0;

    String v_process = box.getString("p_process");

    String ss_grcode = box.getString("s_grcode");           //�����ְ�
    String ss_gyear = box.getString("s_gyear");            //�⵵
    String ss_grseq = box.getString("s_grseq");            //��������
    String ss_grseqnm = box.getString("s_grseqnm");          //����������
    String ss_upperclass = box.getString("s_upperclass");      //������з�
    String ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String ss_subjcourse = box.getString("s_subjcourse");       //����&�ڽ�                                                                                                   javascript:topLogout();
    String ss_subjseq = box.getString("s_subjseq");          //���� ����
    String ss_usergrcode = box.getString("s_usergrcode");    //����� ����ڵ�

    String org_subjcourse = ss_subjcourse;  //���� �Ѿ�� �����ڵ�

    String v_isretire = box.getStringDefault("p_isretire", "N");
    String v_isemtpty = box.getStringDefault("p_isemtpty", "N");
    String v_isstoped = box.getStringDefault("p_isstoped", "N");
    String v_stuoverlap = box.getStringDefault("p_stuoverlap", "N");
    String v_isgraduated = box.getStringDefault("p_isgraduated", "N");

    String v_subjnm   = box.getString("s_subjnm");
    String v_grcodenm = box.getString("s_grcodenm");
    String v_subjseqgrnm = box.getString("s_subjseqgrnm");

    String tid = box.getString("tid");
    String v_luserid   = box.getSession("userid");
    String v_inputlevel= box.getString("p_inputlevel");

    String v_realFileName = box.getRealFileName("p_file");
    String v_newFileName  = box.getNewFileName("p_file");
    int     i=0;
    String v_userid  = "";
    String v_name    = "";
    String v_subjseq = "";
    String v_imsisubj      = "";
    String v_imsisubjseq   = "";

    Cell cell = null;
    Sheet sheet = null;
    Workbook workbook = null;

    Exception ex01 = null;
%>
<html>
<head>
<title>�԰�FileToDB</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function golistPage() {
    document.form1.action = "/servlet/controller.propose.AcceptServlet";
    document.form1.p_process.value = "proposeFileToDB";
    document.form1.submit();
}
//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" >
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="s_grcode" value="<%=ss_grcode%>">
    <input type="hidden" name="s_gyear" value="<%=ss_gyear%>">
    <input type="hidden" name="s_grseq" value="<%=ss_grseq%>">
    <input type="hidden" name="s_upperclass" value="<%=ss_upperclass%>">
    <input type="hidden" name="s_middleclass" value="<%=ss_middleclass%>">
    <input type="hidden" name="s_subjcourse" value="<%=ss_subjcourse%>">
    <input type="hidden" name="p_isretire" value="<%=v_isretire%>">
    <input type="hidden" name="p_isemtpty" value="<%=v_isemtpty%>">
    <input type="hidden" name="p_isstoped" value="<%=v_isstoped%>">
    <input type="hidden" name="p_stuoverlap" value="<%=v_stuoverlap%>">
    <input type="hidden" name="p_isgraduated" value="<%=v_isgraduated%>">
</form>
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr>
                    <td><img src="/images/admin/propose/p_title06.gif" ></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->
            <br/>
            <br/>

            <!-- ������������ //-->
            <table cellspacing="0" cellpadding="1" class="form_table_out">
                <tr>
                    <td bgcolor="#C6C6C6" align="center">
                        <table cellspacing="0" cellpadding="0" class="form_table_bg" >
                            <tr>
                                <td height="15"></td>
                            </tr>
                            <tr>
                                <td align="center" valign="middle">
                                    <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
                                        <tr>
                                            <td>
                                                <b><font size="3">&nbsp;&nbsp;
                                                �����׷�:<%=v_grcodenm%>&nbsp;&nbsp;&nbsp;&nbsp;
                                                �⵵:<%=ss_gyear%>&nbsp;&nbsp;&nbsp;&nbsp;
                                                ����:<%=v_subjnm%>&nbsp;&nbsp;&nbsp;&nbsp;
                                                ����:<%=v_subjseqgrnm%></font></b>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="15"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br/><br/><br/>

<%
    try {

        connMgr = new DBConnectionManager();
        connMgr.setAutoCommit(false);

        workbook = Workbook.getWorkbook(new File(conf.getProperty("dir.home")+v_newFileName));
        // workbook = Workbook.getWorkbook(new File(conf.getProperty("dir.upload.accept")+v_newFileName));
        sheet = workbook.getSheet(0);

        proposebean = new ProposeBean();
        MainSubjSearchBean msbean = new MainSubjSearchBean();
        FinishBean fbean = new FinishBean();
        DecimalFormat df = new DecimalFormat("0000");

        String v_errvalue = "";
        String v_errtxt = "";
        String v_year = "";

        String v_isonoff  = "";
        String v_isclosed = "";
        String v_edustart = "";
        String v_eduend = "";
        String v_subjseqgr = "";


        String v_errString = "";
        String v_okString = "";

        String csSubj = "";
        String csSubjSeq = "";

        ArrayList<HashMap<String, String>> csSubjList = null;
        HashMap<String, String> csSubjMap = null;

        int errcnt = 0;
        int okcnt = 0;

        System.out.println(ss_subjseq+"----------------------------------------------------------------------------");

        int columnLength = sheet.getRow(1).length;

        for (i=1; i < sheet.getRows() ; i++ ) {
            v_userid = StringManager.trim( sheet.getCell(0,i).getContents());  // ���̵�

            // ���� ALL �ϰ��
            if(ss_subjseq.equals("ALL")) {
                v_imsisubjseq = StringManager.trim(sheet.getCell(1, i).getContents());  // ����

                if(v_imsisubjseq.equals("")) {
                    out.println("<font color='red'><b>�������Error</b><br/><b>����ALL���ýÿ��� ���� �Է¾�Ŀ� ������ �Է��Ͽ��� �մϴ�.</b></font>");
                    return;
                }

                // ���� ALL �ϰ��
                if(org_subjcourse.equals("ALL") || org_subjcourse.equals("")){
                    v_imsisubj = StringManager.trim(sheet.getCell(2,i).getContents());  // ����

                    if(v_imsisubj.equals("")) {
                        out.println("<font color='red'><b>�������Error</b><br/><b>����ALL���ýÿ��� ���� �Է¾�Ŀ� ������ �Է��Ͽ��� �մϴ�.</b></font>");
                        return;
                    }

                    ss_subjcourse = v_imsisubj;
                }

                System.out.println(i + "     ----------------------------------------------------------------------------");

                v_subjseqgr = df.format(Integer.parseInt(v_imsisubjseq));
                v_subjseq = fbean.selectGrSubjseq(connMgr, ss_subjcourse, ss_gyear, v_subjseqgr, ss_grcode);

            } else {
                v_subjseqgr = StringManager.replace(v_subjseqgrnm,"��","");
                v_subjseq = ss_subjseq;
            }

            v_year = proposebean.getSubjYear(connMgr, ss_grcode, ss_gyear, ss_grseq, ss_subjcourse, v_subjseq);

            DataBox dbox = msbean.SubjseqInfo(connMgr, ss_subjcourse, ss_grcode, v_subjseq, v_year);
            if(dbox != null){
                v_isonoff  = dbox.getString("d_isonoff");
                v_isclosed = dbox.getString("d_isclosed");
                v_edustart = dbox.getString("d_edustart");
                v_eduend   = dbox.getString("d_eduend");
            }

            v_errvalue=msbean.isExitSeq(ss_grcode, ss_gyear, ss_subjcourse, v_subjseq);

            //�λ�DB�˻�
            if(v_errvalue.equals("0")){
                v_errvalue=msbean.isExitMember(v_userid, v_isretire, v_isemtpty, v_isstoped);

                //������û ���̺� �˻�
                if(v_errvalue.equals("0")){
                    v_errvalue=msbean.isPropose(v_userid, ss_subjcourse, v_year, v_subjseq);
                }

                //���հ��� �ߺ�����
                if(v_errvalue.equals("0") && v_stuoverlap.equals("Y")){
                    v_errvalue=msbean.ziphapOverLapEduterm(v_edustart, v_eduend, v_userid);
                }

                //�ش���� �̼����� üũ
                if(v_errvalue.equals("0") && v_isgraduated.equals("Y")){
                    v_errvalue = msbean.isStold(v_userid, ss_subjcourse, v_year, v_subjseq);
                }
            }

              // Message ���
            v_errtxt = msbean.isGetErrtxt(v_errvalue);

            if(!v_errvalue.equals("0")){
                v_errString += "<tr><td class=table_02_1>"+(i+1)+"</td><td class=table_02_1>" + v_userid + "</td><td class=table_02_1>" + StringManager.cutZero(v_subjseqgr)+"��</td><td class=table_02_1>"+v_errtxt+"</td>";
                errcnt++;
            } else {
                v_okString += "<tr><td class=table_02_1>"+(i+1)+"</td><td class=table_02_1>" + v_userid + "</td><td class=table_02_1>" + StringManager.cutZero(v_subjseqgr)+"��("+ss_subjcourse+")</td><td class=table_02_1>"+v_errtxt+"</td>";
                // v_okString += "<tr><td class=table_02_1>"+(i+1)+"</td><td class=table_02_1>" + v_userid + "</td><td class=table_02_1>" + StringManager.cutZero(v_subjseqgr)+"��</td><td class=table_02_1>"+v_errtxt+"</td>";
            }
        }

        if (v_process.equals("insertFileToDB") && errcnt == 0 ) {

            csSubjList = new ArrayList<HashMap<String, String>>();

            for (i = 1; i < sheet.getRows() ; i++ ) {
                v_userid = StringManager.trim( sheet.getCell(0,i).getContents());  // ���̵�
                // ���� ALL �ϰ��
                if(ss_subjseq.equals("ALL")){
                    v_imsisubjseq = StringManager.trim(sheet.getCell(1,i).getContents());  // ����

                    // ���� ALL �ϰ��
                    if(org_subjcourse.equals("ALL")){
                        v_imsisubj = StringManager.trim(sheet.getCell(2,i).getContents());  // ����
                        ss_subjcourse = v_imsisubj;
                    }

                    v_subjseqgr = df.format(Integer.parseInt(v_imsisubjseq));
                    v_subjseq = fbean.selectGrSubjseq(connMgr, ss_subjcourse, ss_gyear, v_subjseqgr, ss_grcode);

                } else {
                    v_subjseqgr = StringManager.replace(v_subjseqgrnm,"��","");
                    v_subjseq = ss_subjseq;
                }

                v_year = proposebean.getSubjYear(connMgr, ss_grcode, ss_gyear, ss_grseq, ss_subjcourse, v_subjseq);

                DataBox dbox = msbean.SubjseqInfo(connMgr, ss_subjcourse, ss_grcode, v_subjseq, v_year);
                if(dbox != null){
                    v_isonoff  = dbox.getString("d_isonoff");
                    v_isclosed = dbox.getString("d_isclosed");
                    v_edustart = dbox.getString("d_edustart");
                    v_eduend   = dbox.getString("d_eduend");
                }

                inputdata.clear();
                inputdata.put("connMgr", connMgr);
                inputdata.put("subj", ss_subjcourse);
                inputdata.put("year", v_year);
                inputdata.put("subjseq", v_subjseq);
                inputdata.put("userid", v_userid);
                inputdata.put("tid", tid);
                inputdata.put("luserid", v_luserid);
                inputdata.put("isdinsert", "Y");
                inputdata.put("chkfirst", "Y");

                inputdata.put("chkfinal", "Y");
                inputdata.put("usergrcode", ss_usergrcode); //����ڵ�
                inputdata.put("grcode", ss_grcode); //�����׷�

                if ( columnLength >= 4 ) {
                    csSubjMap = new HashMap<String, String>();
                    csSubjMap.put("year", v_year );
                    csSubjMap.put("grcode", ss_grcode );
                    csSubjMap.put("subjseq", StringManager.trim( sheet.getCell(1,i).getContents() ) );
                    csSubjMap.put("subj", StringManager.trim( sheet.getCell(2,i).getContents() ) );
                    csSubjMap.put("cssubjseq", StringManager.trim( sheet.getCell(3,i).getContents() ) );
                    csSubjMap.put("cssubj", StringManager.trim( sheet.getCell(4,i).getContents() ) );
                    csSubjList.add(csSubjMap);
                }

                isOk = proposebean.insertPropose(inputdata);
                isOk1 = proposebean.insertStudent(inputdata);
            }

            if ( isOk > 0 && columnLength >= 4) {
                this.updateCSSubjSeqInfo(connMgr, csSubjList);
            }
        }

%>

            <!-- ������� ���� //-->
            <table>
                <tr>
                    <td>
                        <font color="red">ERROR�Ǽ��� 1���̻� �߻��ϸ� �ϰ�ó���� �ڵ���ҵ˴ϴ�.</font>
                    </td>
                </tr>
            </table>

            <table cellspacing="1" cellpadding="5" class="table_out">
                <tr>
                    <td colspan="15" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title" colspan="8">ERROR : <%= errcnt %>��</td>
                </tr>
                <tr>
                    <td class="table_title" width="10%">�ٹ�ȣ</td>
                    <td class="table_title" width="20%">���</td>
                    <td class="table_title" width="15%">�Է�����</td>
                    <td class="table_title" >MESSAGE</td>
                </tr>
<%
            if(errcnt != 0){
                out.print(v_errString);
            } else {
%>
                <tr>
                    <td class="table_02_1" colspan="8">�˻��� Error�� �����ϴ�.</td>
                </tr>
<%
            }
%>
                </tr>
            </table>
            <!-- ��� ���� ��� �� //-->
            <br/><br/>

            <!-- ������� ���� //-->
            <table cellspacing="1" cellpadding="5" class="table_out">
                <tr>
                    <td colspan="15" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title" colspan="8">�����Է�</td>
                </tr>
                <tr>
                    <td class="table_title" width="10%">�ٹ�ȣ</td>
                    <td class="table_title" width="20%">���</td>
                    <td class="table_title" width="15%">�Է�����</td>
                    <td class="table_title" >MESSAGE</td>
                </tr>
                <%= v_okString %>
            </table>
            <!-- ��� ���� ��� �� //-->

<%
        if(v_process.equals("insertFileToDB")){

            if(errcnt == 0) {
                connMgr.commit();
            } else {
                connMgr.rollback();
            }

        }

    } catch (Exception e) {
        System.out.println(e);
%>
            <br/><br/>
            <!-- �����޼��� ���� //-->

            <table>
                <tr>
                    <td>
                        <font color="blue"><b>(������� Error)<b></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">1. ���� ALL������ ������ �Է����� ������� Erroró�� �˴ϴ�.</font><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">&nbsp;&nbsp;-->�����Է��� �ٽ� �õ��Ͽ� �ֽʽÿ�.</font><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">2. ������Ŀ� ������ �ʴ� ���ڳ� ��ȣ�� �� ���� �� �ֽ��ϴ�.</font><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">&nbsp;&nbsp;--> �Է��� ����<b>(���,����,����)</b>�� �����ϰ� ����<b>[Ctrl+C]</b>�� ������������ ���� �ٿ��ֱ�<b>[Ctrl+V]</b>�� �Ͽ� <br/>&nbsp;&nbsp;&nbsp;&nbsp;���̸����� �������� �ٽýõ� �Ͽ� �ֽʽÿ�.</font><br/>
                    </td>
                </tr>
            </table>
<%

    } finally {
        //÷�����ϻ���

        FileManager.deleteFile(v_newFileName);
        if(propose_pstmt != null) { try { propose_pstmt.close(); } catch (Exception e) {} }
        if(student_pstmt != null) { try { student_pstmt.close(); } catch (Exception e) {} }
        if(connMgr != null) { try { connMgr.setAutoCommit(true); connMgr.freeConnection(); }catch (Exception e10) {} }
    }
%>
            <br/>
            <!-- ���, �̸����� ��ư ���� //-->
            <table width="97%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" ><a href="javascript:golistPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
                </tr>
            </table>
            <!-- ���, �̸����� ��ư �� //-->
            <br/><br/>
        </td>
    </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

<%!
    private int updateCSSubjSeqInfo(DBConnectionManager connMgr, ArrayList<HashMap<String, String>> csSubjList) throws Exception {
        int[] resultCnt = null;
        PreparedStatement pstmt = null;
        StringBuffer sql = new StringBuffer();

        HashMap<String, String> csSubjMap = null;

        try {
            sql.setLength(0);
            sql.append("UPDATE  TZ_SUBJSEQ      \n");
            sql.append("   SET  CS_SUBJ = ?     \n");
            sql.append("    ,   CS_SUBJSEQ = ?  \n");
            sql.append("    ,   CS_YEAR = ?     \n");
            sql.append(" WHERE  GRCODE = ?      \n");
            sql.append("    ,   SUBJ = ?        \n");
            sql.append("    ,   SUBJSEQ = ?     \n");
            sql.append("    ,   YEAR = ?        \n");

            pstmt = connMgr.prepareStatement(sql.toString());

            for ( int i = 0 ; i < csSubjList.size(); i++ ) {
                csSubjMap = (HashMap)csSubjList.get(i);
                pstmt.setString(1, csSubjMap.get("cssubj"));
                pstmt.setString(2, csSubjMap.get("cssubjseq"));
                pstmt.setString(3, csSubjMap.get("year"));
                pstmt.setString(4, csSubjMap.get("grcode"));
                pstmt.setString(5, csSubjMap.get("subj"));
                pstmt.setString(6, csSubjMap.get("subjseq"));
                pstmt.setString(7, csSubjMap.get("year"));

                pstmt.addBatch();
            }

            resultCnt = pstmt.executeBatch();
        } catch (Exception e) {
        } finally {
            if ( pstmt != null ) {
                pstmt.close();
                pstmt = null;
            }
        }

        return resultCnt.length;
    }
%>