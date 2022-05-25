<%@ page contentType="text/html;charset=euc-kr" %>
<%@page errorPage= "/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    ArrayList<DataBox> bannerList = (ArrayList<DataBox>)request.getAttribute("bannerList");

    DataBox dbox = null;
    String process = box.getString("p_process");
    int seq = 0;
    String title ="";
    String onoff_flag ="";
    String use_yn ="";
    int sort_order = 0;
    String start_dt ="";
    String end_dt ="";
    String reg_dt ="";
    String reg_id ="";
    String period_yn ="";
    String fixed_flag ="";
%>
<html>
<head>
<title>���ι�� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script type="text/javascript" src = "/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
<!--

    /**
     * ��� ȭ������ �̵�
     */
    function fnInsert() {
        document.form1.action = "/servlet/controller.homepage.BannerAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
    /**
     * ���� ȭ������ �̵�
     */
    function fnUpdate(seq) {
        var url ="/servlet/controller.homepage.BannerAdminServlet";
        var param= "?&p_process=updatePage&p_seq=" + seq ;
        location.href = url + param ;
    }

    /*
    * ���ļ��� ����
    */
    function fnSortChange( idx, chgValue ){
        var tempValue = "";
        var orgValue = $("#orgVal" + idx).val();

        for( var i = 0 ; i < $("select[name=p_sort_order]").length; i++ ) {
            if ( idx != i ) {
                tempValue = $("select[name=p_sort_order]").eq(i).val();

                if ( chgValue == tempValue ) {
                    $("select[name=p_sort_order]").eq(i).val(orgValue);
                    $("#orgVal" + i).val(orgValue);
                    $("#orgVal" + idx).val(chgValue);

                    break;
                }

            }
        }
    }

    /**
     * ��� �˾�
     */
    function fnViewBanner() {
        var objUseYn = $("select[name=p_use_yn]");
        var seqParam = "";

        for( var k = 0 ; k < objUseYn.length ; k++ ) {
            if (objUseYn.eq(k).val() == "Y") {
                seqParam += "&v_seq=" + $("input[name=v_seq]").eq(k).val();
            }
        }

        var new_Open = window.open("/servlet/controller.homepage.BannerAdminServlet?p_process=viewBanner" + seqParam,"openclassWindow",'scrollbars=yes,width=1000,height=600,resizable=no');

        // document.form1.p_process.value = "viewBanner";
        // document.form1.target = "openclassWindow";
        // document.form1.action = "/servlet/controller.homepage.BannerAdminServlet?" + seqParam;

        // document.form1.submit();
        // document.form1.target = "_self";

    }
    /**
    * ��뿩��/���ļ��� ����
    */
    function fnListUpdate(){
        if ($("input:checked").length < 1){
            alert("���ο� ������ ��ʸ� �����ϼ���.");
            return;
        }else{
            if(confirm("�ش� ������ �����ϸ� Ȩ�������� ��� ����˴ϴ�.\n����� ������ �����Ͻðڽ��ϱ�?")){
                document.form1.action = "/servlet/controller.homepage.BannerAdminServlet";
                document.form1.p_process.value = "listUpdate";
                document.form1.submit();
            }

        }
    }

//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="get">
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" name="p_seq" value="" />
<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="padding-top:20px;"><h2>���ι�� ����</h2></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" /></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br />
            <!-- form ���� //-->

            <!-- form �� //-->
            <!-- ��� ��� �� //-->
            <BR>
            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center">
<%
            if ( bannerList != null || bannerList.size() != 0 ) {
%>
                        <input type="button" value="(�˾�)�̸�����" onclick="javascript:fnViewBanner();">
                        <input type="button" value="��뿩��/���ļ��� ����" onclick="javascript:fnListUpdate();">
<%
            }
%>
                        <input type="button" value="���ȭ��" onclick="javascript:fnInsert();">
                    </td>
                    <td width="100" align="right" valign="middle">
                        <input type="button" value="����" onclick="javascript:document.form1.reset();">
                    </td>

                </tr>
            </table>
            <br />

            <!-- ��� ��� ���� //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <tr>
                    <td colspan="8" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title" height="25"><b>����</b></td>
                    <td class="table_title" width="8%" ><b>��/����</b></td>
                    <td class="table_title" width="8%"><b>��뿩��</b></td>
                    <td class="table_title" width="8%"><b>���ļ���</b></td>
                    <td class="table_title" width="18%"><b>�ԽñⰣ</b></td>
                    <td class="table_title" width="10%"><b>�����</b></td>
                    <td class="table_title" width="8%" ><b>�����</b></td>
                    <td class="table_title" width="5%" ><b>���ΰ���</b></td>
                </tr>
<%

        if ( bannerList == null || bannerList.size() == 0 ) {
%>
                <tr>
                    <td class="table_02_5" colspan="7">��ϵ� ������ �����ϴ�.</td>
                </tr>
<%
        } else {

            for(int i = 0; i < bannerList.size(); i++) {

                dbox = (DataBox)bannerList.get(i);

                seq = dbox.getInt("d_seq");
                title = dbox.getString("d_title");
                onoff_flag = dbox.getString("d_onoff_flag");
                use_yn = dbox.getString("d_use_yn");
                sort_order = dbox.getInt("d_sort_order");
                start_dt = dbox.getString("d_start_dt").substring(0,4)+"/"+dbox.getString("d_start_dt").substring(4,6)+"/"+dbox.getString("d_start_dt").substring(6,8);
                end_dt = dbox.getString("d_end_dt").substring(0,4)+"/"+dbox.getString("d_end_dt").substring(4,6)+"/"+dbox.getString("d_end_dt").substring(6,8);
                reg_dt = dbox.getString("d_reg_dt");
                reg_id = dbox.getString("d_reg_id");
                period_yn = dbox.getString("d_period_yn");
                fixed_flag = dbox.getString("d_fixed_flag");

%>
                <tr>
                    <td class="table_02_2">
                        <input type="hidden" name="seq" value="<%=seq%>" />
                        <a href="javascript:fnUpdate(<%=seq%>);" ><%=title%></a></td>
                    <td class='table_02_1'>
<%
                    if(onoff_flag.equals("ON")){
%>
                        �¶���
<%
                    }else if(onoff_flag.equals("OFF")){
%>
                        ��������
<%
                    }
%>
                    </td>
                    <td class='table_02_1'>
                        <input type="hidden" name="v_seq" value="<%= seq %>">
                        <select id="oUse_Yn" name="p_use_yn">
                            <option value="" <%= (use_yn.equals("")) ? "selected='selected'" : "" %>>--����--</option>
                            <option value="N" <%= (use_yn.equals("N")) ? "selected='selected'" : "" %>>N</option>
                            <option value="Y" <%= (use_yn.equals("Y")) ? "selected='selected'" : "" %>>Y</option>
                        </select>
                    </td>
                    <td class='table_02_1'>
                        <select id="oSort_order" name="p_sort_order" onchange="javascript:fnSortChange(<%= i %>, this.value);">
                            <option value="" <%= (sort_order==0) ? "selected='selected'" : "" %>>--����--</option>
<%
                        for(int j = 0; j < bannerList.size(); j++) {
%>
                            <option value="<%=j+1%>" <%= (sort_order== (j+1)) ? "selected='selected'" : "" %>><%=j+1%></option>
<%

                        }
%>
                        </select>
                        <input type="hidden" id="orgVal<%= i %>" value="<%= sort_order %>" />
                    </td>
                    <td class='table_02_1'><%=start_dt%> ~ <%=end_dt%></td>
                    <td class='table_02_1'><%=reg_dt%></td>
                    <td class='table_02_1'><%=reg_id%></td>
                    <td class='table_02_1'><input type="radio" name="fixed_flag" value="<%=seq%>" <%=fixed_flag.equals("Y") ? "checked" : "" %>></td>
                </tr>
<%
            }
        }
%>

            </table>

        </td>
    </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
