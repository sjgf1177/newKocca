<%
//**********************************************************
//  1. ��      ��: ���� > ����Ʈ��
//  2. ���α׷��� : gu_siteMap.jsp
//  3. ��      ��: ����Ʈ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.10
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box    = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");
    box.put("leftmenu","07");                       // �޴� ���̵� ����
%>

<SCRIPT LANGUAGE="JavaScript">
<!--

//-->
</SCRIPT>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topService.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<link href="/css/user_style1.css" rel="stylesheet" type="text/css">

<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/service/<%=tem_subimgpath%>/tit_sitemap.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> HOME > ���� > ����Ʈ��</td>
  </tr>
  <tr> 
    <td height="20">
      <!-- page sub -->
    </td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td valign="top"><img src="/images/user/game/service/text_sitemap.gif"></td>
  </tr>
  <tr> 
    <td height="25">&nbsp;</td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="155" valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_course.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('1', '01', '1')">���������Ұ�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('1', '02', '2')">�н�����</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('1', '03', '3')">��ü�����˻�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('1', '04', '4')">��������</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('1', '05', '5')">������������</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('1', '06', '6')">�α����</a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="33">&nbsp;</td>
    <td width="155" valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_apply.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('2', '01', '1')">������û�ȳ�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('2', '02', '2')">������û</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('2', '03', '3')">������ûȮ��/���</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('2', '04', '4')">self����</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('2', '05', '5')">�������ΰ��� ��û/Ȯ��</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21">&nbsp;</td>
                <td class="tbl_bleft_none">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="33">&nbsp;</td>
    <td width="155" valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_myclass.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '01', '1')">���ǰ��ǽ�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '02', '2')">���Ǳ����̷�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '03', '3')">����������</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '04', '4')">�����н�Ȱ��</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '05', '5')">���İ����Խ���</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '06', '6')"> E-TEST</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '07', '7')">���Ǽ���</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '08', '8')">Ư����</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '09', '9')">���ɰ���</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('3', '10', '10')">���ϸ���</a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="33" valign="top">&nbsp;</td>
    <td width="155" valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_helpdesk.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('4', '01', '1')">F A Q</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('4', '02', '2')">Q &amp; A</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('4', '03', '3')">S/W �ٿ�ε�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('4', '04', '4')">�ڷ��</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('4', '05', '5')">�н�ȯ�浵���</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('4', '06', '6')">�¶��θ޴���</a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td colspan="7">&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_book.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('6', '01', '1')">�����Ǹ�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('6', '02', '2')">�����û Ȯ��/���</a></td>
              </tr>
            </table>
          </td>
        </tr>
      </table></td>
    <td>&nbsp;</td>
    <td valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_service.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('5', '01', '1')">��������</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('5', '02', '2')">�̴��� ���ȸ��</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('5', '03', '3')">OffLine �л�������</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('5', '04', '4')">���α���</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('5', '05', '5')">��ڿ���</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('5', '06', '6')">���� &amp; ���׽Ű�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="javascript:menuForward('5', '07', '7')">����Ʈ��</a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td>&nbsp;</td>
    <td valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_intro.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab1">������ǥ</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab2">���� �� ����</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab3">�����λ縻</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab4">����ü����</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab5">�����ܰ�</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab6">���ᱳ������</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab7">��ġ/����ó</a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td>&nbsp;</td>
    <td valign="top"><table width="155" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img src="/images/user/game/service/sm_tit_member.gif"></td>
        </tr>
        <tr> 
          <td width="11">&nbsp;</td>
          <td width="144"><table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21" height="10" background="/images/user/game/service/sm_line.gif"></td>
                <td></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.MemberJoinServlet?p_process=join">ȸ������</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.LoginServlet?p_process=golosspwd">���̵�/��й�ȣã��</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21"><img src="/images/user/game/service/sm_bl.gif"></td>
                <td class="tbl_bleft_none"><a href="/servlet/controller.homepage.MemberJoinServlet?p_process=personal">�������� ��ȣ��å</a></td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21">&nbsp;</td>
                <td class="tbl_bleft_none">&nbsp;</td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21">&nbsp;</td>
                <td class="tbl_bleft_none">&nbsp;</td>
              </tr>
            </table>
            <table width="144" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="21">&nbsp;</td>
                <td class="tbl_bleft_none">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
