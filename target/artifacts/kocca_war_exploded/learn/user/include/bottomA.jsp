<%@ page import = "com.credu.course.*" %>

<%
    EduGroupBean helpbean1 = new EduGroupBean();
    box.put("p_grcode", tem_grcode);

    EduGroupData helpdata1 = helpbean1.SelectEduGroupData(box);
%>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0" background="<%=tem_imgpath%><%=tem_footbg%>">
  <tr>
    <td valign="top"><table width="900" height="64" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top">
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td width="131" rowspan="2" align="right" valign="top">&nbsp;</td>
          <td width="634" height="17" align="center" class="bottom_menu"><a href="javascript:openTong()">통신훈련유의사항</a>
            ㅣ <a href="javascript:openPersonal()">개인정보보호정책</a> <strong>교육문의: TEL</strong> <%=helpdata1.getMasterComptel()%>
            <strong>E-MAIL</strong> <a href="javascript:whenUsermail('<%=helpdata1.getMaster()%>', '<%= helpdata1.getMasterName()%>' ,'<%=helpdata1.getMasterEmail()%>')"><%=helpdata1.getMasterEmail()%></a>
          </td>
        </tr>
        <tr>
          <td height="35" align="center" valign="top"><img src="<%=tem_imgpath%><%=tem_footcopyright%>" ></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<SCRIPT LANGUAGE="JavaScript">
<!--
// 통신유의사항
function openTong() {
    window.open('/learn/user/homepage/pop_tongshin.html','openTong','width=550,height=590,scrollbars=no,resizable=no');
}
//개인정보보호정책
function openPersonal() {
    window.open('/learn/user/homepage/pop_personalboho.html','openPersonal','width=550,height=670,scrollbars=no,resizable=no');
}

// 사용자메일
function whenUsermail(tuserid, tusername, tuseremail) {
    window.self.name = "MainPage";
    open_window("openUserMail","","10","10","590","550");
    document.topdefaultForm.target = "openUserMail";
    document.topdefaultForm.p_process.value='usermail';
    document.topdefaultForm.action='/servlet/controller.homepage.MainServlet?p_tuserid=' +tuserid+ '&p_tusername=' +tusername+ '&p_tuseremail='+tuseremail;
    document.topdefaultForm.submit();

    document.topdefaultForm.target = window.self.name;
}
//-->
</SCRIPT>

<%@ include file = "/learn/library/getJspName.jsp" %>

</body>
</html>
