<%
//**********************************************************
//  1. ��      ��: ������(����)
//  2. ���α׷��� : zu_DicSubj_L.jsp
//  3. ��      ��: ������(����) ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process       = box.getString("p_process");
    String  v_total_row_count = box.getStringDefault("total_row_count","0");  // �󿡼� box.put 
    String ss_upperclass    = box.getString("s_upperclass");    // �����з�
    String ss_middleclass   = box.getString("s_middleclass");   // �����з�
    String ss_lowerclass    = box.getString("s_lowerclass");    // �����з�
    String ss_subj          = box.getString("s_subjcourse");    // �����ڵ�


    int v_pageno = box.getInt("p_pageno"); 
    if (v_pageno == 0) v_pageno = 1;

    String  v_searchtext    = box.getString("p_searchtext");
    String  v_group         = box.getString("p_group");

    String  v_search         = "";
    if (v_searchtext.equals(""))  v_search = v_group;
    else                          v_search = v_searchtext;


    int     v_seq        = 0;
    String  v_subjcode   = "";
    String  v_subjcodenm = "";
    String  v_words      = "";
    String  v_descs      = "";
    String  v_groups     = "";
    int     v_totalpage  = 0;
    int     v_rowcount = 1;

    ArrayList list = (ArrayList)request.getAttribute("selectList");
%>

<html>
<head>
<title>::: ������ :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_course.css" type="text/css">

<SCRIPT LANGUAGE="JavaScript">
<!--


obj_old = null;
    function show_list(obj) {
        if(obj_old != null)
        {
            if(obj.id != obj_old.id)
            {
                change_old()
            }
        }
        if (obj.style.display == "" || obj.style.display == "show")
        {
            obj.style.display = "none";
        }
        else if (obj.style.display == "none")
        {
            obj.style.display = "";
        }
        obj_old = obj;
    }

    function change_old() {
        obj_old.style.display = "none";
    }

    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.course.DicSubjServlet";
         document.form1.p_process.value = "selectList";     
         document.form1.submit();
    }            
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.course.DicSubjServlet";
         document.form1.p_process.value = "selectList";     
         document.form1.submit();
    } 

    function goSearch() {
        if (document.form1.s_subjcourse.value == '' || document.form1.s_subjcourse.value == 'ALL'){
          alert("������ ���� �����Ͻð� ��ȸ�ϼ���");
          return;
        }

        document.form1.p_pageno.value = 1;
        document.form1.target = "_self"
        document.form1.p_process.value   = "selectList";
        document.form1.action            = "/servlet/controller.course.DicSubjServlet";
        document.form1.submit();

    }

    function goGroup(group) {
        if (document.form1.s_subjcourse.value == '' || document.form1.s_subjcourse.value == 'ALL'){
          alert("������ ���� �����Ͻð� ��ȸ�ϼ���");
          return;
        }

        document.form1.p_pageno.value = 1;
        document.form1.p_group.value      = group;
        document.form1.p_searchtext.value = "";

        document.form1.target = "_self"
        document.form1.p_process.value   = "selectList";
        document.form1.action            = "/servlet/controller.course.DicSubjServlet";
        document.form1.submit();

        document.form1.target = window.self.name;

    }

    function whenSelection(p_action) {
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.course.DicSubjServlet';
        document.form1.p_process.value = 'selectListPre';
        document.form1.submit();

    }

    function dicComp() {
        document.form1.target = "_self";

        document.form1.p_searchtext.value = "";
        document.form1.p_group.value      = "";
        document.form1.action = "/servlet/controller.course.DicCompServlet";
        document.form1.p_process.value = "selectListPre";
        document.form1.submit();
    }

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</SCRIPT>
</head>

<body text="#000000" leftmargin="0" topmargin="0" marginheight="0" class="body_color">
<form name = 'form1' method ='post'>

<form name ='form1' method='post' action='javascript:goSearch();'>
    <input type='hidden' name = 'p_process'    value = '<%=v_process%>'>
    <input type='hidden' name = 'p_pageno'     value = '<%=v_pageno%>'>
    <input type='hidden' name = 'p_group'      value = '<%=v_group%>'>

  <table width="651" border="0" cellspacing="0" cellpadding="0" height="100%">

    <!----------------- top Ÿ��Ʋ ���� ----------------->
    <tr>
      <td valign="top" height="55"><img src="/images/user/course/open_dicitonary_img1.gif"  alt="������" width="651" height="55" border="0"></td>
    </tr>
    <!----------------- top Ÿ��Ʋ �� ----------------->
    <tr>
      <td align="center" valign="top">
        <br>
        <!----------------- �޴� ���� ----------------->
        <!----------------- �޴� �� ----------------->
        <table cellspacing="0" cellpadding="0" class="open_dictionary_table_out1">
          <tr> 
            <td class="open_dictionary_color_line"></td>
          </tr>
        </table>

        <!----------------- �˻� ���� ----------------->
        <table cellspacing="0" cellpadding="0" class="open_dictionary_table_out2">
          <tr> 
            <td> 
              <table cellspacing="1" cellpadding="5" class="table2">

                <tr> 
                  <td width="110" class="open_dictionary_title1">�� ��</td>
                  <td class="open_dictionary_text2">
                    <%@ include file="/learn/admin/include/za_SelectSub_noseq.jsp"%>
                  </td>
                </tr> 

                <tr> 
                  <td class="open_dictionary_title1">���˻�</td>
                  <td class="open_dictionary_text1">
                    <table cellpadding="0" cellspacing="0" width="36%" border="0">
                      <tr> 
                        <td width="155"> 
                          <input type="text" name="p_searchtext"  class="input_course_search" value='<%=v_searchtext%>'>
                        </td>
                        <td><a href="javascript:goSearch()"><img src="/images/user/course/search_butt1.gif" width="45" height="16" border="0"></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td class="open_dictionary_title1">�� ��</td>
                  <td class="open_dictionary_text1">
                    <table width="317" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt1.gif"  alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt2.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt3.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt4.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt5.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt6.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt7.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt8.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt9.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt10.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt11.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt12.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt13.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt14.gif" alt="��" width="17" height="17" border="0"></a></td>
                        <td align="center" width="36"><a href="javascript:goGroup('��Ÿ')"><img src="/images/user/course/dictionary_kor_butt15.gif" alt="��Ÿ" width="34" height="17" border="0"></a><td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td class="open_dictionary_title1">�� ��</td>
                  <td class="open_dictionary_text1">
                    <table width="494" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td align="center" width="19"><a href="javascript:goGroup('A')"><img src="/images/user/course/dictionary_eng_butt1.gif" alt="A" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('B')"><img src="/images/user/course/dictionary_eng_butt2.gif" alt="B" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('C')"><img src="/images/user/course/dictionary_eng_butt3.gif" alt="C" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('D')"><img src="/images/user/course/dictionary_eng_butt4.gif" alt="D" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('E')"><img src="/images/user/course/dictionary_eng_butt5.gif" alt="E" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('F')"><img src="/images/user/course/dictionary_eng_butt6.gif" alt="F" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('G')"><img src="/images/user/course/dictionary_eng_butt7.gif" alt="G" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('H')"><img src="/images/user/course/dictionary_eng_butt8.gif" alt="H" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('I')"><img src="/images/user/course/dictionary_eng_butt9.gif" alt="I" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('J')"><img src="/images/user/course/dictionary_eng_butt10.gif" alt="J" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('K')"><img src="/images/user/course/dictionary_eng_butt11.gif" alt="K" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('L')"><img src="/images/user/course/dictionary_eng_butt12.gif" alt="L" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('M')"><img src="/images/user/course/dictionary_eng_butt13.gif" alt="M" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('N')"><img src="/images/user/course/dictionary_eng_butt14.gif" alt="N" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('O')"><img src="/images/user/course/dictionary_eng_butt15.gif" alt="O" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('P')"><img src="/images/user/course/dictionary_eng_butt16.gif" alt="P" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('Q')"><img src="/images/user/course/dictionary_eng_butt17.gif" alt="Q" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('R')"><img src="/images/user/course/dictionary_eng_butt18.gif" alt="R" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('S')"><img src="/images/user/course/dictionary_eng_butt19.gif" alt="S" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('T')"><img src="/images/user/course/dictionary_eng_butt20.gif" alt="T" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('U')"><img src="/images/user/course/dictionary_eng_butt21.gif" alt="U" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('V')"><img src="/images/user/course/dictionary_eng_butt22.gif" alt="V" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('W')"><img src="/images/user/course/dictionary_eng_butt23.gif" alt="W" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('X')"><img src="/images/user/course/dictionary_eng_butt24.gif" alt="X" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('Y')"><img src="/images/user/course/dictionary_eng_butt25.gif" alt="Y" width="17" height="17" border="0"></a></td>
                        <td align="center" width="19"><a href="javascript:goGroup('Z')"><img src="/images/user/course/dictionary_eng_butt26.gif" alt="Z" width="17" height="17" border="0"></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <!----------------- �˻� �� ----------------->
        <br>




        <!----------------- �˻��� ���� ���� ----------------->
        <table cellspacing="0" cellpadding="0" class="open_dictionary_table_out1">
          <tr>
            <td height="6"></td>
          </tr>
          <tr> 
            <td width="39" height="8"><img src="/images/user/course/open_dicitonary_bar1.gif" width="39" height="8" border="0"></td>
            <td background="/images/user/course/open_dicitonary_bar2.gif" width="537"></td>
            <td width="39" align="right"><img src="/images/user/course/open_dicitonary_bar3.gif" width="39" height="8" border="0"></td>
          </tr>
          <tr> 
            <td colspan="3" style="padding-left=5" class="open_dictionary_text3">&gt;&gt; 
              �� <b><font color="#3C980A"><%=v_total_row_count%>��</font></b>�� �� �˻��Ǿ����ϴ�. [<font color="#3E9F09"><b><font color="#3C980A">��<%=v_search%>��</font></b></font>(��)�� 
              �˻��� ���]</td>
          </tr>
        </table>


        <table cellspacing="0" cellpadding="0" class="open_dictionary_table_out1">
<%

        for(int i = 0; i < list.size(); i++) {
            DataBox dbox   = (DataBox)list.get(i);
            v_seq        = dbox.getInt   ("d_seq");
            v_words      = dbox.getString("d_words");
            v_descs      = dbox.getString("d_descs");
            v_groups     = dbox.getString("d_groups");
            v_subjcode   = dbox.getString("d_subjcode");
            v_subjcodenm = dbox.getString("d_subjcodenm");
            v_totalpage  = dbox.getInt("d_totalpage");
            v_rowcount   = dbox.getInt("d_rowcount");  

            v_descs = StringManager.replace(v_descs,"\n","<br>");

%>
          <tr> 
            <td class="open_dictionary_text4">
              <div onMouseDown="show_list(dicitonary<%=v_seq%>);">
              <font style="cursor:hand"><img src="/images/user/course/dictionary_icon1.gif" width="16" height="6" border="0"><%=v_words%></font>
              </div>
            </td>
          </tr>
          <tr><td class="dictionary_search_line"></td></tr>

          <tr id="dicitonary<%=v_seq%>" style="display: none"> 
            <td class="open_dictionary_text5">
              <table cellspacing="0" cellpadding="0" class="table2">
                <tr>
                  <td width="16"></td>
                  <td width="1" valign="top"><img src="/images/user/course/table_line.gif" width="1" height="8" border="0"></td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td width="16"></td>
                  <td width="1"></td>
                  <td> 
                    <div onMouseDown="show_list(dicitonary<%=v_seq%>);"><font style="cursor:hand"><%=v_descs%></font></div>
                  </td>
                </tr>
                <tr><td height="5"></td></tr>
                <tr><td class="dictionary_search_line" colspan="3"></td></tr>
              </table>
             </td>
          </tr>

<%
       }
%>
          <tr>
            <td bgcolor="#30AB6A" height="3"></td>
          </tr>
        </table>  
        <!----------------- �˻��� ���� �� ----------------->

        <!----------------- ������ ���� ----------------->
        <table cellspacing="0" cellpadding="0" class="open_dictionary_table_out1">
          <tr> 
            <td height="5"></td>
          </tr>
          <tr> 
            <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
          </tr>
          <tr> 
            <td height="5"></td>
          </tr>
        </table>
        <!----------------- ������ �� ----------------->
        <br>

      </td>
    </tr>
    <tr>
      <td bgcolor="#636163" height="26" valign='bottom'> 
        <!----------------- �ݱ� ��ư ���� ----------------->
        <table cellspacing="0" cellpadding="0" width="98%">
        <tr> 
            <td align="right"><a href="javascript:self.close();"><img src="/images/user/course/open_dicitonary_close_butt.gif" alt="close" width="48" height="17" border="0"></a></td>
        </tr>
      </table>
        <!----------------- �ݱ� ��ư �� ----------------->
      </td>
    </tr>
  </table>

</form>
</body>
</html>
