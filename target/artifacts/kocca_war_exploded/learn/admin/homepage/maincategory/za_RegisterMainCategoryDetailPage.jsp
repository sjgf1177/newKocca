<%
//**********************************************************
// 1. ���ϸ� : za_RegisterMainCategoryDetailPage.jsp
// 2. ���α׷��� : Ȩ������ ����ȭ�� �α�/��õ �׸� ��� ȭ��
// 3. ���� : Ȩ������ ����ȭ�� �α�/��õ ������ ǥ�õǴ� ī�װ� �׸��� ����� �� �ִ� �������̴�.
// 4. ȯ��: JDK 1.5
// 5. ����: 1.0
// 6. �ۼ� : 2015-02-13
// 7. ���� �̷� :
//          2015-02-13 ���� �ۼ�
//***********************************************************
%>

<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    int categorySeq = box.getInt("categorySeq");
    String categoryNm = box.getString("categoryNm");
    String categoryType = box.getString("categoryType");
    String categoryTypeNm = box.getString("categoryTypeNm");
    String layoutType = box.getString("layoutType");

    int maxSortOrder = layoutType.equals("A") ? 5 : 4;
%>
<!DOCTYPE html>
<html>
<head>
<title>��� - ���� �α�/��õ ���� ���� ���� - Ȩ������ - ������ - �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<style>
    .coursePopup { display:none; width:840px; height:500px; background:#fff; color:#000; position:fixed; top:100px; left:80px; text-align:center; border:2px solid #000; }
    #oClosePopup { position:absolute; top:6px; left:795px; width:24px; cursor:pointer; border:1px solid #000; font-weight:bold;}
    #oCourseSearch { position:absolute; top:34px; left:14px; width:96%; height:100px; overflow:hidden;}
    #oCourseList { position:absolute; top:88px; left:14px; width:96%; height:80%; border:1px solid #000; overflow:hidden; overflow-y:scroll;}
    #oCourseList table { width:100%; border-collapse:collapse; }
    #oCourseList table th { font-size:12px; text-align:center; border:1px gray solid; background-color: #eef1f2; padding:12px;}
    #oCourseList table td { font-size:12px; border:1px gray solid; background-color: #ffffff; padding:4px;}
    .d_center { text-align:center;}
    .d_left { text-align:left; }

    #oLayoutTable {width: 360px; }
    #oLayoutTable tr td {text-align:center; font-weight:bold; font-size:32px;  border:1px solid; height:56px; color:#808080;}
</style>

<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.11.1/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
<!--
    $(function() {
        $(".board_btn2").click( function() {
            $("#oCourseSearchPopup").show();
        });

        $("#oClosePopup").click( function() {
            $("#oCourseSearchPopup").hide();
        });
    });

    /**
     * ���� ȭ�� �α�/��õ ���� ���� ī�װ� �׸��� ����Ѵ�.
     */
    function fnRegisterMainCategoryDetail() {
        if( $("#oItemUrl").val() === "" ) {
            alert("������ �����ϼ���.");
            $("#oItemNm").focus();
            return;

        } else if( $("#oPositionNum").val() === "" ) {
            alert("������ �����ϼ���.");
            $("#oPositionNum").focus();
            return;

        } else if( $("input:radio[name=useYn]:checked").length === 0 ) {
            alert("��뿩�θ� �����ϼ���.");
            $("input:radio[name=useYn]").eq(0).focus();
            return;

        } else if( $("#oThumbFileNm").val() === "") {
            alert("����� ������ �����ϼ���.");
            $("#oThumbFileNm").focus();
            return;

        } else if (confirm("����Ͻðڽ��ϱ�?")) {
            $("#oMainCategoryDetailRegForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryDetailServlet").submit();
        } else {
            return;
        }
    }

    /**
     * ��� ȭ������ �̵��Ѵ�.
     */
    function fnGoToList() {
        $("#oProcess").val("retrieveList");
        $("#oMainCategoryDetailRegForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryDetailServlet").submit();
    }

    /**
     * ���� �˻� �˾����� �˻��� �Է� �� ����Ű�� ������ �� �˻�
     * @param e - key event
     */
    function fnSearchSubjByKey(e) {
        if (e.keyCode == "13") {
            fnSearchSubj();
        }
    }

    /**
     * ������ �˻��Ѵ�.
     * @param categoryType - ��������. ���԰���(C_ONL) /��������(C_OPN)
     */
    function fnSearchSubj() {


        $("#oSearchProcess").val("searchSubj");
        var resultStr = "";

        var param = $("#oSearchSubjForm").serialize();

        $.ajaxSetup({cache:false});
        $.ajax({
                type : "post"
            ,   url : "/servlet/controller.admin.homepage.MainCategoryDetailServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    var currCnt = data.subjList.length;

                    $("#oCourseList").empty();

                    if ( currCnt > 0 ) {
                        resultStr += "<table>\n";
                        resultStr += "  <colgroup>\n";
                        resultStr += "      <cols style=\"width:40px;\">\n";
                        resultStr += "      <cols style=\"width:90px\">\n";
                        resultStr += "      <cols style=\"width:*;\">\n";
                        resultStr += "      <cols style=\"width:80px;\">\n";
                        resultStr += "  </colgroup>\n";
                        resultStr += "  <tr>\n";
                        resultStr += "      <th>No.</th>\n";
                        resultStr += "      <th>�����з�</th>\n";
                        resultStr += "      <th>������</th>\n";
                        resultStr += "      <th>����</th>\n";
                        resultStr += "  </tr>\n";
                        $.each( data.subjList, function() {

                            resultStr += "  <tr>";
                            resultStr += "      <td class=\"d_center\">" + (currCnt--) + "</td>";
                            resultStr += "      <td class=\"d_center\">" + this.d_areanm + "</td>";
                            resultStr += "      <td class=\"d_left\">" + this.d_subjnm + "</td>";
                            resultStr += "      <td class=\"d_center\"><a class=\"board_btn\" href=\"javascript:fnSetSubj('" + this.d_subj + "', '" + this.d_subjnm + "');\"><span>����</span></a></td>";
                            resultStr += "  </tr>";
                        });
                        resultStr += "</table>\n";
                    } else {
                        resultStr += "<table><tr><td>��ȸ�� ������ �����ϴ�.</td></tr></table>"
                    }

                    $("#oCourseList").append(resultStr);
                }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                    // alert("error : " + errorThrown);
                    alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                }

        });
    }

    /**
     * ���� ������ �����Ѵ�.
     * @param subj - �����ڵ� Ȥ�� �������� �Ϸù�ȣ
     * @param subjNm - ������ Ȥ�� �������¸�
     */
    function fnSetSubj(subj, subjNm) {
        var categoryType = $("#oSearchCategoryType").val();
        var url = "";

        if ( categoryType == "C_ONL" ) {
            url = "/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=" + subj;
        } else {
            url = "/servlet/controller.infomation.GoldClassHomePageServlet?p_process=selectView&p_seq=" + subj;
        }

        $("#oItemNm").val(subjNm);
        $("#oItemUrl").val(url);

        $("#oClosePopup").trigger("click");
    }

    /**
     * ���̾ƿ� Ÿ�԰� ������ ���� ����� �̹��� ũ�Ⱑ �ٸ��� ������ ���� �׸� �ش��ϴ� �̹��� ������ �ؽ�Ʈ�� ����Ѵ�.
     * @param len - selectbox�� ����
     * @param val - selectbox ���õ� ��
     */
    function fnShowThumbInfo( len, val ) {
        var layoutType = (len === 6) ? "A" : "B";
        var msg = "";

        if ( val !== "" ) {
            if ( layoutType === "A" ) {
                if ( val == 5) {
                    msg = "����� ũ��� <b>188 * 338</b> �Դϴ�.";
                } else {
                    msg = "����� ũ��� <b>188 * 103</b> �Դϴ�.";
                }
            } else {
                if ( val == 1) {
                    msg = "����� ũ��� <b>288 * 158</b> �Դϴ�.";
                } else {
                    msg = "����� ũ��� <b>188 * 103</b> �Դϴ�.";
                }
            }

            msg += " �԰ݿ� ���� ���� ��� Ȩ���������� �̹����� ���������� ������ ���� �� �ֽ��ϴ�.";
        }

        $("#oThumbInfo").html( msg );

        $("#oLayoutTable tr td").css("background-color", "#fff");
        $("#oLayoutTable tr td").css("color", "#808080");

        $("#oPosition" + val).css("background-color", "#cdcdcd");
        $("#oPosition" + val).css("color", "#000");

    }

//-->
</script>

</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="background-color:#fff; width:240px; font-size:20px; font-weight:bold;">���� �α�/��õ ����</td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br/>

            <h3 style="text-align:left; padding-left:16px">* ���� ���� ���</h3>
            <table width="97%" cellspacing="1" cellpadding="5">
                <tr>
                    <td style="background-color:#fff; text-align:right;">* ��� �Է� �׸��� �ʼ��Դϴ�.</td>
                </tr>
            </table>
            <!-- �Է� form ���� //-->

            <form id="oMainCategoryDetailRegForm" name="mainCategoryRegForm" method="post" action="" enctype="multipart/form-data">
                <input type="hidden" id="oProcess" name="process" value="register" />
                <input type="hidden" id="oCategorySeq" name="categorySeq" value="<%= categorySeq %>" />
                <input type="hidden" id="oCategoryNm" name="categoryNm" value="<%= categoryNm %>" />
                <input type="hidden" id="oCategoryType" name="categoryType" value="<%= categoryType %>" />
                <input type="hidden" id="oCategoryTypeNm" name="categoryTypeNm" value="<%= categoryTypeNm %>" />
                <input type="hidden" id="oLayoutType" name="layoutType" value="<%= layoutType %>" />
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col style="width:16%;" />
                    <col style="width:34%;" />
                    <col style="width:16%;" />
                    <col style="width:34%;" />
                </colgroup>
                <tr>
                    <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr>
                    <th class="table_title">ī�װ� ��</th>
                    <td class="table_02_2">
                        <%= categoryNm %>
                    </td>
                    <th class="table_title">ī�װ� Ÿ��</th>
                    <td class="table_02_2">
                        <%= categoryTypeNm %>
                    </td>
                </tr>
                <tr>
                    <th class="table_title">���̾ƿ� Ÿ��</th>
                    <td class="table_02_2" colspan="3">
                        <%= layoutType %> Ÿ��
                        <br/>
<%
        if ( layoutType.equals("A") ) {
%>
                        <table id="oLayoutTable" cellspacing="12" cellpadding="4">
                            <colgroup>
                                <col style="width:120px;"/>
                                <col style="width:120px;"/>
                                <col style="width:120px;"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td id="oPosition1">1</td>
                                    <td id="oPosition2">2</td>
                                    <td id="oPosition5" rowspan="2">5</td>
                                </tr>
                                <tr>
                                    <td id="oPosition3">3</td>
                                    <td id="oPosition4">4</td>
                                </tr>
                            </tbody>
                        </table>
<%
        } else {
%>
                        <table id="oLayoutTable" cellspacing="12" cellpadding="4">
                            <colgroup>
                                <col style="width:120px;"/>
                                <col style="width:120px;"/>
                                <col style="width:120px;"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td colspan="3">
                                        <table width="50%">
                                            <tr>
                                                <td id="oPosition1">1</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="oPosition2">2</td>
                                    <td id="oPosition3">3</td>
                                    <td id="oPosition4">4</td>
                                </tr>
                            </tbody>
                        </table>
<%
        }
%>
                    </td>
                </tr>
                <tr>
                    <th class="table_title">���� ����</th>
                    <td class="table_02_2" colspan="3">
                        <input type="text" id="oItemNm" name="itemNm" style="width:474px;" onkeypress="return false;"/>
                        <a href="#" class="board_btn2"><span>ã�ƺ���</span></a><br/>
                        <input type="hidden" id="oItemUrl" name="itemUrl" />
                    </td>
                </tr>
                <tr>
                    <th class="table_title">����</th>
                    <td class="table_02_2">
                        <select id="oPositionNum" name="positionNum" style="font-family:����; font-size:13px;" onchange="fnShowThumbInfo(this.length, this.value);">
                            <option value="">����</option>
<%
        for( int i = 1; i <= maxSortOrder ; i++ ) {
%>
                            <option value="<%= i %>"><%= i %></option>
<%
        }
%>
                        </select>
                    </td>
                    <th class="table_title">��뿩��</th>
                    <td class="table_02_2">
                        <label><input type="radio" id="oUseYnY" name="useYn" value="Y" checked="checked" /> ���</label>
                        <label><input type="radio" id="oUseYnN" name="useYn" value="N" /> �̻��</label>
                    </td>
                </tr>
                <tr>
                    <th class="table_title">�����</th>
                    <td class="table_02_2" colspan="3">
                        <input type="file" id="oThumbFileNm" name="p_thumbFileNm" style="width:474px;" /><br/>
                        <div id="oThumbInfo" style="color:#f00; padding-top:4px;"></div>
                    </td>
                </tr>
            </table>
            </form>
            <!-- �Է� form �� //-->

            <br/>
            <!-- ����, ��� ��ư ���� //-->
            <table width="11%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center"><a href="javascript:fnRegisterMainCategoryDetail();"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                    <td align="center"><a href="javascript:history.back()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
                </tr>
            </table>
            <!-- ����, ��� ��ư �� //-->
        </td>
    </tr>
</table>

<div id="oCourseSearchPopup" class="coursePopup">
    <div style="padding: 8px 0 0 15px; font-weight:bold; text-align:left;">�������� - <%= categoryTypeNm %></div>
    <div id="oClosePopup">X</div>
    <div id="oCourseSearch">
        <form id="oSearchSubjForm" name="searchSubjForm" method="post" onsubmit="return false;">
            <input type="hidden" id="oSearchProcess" name="process" value="" />
            <input type="hidden" id="oSearchCategoryType" name="categoryType" value="<%= categoryType %>" />
        <table border="0" cellpadding="0" cellspacing="0" class="searchTable" style="width:100%;">
            <colgroup>
                <col style="width:12%;" />
                <col style="width:18%;" />
                <col style="width:12%;" />
                <col style="width:*;" />
                <col style="width:12%;" />
            </colgroup>
            <tr>
<%
        if  ( categoryType.equals("C_ONL") ) {
%>
                <th scope="cols">�����з�</th>
                <td style="text-align:left; padding:8px;">
                    <kocca:selectBox id="oSearchSubjArea" name="searchSubjArea" type="code" isLoad="true" codeValue="0101" optionTitle="- ���� -" />
                </td>
                <th scope="cols">������</th>
                <td style="text-align:left; padding:8px;">
                    <input type="text" id="oSearchSubjNm" name="searchSubjNm" style="width:320px;" value="" onkeypress="fnSearchSubjByKey(event);" />
                </td>
<%
        } else if ( categoryType.equals("C_OPN") ) {
%>
                <th scope="cols">���ºз�</th>
                <td style="text-align:left; padding:8px;">
                    <kocca:selectBox id="oSearchSubjArea" name="searchSubjArea" type="code" isLoad="true" codeValue="0118" optionTitle="- ���� -" />
                </td>
                <th scope="cols">���¸�</th>
                <td style="text-align:left; padding:8px;">
                    <input type="text" id="oSearchSubjNm" name="searchSubjNm" style="width:320px;" value="" onkeypress="fnSearchSubjByKey(event);" />
                </td>
<%
        }
%>

                <td style="text-align:center;"><a href="javascript:fnSearchSubj();"><img src="/images/admin/button/btn_inquiry.gif" border="0" /></a></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="oCourseList"></div>
</div>


<%@ include file="/learn/library/getJspName.jsp" %>
</body>
</html>
