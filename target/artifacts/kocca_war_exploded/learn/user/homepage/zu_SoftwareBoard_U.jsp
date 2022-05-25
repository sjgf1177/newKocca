<%
//**********************************************************
//  1. ��      ��: S/W�ڷ��
//  2. ���α׷��� : zu_SoftwareBoard_U.jsp
//  3. ��      ��: S/W�ڷ�� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.16
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";

    Vector v_realfileVector = null;          //      �����ϸ� �迭
    Vector v_savefileVector = null;          //      ������ ������ִ� ���ϸ� �迭
    Vector v_fileseqVector  = null;          //      ����� ���Ϲ�ȣ �迭

    DataBox dbox = (DataBox)request.getAttribute("selectSoftwareBoard");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        v_fileseqVector  = (Vector)dbox.getObject("d_fileseq");

        v_title = StringManager.replace(v_title, "`", "'");
    }

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");

%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%//@ include file="/jsp/user/homepage/supporttop.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert() {
        moveContent();

        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }

        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

        if (blankCheck(document.form1.p_content.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_content.focus();
            return;
        }
/*
        document.forms[0].p_content.editorApplet = DHTMLEdit.tbContentElement;
        document.forms[0].p_content.value = DHTMLEdit.getDocumentHTML();
        document.forms[0].InitHTML.value="";
        document.forms[0].addBody.value="";
*/
        document.form1.p_search.value     = "";
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

   function cancel() {
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
   }

    //namo editor �ۼ� ���밪 �ű��
    function moveContent(){
        document.form1.p_content.value = document.form1.we.BodyValue;
    }

//-->
</SCRIPT>

<!-- SCRIPT FOR NAMO EDITOR -->
<SCRIPT LANGUAGE="VBScript">
<!--
    Function Load_Content()
            document.form1.we.BodyValue = document.form1.p_content.value
            document.form1.we.focus
    End Function

    Sub we_OnInitCompleted
        call Load_Content()
    End Sub

    Function Move_Content()
            document.form1.p_content.value = document.form1.we.BodyValue
    End Function
-->
</script>
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
    <input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">

              <!----------------- page ��� ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="route_table">
                <tr> 
                  <td class="route_text">
                  <img src="/images/user/homepage/arrow_icon2.gif" width="20" height="7" border="0">
                  ������ġ : Home &gt; �������� &gt; SW�ڷ��</td>
                </tr>
                <tr> <td class="route_line"></td></tr>
              </table>
              <!----------------- page ��� �� ----------------->


              <!----------------- Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="b_title_table">
                <tr> <td height="10"></td></tr>
                <tr> 
                  <td background="/images/user/homepage/information_b_title_bg1.gif">
                  <img src="/images/user/homepage/information_b_title2.gif" width="370" height="46" border="0">
                  </td>
                  <td width="7" background="/images/user/homepage/information_b_title_bg1.gif">
                  <img src="/images/user/homepage/information_b_title_bg2.gif" width="7" height="46" border="0">
                  </td>
                </tr>
                <tr><td height="7"></td></tr>
              </table>
              <!----------------- Ÿ��Ʋ �� ----------------->
              <br>


              <!----------------- SW�ڷ�� ���� ���� ---------------->
              <table cellspacing="0" cellpadding="0" class="vertical_table_out">
                <tr> 
                  <td width="3" class="information_board_color_line"></td>
                  <td> 
                    <table cellspacing="1" cellpadding="1" class="table2">
                      <tr> 
                        <td class="information_board_title_bg2" width="140">�� ��</td>
                        <td class="table_text3"> 
                          <input size="80" maxlength="100" name="p_title" class="inputsub" value ="<%= v_title %>">
                        </td>
                      </tr>
                      <tr> 
                        <td class="information_board_title_bg2">�����</td>
                        <td class="table_text3"> 
                          <%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %>
                        </td>
                      </tr>
                      <tr> 
                        <td class="information_board_title_bg2" height="216">�� ��</td>
                        <td class="table_text3"> 
							<script language = "javascript" src = "/script/user_patch.js"></script>
							<script language='javascript'>object_namopatch('580','300');</script>
                                <!--OBJECT WIDTH=0 HEIGHT=0 CLASSID="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                                <PARAM NAME="LPKPath" VALUE="/jsp/namo/NamoWec4_Namo.lpk">
                                </OBJECT>
                                <OBJECT ID="we" WIDTH="580" HEIGHT="300" CLASSID="CLSID:C5AC95C0-C873-445B-BA1F-3A430A4DEA42" CODEBASE="/jsp/namo/NamoWec.cab#version=4,0,0,17">
                                  <param name="InitFileURL" value="/jsp/namo/namowec.env">
                                </OBJECT-->
                                <DIV id="tmpHTML" style="visibility:hidden; display:none">
                                    <TEXTAREA NAME="p_content" type=hidden ><%= v_content%></TEXTAREA>
                                </DIV>
                        </td>
                      </tr>


                        <!---------����÷�ο��� ------------>
                        <%  if(box.getBoolean("p_isUpload")) {      %>
                        <tr>
                            <td class = "information_board_title_bg2" width = "20%" align = "center">÷������</td>
                            <td class = "table_text3" width = "80%" align = "left" colspan="3">
                            <% 
                                    if (v_realfileVector !=null ) {
                                        for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
                                            String v_realfile = (String)v_realfileVector.elementAt(i);
                                            String v_savefile = (String)v_savefileVector.elementAt(i);                              
                                            String v_fileseq  = (String)v_fileseqVector.elementAt(i);                               
                                            if(v_realfile != null && !v_realfile.equals("")) { 
                            %>
                                            &nbsp;<%= v_realfile%>
                                            &nbsp;<input type = "checkbox"  onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" name = "p_savefile" value =<%=v_savefile%>> (������ üũ)
                                            <br>
                                            <input type = "hidden" name = "p_realfile"  value = "<%= v_realfile%>">
                            <%              }  
                                        }
                                    }// end of if v_realfileVector != null 
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td class = "information_board_title_bg2" width = "20%" align = "center">����÷��</td>
                            <td class = "table_text3" width = "80%" align = "left">
                            <input type = "file" size="65"  name = "p_file"><br>
                            <input type = "file" size="65"  name = "p_file"><br>
                            <input type = "file" size="65"  name = "p_file"><br>
                            <input type = "file" size="65"  name = "p_file"><br>
                            <input type = "file" size="65"  name = "p_file">
                            </td>
                        </tr>
                        <%  }           %>
                        <!---------����÷�ο��� �� ------------>

                    </table>
                  </td>
                </tr>
              </table>
              <!----------------- SW�ڷ�� ���� �� ---------------->
              <br>


              <!----------------- ����, ��� ��ư ���� ---------------->
              <table width="18%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td align="center">
                  <a href = "javascript:insert();"><img src="/images/user/homepage/save_butt1.gif" width="45" height="16" border="0"></a>
                  </td>
                  <td align="center">
                  <a href = "javascript:cancel();"><img src="/images/user/homepage/cancel_butt1.gif" width="45" height="16" border="0"></a>
                  </td>
                </tr>
              </table>
              <!----------------- ����, ��� ��ư �� ---------------->
              <br>
              <br>



            </td>
          </tr>
          <tr>
            <td height="8"><img src="/images/user/homepage/information_sub_menu_bg2.gif" width="178" height="8" border="0"></td>
            <td><img src="/images/user/homepage/sub_body_bg2.gif" width="804" height="8" border="0"></td>
          </tr>
        </table>
        <!----------------- ����޴�, ���� ���� �� �� ----------------->
<!---------- copyright start ------------------->
<%//@ include file="/jsp/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->



