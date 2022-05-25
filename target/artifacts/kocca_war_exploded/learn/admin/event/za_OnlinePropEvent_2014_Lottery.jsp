<%@page contentType="text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.credu.library.DBConnectionManager" %>
<%@page import="com.credu.library.ListSet" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    String adminAuth = (String)session.getAttribute("gadmin");
    if ( adminAuth == null || !adminAuth.equals("A1") ) {
%>
<html>
<head>
<title>�̺�Ʈ ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/css" href="/css/admin_style.css">
<style type="text/css">
    .divPopupMask   {position: fixed; left:0px; top:0px; width:1024px; height:800px; background-image: url(/images/common/mask.png); z-index:100; display: block; }
</style>

<script type="text/javascript">
    alert("������ �����ϴ�.");
    window.close();
</script>
<body></body>
</html>

<%
    } else {

        HashMap<String, String> countInfo = this.getRealCountInfo();

        int propCnt = Integer.parseInt( (String)countInfo.get("prop_cnt") );
        int level1_cnt = Integer.parseInt( (String)countInfo.get("level1_cnt") );
        int level2_cnt = Integer.parseInt( (String)countInfo.get("level2_cnt") );
        int level3_cnt = Integer.parseInt( (String)countInfo.get("level3_cnt") );
        int level4_cnt = Integer.parseInt( (String)countInfo.get("level4_cnt") );
        int level5_cnt = Integer.parseInt( (String)countInfo.get("level5_cnt") );
        int remainCnt = Integer.parseInt( (String)countInfo.get("remain_cnt") );

        int totCnt = (level1_cnt + level2_cnt + level3_cnt + level4_cnt + level5_cnt + remainCnt);

        int possibleLevel = 0;

        propCnt = 3302;

        if ( 2500 > propCnt && propCnt >= 2000) {
            possibleLevel = 1;

        } else if ( 3000 > propCnt && propCnt >= 2500 ) {
            possibleLevel = 2;

        } else if ( 5000 > propCnt && propCnt >= 3000 ) {
            possibleLevel = 3;

        } else if ( 10000 > propCnt && propCnt >= 5000 ) {
            possibleLevel = 4;

        } else if ( propCnt >= 10000 ) {
            possibleLevel = 5;

        }

%>
<html>
<head>
<title>�̺�Ʈ ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/css" href="/css/admin_style.css">
<script type="text/javascript" src="/js/jquery/1.8.3/jquery.js"></script>
<script type="text/javascript">
<!--
    var totCnt = <%= totCnt %>;
    var remainCnt = <%= remainCnt %>;
    /**
     * ��÷�ϱ�
     */
    function fnDoLuckyDraw (lvl) {

        if ( !confirm("�� �� ����� ��÷ ����� �ǵ��� �� �����ϴ�.\n��÷�� �����Ͻðڽ��ϱ�?")) {
            return;
        }
        var winnerCnt = 0;

        var btnStr = ["�ٳ��� ����(60��)", "CU ����ϻ�ǰ�� ��÷(20��)", "��Ų������ ��ȯ��(10��)", "CGV ���� ��ȭ���ű�(5��)", "iPad mini 32G��(1��)"];

        switch(lvl) {
            case 1 :
                winnerCnt = 60;
                break;
            case 2 :
                winnerCnt = 20;
                break;
            case 3 :
                winnerCnt = 10;
                break;
            case 4 :
                winnerCnt = 5;
                break;
            case 5 :
                winnerCnt = 1;
                break;
        }
        
        var param = "act_type=1&level=" + lvl + "&winner_cnt=" + winnerCnt + "&remain_cnt=" + $("#oRemainCnt").val();
        $.ajax({
                type : "get"
            ,   url : "/learn/admin/event/za_OnlineProposeEventAjaxResult.jsp"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    alert("��÷�� �Ϸ�Ǿ����ϴ�.");
                    var currBtn = $("#oCurrBtn" + lvl);
                    var nextBtn = ( lvl < 5) ? $("#oCurrBtn" + (lvl + 1) ) : $("#oCurrBtn5");

                    currBtn.attr("value", btnStr[lvl - 1] +" ��÷�� ��Ϻ���");
                    currBtn.attr("style", "background-color:#80de80;");
                    currBtn.attr("onclick", "fnViewPrizeWinners(" + lvl + ");");

                    if ( lvl < 5 ) {
                        nextBtn.attr("disabled", false);
                    } else if ( lvl == 5 ) {
                        currBtn.attr("disabled", false);
                    }
                    $("#oBtnArea" + lvl).append(" (��÷�Ϸ�)");
                    remainCnt -= winnerCnt
                    $("#oRemainCnt").val(remainCnt);

                    fnViewPrizeWinners(lvl);
                }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                    $("#oLoadingImg").hide();
                }
            ,   error :  function(arg1, arg2) {
                    // alert("error : " + arg1);
                }

        });

    }

    /**
     * ��÷�� ��� ����
     */
    function fnViewPrizeWinners (lvl) {
        // ajax �񵿱�� ��ȸ �� ȭ�� ������ ��÷�� ��� ǥ��
        var winnerCnt = 0;

        switch(lvl) {
            case 1 :
                winnerCnt = 60;
                break;
            case 2 :
                winnerCnt = 20;
                break;
            case 3 :
                winnerCnt = 10;
                break;
            case 4 :
                winnerCnt = 5;
                break;
            case 5 :
                winnerCnt = 1;
                break;
        }
        
        var param = "act_type=2&level=" + lvl + "&winner_cnt=" + winnerCnt + "&remain_cnt=" + $("#oRemainCnt").val();
        var listStr = "";
        var num = 1;
        $.ajax({
                type : "get"
            ,   url : "/learn/admin/event/za_OnlineProposeEventAjaxResult.jsp"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {
                    if ( data.prizeWinnerList.length > 0 ) {

                        listStr += "<table width=\"99%\" class=\"table_out\" cellspacing=\"1\" cellpadding=\"1\">   \n";
                        listStr += "    <tr>    \n";
                        listStr += "        <th class=\"table_title\">��ȣ</th>   \n";
                        listStr += "        <th class=\"table_title\">���̵�</th>   \n";
                        listStr += "        <th class=\"table_title\">�̸�</th>     \n";
                        listStr += "        <th class=\"table_title\">��ȭ��ȣ</th> \n";
                        listStr += "        <th class=\"table_title\">�̸���</th>   \n";
                        listStr += "    </tr>   \n";

                        $.each( data.prizeWinnerList, function(){
                            listStr += "<tr>   \n";
                            listStr += "    <td class=\"table_02_5\">" + (num++) + "</td>     \n";
                            listStr += "    <td class=\"table_02_5\">" + this.d_userid + "</td>     \n";
                            listStr += "    <td class=\"table_02_5\">" + this.d_usernm + "</td>     \n";
                            listStr += "    <td class=\"table_02_5\">" + this.d_handphone + "</td>  \n";
                            listStr += "    <td class=\"table_02_5\">" + this.d_email + "</td> \n";
                            listStr += "</tr>   \n";
                        });
                        listStr += "</table>";
                    }

                    var listArea = $("#oPrizeWinnersLevel" + lvl);
                    listArea.empty();
                    listArea.html( listStr );

                }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(arg1, arg2) {
                    // alert("error : " + arg1);
                }

        });
    }

    /**
     * ���� ���Ϸ� ��� ����
     */
    function fnSaveExcelFile() {
        if ( totCnt == remainCnt ) {
            alert("����� ����� �����ϴ�.");
        } else {
            var docForm = document.form1;
            docForm.action = "./za_OnlineProposeEvent_2014_Excel.jsp"
            docForm.submit();
        }
    }
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id="oLoadingImg" style="display:none;">
    <img src="/images/common/loader.gif" id="oLoadImg" />
</div>
<div class="divPopupMask"></div>
<div id="oContents">
<form name="form1" method="get">
    <input type="hidden" id="oTotCnt" name="tot_cnt" value="<%= totCnt %>" />
    <input type="hidden" id="oRemainCnt" name="remain_cnt" value="<%= remainCnt %>" />


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><h2>2014�� 12�� 1�� ������û �̺�Ʈ ��÷</h2></td>
                    <td align="right"><!-- <img src="/images/admin/common/sub_title_tail.gif" /> //--></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br/>

            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="250"></td>
                    <td width="670" align="right"></td>
                    <td width="50" align="right" valign="middle">
                        <a href="javascript:fnSaveExcelFile();"><img src="/images/admin/button/btn_excelsave.gif" border="0"></a>
                    </td>
                </tr>
                <tr>
                    <td height="3"></td>
                </tr>
            </table>

            <!-- //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col width="40%" />
                    <col width="60%" />
                </colgroup>
                <tr>
                    <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title" height="25"><b>��÷</b></td>
                    <td class="table_title"><b>��÷���</b></td>
                </tr>
                <tr>
                    <td class="table_01">
                        <table width="99%">
                            <tr>
                                <td style="text-align:center;" id="oBtnArea1">
<%
        if ( possibleLevel < 1 ) {
%>
                                    <span style="color:#ff0000; font-weight:bold;">��÷��� �ƴ�</span>
<%
        } else if ( possibleLevel >= 1 && level1_cnt == 0 ) {
%>
                                    <input type="button" id="oCurrBtn1" value="�ٳ��� ���� ��÷(60��)" onclick="fnDoLuckyDraw(1);"/>
<%
        } else if (possibleLevel >= 1 && level1_cnt > 0 ) {
%>
                                    <input type="button" id="oCurrBtn1" value="�ٳ��� ����(60��) ��÷�� ��Ϻ���" style="background-color:#80de80;" onclick="fnViewPrizeWinners(1);" /> (��÷ �Ϸ�)
<%
        }
%>

                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="table_02_6" style="text-align:center;" id="oPrizeWinnersLevel1">
                    </td>
                </tr>

                <tr>
                    <td class="table_01">
                        <table width="99%">
                            <tr>
                                <td style="text-align:center;" id="oBtnArea2">
<%
        if ( possibleLevel < 2 ) {
%>
                                    <span style="color:#ff0000; font-weight:bold;">��÷��� �ƴ�</span>
<%
        } else if ( possibleLevel >= 2 && level2_cnt == 0 ) {
%>
                                    <input type="button" id="oCurrBtn2" value="CU ����ϻ�ǰ�� ��÷(20��)" onclick="fnDoLuckyDraw(2);" <%= level1_cnt == 0 ? "disabled=\"disabled\"" : "" %>/>
<%
        } else if (possibleLevel >= 2 && level2_cnt > 0) {
%>
                                    <input type="button" id="oCurrBtn2" value="CU ����ϻ�ǰ��(20��) ��÷�� ��Ϻ���" style="background-color:#80de80;"  onclick="fnViewPrizeWinners(2);" /> (��÷ �Ϸ�)
<%
        }
%>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="table_02_6" style="text-align:center;" id="oPrizeWinnersLevel2">
                    </td>
                </tr>

                <tr>
                    <td class="table_01">
                        <table width="99%">
                            <tr>
                                <td style="text-align:center;" id="oBtnArea3">
<%
        if ( possibleLevel < 3 ) {
%>
                                    <span style="color:#ff0000; font-weight:bold;">��÷��� �ƴ�</span>
<%
        } else if ( possibleLevel >= 3 && level3_cnt == 0 ) {
%>
                                    <input type="button" id="oCurrBtn3" value="��Ų������ ��ȯ�� ��÷(10��)" onclick="fnDoLuckyDraw(3);" <%= level2_cnt == 0 ? "disabled=\"disabled\"" : "" %>/>
<%
        } else if (possibleLevel >= 3 && level3_cnt > 0) {
%>
                                    <input type="button" id="oCurrBtn3" value="��Ų������ ��ȯ��(10��) ��÷�� ��Ϻ���" style="background-color:#80de80;"  onclick="fnViewPrizeWinners(3);" /> (��÷ �Ϸ�)
<%
        }
%>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="table_02_6" style="text-align:center;" id="oPrizeWinnersLevel3">
                    </td>
                </tr>

                <tr>
                    <td class="table_01">
                        <table width="99%">
                            <tr>
                                <td style="text-align:center;" id="oBtnArea4">
<%
        if ( possibleLevel < 4 ) {
%>
                                    <span style="color:#ff0000; font-weight:bold;">��÷��� �ƴ�</span>
<%
        } else  if ( possibleLevel >= 4 && level4_cnt == 0 ) {
%>
                                    <input type="button" id="oCurrBtn4" value="CGV ���� ��ȭ���ű� ��÷(5��)" onclick="fnDoLuckyDraw(4);" <%= level3_cnt == 0 ? "disabled=\"disabled\"" : "" %>/>
<%
        } else if (possibleLevel >= 4 && level4_cnt > 0) {
%>
                                    <input type="button" id="oCurrBtn4" value="CGV ���� ��ȭ���ű�(5��) ��÷�� ��Ϻ���" style="background-color:#80de80;"  onclick="fnViewPrizeWinners(4);" /> (��÷ �Ϸ�)
<%
        }
%>

                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="table_02_6" style="text-align:center;" id="oPrizeWinnersLevel4">
                    </td>
                </tr>

                <tr>
                    <td class="table_01">
                        <table width="99%">
                            <tr>
                                <td style="text-align:center;" id="oBtnArea5">
<%
        if ( possibleLevel < 5 ) {
%>
                                    <span style="color:#ff0000; font-weight:bold;">��÷��� �ƴ�</span>
<%
        } else  if ( possibleLevel >= 5 && level5_cnt == 0 ) {
%>
                                    <input type="button" id="oCurrBtn5" value="iPad mini 32G ��÷(1��)" onclick="fnDoLuckyDraw(5);" <%= level4_cnt == 0 ? "disabled=\"disabled\"" : "" %>/>
<%
        } else if (possibleLevel >= 5 && level5_cnt > 0) {
%>
                                    <input type="button" id="oCurrBtn5" value="iPad mini 32G��(1��) ��÷�� ��Ϻ���" style="background-color:#80de80;"  onclick="fnViewPrizeWinners(5);" /> (��÷ �Ϸ�)
<%
        }
%>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="table_02_6" style="text-align:center;" id="oPrizeWinnersLevel5">
                        <!--
                        <table width="99%" class="table_out" cellspacing="1" cellpadding="1">
                            <tr>
                                <th class="table_title">���̵�</th>
                                <th class="table_title">�̸�</th>
                                <th class="table_title">��ȭ��ȣ</th>
                                <th class="table_title">�̸���</th>
                            </tr>
                            <tr>
                                <td class="table_02_5">honggildong</td>
                                <td class="table_02_5">ȫ�浿</td>
                                <td class="table_02_5">010-1020-1201</td>
                                <td class="table_02_5">honggildong@gmail.com</td>
                            </tr>
                        </table>
                        //-->
                    </td>
                </tr>

            </table>
            <!-- //-->

            <br/>
        </td>
    </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</div>

</body>
</html>

<%
    }
%>

<%!
    private HashMap<String, String> getRealCountInfo() throws Exception {
        DBConnectionManager connMgr = null;
        ListSet ls = null;
        StringBuilder sql = new StringBuilder();

        HashMap<String, String> cntInfo = new HashMap<String, String>();

        try {
            connMgr = new DBConnectionManager();

            sql.append("SELECT  COUNT(B.USERID)  AS PROP_CNT \n");
            sql.append("  FROM  TZ_SUBJSEQ A            \n");
            sql.append("    ,   TZ_PROPOSE B            \n");
            sql.append(" WHERE  A.GRCODE = 'N000001'    \n");
            sql.append("   AND  A.GYEAR = '2014'        \n");
            sql.append("   AND  A.GRSEQ = '0019'        \n");
            sql.append("   AND  A.YEAR = B.YEAR         \n");
            sql.append("   AND  A.SUBJ = B.SUBJ         \n");
            sql.append("   AND  A.SUBJSEQ = B.SUBJSEQ   \n");

            ls = connMgr.executeQuery(sql.toString());

            if ( ls.next() ) {
                cntInfo.put("prop_cnt", ls.getString("prop_cnt"));
            }

            ls.close();
            ls = null;

            sql.setLength(0);
            sql.append("SELECT  MAX( SUM( DECODE( WIN_LEVEL, 1, 1, 0) ) ) AS LEVEL1_CNT    \n");
            sql.append("    ,   MAX( SUM( DECODE( WIN_LEVEL, 2, 1, 0) ) ) AS LEVEL2_CNT    \n");
            sql.append("    ,   MAX( SUM( DECODE( WIN_LEVEL, 3, 1, 0) ) ) AS LEVEL3_CNT    \n");
            sql.append("    ,   MAX( SUM( DECODE( WIN_LEVEL, 4, 1, 0) ) ) AS LEVEL4_CNT    \n");
            sql.append("    ,   MAX( SUM( DECODE( WIN_LEVEL, 5, 1, 0) ) ) AS LEVEL5_CNT    \n");
            sql.append("    ,   MAX( SUM( DECODE( WIN_LEVEL, NULL, 1, 0) ) ) AS REMAIN_CNT \n");
            sql.append("  FROM  TZ_EVENT_APPLICANT  \n");
            sql.append(" WHERE  SEQ = 1             \n");
            sql.append(" GROUP  BY WIN_LEVEL        \n");

            ls = connMgr.executeQuery(sql.toString());

            if ( ls.next() ) {
                cntInfo.put("level1_cnt", ls.getString("level1_cnt"));
                cntInfo.put("level2_cnt", ls.getString("level2_cnt"));
                cntInfo.put("level3_cnt", ls.getString("level3_cnt"));
                cntInfo.put("level4_cnt", ls.getString("level4_cnt"));
                cntInfo.put("level5_cnt", ls.getString("level5_cnt"));
                cntInfo.put("remain_cnt", ls.getString("remain_cnt"));
            }

        } catch(Exception e) {
        } finally {
            if ( ls != null ) {
                ls.close();
                ls = null;
            }
            if ( connMgr != null ) {
                connMgr.freeConnection();
                connMgr = null;
            }
        }

        return cntInfo;
    }
%>