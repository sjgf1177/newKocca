<%
//**********************************************************
//  1. ��      ��: E-TEST
//  2. ���α׷���: za_ETestUserList.jsp
//  3. ��      ��: �¶����׽�Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 28
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.etest.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    
    String  v_subj       = "";
    String  v_subjnm     = "";
    String  v_year       = "";
    String  v_subjseq    = "";
    String  v_testdate   = "";
    int     v_testtime   = 0;
    String  v_testdate_view = "";
    String  v_teststart     = "";
    String  v_testend       = "";
    int v_papernumcnt = 0;
    int     i               =  0;
    int     j               =  0;
    
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process       = box.getString("p_process");
//    String  v_today = FormatDate.getDate("yyyyMMddHHmm");
String  v_today = "";
    String s_userid = box.getSession("userid");
    
    boolean isFile = conf.getBoolean("etest.paper.file");
        
%>    
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/study/studytop.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

      <input type="hidden" name="p_userid"      value="<%=s_userid%>">
<iframe name="servertimechk" frameborder="0" border="0" scrolling="no" marginwidth="0" marginheight="0" noresize src="/learn/user/etest/ServerTime.jsp" height="0" width="1"></iframe>
      <input type="hidden" name="p_servertime"      value="">
<SCRIPT LANGUAGE="JavaScript">
<!--
//alert(document.form1.p_servertime.value);

function ETestOpen(start, end, subj, year, subjseq, papernum) {
    var now = document.form1.p_servertime.value;//alert(now);
    if (now < start) {
        alert("���� ����ð��� �ƴմϴ�.");
        return;
    }else if(now > end) {
        alert("������ �̹� ����ƽ��ϴ�.");
        return;
    }
	
    document.form1.p_end.value = end;

    document.form1.p_subj.value = subj;
    document.form1.p_year.value = year;
    document.form1.p_subjseq.value = subjseq;
    document.form1.p_papernum.value = papernum;
    document.form1.p_process.value = "ETestUserPaperListPage";

    window.self.name = "winSelectView";
    farwindow = window.open("", "ETestOpen", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 800, height = 600, top=0, left=0");
    document.form1.target = "ETestOpen";
    if(<%=isFile%>) {alert("/learn/etestpaper/"+subj+year+subjseq+papernum+".jsp");
        document.form1.action = "/learn/etestpaper/"+subj+year+subjseq+papernum+".jsp";
    }
    else {
        document.form1.action = "/servlet/controller.etest.ETestUserServlet";
    }
    document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}
function ETestResult(subj, year, subjseq, papernum) {
    document.form1.p_subj.value = subj;
    document.form1.p_year.value = year;
    document.form1.p_subjseq.value = subjseq;
    document.form1.p_papernum.value = papernum;
    document.form1.p_process.value = "ETestUserPaperResult";

    window.self.name = "winSelectView";
    farwindow = window.open("", "ETestResult", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 800, height = 600, top=0, left=0");
    document.form1.target = "ETestResult";
    document.form1.action = "/servlet/controller.etest.ETestUserServlet";
    document.form1.submit();
}
//-->
</SCRIPT>
            <input type="hidden" name="p_subj"    value="">
            <input type="hidden" name="p_year"      value="">
            <input type="hidden" name="p_subjseq"    value="">
            <input type="hidden" name="p_papernum"      value="">
            <input type="hidden" name="p_testdate"      value="">

            <!-- J.S.J �߰�  -->
            <input type="hidden" name="p_end"      value="">

              <!----------------- page ��� ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="route_table">
                <tr> 
                  <td class="route_text"><img src="/images/user/etest/arrow_icon1.gif" width="20" height="7" border="0">������ġ 
                    : Home &gt; ���� �н��� &gt; E-Test</td>
                </tr>
                <tr> 
                  <td class="route_line"></td>
                </tr>
              </table>
              <!----------------- page ��� �� ----------------->

              <!----------------- Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="b_title_table">
                <tr> 
                  <td height="10"></td>
                </tr>
                <tr> 
                  <td background="/images/user/etest/etest_b_title_bg1.gif"><img src="/images/user/etest/etest_b_title1.gif" width="427" height="46" border="0"></td>
                  <td width="7" background="/images/user/etest/etest_b_title_bg1.gif"><img src="/images/user/etest/etest_b_title_bg2.gif" width="7" height="46" border="0"></td>
                </tr>
                <tr> 
                  <td height="7"></td>
                </tr>
              </table>
              <!----------------- Ÿ��Ʋ �� ----------------->
              <br>
              <!----------------- ���׽�Ʈ �� Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="s_title_table">
                <tr>
                  <td height="8"></td>
                </tr>
                <tr>
                  <td width="15"><img src="/images/user/study/study_icon1.gif" width="15" height="15" border="0"></td>
                  <td class="s_title_text">E-Test ��</td>
                </tr>
                <tr>
                  <td height="5"></td>
                </tr>
              </table>
              <!----------------- ���׽�Ʈ �� Ÿ��Ʋ �� ----------------->
              <!----------------- E-Test ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="table_out">
                <tr> 
                  <td colspan="9" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td class="table_title_bg1">������</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="10%">����</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="10%">����</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="13%">������۽ð�</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="13%">�ҿ�ð�</td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_color_line"></td>
                </tr> 
<%       
            ArrayList list1 = (ArrayList)request.getAttribute("ETestUserList");        
            for (i=0; i<list1.size(); i++) {
                DataBox dbox  = (DataBox)list1.get(i); 
        
                v_subj  = dbox.getString("d_subj");
                v_subjnm = dbox.getString("d_subjnm");
                v_year = dbox.getString("d_year");
                v_subjseq = dbox.getString("d_subjseq");
                v_testdate = dbox.getString("d_testdate");
                v_testdate_view = FormatDate.getFormatDate(v_testdate, "yyyy/MM/dd HH:mm");
                v_testtime = dbox.getInt("d_testtime");
                v_teststart = v_testdate;
                v_testend = FormatDate.getDayAdd(v_teststart, "yyyyMMddHHmm", "minute", v_testtime);
                v_papernumcnt = dbox.getInt("d_papernumcnt");
                
                Random random = new Random();
                int v_papernum = (random.nextInt(v_papernumcnt) +1);//System.out.println(v_papernum);

%>
                <tr> 
                  <td class="table_text1"><a href="javascript:ETestOpen('<%=v_teststart%>', '<%=v_testend%>', '<%=v_subj%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_papernum%>')"><%=v_subjnm%></a></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><%=v_year%></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><%=v_subjseq%></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><%=v_testdate_view%></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><%=v_testtime%></td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_line2"></td>
                </tr>
<%
            }
            if (i == 0) {
%>
                <tr> 
                  <td class="table_text1" colspan='9'>�ش�Ǵ� ������ �����ϴ�.</td>
                </tr>
<%
            }
%>
               <tr> 
                  <td colspan="9" class="table_line2"></td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_line2"></td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_line_bottom1"></td>
                </tr>
              </table>             
              <!----------------- E-Test �� ----------------->  
              <br>
              <br>
              <br>
              <br>
            <!----------------- ���׽�Ʈ ��� Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="s_title_table">
                <tr>
                  <td height="8"></td>
                </tr>
                <tr>
                  <td width="15"><img src="/images/user/study/study_icon1.gif" width="15" height="15" border="0"></td>
                  <td class="s_title_text">E-Test ���</td>
                </tr>
                <tr>
                  <td height="5"></td>
                </tr>
              </table>
              <!----------------- ���׽�Ʈ ��� Ÿ��Ʋ �� ----------------->
              <!----------------- E-Test ��� ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="table_out">
                <tr> 
                  <td colspan="9" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td class="table_title_bg1">������</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="10%">����</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="10%">����</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="13%">������</td>
                  <td valign="top" class="table_title_line"><img src="/images/user/etest/table_line.gif" width="1" height="8" border="0"></td>
                  <td class="table_title_bg1" width="13%">����</td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_color_line"></td>
                </tr> 
<%       
            ArrayList list2 = (ArrayList)request.getAttribute("ETestUserResultList");        
            for (j=0; j<list2.size(); j++) {
                DataBox dbox  = (DataBox)list2.get(j); 
        
                v_subj  = dbox.getString("d_subj");
                v_subjnm = dbox.getString("d_subjnm");
                v_year = dbox.getString("d_year");
                v_subjseq = dbox.getString("d_subjseq");
                String v_started = FormatDate.getFormatDate(dbox.getString("d_started"), "yyyy/MM/dd");
                int v_papernum = dbox.getInt("d_papernum");
                String v_score = dbox.getString("d_score");

%>
                <tr> 
                  <td class="table_text1">
                  <% if(dbox.getString("d_status").equals("����")) {    %>
                    <a href="javascript:ETestResult('<%=v_subj%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_papernum%>')">
                    <%=v_subjnm%>
                  <% }else {    %>
                    <%=v_subjnm%>
                  <% }  %>
                    </a></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><%=v_year%></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><%=v_subjseq%></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><%=v_started%></td>
                  <td class="table_line1"></td>
                  <td class="table_text1"><% if(dbox.getString("d_status").equals("����")) { %><%=dbox.getString("d_score")%><%  }else {   %>������ <%  }  %></td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_line2"></td>
                </tr>
<%
            }
            if (j == 0) {
%>
                <tr> 
                  <td class="table_text1" colspan='9'>�ش�Ǵ� ������ �����ϴ�.</td>
                </tr>
<%
            }
%>
               <tr> 
                  <td colspan="9" class="table_line2"></td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_line2"></td>
                </tr>
                <tr> 
                  <td colspan="9" class="table_line_bottom1"></td>
                </tr>
              </table>             
              <!----------------- E-Test ��� �� ----------------->  
              <br>
              <br>
            </td>
          </tr>
          <tr>
            <td height="8"><img src="/images/user/etest/etest_sub_menu_bg2.gif" width="178" height="8" border="0"></td>
            <td><img src="/images/user/etest/sub_body_bg2.gif" width="804" height="8" border="0"></td>
          </tr>
        </table>
        <!----------------- ����޴�, ���� ���� �� �� ----------------->

<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->