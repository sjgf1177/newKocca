<%
//**********************************************************
//  1. ��      ��: ������(����)
//  2. ���α׷��� : zu_DicSubjStudy_L.jsp
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
    String  v_process         = box.getString("p_process");
    String  v_total_row_count = box.getStringDefault("total_row_count","0");  // �󿡼� box.put 
    //2005.12.06_�ϰ��� : ���� -> �����׷����� ����.
	String  v_subj            = box.getString("p_subj");    // �����ڵ�
	//String  v_subj            = box.getString("p_grcode");    // �����׷��ڵ�

	String s_grcode		= box.getSession("tem_grcode");
	if(!s_grcode.equals(""))
	{
		v_subj = s_grcode;
	}


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
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">

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
         document.form1.action = "/servlet/controller.study.DicSubjStudyServlet";
         document.form1.p_process.value = "selectList";     
         document.form1.submit();
    }            
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.study.DicSubjStudyServlet";
         document.form1.p_process.value = "selectList";     
         document.form1.submit();
    } 

    function goSearch() {
        document.form1.p_pageno.value = 1;
        document.form1.target = "_self"
        document.form1.p_process.value   = "selectList";
        document.form1.action            = "/servlet/controller.study.DicSubjStudyServlet";
        document.form1.submit();

    }

    function goGroup(group) {
        document.form1.p_pageno.value = 1;
        document.form1.p_group.value      = group;
        document.form1.p_searchtext.value = "";

        document.form1.target = "_self"
        document.form1.p_process.value   = "selectList";
        document.form1.action            = "/servlet/controller.study.DicSubjStudyServlet";
        document.form1.submit();

        document.form1.target = window.self.name;

    }

//-->
</SCRIPT>
</head>

<body class="body_color" text="#000000" topmargin="0" leftmargin="0" marginheight="0">
<form name = 'form1' method ='post'>

<form name ='form1' method='post' action='javascript:goSearch();'>
    <input type='hidden' name = 'p_process'    value = '<%=v_process%>'>
    <input type='hidden' name = 'p_pageno'     value = '<%=v_pageno%>'>
    <input type='hidden' name = 'p_subj'       value = '<%=v_subj%>'>
    <input type='hidden' name = 'p_group'      value = '<%=v_group%>'>

  <table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="1" bgcolor="#bebebe" class="table2" height="100%">
                <tr>
                    <td align="center" valign="top" class="body_color">
				      <table width="100%" border="0" cellspacing="0" cellpadding="0">

   
    <tr>
                  <td valign="top" height="55">
				  <br>
                    <!----------------- Ÿ��Ʋ ���� ----------------->
                    <table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
                      <tr> 
                        <td><img src="/images/user/study/dic_title.gif"></td>
                        <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
                        <td><img src="/images/user/study/gongi_tail.gif"></td>
                      </tr>
                    </table></td>
    </tr>
    <!----------------- top Ÿ��Ʋ �� ----------------->
    <tr>
      <td align="center" valign="top">
        <br>

        <table cellspacing="0" cellpadding="0" class="open_dictionary_table_out1">
          <tr> 
            <td class="open_dictionary_color_line"></td>
          </tr>
        </table>

        <!----------------- �˻� ���� ----------------->
        <table cellspacing="0" cellpadding="0" class="open_dictionary_table_out2">
          <tr> 
            <td> 
              <table width="100%" cellpadding="3" cellspacing="0" class="table2">
                      <tr> 
                        <td><img src="../../../images/user/study/dic_text1.gif"></td>
                        <td class="open_dictionary_text1"> <table cellpadding="0" cellspacing="0" width="36%" border="0">
                            <tr> 
                              <td width="155"> <input type="text" name="p_searchtext"  class="input_course_search" value='<%=v_searchtext%>'> 
                              </td>
                              <td><a href="javascript:goSearch()"><img src="/images/user/button/btn_j.gif" border="0"></a></td>
                            </tr>
                          </table></td>
                      </tr>
					  <tr>
                        <td height="1"></td>
                        <td height="1" background="../../../images/user/study/dic_line.gif"></td>
                      </tr>
                      <tr> 
                        <td><img src="../../../images/user/study/dic_text2.gif"></td>
                        <td class="open_dictionary_text1"> <table width="317" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt1.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt2.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt3.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt4.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt5.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt6.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt7.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt8.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt9.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt10.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt11.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt12.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt13.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('��')"><img src="/images/user/course/dictionary_kor_butt14.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="36"><a href="javascript:goGroup('��Ÿ')"><img src="/images/user/course/dictionary_kor_butt15.gif" width="34" height="17" border="0"></a>
                              <td> </tr>
                          </table></td>
                      </tr>
                      <tr>
                        <td height="1"></td>
                        <td height="1" background="../../../images/user/study/dic_line.gif"></td>
                      </tr>
                      <tr> 
                        <td><img src="../../../images/user/study/dic_text3.gif"></td>
                        <td class="open_dictionary_text1"> <table width="494" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td align="center" width="19"><a href="javascript:goGroup('A')"><img src="/images/user/course/dictionary_eng_butt1.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('B')"><img src="/images/user/course/dictionary_eng_butt2.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('C')"><img src="/images/user/course/dictionary_eng_butt3.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('D')"><img src="/images/user/course/dictionary_eng_butt4.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('E')"><img src="/images/user/course/dictionary_eng_butt5.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('F')"><img src="/images/user/course/dictionary_eng_butt6.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('G')"><img src="/images/user/course/dictionary_eng_butt7.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('H')"><img src="/images/user/course/dictionary_eng_butt8.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('I')"><img src="/images/user/course/dictionary_eng_butt9.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('J')"><img src="/images/user/course/dictionary_eng_butt10.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('K')"><img src="/images/user/course/dictionary_eng_butt11.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('L')"><img src="/images/user/course/dictionary_eng_butt12.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('M')"><img src="/images/user/course/dictionary_eng_butt13.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('N')"><img src="/images/user/course/dictionary_eng_butt14.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('O')"><img src="/images/user/course/dictionary_eng_butt15.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('P')"><img src="/images/user/course/dictionary_eng_butt16.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('Q')"><img src="/images/user/course/dictionary_eng_butt17.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('R')"><img src="/images/user/course/dictionary_eng_butt18.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('S')"><img src="/images/user/course/dictionary_eng_butt19.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('T')"><img src="/images/user/course/dictionary_eng_butt20.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('U')"><img src="/images/user/course/dictionary_eng_butt21.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('V')"><img src="/images/user/course/dictionary_eng_butt22.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('W')"><img src="/images/user/course/dictionary_eng_butt23.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('X')"><img src="/images/user/course/dictionary_eng_butt24.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('Y')"><img src="/images/user/course/dictionary_eng_butt25.gif" width="17" height="17" border="0"></a></td>
                              <td align="center" width="19"><a href="javascript:goGroup('Z')"><img src="/images/user/course/dictionary_eng_butt26.gif" width="17" height="17" border="0"></a></td>
                            </tr>
                          </table></td>
                      </tr>
					  <tr>
                        <td height="1"></td>
                        <td height="1" background="../../../images/user/study/dic_line.gif"></td>
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
            <td width="39" height="8"><img src="../../../images/user/study/dic_head.gif"border="0"></td>
            <td background="../../../images/user/study/dic_head_bg.gif" width="537"></td>
                  <td width="39" align="right"><img src="../../../images/user/study/dic_tail.gif"border="0"></td>
          </tr>
          <tr> 
            <td colspan="3" style="padding-left=5" class="open_dictionary_text3">&gt;&gt; 
              �� <b><font color="#FFFF00"><%=v_total_row_count%>��</font></b>�� �� �˻��Ǿ����ϴ�. 
              [<font color="#3E9F09"><b><font color="#FFFF00">��<%=v_search%>��</font></b></font>(��)�� 
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
            //2005.12.06_�ϰ��� : ���� -> �����׷� 
			//v_subjcode   = dbox.getString("d_subjcode");
            v_subjcodenm = dbox.getString("d_subjcodenm");
			v_subjcode   = dbox.getString("d_grcode");
            v_subjcodenm = dbox.getString("d_grcodenm");

            v_totalpage  = dbox.getInt("d_totalpage");
            v_rowcount   = dbox.getInt("d_rowcount");  

            v_descs = StringManager.replace(v_descs,"\n","<br>");

%>
          <tr> 
            <td class="open_dictionary_text4">
              <div onMouseDown="show_list(dicitonary<%=v_seq%>);">
              <font style="cursor:hand"><img src="../../../images/user/study/bl_dic.gif" border="0"><%=v_words%></font>
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
                    <div onMouseDown="show_list(dicitonary<%=v_seq%>);"><font style="cursor:hand"><%=dbox.getString("d_descs")%></font></div>
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
            <td bgcolor="#E47B49" height="3"></td>
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
      <td  height="26" valign='bottom'> 
        <!----------------- �ݱ� ��ư ���� ----------------->
        <table cellspacing="0" cellpadding="0" width="90%">
        <tr> 
            <td align="right"><a href="javascript:self.close();"><img src="/images/user/button/btn_close.gif" border="0"></a></td>
        </tr>
      </table>
        <!----------------- �ݱ� ��ư �� ----------------->
      </td>
    </tr>
  </table>
 </td>        </table>
                </tr>
            </table>

        </td>
    </tr>
</table>
</form>
</body>
</html>
