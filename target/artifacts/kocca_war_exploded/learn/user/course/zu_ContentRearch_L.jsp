<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: zu_SubjectPreview.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����

    String  v_process      = box.getString("p_process");
    String  v_isonoff      = box.getString("p_isonoff");
    String  v_gubun       = box.getString("p_gubun");
    String  v_rprocess     = box.getString("p_rprocess");
    String  v_subj         = box.getString("p_subj");
    String  v_subjnm       = box.getString("p_subjnm");
    String  v_upperclassnm = box.getString("p_upperclassnm");
    String  v_upperclass   = box.getString("p_upperclass");
    String  v_select       = box.getString("p_select");
    String  v_actionurl    = box.getString("p_actionurl");
    String  v_lsearchsubject = box.getString("p_lsearchsubject");

    
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �����˻� ����ó��
    function search_enter(e)  {
        if (e.keyCode =='13'){  subjSearch();  }
    }

    // �����˻�
    function subjSearch() {
        if (document.form1.p_lsearchtext.value=="") {
            alert("�˻�� �Է����ּ���");
            return;
        }
        document.form1.action = "/servlet/controller.propose.MainSubjSearchServlet";   // 
        document.form1.p_process.value = "SubjSearch";
        document.form1.submit();
    }
//-->
</SCRIPT>

<form name="form1" method="post" >
  <input type='hidden' name='p_process'>
  <input type='hidden' name='p_isonoff' value='<%=v_isonoff%>'>
  <input type='hidden' name='p_gubun' value="<%=v_gubun%>">


  <input type='hidden' name='p_subj' value='<%=v_subj%>'>
  <input type='hidden' name='p_subjnm' value='<%=v_subjnm%>'>
  <input type='hidden' name='p_select' value='<%=v_select%>'>
  <input type='hidden' name='p_upperclass' value='<%=v_upperclass%>'>
  <input type='hidden' name='p_upperclassnm' value='<%=v_upperclassnm%>'>
  <input type='hidden' name='p_lsearchsubject' value='<%=v_lsearchsubject%>'>
  <input type='hidden' name='p_actionurl' value='<%=v_actionurl%>'>
  <input type='hidden' name='p_rprocess' value='<%=v_rprocess%>'>

          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> HOME &gt; ������û/�ȳ� &gt; ������û</td>
              </tr>
              <tr> 
                <td align="center" valign="top">
                <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="75"><img src="/images/user/support/search_img.gif"  alt="�����˻�"></td>
                      <td width="75">
                        <select name="p_lsearch">
                          <option value="isonoff">����</option>
                          <option value="upperclass">�з�</option>
                          <option value="subjnm">������</option>
                        </select>
                      </td>
                      <td width="132"><input type="text" class="input" name="p_lsearchtext" onkeypress="search_enter(event)" size="20"></td>
                      <td width="394"><a href="javascript:subjSearch()"><img src="/images/user/button/btn_search.gif"  alt="�˻�"></a></td>
                    </tr>
                    <tr> 
                      <td colspan="4"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/apply/<%=tem_subimgpath%>/tit_apply.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="128" valign="top"><img src="/images/user/apply/st_conview.gif" ></td>
                      <td width="547" align="right" valign="top">&nbsp; </td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="2" class="font_ex">���״� 5�����������Դϴ�.</td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="2"></td>
                    </tr>
                    <tr valign="top"> 
                      <td height="20" colspan="2"> 
                        <!-- �����Ұ� table -->
                        <table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr  class="lcolor"> 
                            <td height="3" colspan="5" class="lcolor"></td>
                          </tr>
                          <tr> 
                            <td colspan="4" class="tbl_gtit">����</td>
                            <td width="53" class="tbl_gtit">����</td>
                          </tr>

<%  
    ArrayList    list = (ArrayList)request.getAttribute("SulmunResultList");
    SulmunQuestionExampleData data    = null;
    SulmunExampleData         subdata = null;
    double v_total = 0;
    int v_row = 0;
    int v_flag = 0;

    for (int i=0; i < list.size(); i++) {
        data = (SulmunQuestionExampleData)list.get(i);

              double d = 0; 
              int person = 0;
              double v_point = 0;
      
           for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j); 
                if (subdata != null) { 

                    d +=  (subdata.getReplycnt()) * subdata.getSelpoint();
                    person += subdata.getReplycnt();
                }
            }   
               
        v_point = d / person;     
               
        v_total += v_point;

        if(data.getDistcode().equals("11")){
             v_row = 5;
        } else if(data.getDistcode().equals("12")){
             v_row = 5;
        } else if(data.getDistcode().equals("13")){
             v_row = 5;
        } else if(data.getDistcode().equals("14")){
             v_row = 5;
        } else if(data.getDistcode().equals("15")){
             v_row = 5;
        } else if(data.getDistcode().equals("16")){
             v_row = 10;
             v_flag++;
        } else if(data.getDistcode().equals("17")){
             v_row = 5;
        }

        if( (i%5) == 0 && (v_flag) != 6 ){
%>
                          <tr> 
                            <td width="111" rowspan="<%=v_row%>" class="tbl_gtit2"><%=data.getDistcodenm()%></td>
                            <td colspan="3" class="tblfont_gleft"><%=data.getSultext()%><br></td>
                            <td class="tblfont_gleft"><%if(v_point >=0){%><%=v_point%>��<%}else{%>0.0��<%}%></td>
                          </tr>
<%
        }else{
%>
                          <tr> 
                            <td height="26" colspan="3" class="tblfont_gleft"><%=data.getSultext()%><br></td>
                            <td class="tblfont_gleft"><%if(v_point >=0){%><%=v_point%>��<%}else{%>0.0��<%}%></td>
                          </tr>
<%
        }
    }   
    
    double v_average = v_total / list.size();
%>
                          <tr> 
                            <td height="4" colspan="5" ></td>
                          </tr>
                          <tr> 
                            <td class="tbl_gtit2">����</td>
                            <td width="233" class="tblfont_gleft"><%if(v_total >=0){%><%=v_total%>��<%}else{%>0.0��<%}%></td>
                            <td width="121" class="tbl_gtit2">�������</td>
                            <td width="121" class="tblfont_gleft"><%if(v_average >=0){%><%=v_average%>��<%}else{%>0.0��<%}%></td>
                            <td class="tblfont_gleft">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="2"></td>
                    </tr>
                    <tr align="center"> 
                      <td height="20" colspan="2"><a href="javascript:history.back()"><img src="/images/user/button/btn_list.gif"  alt="���" border="0"></a></td>
                    </tr>
                  </table>
</form>

                </td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
              <tr> 
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>
            </table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->