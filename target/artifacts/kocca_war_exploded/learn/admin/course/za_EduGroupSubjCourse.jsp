<%
//**********************************************************
//  1. ��      ��: �����׷������ȸ
//  2. ���α׷���: za_Subject_L.jsp
//  3. ��      ��: �����׷������ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 10. 29
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.common.SelectSubjBean" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="com.credu.library.StringManager" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    if ( box == null ) {
        box = RequestManager.getBox(request);
    }

    String v_grcode = box.getString("p_grcode");                //�����׷��ڵ�
    String ss_upperclass = box.getString("s_upperclass");      //������з�
    String ss_middleclass= box.getString("s_middleclass");    //�����ߺз�
    String ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String ss_action = box.getString("s_action");
    String v_grcodes = "";

    ArrayList list = null;
    if(ss_action.equals("go")){    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("SubjectList");
    }
    String v_middleclass = "";
    String v_isCourse = "";

    String v_orderType = box.getStringDefault("p_orderType"," asc"); //���ļ���

%>
<!doctype html>
<html>
<head>
<title>�����׷����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script language="VBScript" src="/script/cresys_lib.vbs"></script>
<script type="text/javascript">
<!--

    // ����Ʈ ������ �˻�
    function whenSelection(ss_action) {
        document.form1.s_action.value = ss_action;
        document.form1.p_process.value = "assignSubj";
        document.form1.submit();
    }

    //����
    function whenOrder(column) {
        if (document.form1.p_orderType.value == " asc") {
            document.form1.p_orderType.value = " desc";
        } else {
            document.form1.p_orderType.value = " asc";
        }

        document.form1.s_action.value = "go";
        document.form1.p_process.value = "assignSubj";
        document.form1.p_orderColumn.value = column;

        document.form1.submit();
    }

    /**
     * ������ �������� �ش� �׷쿡 ����Ѵ�.
     */
    function fnInsertGrSubj(){
        var checkedLength = $("input:checkbox[name=p_checks]:checked").length;

        if(checkedLength == 0) {
            alert("������ ������ �����ϴ�.");
            return;
        } else if ( confirm("������ �������� �����׷쿡 ����Ͻðڽ��ϱ�?") ) {
            document.form1.action = "/servlet/controller.course.EduGroupServlet";
            document.form1.p_process.value = "assignSubjSave";
            document.form1.submit();
        }
    }

    $(function() {
        $("#oCheckAll").bind("click", function() {
            if ( $(this).is(":checked") ) {
                $("input:checkbox[name=p_checks]").attr("checked", true);
            } else {
                $("input:checkbox[name=p_checks]").attr("checked", false);
            }
        });

        $("input:checkbox[name=p_checks]").bind("click", function() {
            var allCnt = $("input:checkbox[name=p_checks]").length;
            var checkedCnt = $("input:checkbox[name=p_checks]:checked").length;

            if ( allCnt == checkedCnt ) {
                $("#oCheckAll").attr("checked", true);
            } else {
                $("#oCheckAll").attr("checked", false);
            }
        });

    });

//-->
</script>
</head>
<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="700" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
        <!-- title ���� //-->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
            <tr>
                <td><img src="/images/admin/system/unite_title08.gif" ></td>
                <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
            </tr>
        </table>
        <!-- title �� //-->
        <br/>
        <!-- form ���� //-->
        <form name="form1" method="post" action="/servlet/controller.course.EduGroupServlet">
            <input type="hidden" name="p_grcode" value="<%=v_grcode%>" />
            <input type="hidden" name="p_process" value="" />
            <input type="hidden" name="p_subj" value="" />
            <input type="hidden" name="p_subjnm" value="" />
            <input type="hidden" name="s_action" value="" />
            <input type="hidden" name="p_orderColumn" />
            <input type="hidden" name="p_orderType" value="<%=v_orderType%>">

        <table cellspacing="0" cellpadding="1" class="form_table_out">
            <tr>
                <td bgcolor="#C6C6C6" align="center">
                    <table cellspacing="0" cellpadding="0" class="form_table_bg">
                        <tr>
                            <td height="7" width="99%"></td>
                        </tr>
                        <tr>
                            <td align="center" width="99%" valign="middle">
                                <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                                    <tr>
                                        <td>
                                            <!-- ���ǰ˻� ���� //-->
                                            <table cellspacing="0" cellpadding="0" width="99%">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellspacing="0" cellpadding="0" width="99%">
                                                            <tr>
                                                                <td width="65%">
                                                                    <%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                                                                    <%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
                                                                    <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                                                                </td>
                                                                <td  width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') --></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!---���ǰ˻� �� //-->
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="7" width="99%"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br/>
        <table cellspacing="1" cellpadding="5"  width="100%">
            <tr>
                <td align="right"><a href="javascript:fnInsertGrSubj();"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            </tr>
        </table>
        <!-- ���� ���� ���� //-->
        <table cellspacing="1" cellpadding="5" class="table_out" width="100%">
            <tr>
                <td colspan="7" class="table_top_line"></td>
            </tr>
            <tr>
                <td class="table_title" width="5%"><b>NO</b></td>
                <td class="table_title" width="15%"><a href="javascript:whenOrder('classname')" class="e">�����з�</a></td>
                <td class="table_title" width="10%"><a href="javascript:whenOrder('codenm')" class="e">��������</a></td>
                <td class="table_title" width="10%"><a href="javascript:whenOrder('isuse')" class="e">��뿩��</a></td>
                <td class="table_title" width="10%"><a href="javascript:whenOrder('subj')" class="e">�����ڵ�</a></td>
                <td class="table_title" width="45%"><a href="javascript:whenOrder('subjnm')" class="e">������</a></td>
                <td class="table_title" width="5%"><input type="checkbox" id="oCheckAll" name="p_chkeckall" /></td>
            </tr>
<%
    if(ss_action.equals("go")) {    //go button ���ýø� list ���
        if ( list != null && list.size() > 0 ) {
            for (int i = 0; i < list.size(); i++) {
                DataBox dbox = (DataBox)list.get(i);
                v_grcodes = dbox.getString("d_grcode");
                v_middleclass = dbox.getString("d_middleclass");

                if (v_middleclass.equals("COU")) {
                    v_isCourse = "Y";
                } else {
                    v_isCourse = "N";
                }
%>
            <tr>
                <td class="table_01"><%= String.valueOf(i+1) %></td>
                <td class="table_02_1"><%= dbox.getString("d_classname") %></td>
                <td class="table_02_1"><%= dbox.getString("d_codenm") %></td>
                <td class="table_02_1"><%= dbox.getString("d_isuse") %></td>
                <td class="table_02_1"><%= dbox.getString("d_subj") %></td>
                <td class="table_02_2"><%= dbox.getString("d_subjnm") %></td>
                <td class="table_02_2"><input id="oCheck<%= i %>" name="p_checks" type="checkbox" value="<%= dbox.getString("d_subj") %>|<%= v_isCourse %>" <%= v_grcodes.equals("") ? "" : "checked" %>></td>
            </tr>
<%
            }
        } else  if (list.size() == 0) {
            if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("H")) {
%>
            <tr><td colspan="12" class="table_02_1">��ϵ� ������ �����ϴ�.</td></tr>
<%
            } else {
%>
            <tr><td colspan="9" class="table_02_1">��ϵ� ������ �����ϴ�.</td></tr>
<%
            }
        }
    }
%>
        </table>
        <!-- ���� ���� �� //-->

        </td>
    </tr>
    <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
