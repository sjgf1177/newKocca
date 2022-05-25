<%
//**********************************************************
//  1. ��  ��: ȸ������_����Ȯ��
//  2. ���ϸ�: /certi/email/sendCertiEmailAjax.jsp
//  3. ��  ��: ȸ������_����Ȯ��
//  4. ȯ  ��: JDK 1.5
//  5. ��  ��: 1.0
//  6. ��  ��:
//  7. ��  ��:
//***********************************************************
%>

<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>

<%@ page import="com.credu.library.DBConnectionManager" %>
<%@ page import="com.credu.library.ErrorManager" %>
<%@ page import="com.credu.library.ListSet" %>
<%@ page import="com.credu.library.Log" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="com.mnwise.lts.client.TcpipClient" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    StringBuffer sb = new StringBuffer();
    StringBuffer contSb = new StringBuffer();
    String certiNum = "";
    String sendMailResult = "";

    String email = box.getString("email");

    // ������ȣ ����
    int index = 0;
    char[] charSet = new char[] {
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
    };

    for( int i = 0 ; i < 6 ; i++ ) {
        index = (int)(charSet.length * Math.random() );
        certiNum += charSet[index];
    }

    System.out.println( "\n������ȣ: " + certiNum );

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� MM�� dd�� HH:mm");
    Date dt = new Date();

    // ���� ����
    contSb.append("<div style=\"font-weight:bold; font-size:13px; \">�ȳ��ϼ���, EDUKOCCA ����,<br/>��û�Ͻ� ȸ������ ������ȣ�� ������ �����ϴ�.<br/><br/>");
    contSb.append("<ul>");
    contSb.append("<li>������ȣ : <span style=\"color:#5c82e8;\">").append( certiNum ).append( "</span></li><br/>");
    contSb.append("<li>�߱޽ð� : <span style=\"color:#5c82e8;\">").append( sdf.format(dt) ).append( "</span></li><br/>");
    contSb.append("</ul>");
    contSb.append("<span style=\"font-weight:bold;\">������ȣ�� ������ �߼۵� �������� 10�а��� ��ȿ �մϴ�.</span></div>");

    TcpipClient tc = new TcpipClient(); // ���Ϲ߼� socket connection open
    tc.open("mail2.kocca.kr", 9110);   //9100 ���ĺ���

    tc.setAID("34");
    tc.setArg("INAME", "");
    tc.setArg("IUSERID", "");
    tc.setArg("IEMAIL", email);
    tc.setArg("TITLE", "[EDUKOCCA] ȸ������ ������ȣ �ȳ� �����Դϴ�.");
    tc.setData("CONTENT", contSb.toString() );

    // ���� �߼�
    sendMailResult = tc.commit();
    // sendMailResult = "250";

    System.out.println("���Ϲ߼۰�� : " + sendMailResult);

    // ���� �߼� �����̸� DB�� ���� ���� �Է�
    if ( sendMailResult.equals("250") ) {
        String insertResult = this.insertEmailCertiHistory( email, certiNum );
        String[] temp = insertResult.split("\\|");

        if ( temp[0].equals("1") ) {
            sb.append("{    \n");
            sb.append("    \"result\": \"S\", \n");
            sb.append("    \"seq\": \"").append(temp[1]).append("\",     \n");
            sb.append("    \"certiNum\": \"").append(certiNum).append("\"   \n");
            sb.append("}    \n");
        } else {
            sb.append("{    \n");
            sb.append("    \"result\": \"EI\" \n");
            sb.append("}    \n");
        }

    } else {
        sb.append("{    \n");
        sb.append("    \"result\": \"EE\" \n");
        sb.append("}    \n");
    }

    System.out.println( sb.toString() );
    out.println( sb.toString() );
%>

<%!
    private String insertEmailCertiHistory(String email, String certiNum) throws Exception {
        DBConnectionManager connMgr = null;
        PreparedStatement pstmt = null;
        ListSet ls = null;
        StringBuffer sql = new StringBuffer();
        int maxSeq = 0;
        int resultCount = 0;

        try {
            connMgr = new DBConnectionManager();
            connMgr.setAutoCommit(false);
            sql.append("SELECT NVL( MAX ( SEQ ), 0 ) + 1 AS MAX_SEQ FROM TZ_EMAIL_CERTI_HISTORY ");

            ls = connMgr.executeQuery(sql.toString());
            if ( ls.next() ) {
                maxSeq = ls.getInt("MAX_SEQ");
            }

            sql.setLength(0);
            sql.append("/* �̸��� ������ȣ �߼� ��� ���� */\n");
            sql.append("INSERT  INTO    TZ_EMAIL_CERTI_HISTORY  \n");
            sql.append("    (                   \n");
            sql.append("        SEQ             \n");
            sql.append("    ,   EMAIL           \n");
            sql.append("    ,   CERTI_NUM       \n");
            sql.append("    ,   CERTI_STATUS    \n");
            sql.append("    ,   REG_DT          \n");
            sql.append("    ,   ACT_TYPE        \n");
            sql.append("    ) VALUES (          \n");
            sql.append("        ?   \n");
            sql.append("    ,   CRYPTO.ENC('normal', ?) \n");
            sql.append("    ,   ?   \n");
            sql.append("    ,   'N' \n");
            sql.append("    ,   SYSDATE \n");
            sql.append("    ,   'C'     \n");
            sql.append("    )   \n");

            pstmt = connMgr.prepareStatement(sql.toString());
            pstmt.setInt( 1, maxSeq );
            pstmt.setString( 2, email );
            pstmt.setString( 3, certiNum );

            resultCount = pstmt.executeUpdate();

            if ( resultCount > 0 ) {
                connMgr.commit();
            } else {
                connMgr.rollback();
            }

        } catch (Exception e) {
            Log.err.println(e.getMessage());
            ErrorManager.getErrorStackTrace(e);
            throw new Exception("insertEmailCertiHistory()\r\n" + e.getMessage());
        } finally {
            if ( ls != null ) {
                ls.close();
                ls = null;
            }
            if ( pstmt != null ) {
                pstmt.close();
                pstmt = null;
            }

            if ( connMgr != null ) {
                connMgr.freeConnection();
            }
        }

        return resultCount + "|" + maxSeq;
    }
%>