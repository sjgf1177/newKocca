<%
//**********************************************************
//  1. ��      ��: ����Ÿ > FAQ 
//  2. ���α׷��� : ku_HomePageFaq_L.jsp
//  3. ��      ��: FAQ ����Ʈȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
//  7. ��      ��: 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_process     = box.getString("p_process");
    String  v_faqcategory = "";
    v_faqcategory = box.getString("faqcategory");

    int     v_fnum       = 0, v_totalpage = 0, v_rowcount = 1;
    int     v_pageno     = box.getInt("p_pageno"); 
    String  v_title      = "";
    String  v_contents   = "";
    String  v_indate     = "";
    String  v_searchtext = box.getString("p_searchtxt");   
    ArrayList list       = (ArrayList)request.getAttribute("selectList");
    String faqcategory   ="";
                  
%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topHelpdesk.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--
// faq ��ȸ
function Search()
{
    document.form1.p_faqcodecont.value=document.form1.p_faqcode.options[document.form1.p_faqcode.selectedIndex].text;
    document.form1.action="/Controller?cmd=home&act=homefaq";
    document.form1.submit();
}

// �����˻� ����ó��
    function search_enter(e)  {
        if (e.keyCode =='13'){  searchTxt();  }
    }

//ī�װ��� �´� ����Ʈ �˻�
function changeCategory(aa) {
        document.form1.faqcategory.value=aa;
        document.form1.action = "/servlet/controller.homepage.KHomePageFAQServlet";
        document.form1.p_process.value    = "selectList";
        document.form1.submit();
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function searchTxt() {
    if(document.form1.p_searchtxt.value ==""){
        alert("������ �Է��ϼ���");
        return;
        
    }
        document.form1.action = "/servlet/controller.homepage.KHomePageFAQServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
}


//-->

function clickHandler() {
  var targetId, srcElement, targetElement, srcCss;
  srcElement = window.event.srcElement;

  if (srcElement.className == "question") {
     targetId = srcElement.id + "details";
     targetElement = document.all(targetId);
     srcCss = document.all(srcElement.id);

     if (targetElement.style.display == "none") {
        targetElement.style.display = "";
        //srcCss.style.color = "#666666";
        //srcCss.style.font = "normal 9pt \"����\"";
     } else {
        targetElement.style.display = "none";
        //srcCss.style.color = "";
        //srcCss.style.font = "normal 9pt \"����\"";
     }
  }
}

document.onclick = clickHandler;
//-->
</script>
<style type="text/css">
<!--
.l-padding {
    padding-left: 12px;
}
-->
</style>


<form name = "form1" method = "post">
      <input type = "hidden" name = "p_process"   value = "">
      <input type = "hidden" name = "p_pageno"    value = "">
      <input type = "hidden" name = "p_seq"       value = "">
      <input type = "hidden" name = "p_userid"    value = "">
      <input type = "hidden" name = "faqcategory" value = "<%=v_faqcategory%>">


                       <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > ����Ÿ > FAQ</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/customer/<%=tem_subimgpath%>/tit_faq.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/customer/text_faq.gif"></td>
                          </tr>
                          <tr> 
                            <td height="12"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="2" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr > 
                            <td height="7" colspan="2" ></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>
                              <table border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="4"><img src="/images/user/kocca/customer/text_search_text.gif"></td>
                                  <td width="110"><input name="p_searchtxt" type="text" class=input style=width:102px></td>
                                  <td width="37"><a href="javascript:searchTxt()"><img src="/images/user/kocca/button/btn_search.gif"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/kocca/customer/bar_cata_top.gif" width="679" height="10"></td>
                          </tr>
                          <tr> 
                            <td background="/images/user/kocca/customer/bg_cata.gif">
                               <table width="680" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td width="13">&nbsp;</td>
                                   <td width="649">
                                     <!-- ī�װ� ���̺� -->
                                     <%=HomePageFAQBean.koccaFaqCategoryTable(box)%>
                                  </td>
                                 </tr>
                               </table> 
                            </td><td width='18'>&nbsp;</td>
                          </tr>
                          <tr>
                            <td ><img src='/images/user/kocca/customer/bar_cata_bo.gif' width='680' height='8'></td>
                          </tr> 
                          <tr>
                            <td>&nbsp;</td>
                          </tr> 
                        </table>


            <!-- ����1 -->
<%
           if(list.size() != 0){

                int i =0;
                for( i = 0; i < list.size(); i++) {

                    DataBox dbox = (DataBox)list.get(i);  
                    
                    v_title     = dbox.getString("d_title");
                    v_contents  = dbox.getString("d_contents");
                    v_totalpage = dbox.getInt("d_totalpage");
                    v_rowcount  = dbox.getInt("d_rowcount");

                    if (!v_searchtext.equals("")) {
                        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
                        v_contents = StringManager.replace(v_contents, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
                    }


            %>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td bgColor=#979CD1 height="3"></td>
                          </tr>
                          <tr> 
                            <td height="2"></td>
                          </tr>
                          <tr> 
                            <td class="linecolor_class02">
                              <TABLE cellSpacing=0 cellPadding=0 width=680 
                                align=center border=0>
                    
                                  <TR> 
                                    <TD width=34 height="27" vAlign=middle><div align="center"><IMG 
                                src="/images/user/kocca/customer/icon_question.gif"></div></TD>
                                    <TD class="l-padding" ><span id="Out<%=i%>" class="question" style="cursor:hand"><%=v_title%></span></TD>
                                  </TR>
                              </TABLE></td>
                          </tr>
                          <tr> 
                            <td class="linecolor_customer01" height=1></td>
                          </tr>
                          <tr>
                            <td height="6"></td>
                          </tr>
                        </table>
                        
                        <!-- ����1  -->
                        <div id="Out<%=i%>details" style="display:none; position:relative;padding-top:4px;visibility:visible;"> 
                          <table width="680" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td height="5"></td>
                            </tr>
                            <tr> 
                              <td> <table width="680" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="46">&nbsp;</td>
                                    <td><%=v_contents%></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr> 
                              <td height="10"></td>
                            </tr>
                          </table>
                        </div>

                        <%}%>
                        <%}else{%>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="13" align=center valign=top>
                                ��� �� FAQ�� �����ϴ�.     
                            </td>
                        </tr>
                        </table> 
                        <%}%>
    </form>



<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->