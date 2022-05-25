<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_I.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 8. 1
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process = box.getString("p_process");

    int v_pageno = box.getInt("p_pageno");
    int v_pagesize = box.getInt("p_pagesize");

    String v_searchtext = box.getString("p_searchtext");
    String v_search = box.getString("p_search");

    int v_seq = box.getInt("p_seq");

    ArrayList groupList = (ArrayList)request.getAttribute("groupList");
    String grCode = "";
    String grCodeNm = "";
    DataBox dbox = null;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/css" href="/css/admin_style.css">
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script language="VBScript" src="/script/cresys_lib.vbs"></script>
<script type="text/javascript">
<!--

    /**
     * �������� ��ȿ�� üũ �� ���
     */
    function fnSaveGoldClass() {
        var saveForm = document.getElementById("oSaveForm");

        var lectType = saveForm.p_lecture_type.value;

        if ( lectType == "E" && saveForm.p_vod_path.value == "" ) {
            alert("�Ӻ��� ������ ���´� ������ ���� ������ �Է��ؾ� �մϴ�.");
            saveForm.p_vod_path.focus();
            return;
        }

        if (saveForm.p_img_file.value == "") {
            alert("���� �̹����� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_img_file.focus();
            return;
        }

        if (saveForm.p_vodurl.value == "") {
            alert("���� URL�� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_vodurl.focus();
            return;
        }

        if (saveForm.p_lecnm.value == "") {
            alert("���¸��� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_lecnm.focus();
            return;
        }

        if (saveForm.p_tutornm.value == "") {
            alert("������� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_tutornm.focus();
            return;
        }

        if (saveForm.p_tutor_file.value == "") {
            alert("�����̹����� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_tutor_file.focus();
            return;
        }

        if (saveForm.p_tutorcareer.value == "") {
            // alert("����� �Է��Ͽ��ֽʽÿ�");
            // saveForm.p_tutorcareer.focus();
            // return;
            saveForm.p_tutorcareer.value = "-";
        }

        if (saveForm.p_tutorauthor.value == "") {
            // alert("������ �Է��Ͽ��ֽʽÿ�");
            // saveForm.p_tutorauthor.focus();
            // return;
            saveForm.p_tutorauthor.value = "-";
        }

        if (saveForm.p_lectime.value == "") {
            alert("���ǽð��� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_lectime.focus();
            return;
        }

        if (saveForm.p_genre.value == "") {
            alert("�帣�� �����ϼ���.");
            saveForm.p_genre.focus();
            return;
        }

        if (saveForm.p_creator.value == "") {
            // alert("���۾�ü ������ �Է��Ͽ��ֽʽÿ�");
            // saveForm.p_creator.focus();
            // return;
            saveForm.p_creator.value = "-";
        }

        if (saveForm.p_creatyear.value == "") {
            alert("���۳⵵�� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_creatyear.focus();
            return;
        }

        if (saveForm.p_intro.value == "") {
            // alert("���並 �Է��Ͽ��ֽʽÿ�");
            // saveForm.p_intro.focus();
            // return;
            saveForm.p_intro.value = "-";
        }

        if (saveForm.p_contents.value == "") {
            // alert("������ �Է��Ͽ��ֽʽÿ�");
            // saveForm.p_contents.focus();
            // return;
            saveForm.p_contents.value = "-";
        }

        if (saveForm.p_width_s.value == "") {
            alert("â���̸� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_width_s.focus();
            return;
        }

        if (saveForm.p_height_s.value == "") {
            alert("â���̸� �Է��Ͽ��ֽʽÿ�");
            saveForm.p_height_s.focus();
            return;
        }

        saveForm.p_pageno.value = 1;
        saveForm.p_searchtext.value = "";
        saveForm.p_search.value = "";
        saveForm.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        saveForm.p_process.value = "insert";

        saveForm.submit();
    }

    /**
     * ��� ȭ������ �̵�
     */
    function list() {
        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    /**
     * �����׷� ��ü ���� ���� �Լ�
     */
    function fnToggleCheckbox() {
        var toggleStat = document.getElementById("oCheckAll").checked;
        var grCodeCheckboxList = document.getElementsByName("grCode");

        var i = 0;

        for( i = 0 ; i < grCodeCheckboxList.length; i++ ) {
            grCodeCheckboxList[i].checked = toggleStat;
        }
    }

    /**
     * �����׷� ����߿��� üũ ���ο� ����
     * �ϳ��̻� üũ�� �Ǿ� ���� ������ ��ü����/���� üũ�ڽ� ����
     */
    function fnIsCheckAll() {
        var grCodeCheckboxList = document.getElementsByName("grCode");

        var i = 0;
        var cnt = 0;

        for( i = 0 ; i < grCodeCheckboxList.length; i++ ) {
            if( !grCodeCheckboxList[i].checked) {
                document.getElementById("oCheckAll").checked = false;
                break;
            } else {
                cnt++;
            }
        }

        if ( cnt == grCodeCheckboxList.length) {
            document.getElementById("oCheckAll").checked = true;
        }
    }
//-->
</script>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form ID="oSaveForm" name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%= v_pageno %>">
    <input type = "hidden" name="p_pagesize"   value = "<%= v_pagesize %>">
    <input type = "hidden" name="p_search"     value = "<%= v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%= v_searchtext %>">
    <input type = "hidden" name="p_seq"        value = "<%= v_seq %>">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td><img src="/images/admin/portal/s.1_19.gif" ></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br />
            <br />
            <!-- �������� ���� ���� //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col width="120px;" />
                    <col width="200px;" />
                    <col width="120px;" />
                    <col width="*;" />
                </colgroup>
                <tr>
                    <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>���� �̹���</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="file" name="p_img_file" size="84" class="input" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>���� ����</strong></td>
                    <td class="table_02_2" colspan="3">
                        <select id="oLectureType" name="p_lecture_type">
                            <option value="">-- ���� --</option>
                            <option value="E">�Ӻ���</option>
                            <option value="P">�˾�</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�������� �з�</strong></td>
                    <td class="table_02_2" >
                        <%-- <kocca_select:select name="p_lecture_cls" sqlNum="0001" param="0118" attr=" " selectedValue="" isLoad="true" all=" " /> --%>
                        <kocca:selectBox name="p_lecture_cls" id="oLectureCls" optionTitle="== ���� ==" type="sqlID" sqlID="code.list.0001" param="0118" selectedValue="" isLoad="true" />
                    </td>
                    <td class="table_title"><strong>�������� �׸�</strong></td>
                    <td class="table_02_2" >
                        <%-- <kocca_select:select name="p_lecture_theme" sqlNum="0001" param="0119" attr=" " selectedValue="" isLoad="true" all=" " /> --%>
                        <kocca:selectBox name="p_lecture_theme" id="oLectureTheme" optionTitle="== ���� ==" type="sqlID" sqlID="code.list.0001" param="0119" selectedValue="" isLoad="true" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�������� �ҼӺо�</strong></td>
                    <td class="table_02_2" >
                        <%-- <kocca_select:select name="p_area" sqlNum="0001" param="0101" attr=" " selectedValue="" isLoad="true" all=" " /> --%>
                        <kocca:selectBox name="p_area" id="oArea" optionTitle="== ���� ==" type="sqlID" sqlID="code.list.0001" param="0101" selectedValue="" isLoad="true" />
                    </td>
                    <td class="table_title"><strong>�������� �帣 (����)</strong></td>
                    <td class="table_02_2" >
                        <%-- <kocca_select:select name="p_genre" sqlNum="0001" param="0117" attr=" " selectedValue="" isLoad="true" all=" " /> --%>
                        <kocca:selectBox name="p_genre" id="oGenre" optionTitle="== ���� ==" type="sqlID" sqlID="code.list.0001" param="0117" selectedValue="" isLoad="true" />
                    </td>
                </tr>

                <tr id="oVodPathTr">
                    <td height="25" class="table_title"><strong>������ URL</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" name="p_vod_path" size="100" class="input" maxlength="80" value="/contents/openclass/" />
                    </td>
                </tr>
                <tr id="oVodUrlTr">
                    <td height="25" class="table_title"><strong>���� URL</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" name="p_vodurl" size="100" class="input" maxlength="80" value="/contents/openclass/" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>����� URL</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" name="p_mobile_url" size="100" class="input" maxlength="80" value="/contents/openclass/" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>���¸�</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" name="p_lecnm" size="100" class="input" maxlength="80">
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�����</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" name="p_tutornm" size="100" class="input" maxlength="80">
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�������</strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="FILE" name="p_tutor_file" size="84" class="input">
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>���</strong></td>
                    <td class="table_02_2" colspan="3">
                        <textarea name="p_tutorcareer" cols="80" rows="20" style="width: 96%; height: 200;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>����</strong></td>
                    <td class="table_02_2" colspan="3">
                        <textarea name="p_tutorauthor" cols="80" rows="20" style="width: 96%; height: 200;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>���ǽð�</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" name="p_lectime" size="30" class="input" maxlength="30" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>���۾�ü</strong></td>
                    <td class="table_02_2" >
                        <input type="text" name="p_creator" size="30" class="input" maxlength="30">
                    </td>
                    <td class="table_title"><strong>���۳⵵</strong></td>
                    <td class="table_02_2" >
                        <input type="text" name="p_creatyear" size="30" class="input" maxlength="30">
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>����</strong></td>
                    <td class="table_02_2" colspan="3">
                        <textarea name="p_intro" cols="80" rows="20" style="width: 96%; height: 200;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>����</strong></td>
                    <td class="table_02_2" colspan="3">
                        <textarea name="p_contents" cols="80" rows="20" style="width: 96%; height: 200;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>â����</strong></td>
                    <td class="table_02_2">
                        <input type="text" name="p_width_s" size="4" class="input" maxlength="4">
                    </td>
                    <td class="table_title"><strong>â����</strong></td>
                    <td class="table_02_2" >
                          <input type="text" name="p_height_s" size="4" class="input" maxlength="4">
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�����׷켱��</strong></td>
                    <td class="table_02_2" colspan="3">
                        <table width="100%" cellspacing="0" cellpadding="2">
                            <tr>
                                <td>
                                    <input type="checkbox" id="oCheckAll" name="checkAll" onclick="fnToggleCheckbox();" /><label for="oCheckAll"><b>��ü����/����</b></label>
                                </td>
                            </tr>
                            <tr>
<%
            for(int i = 0; i < groupList.size(); i++) {

                dbox = (DataBox)groupList.get(i);

                grCode = dbox.getString("d_grcode");
                grCodeNm = dbox.getString("d_grcodenm");
%>
                <td>
                      <input type="checkbox" id="oGrCode<%= grCode %>" name="grCode" value="<%= grCode%>" onclick="fnIsCheckAll();" /><label for="<%= "oGrCode" + grCode %>"><%= grCodeNm %></label>&nbsp;&nbsp;
                </td>
<%
                if ( i > 0 && (i+1) % 4 == 0) {
                    out.println("</tr><tr>");
                }

                if ( i == groupList.size() -1 ) {
                    out.println("</tr>");
                }
            }
%>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�̴��� ���� ����</strong></td>
                    <td class="table_02_2" >
                        <input type="checkbox" name="p_openyn" value="Y" />
                    </td>
                    <td class="table_title"><strong>��뿩��</strong></td>
                    <td class="table_02_2" >
                        <input type="checkbox" name="p_useyn" value="Y" />
                    </td>
                </tr>

                <tr>
                    <td height="25" class="table_title"><strong>�űԿ���</strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="checkbox" id="oNewYn" name="p_new_yn" value="Y" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong><label for="">�������� ����</label></strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="text" id="p_goldclasssummary" name="p_goldclasssummary" size="100" class="input" maxlength="80" value="" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>TAGS</strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="text" id="oTags" name="p_tags" size="100" class="input" maxlength="80" value="" />
                    </td>
                </tr>
                <tr>
	                <td height="25" class="table_title"><strong>�������� �ڸ�����</strong></td>
	                <td class="table_02_2" colspan="3">
	                    <textarea name="p_subtitle" id="p_subtitle" rows="10"></textarea>
	                </td>
	            </tr>

            </table>
            <!-- �������� �Է� ��� �� //-->

    <br />
    <!-- ��ư ���� //-->
    <table width="11%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center"><a href="javascript:fnSaveGoldClass()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
        </tr>
    </table>
    <!-- ��ư �� //-->


      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
