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
<%@ page import="com.credu.library.HashCipher" %>
<%@ page import="com.credu.library.ListSet" %>
<%@ page import="com.credu.library.Log" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="com.mnwise.lts.client.TcpipClient" %>

<%@ page import="org.json.simple.JSONObject" %>

<%@ page import="java.sql.PreparedStatement" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String certiType = box.getString("checkType");
    String userId = box.getString("p_findpwd_userid");
    String userName = box.getString("p_findpwd_name");
    String mobileNo = box.getStringDefault("p_findpwd_mobile", "");
    String email = box.getStringDefault("p_findpwd_email", "");

    certiType = certiType.equals("1") ? "MOBILE" : "EMAIL";
    String certiStr = certiType.equals("MOBILE") ? mobileNo : email;

    JSONObject jsonObj = new JSONObject();

    int resultCount = this.checkUserPassword( userId, userName, certiType, certiStr );

    if ( resultCount == 0) {
        jsonObj.put("result", "fail");
    } else {
        jsonObj.put("result", "success");
    }

    System.out.println( jsonObj.toJSONString().replace("\\\\", "/") );
    out.println( jsonObj.toJSONString().replace("\\\\", "/") );

%>

<%!
    /**
     * ȸ���� ��й�ȣ ã���̴�.
     * ���� ��й�ȣ�� ��ȣȭ�� �Ұ����ϱ� ������ �Է��� ���� ��ġ ���θ� Ȯ�� ��
     * ��ġ�� ��� �ӽ� ��й�ȣ�� �����ϰ�, ������ ��ü(�޴���/�̸���)�� �ӽ� ��й�ȣ�� �߼��Ѵ�.
     * @param userId - ����� ���̵�
     * @param userName - ����� �̸�
     * @param certiType - ��������(MOBILE / EMAIL)
     * @param certiStr - ���������� ���� ��. MOBILE�̸� �޴���ȭ��ȣ, EMAIL�̸� �̸��� �ּ�
     */
    private int checkUserPassword( String userId, String userName, String certiType, String certiStr) throws Exception {
        DBConnectionManager connMgr = null;
        PreparedStatement pstmt = null;
        ListSet ls = null;
        StringBuffer sql = new StringBuffer();

        int result = 0;
        int sendResult = 0;
        int updateResult = 0;

        try {
            System.out.println("checkUserPassword start ");
            connMgr = new DBConnectionManager();
            connMgr.setAutoCommit(false);

            sql.append("SELECT  COUNT(USERID) AS RESULTCNT  \n");
            sql.append("  FROM  TZ_MEMBER   \n");
            sql.append(" WHERE  GRCODE = 'N000001'  \n");
            sql.append("   AND  STATE = 'Y'         \n");
            sql.append("   AND  LEAVE_DATE IS NULL  \n");
            sql.append("   AND  USERID = ?          \n");
            sql.append("   AND  NAME LIKE '%' || ? || '%'\n");

            if ( certiType.equals("MOBILE") ) {
                sql.append("   AND  REPLACE(CRYPTO.DEC('normal', HANDPHONE), '-', '') = ? \n");

            } else if ( certiType.equals("EMAIL") ) {
                sql.append("   AND  EMAIL =  CRYPTO.ENC('normal', ? )   \n");
            }

            if ( certiType.equals("MOBILE") ) {
                certiStr = certiStr.replaceAll("-", "");
            }

            pstmt = connMgr.prepareStatement(sql.toString());
            pstmt.setString( 1, userId );
            pstmt.setString( 2, userName );
            pstmt.setString( 3, certiStr );

            ls = new ListSet(pstmt);

            if ( ls.next() ) {
                result = ls.getInt("RESULTCNT");
                System.out.println("ls.next() result : " + result);
            }

            ls.close();
            ls = null;

            pstmt.close();
            pstmt = null;

            // ������ ������ ���
            if (result > 0) {
                String newPassword = this.getRandomString(8);

                System.out.println("newPassword : " + newPassword);

/**========================================================**/
                if ( certiType.equals("MOBILE") ) {
                    System.out.println("���� Ÿ���� �޴���");
                    String msg = "";
                    String[] mobileNoArr = new String[3];

                    sql.setLength(0);
                    sql.append("INSERT  INTO EM_TRAN    (   \n");
                    sql.append("        TRAN_PR         \n");
                    sql.append("    ,   TRAN_PHONE      \n");
                    sql.append("    ,   TRAN_CALLBACK   \n");
                    sql.append("    ,   TRAN_STATUS     \n");
                    sql.append("    ,   TRAN_DATE       \n");
                    sql.append("    ,   TRAN_MSG        \n");
                    sql.append(") VALUES (  \n");
                    sql.append("        EM_TRAN_PR.NEXTVAL  \n");
                    sql.append("    ,   ?   \n");
                    sql.append("    ,   ?   \n");
                    sql.append("    ,   '1' \n");
                    sql.append("    ,   SYSDATE \n");
                    sql.append("    ,   ?   \n");
                    sql.append(")  \n");

                    pstmt = connMgr.prepareStatement(sql.toString());

                    msg += "[EDUKOCCA] ȸ������ �ӽ� ��й�ȣ�� " + newPassword + " �Դϴ�.";

                    if ( certiStr.length() < 11 ) {
                        mobileNoArr[0] = certiStr.substring(0, 3);
                        mobileNoArr[1] = certiStr.substring(3, 6);
                        mobileNoArr[2] = certiStr.substring(6, 10);
                    } else {
                        mobileNoArr[0] = certiStr.substring(0, 3);
                        mobileNoArr[1] = certiStr.substring(3, 7);
                        mobileNoArr[2] = certiStr.substring(7, 11);
                    }

                    pstmt.setString(1, mobileNoArr[0] + "-" + mobileNoArr[1] + "-" + mobileNoArr[2]);
                    pstmt.setString(2, "02-2161-0077");
                    pstmt.setString(3, msg);

                    sendResult = pstmt.executeUpdate();

                    pstmt.close();
                    pstmt = null;

                    /*
                    if ( result > 0 ) {
                        connMgr.commit();
                    } else {
                        connMgr.rollback();
                    }
                    */

                } else {
                    System.out.println("���� Ÿ���� �̸���");

                    StringBuffer contSb = new StringBuffer();

                    contSb.append("<div style=\"font-weight:bold; font-size:13px; \">�ȳ��ϼ���,").append(userName).append(" ����,<br/>�ӽ� ��й�ȣ�� ������ �����ϴ�.<br/><br/>");
                    contSb.append("<ul>");
                    contSb.append("<li>�ӽ� ��й�ȣ : <span style=\"color:#5c82e8;\">").append( newPassword ).append( "</span></li><br/>");
                    contSb.append("</ul>");
                    contSb.append("<span style=\"font-weight:bold;\"><a href=\"http://edu.kocca.or.kr/\" target=\"_blank\">EDUKOCCA �ٷΰ���</a></span><br/><br/>");
                    contSb.append("<span style=\"font-weight:bold;\">���� �߱޹��� ��й�ȣ�� �α��� �� ��й�ȣ�� �����Ͻñ� �ٶ��ϴ�.</span></div>");

                    TcpipClient tc = new TcpipClient(); // ���Ϲ߼� socket connection open
                    tc.open("mail2.kbi.re.kr", 9110);   //9100 ���ĺ���

                    tc.setAID("34");
                    tc.setArg("INAME", "");
                    tc.setArg("IUSERID", "");
                    tc.setArg("IEMAIL", certiStr);
                    tc.setArg("TITLE", "[EDUKOCCA] �ӽ� ��й�ȣ �߱� �ȳ� �����Դϴ�.");
                    tc.setData("CONTENT", contSb.toString() );

                    // ���� �߼�
                    String sendMailResult = tc.commit();
                    // String sendMailResult = "250";

                    if ( sendMailResult.equals("250") ) {

                        System.out.println("�̸��� �߼� ����");

                        int maxSeq = 0;
                        sql.setLength(0);
                        sql.append("SELECT NVL( MAX ( SEQ ), 0 ) + 1 AS MAX_SEQ FROM TZ_EMAIL_CERTI_HISTORY ");

                        ls = connMgr.executeQuery(sql.toString());
                        if ( ls.next() ) {
                            maxSeq = ls.getInt("MAX_SEQ");
                        }

                        sql.setLength(0);
                        sql.append("/* �̸��� �ӽú�й�ȣ �߼� ��� ���� */\n");
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
                        sql.append("    ,   ''  \n");
                        sql.append("    ,   SYSDATE \n");
                        sql.append("    ,   'P'     \n");
                        sql.append("    )   \n");

                        pstmt = connMgr.prepareStatement(sql.toString());
                        pstmt.setInt( 1, maxSeq );
                        pstmt.setString( 2, certiStr );
                        pstmt.setString( 3, newPassword );

                        System.out.println("�̸��� �߼� - maxSeq : " + maxSeq);
                        System.out.println("�̸��� �߼� - certiStr : " + certiStr);
                        System.out.println("�̸��� �߼� - newPassword : " + newPassword);

                        sendResult = pstmt.executeUpdate();

                        System.out.println("�̸��� �α� ��� ��� : " + sendResult);

                        pstmt.close();
                        pstmt = null;

                        /*
                        if ( result > 0 ) {
                            connMgr.commit();
                        } else {
                            connMgr.rollback();
                        }
                        */
                    }
                }
/**========================================================**/

                if ( sendResult > 0 ) {
                    System.out.println("�̸��� �α� ��� ���� �� ȸ�� ���� ����");
                    sql.setLength(0);
                    sql.append("/* ȸ�����̺� �ӽ� ��й�ȣ ���� */   \n");
                    sql.append("UPDATE  TZ_MEMBER   \n");
                    sql.append("   SET  PWD = ?     \n");
                    sql.append(" WHERE  USERID = ?  \n");

                    pstmt = connMgr.prepareStatement(sql.toString());

                    pstmt.setString(1, HashCipher.createHash(newPassword));
                    pstmt.setString(2, userId);

                    updateResult = pstmt.executeUpdate();

                    pstmt.close();
                    pstmt = null;
                }

                if ( result + sendResult + updateResult > 2 ) {
                    System.out.println("DB commit");
                    connMgr.commit();
                } else {
                    System.out.println("DB rollback");
                    connMgr.rollback();
                    return 0;
                }

            } else {
                return 0;
            }

        } catch (Exception e) {
            Log.err.println(e.getMessage());
            ErrorManager.getErrorStackTrace(e);
            throw new Exception("checkUserPassword()\r\n" + e.getMessage());
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

        return result + sendResult + updateResult;
    }

    /**
     * ������ �߻����� ������ ��й�ȣ�� ������ �� �����Ѵ�.
     */
    private String getRandomString(int randomStrLength) throws Exception {
        int index = 0;

        char[] charSet = new char[] {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
            , 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M'
            , 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
            , 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'
            , 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        };

        StringBuffer sb = new StringBuffer();

        try {

            for( int i = 0 ; i < randomStrLength ; i++ ) {
                index = (int)(charSet.length * Math.random() );
                sb.append(charSet[index]);
            }

            System.out.println("�ӽ� ��� : " + sb.toString() );
        } catch (Exception e) {
            Log.err.println(e.getMessage());
            ErrorManager.getErrorStackTrace(e);
            throw new Exception("getRandomString()\r\n" + e.getMessage());
        }

        return sb.toString();
    }
%>