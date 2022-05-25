<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.credu.library.DBConnectionManager" %>
<%@ page import="com.credu.library.ErrorManager" %>
<%@ page import="com.credu.library.ListSet" %>
<%@ page import="com.credu.library.Log" %>
<%@ page import="NiceID.Check.CPClient" %>

<%
    CPClient niceCheck = new  CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
    String sReserved1  = requestReplace(request.getParameter("param_r1"), "");
    String sReserved2  = requestReplace(request.getParameter("param_r2"), "");
    String sReserved3  = requestReplace(request.getParameter("param_r3"), "");

    String sSiteCode = "G7889";             // NICE�κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword = "KCQJDMUIH9ZI";  // NICE�κ��� �ο����� ����Ʈ �н�����

    String sCipherTime = "";        // ��ȣȭ�� �ð�
    String sRequestNumber = "";     // ��û ��ȣ
    String sErrorCode = "";         // ���� ����ڵ�
    String sAuthType = "";          // ���� ����
    String sMessage = "";
    String sPlainData = "";

    System.out.println("�������� ��� ���� ������ ����<br/>");
    String[] errCodeArr = {"0001", "0011", "0012", "0013", "0014", "0015", "0016", "0017", "0018", "0020", "0021", "0022", "0031", "0032", "0033", "0034", "0050", "9998", "9999", "9097"};
    String[] errMessageArr = {"��������ġ(���������, ������ȣ ����ġ)", "��ȿ���� ���� ���� SEQ", "��ȿ���� ���� ��������(�ֹι�ȣ, �޴�����ȣ, �����)", "��ȣȭ ������ ó������", "��ȣȭ ���μ��� ����", "��ȣȭ ������ ����", "��ȣȭ ���μ��� ����", "��ȣȭ ������ ����", "����� ��ſ���", "��ȿ���� ���� ���޻� �ڵ�", "�ߴܵ� ���޻� �ڵ�", "�޴������� ����� �Ұ��� ���޻� �ڵ�", "������ȣ Ȯ�� ����(�ش� ������ ����)", "������ȣ Ȯ�� ����(�ֹι�ȣ ����ġ)", "������ȣ Ȯ�� ����(��ûSEQ ����ġ)", "������ȣ Ȯ�� ����(�� ó����)", "���ǵ��� ���ܼ��� ������", "�������� ����� ���� ����", "���ǵ��� ���� ����", "������ȣ �Է� 3ȸ ����"};

    HashMap mapresult = new HashMap();
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 ) {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();

        // ����Ÿ�� �����մϴ�.
        mapresult = niceCheck.fnParse(sPlainData);

        mapresult.put("CIPHER_TIME", sCipherTime);

        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
        sErrorCode = (String)mapresult.get("ERR_CODE");
        sAuthType = (String)mapresult.get("AUTH_TYPE");

        int index = 0;
        for ( int i = 0 ; i < errCodeArr.length ; i++ ) {
            if ( errCodeArr[i].equals( sErrorCode ) ) {
                index = i;
                break;
            }
        }
        // sMessage = "������ ���� ������ �߻��Ͽ����ϴ�.\"\n\"" + errMessageArr[index];
        sMessage = errMessageArr[index];

    } else if( iReturn == -1) {
        sMessage = "��ȣȭ �ý��� ����";

    } else if( iReturn == -4) {
        sMessage = "��ȣȭ ó�� ����";

    } else if( iReturn == -5) {
        sMessage = "��ȣȭ �ؽ� ����";

    } else if( iReturn == -6) {
        sMessage = "��ȣȭ ������ ����";

    } else if( iReturn == -9) {
        sMessage = "�Է� ������ ����";

    } else if( iReturn == -12) {
        sMessage = "����Ʈ �н����� ����";

    } else {
        sMessage = "�˼� ���� ����";
    }

    if( iReturn != 0 ) {
        mapresult.put("ERR_CODE", String.valueOf(iReturn));
    }
    mapresult.put("RESULT_MSG", sMessage);

    this.insertMobileCertiHistory(mapresult);
%>
<%!
    /**
     *
     */
    public static String requestReplace (String paramValue, String gubun) {
        String result = "";

        if (paramValue != null) {

            paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

            paramValue = paramValue.replaceAll("\\*", "");
            paramValue = paramValue.replaceAll("\\?", "");
            paramValue = paramValue.replaceAll("\\[", "");
            paramValue = paramValue.replaceAll("\\{", "");
            paramValue = paramValue.replaceAll("\\(", "");
            paramValue = paramValue.replaceAll("\\)", "");
            paramValue = paramValue.replaceAll("\\^", "");
            paramValue = paramValue.replaceAll("\\$", "");
            paramValue = paramValue.replaceAll("'", "");
            paramValue = paramValue.replaceAll("@", "");
            paramValue = paramValue.replaceAll("%", "");
            paramValue = paramValue.replaceAll(";", "");
            paramValue = paramValue.replaceAll(":", "");
            paramValue = paramValue.replaceAll("-", "");
            paramValue = paramValue.replaceAll("#", "");
            paramValue = paramValue.replaceAll("--", "");
            paramValue = paramValue.replaceAll("-", "");
            paramValue = paramValue.replaceAll(",", "");

            if(gubun != "encodeData"){
                paramValue = paramValue.replaceAll("\\+", "");
                paramValue = paramValue.replaceAll("/", "");
            paramValue = paramValue.replaceAll("=", "");
            }

            result = paramValue;

        }
        return result;
    }

    /**
     * ���� ��� ����
     */
    private void insertMobileCertiHistory( HashMap certiMap ) throws Exception {
        DBConnectionManager connMgr = null;
        PreparedStatement pstmt = null;
        ListSet ls = null;
        StringBuffer sql = new StringBuffer();
        int maxSeq = 0;
        int resultCount = 0;
        int index = 1;

        try {
            connMgr = new DBConnectionManager();
            connMgr.setAutoCommit(false);
            sql.append("SELECT NVL( MAX ( SEQ ), 0 ) + 1 AS MAX_SEQ FROM TZ_MOBILE_CERTI_HISTORY ");

            ls = connMgr.executeQuery(sql.toString());
            if ( ls.next() ) {
                maxSeq = ls.getInt("MAX_SEQ");
            }

            sql.setLength(0);
            sql.append("/* �޴���ȭ ���� ��� ���� (����) */\n");
            sql.append("INSERT  INTO    TZ_MOBILE_CERTI_HISTORY (   \n");
            sql.append("        SEQ                                 \n");
            sql.append("    ,   DEC_DT                              \n");
            sql.append("    ,   REQ_NO                              \n");
            sql.append("    ,   RESULT_CD                           \n");
            sql.append("    ,   CERTI_SATUS                         \n");
            sql.append("    ,   RESULT_MSG                          \n");
            sql.append("    ,   CERTI_DT                            \n");
            sql.append(") VALUES (                                  \n");
            sql.append("        ?                                   \n");
            sql.append("    ,   TO_DATE(?, 'YYMMDDHH24MISS')        \n");
            sql.append("    ,   ?                                   \n");
            sql.append("    ,   ?                                   \n");
            sql.append("    ,   'F'                                 \n");
            sql.append("    ,   ?                                   \n");
            sql.append("    ,   SYSDATE                             \n");
            sql.append(")                                           \n");

            pstmt = connMgr.prepareStatement(sql.toString());
            pstmt.setInt( index++, maxSeq );
            pstmt.setString( index++, (String)certiMap.get("CIPHER_TIME") );
            pstmt.setString( index++, (String)certiMap.get("REQ_SEQ") );
            pstmt.setString( index++, (String)certiMap.get("ERR_CODE") );
            pstmt.setString( index++, (String)certiMap.get("RESULT_MSG") );

            resultCount = pstmt.executeUpdate();

            if ( resultCount > 0 ) {
                connMgr.commit();
            } else {
                connMgr.rollback();
            }

        } catch (Exception e) {
            Log.err.println(e.getMessage());
            ErrorManager.getErrorStackTrace(e);
            throw new Exception("insertMobileCertiHistory()\r\n" + e.getMessage());
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

    }

%>
<!doctype html>
<html>
<head>
<title>�Ƚɺ������� ��� ������ | �ѱ���������ī����</title>

<script type="text/javascript">
    window.onload = function() {
        alert("������ ���� ������ �߻��Ͽ����ϴ�.\n[<%= sMessage %>]");
        self.close();
    };
</script>

</head>
<body>
<!--
    <center>
    <p><p><p><p>
    ���������� �����Ͽ����ϴ�.<br>
    <table border=1>
        <tr>
            <td>��ȣȭ�� �ð�</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
        </tr>
        <tr>
            <td>��û ��ȣ</td>
            <td><%= sRequestNumber %></td>
        </tr>
        <tr>
            <td>�������� ���� �ڵ�</td>
            <td><%= sErrorCode %></td>
        </tr>
        <tr>
            <td>��������</td>
            <td><%= sAuthType %></td>
        </tr>
        <tr>
            <td>RESERVED1</td>
            <td><%= sReserved1 %></td>
        </tr>
        <tr>
            <td>RESERVED2</td>
            <td><%= sReserved2 %></td>
        </tr>
        <tr>
            <td>RESERVED3</td>
            <td><%= sReserved3 %></td>
        </tr>
    </table><br><br>
    <%= sMessage %><br>
    </center>
//-->
</body>
</html>