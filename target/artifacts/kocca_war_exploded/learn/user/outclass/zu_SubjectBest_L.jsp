<%
//**********************************************************
//  1. ��      ��: SUBJECT ALL LIST
//  2. ���α׷���: zu_SubjectBest_L.jsp
//  3. ��      ��: �α������ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.01.14
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����

    String  v_process     = box.getString("p_process");
    String  v_select      = box.getStringDefault("p_select","ON");


    String v_subj           = "";
    String v_scupperclass   = "";
    String v_scmiddleclass  = "";
    String v_isonoff        = "";
    String v_year           = "";
    String v_subjseq        = "";
    String v_subjnm         = "";
    String v_proposetype    = "";
    String v_isnew          = "";
    String v_ishit          = "";
    String v_isrecom        = "";
    String v_uclassnm       = "";
    String v_mclassnm       = "";

    String v_isonoff_value  = "";

    ArrayList list1 = (ArrayList)request.getAttribute("SubjectListW");         // �������� ����Ʈ
    ArrayList list2 = (ArrayList)request.getAttribute("SubjectListL");         // ���а��� ����Ʈ
%>
<!------- �޴����� ------------>
<%@ include file="/learn/user/include/topOutClass.jsp"%>
<!------- �޴���  ------------->
<SCRIPT LANGUAGE="JavaScript">
<!--

// ����������
function whenSubjInfo(subj,subjnm,isonoff,upperclass,upperclassnm){
    document.form1.p_subj.value = subj;
    document.form1.p_subjnm.value = subjnm;
    document.form1.p_isonoff.value = isonoff;
    document.form1.p_upperclass.value = upperclass;
    document.form1.p_upperclassnm.value = upperclassnm;
    document.form1.p_process.value = 'SubjectPreviewPage';
    document.form1.p_rprocess.value = 'SubjectListAll';
    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
    document.form1.submit();
}

//-->
</SCRIPT>

<form name="form1" method="post" enctype = "multipart/form-data">
    <input type='hidden' name='p_process' value="<%=v_process%>">
    <input type='hidden' name='p_isonoff' value="ON">
    <input type='hidden' name='p_select'  value="<%=v_select%>">


    <input type='hidden' name='p_year'>
    <input type='hidden' name='p_subjseq'>
    <input type='hidden' name='p_proposestart'>
    <input type='hidden' name='p_proposeend'>
    <input type='hidden' name='p_proposeyn'>
    <input type='hidden' name='p_proposetype'>
    <input type='hidden' name='p_purl'>


    <input type='hidden' name='p_subj'>
    <input type='hidden' name='p_subjnm'>
    <input type='hidden' name='p_upperclass' value=''>
    <input type='hidden' name='p_upperclassnm' >
    <input type='hidden' name='p_actionurl' value='/servlet/controller.propose.ProposeCourseServlet'>
    <input type='hidden' name='p_rprocess' >

          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="center" valign="top">
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/<%=site%>/tit_apply.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top" ><img src="/images/user/<%=site%>/st_bestinfo.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td height="20"><img src="/images/user/<%=site%>/sst_jobbest.gif"></td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                    <tr> 
                      <td valign="top"> 
                        <!-- �������� table  -->
                        <table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr  class="lcolor"> 
                            <td height="3" colspan="3" class="lcolor"></td>
                          </tr>
                          <tr> 
                            <td width="55" class="tbl_gtit">����</td>
                            <td width="88" class="tbl_gtit2">�з�</td>
                            <td  class="tbl_gtit">������</td>
                          </tr>
<%
                  //���� ����Ʈ
                  int i = 0;
                  for(i = 0; i < list1.size(); i++) {
                      DataBox dbox1 = (DataBox)list1.get(i);

                      v_subj          = dbox1.getString("d_subj");
                      v_scupperclass  = dbox1.getString("d_scupperclass");
                      v_scmiddleclass = dbox1.getString("d_scmiddleclass");
                      v_isonoff       = dbox1.getString("d_isonoff");
                      v_subjnm        = dbox1.getString("d_subjnm");
                      v_isnew         = dbox1.getString("d_isnew");
                      v_ishit         = dbox1.getString("d_ishit");
                      v_isrecom       = dbox1.getString("d_isrecom");
                      v_uclassnm      = dbox1.getString("d_uclassnm");
                      v_mclassnm      = dbox1.getString("d_mclassnm");

                      v_isonoff_value  = (v_isonoff.equals("ON"))?"���̹�":"����";

%>
                          <tr> 
                            <td class="tbl_grc"><%=v_isonoff_value%></td>
                            <td class="tbl_grc"><%=v_uclassnm%></td>
                            <td class="tbl_bleft"><a href="javascript:whenSubjInfo('<%=v_subj%>','<%=v_subjnm%>','<%=v_isonoff%>','<%=v_scupperclass%>','<%=v_uclassnm%>')" title="<%=v_subjnm%>"><%=v_subjnm%></a></td>
                          </tr>
<%
                }   // END FOR

                if (i == 0 ) {

%>
                          <tr> 
                            <td class="tbl_grc" colspan="5">�������� ������ �����ϴ�.</td>
                          </tr>
<%
                }
%>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/<%=site%>/sst_wordbest.gif"></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                    <tr> 
                      <td><table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr  class="lcolor"> 
                            <td height="3" colspan="3" class="lcolor"></td>
                          </tr>
                          <tr> 
                            <td width="55" class="tbl_gtit">����</td>
                            <td width="88" class="tbl_gtit2">�з�</td>
                            <td  class="tbl_gtit">������</td>
                          </tr>
<%
                  //���� ����Ʈ
                  int j = 0;
                  for(j = 0; j < list2.size(); j++) {
                      DataBox dbox2 = (DataBox)list2.get(j);

                      v_subj          = dbox2.getString("d_subj");
                      v_scupperclass  = dbox2.getString("d_scupperclass");
                      v_scmiddleclass = dbox2.getString("d_scmiddleclass");
                      v_isonoff       = dbox2.getString("d_isonoff");
                      v_subjnm        = dbox2.getString("d_subjnm");
                      v_isnew         = dbox2.getString("d_isnew");
                      v_ishit         = dbox2.getString("d_ishit");
                      v_isrecom       = dbox2.getString("d_isrecom");
                      v_uclassnm      = dbox2.getString("d_uclassnm");
                      v_mclassnm      = dbox2.getString("d_mclassnm");

                      v_isonoff_value  = (v_isonoff.equals("ON"))?"���̹�":"����";

%>
                          <tr> 
                            <td class="tbl_grc"><%=v_isonoff_value%></td>
                            <td class="tbl_grc"><%=v_uclassnm%></td>
                            <td class="tbl_bleft"><a href="javascript:whenSubjInfo('<%=v_subj%>','<%=v_subjnm%>','<%=v_isonoff%>','<%=v_scupperclass%>','<%=v_uclassnm%>')" title="<%=v_subjnm%>"><%=v_subjnm%></a></td>
                          </tr>
<%
                }   // END FOR

                if (j == 0 ) {

%>
                          <tr> 
                            <td class="tbl_grc" colspan="5">�������� ������ �����ϴ�.</td>
                          </tr>
<%
                }
%>
                        </table>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
</form>

            </table>

          </td>
        </tr>
        <tr>
          <td class="mlcolor2">&nbsp;</td>
        </tr>
      </table>
     </td>
  </tr>
</table>
<!-- footer -->
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
