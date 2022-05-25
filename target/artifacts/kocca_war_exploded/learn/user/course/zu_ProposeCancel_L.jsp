<%
//**********************************************************
//  1. ��      ��: EDUCATION SUBJECT PAGE
//  2. ���α׷���: zu_EducationSubject_L.jsp
//  3. ��      ��: ��������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 27
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "MyClassBean" class = "com.credu.study.MyClassBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","02");                       // �޴� ���̵� ����

    String  v_process   = box.getString("p_process");
    String  v_user_id   = box.getSession("userid");
    String  v_grcode    =  "";
    String  v_gyear     =  "";
    String  v_grseq     =  "";
    String  v_upperclass=  "";
    String  v_isonoff   =  "";
    String  v_course    =  "";
    String  v_cyear     =  "";
    String  v_courseseq =  "";
    String  v_coursenm  =  "";
    String  v_subj      =  "";
    String  v_subjseqgr =  "";
    String  v_year      =  "";
    String  v_subjnm    =  "";
    String  v_subjseq   =  "";
    String  v_propstart=  "";
    String  v_propend   =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_eduurl    =  "";
    String  v_isnewcourse=  "";
    String  v_chkfirst  =  "";
    String  v_chkfinal  =  "";
    String  v_cancelkind=  "";
    String  v_proposestatus=  "";
    String  v_userid = "";

    String  v_isgraduated= "";
    String  v_subjtarget=  "";
    String  v_isonoff_value="";
    String  v_isgraduated_value="";
    String  v_today     =  FormatDate.getDate("yyyyMMdd");
    String  v_propstart_date = "";
    String  v_propend_date = "";
    String  v_edustart_date = "";
    String  v_eduend_date = "";

    int     i           =  0;

    ArrayList list1     = null;
    //DEFINED class&variable END

    list1 = (ArrayList)request.getAttribute("CancelPossibleList");   //study.MyClassBean.selectEducationSubjectList(box)
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="javascript">
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

function whenProposeCancel(userid,subj,year,subjseq) {
    if(confirm('������û�� ��� �Ͻðڽ��ϱ�?')){
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.action='/servlet/controller.study.MyClassServlet';
        document.form1.p_process.value = 'ProposeCancel';
        document.form1.submit();
    }
}
//-->
</script>


<form name= "form1" method= "post">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_userid'    value ="">
    <input type='hidden' name='p_subj'      value ="">
    <input type='hidden' name='p_year'      value ="">
    <input type='hidden' name='p_subjseq'   value ="">
    <input type='hidden' name='p_subjnm'    value ="">
          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; ������û/�ȳ� &gt; ������ûȮ��/���</td>
              </tr>
              <tr> 
                <td align="center" valign="top">
                <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="75"><img src="/images/user/support/search_img.gif" alt="�����˻�"></td>
                      <td width="75">
                        <select name="p_lsearch">
                          <option value="isonoff">����</option>
                          <option value="upperclass">�з�</option>
                          <option value="subjnm">������</option>
                        </select>
                      </td>
                      <td width="132"><input type="text" class="input" name="p_lsearchtext" onkeypress="search_enter(event)" size="20"></td>
                      <td width="394"><a href="javascript:subjSearch()"><img src="/images/user/button/btn_search.gif" alt="�˻�"></a></td>
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
                      <td valign="top"><img src="/images/user/apply/<%=tem_subimgpath%>/tit_apply_c.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top" class="font_ex">������û�� ���� �� ������Ҹ� ���Ͻô� ���� 
                        ������û�Ⱓ���� �Ʒ�<br>
                        ������û��� ��ư�� ������ ��Ұ� �����մϴ�.</td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                    <tr> 
                      <td> 
                        <!-- ������û���table  -->
                        <table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr  class="lcolor"> 
                            <td height="3" colspan="5" class="lcolor"></td>
                          </tr>
                          <tr> 
                            <!--td width="55" class="tbl_gtit">��������</td-->
                            <td width="220" class="tbl_gtit2">������</td>
                            <td width="137" class="tbl_gtit">�����Ⱓ</td>
                            <td width="134" class="tbl_gtit2">������û�Ⱓ</td>
                            <td width="85"  class="tbl_gtit">������û���</td>
                          </tr>

<%
                                      //out.println(list1.size());

                      String v_FinalStatusImg = "";
                      //String v_cancelkind = "";
                      if(list1 != null){
                       for(i = 0; i < list1.size(); i++) {
                           DataBox dbox = (DataBox)list1.get(i);
                           v_subj               = dbox.getString("d_subj");
                           v_subjseq            = dbox.getString("d_subjseq");
                           v_subjseqgr          = dbox.getString("d_subjseqgr");
                           v_year               = dbox.getString("d_year");
                           v_subjnm             = dbox.getString("d_subjnm");
                           v_propstart          = dbox.getString("d_propstart");
                           v_propend            = dbox.getString("d_propend");
                           v_edustart           = dbox.getString("d_edustart");
                           v_eduend             = dbox.getString("d_eduend");
                           v_chkfinal           = dbox.getString("d_chkfinal");
                           v_isonoff            = dbox.getString("d_isonoff");
                           v_userid             = dbox.getString("d_userid");
                           v_cancelkind         = dbox.getString("d_cancelkind");

                           v_propstart_date   = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");
                           v_propend_date     = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");
                           v_edustart_date    = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                           v_eduend_date      = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");
                           if(v_isonoff.equals("ON"))      {   v_isonoff_value =   "���̹�";
                           }else if(v_isonoff.equals("OFF")){  v_isonoff_value =   "����"; }
                           
                           if(v_cancelkind.equals("")){
                             if (v_chkfinal.equals("Y")){
                               v_FinalStatusImg = "<img src=/images/user/button/btn_approve.gif >";
                             }else if (v_chkfinal.equals("N")){
                               v_FinalStatusImg = "<img src=/images/user/button/btn_ban.gif >";
                             }else if (v_chkfinal.equals("B")){
//                               v_FinalStatusImg = "<img src=/images/user/myhome/b_submiting.gif >";
                                 v_FinalStatusImg = "<a href=\"javascript:whenProposeCancel('"+v_userid+"','"+v_subj+"','"+v_year+"','"+v_subjseq+"')\"><img src='/images/user/button/btn_apply_cancel.gif' border='0'></a>";
                             }else if (v_chkfinal.equals("M")){
                               v_FinalStatusImg = "-";
                             }
                           }else{
                             v_FinalStatusImg  = "-";
                           }
%>

                          <tr> 
                            <!--td class="tbl_grc"><%=v_isonoff_value%></td-->
                            <td class="tbl_bleft"><%=v_subjnm%></td>
                            <td class="tbl_grc"><%= v_edustart_date %>~<%= v_eduend_date %></td>
                            <td class="tbl_grc"><%= v_propstart_date %>~<%= v_propend_date %></td>
                            <td class="tbl_grc"><%=v_FinalStatusImg%></td>
                          </tr>
<!--
                                        <td class=boardskin1_textn><%if(dbox.getString("d_cancelkind").equals("")){%><a href="javascript:whenProposeCancel('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')"><img src="/images/user/myhome/b_cansubmit.gif" border="0"></a><%}else{%>��ҿϷ�<%}%></td>
-->
<%}
                           }
                           if(i == 0){
%>
                                      <tr> 
                                        <td bgcolor="FFFFFF" align="center" colspan="11" height="35">��Ұ����� ������ �����ϴ�.</td>
                                      </tr>
<%
                           }
%>

                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
</form>
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