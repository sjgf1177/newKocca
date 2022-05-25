<%
//**********************************************************
//  1. ��      ��: EDUCATION SUBJECT PAGE
//  2. ���α׷���: gu_SulmunNew_L.jsp
//  3. ��      ��: ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);
	
	box.put("topmenu","2");
	box.put("submenu","6");

    ArrayList list2     = null;
    list2 = (ArrayList)request.getAttribute("SulmunCommon");			//�Ϲݼ���
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
// Tab ���ý� ����
function showTab(clickTab)
{
	g_showTab(clickTab, 4);
}

function g_showTab(tabNo, count)
{

	var clickTabNo = new Number(tabNo);
	var tabCount   = new Number(count);

	if( clickTabNo == 0 || tabCount == 0 ) return;

	for(i=1; i<=tabCount; i++)
    {
		div = document.all["tab_"+i];

		if(!div) return;

		if( clickTabNo == i ) {
			// Ȱ��ȭ�� tab Ŭ���� return
			if(div.style.display == "") return;
			div.style.display = ""
		}
		else {
			// ���õ��� �ʴ� �ǵ��� ������ ����.
			if(div.style.display != "none") {
				div.style.display = "none";
			}
		}
	}
}

// ������ ��������
function contentsWright(p_subj, p_grcode, p_gyear, p_subjseq, p_sulpapernum, p_sulpapernm, p_sulstart, p_sulend){
        document.form1.p_subj.value = 'CONTENTS';
        document.form1.s_subj.value = p_subj;
        document.form1.p_grcode.value = p_grcode;
        document.form1.p_gyear.value = p_gyear;
        document.form1.p_subjseq.value = p_subjseq;
        document.form1.p_sulpapernum.value = p_sulpapernum;
        document.form1.p_sulpapernm.value = p_sulpapernm;
		document.form1.p_sulstart.value = p_sulstart;
        document.form1.p_sulend.value = p_sulend;
        document.form1.p_listok.value = '0';

        window.self.name = "winSelectView";
        farwindow = window.open("", "openSubjChange", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 680, height = 538, top=0, left=0");
        document.form1.target = "openSubjChange";
        document.form1.action = "/servlet/controller.research.SulmunContentsUserServlet";
        document.form1.p_process.value = "SulmunUserPaperListPage";
        document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}

// ���� ��������
function contentsWright1(p_subjnm, p_subj, p_grcode, p_gyear, p_subjseq, p_sulpapernum, p_sulpapernm, p_sulstart, p_sulend, p_sulnums){
        document.form1.p_subj.value = "ALL";
        document.form1.s_subj.value = p_subj;   // tz_suleach �� �����ڵ�
        document.form1.p_subjnm.value = p_subjnm;
        document.form1.p_grcode.value = "ALL";
        document.form1.s_grcode.value = p_grcode;    // tz_suleach �� �����׷��ڵ�       
        document.form1.p_gyear.value = p_gyear;
        document.form1.p_subjseq.value = p_subjseq;
        document.form1.p_sulpapernum.value = p_sulpapernum;
        document.form1.p_sulpapernm.value = p_sulpapernm;
		document.form1.p_sulstart.value = p_sulstart;
        document.form1.p_sulend.value = p_sulend;
        document.form1.p_sulnums.value = p_sulnums;    // ������ȣ    
        document.form1.p_listok.value = '0';

        window.self.name = "winSelectView";
        farwindow = window.open("", "openSubjChange", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 680, height = 538, top=0, left=0");
        document.form1.target = "openSubjChange";
        document.form1.action = "/servlet/controller.research.SulmunSubjUserServlet";
        document.form1.p_process.value = "SulmunUserPaperListPage";
        document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}

// ����� ��������
function targetWright(p_subj, p_grcode, p_gyear, p_subjseq, p_sulpapernum, p_sulpapernm, p_sulstart, p_sulend){
        document.form1.p_subj.value = p_subj;
        document.form1.p_grcode.value = p_grcode;
        document.form1.p_gyear.value = p_gyear;
        document.form1.p_subjseq.value = p_subjseq;
        document.form1.p_sulpapernum.value = p_sulpapernum;
        document.form1.p_sulpapernm.value = p_sulpapernm;
		document.form1.p_sulstart.value = p_sulstart;
        document.form1.p_sulend.value = p_sulend;
        document.form1.p_listok.value = '0';

        window.self.name = "winInsertPage";
        farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 680, height = 538, top=0, left=0");
        document.form1.target = "openWinInsert";
        document.form1.action = "/servlet/controller.research.SulmunTargetUserServlet";
        document.form1.p_process.value = "SulmunUserPaperListPage";
        document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}



// �Ϲ� ��������
function commonWright(p_subj, p_grcode, p_sulpapernum){
        document.form1.p_subj.value = p_subj;
        document.form1.p_grcode.value = p_grcode;
        document.form1.p_sulpapernum.value = p_sulpapernum;
     
        window.self.name = "winSelectView";
        farwindow = window.open("", "openSubjChange", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 680, height = 538, top=0, left=0");
        document.form1.target = "openSubjChange";
        document.form1.action = "/servlet/controller.research.SulmunCommonUserServlet";
        document.form1.p_process.value = "SulmunUserPaperListPage";
        document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}

function ReloadPage(p_action, tab) {
  //document.form1.p_process.value = 'SulmunUserListPage';
  document.form1.p_process.value = 'SulmunNew';
  document.form1.p_action.value  = p_action;
  document.form1.action = "/servlet/controller.research.SulmunSubjUserServlet";
  document.form1.submit();
  showTab(tab);
}
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
  <form name="form1" method="post" action="/servlet/controller.research.SulmunCommonUserServlet">
    <input type="hidden" name="p_process"      value="">
    <input type="hidden" name="p_action"       value="">
    <input type="hidden" name="p_subj"         value="">
    <input type="hidden" name="p_subjnm"       value="">            
    <input type="hidden" name="s_subj"         value="">    
    <input type="hidden" name="p_grcode"       value="">
    <input type="hidden" name="s_grcode"       value="">        
    <input type="hidden" name="p_gyear"        value="">
    <input type="hidden" name="p_subjseq"      value="">
    <input type="hidden" name="p_sulpapernum"  value="">
    <input type="hidden" name="p_sulpapernm"   value="">
    <input type="hidden" name="p_sulstart"     value="">
    <input type="hidden" name="p_sulend"       value="">
    <input type="hidden" name="p_sulnums"      value="">        
    <input type="hidden" name="p_listok"       value="">
    
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� ><u>���� ����</u></td>
			</tr>
		</table>
		
		<div class="concept a06">
			<div class="titlemsg"><img src="/images/2012/sub/page1/title/my_survey.gif" alt="���� ����"></div>
			<ul class="pagetab">
				<li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew" tabindex="171" title="ȸ���Բ��� �׵��� ���������� ���� �����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/learning_off.png" alt="����"></a></li>
				<li><img src="/images/2012/sub/page1/tabmenu/general_on.png" alt="�Ϲ�"></li>
			</ul>
		</div>	
		
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="50"><col width="80"><col width="*"><col width="150"><col width="250"><col width="100"><col width="80"></colgroup>
					<tr class="listhead">
						<th>��ȣ</th>
						<th>��������</th>
						<th>�����Ⱓ</th>
						<th>������</th>
						<th>���ÿ���</th>
					</tr>
					<%
		        for(int i = 0; i < list2.size(); i++) {
		    		DataBox dbox2 = (DataBox)list2.get(i);
		    		int v_sulpapernum      =  dbox2.getInt("d_sulpapernum");
		    		String v_sulpapernm    =  dbox2.getString("d_sulpapernm");
		    		String v_sulstart      =  dbox2.getString("d_sulstart");
		    		String v_sulend        =  dbox2.getString("d_sulend");
		    		int v_totcnt           =  dbox2.getInt("d_totcnt");
		    		v_sulstart      = FormatDate.getFormatDate(v_sulstart,"yyyy.MM.dd");
		    		v_sulend        = FormatDate.getFormatDate(v_sulend,"yyyy.MM.dd");
		    		int v_sulresult = dbox2.getInt("d_sulresult");       // �����������
		    		String v_issul  = dbox2.getString("d_issul");        // �������ɿ���      
					%>    

					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst"><%= i+ 1 %></td>
						<td class="title"><%= v_sulpapernm %></td>
						<td><%= v_sulstart %> ~ <%= v_sulend %></td>
						<td><%= v_totcnt %></td>
						<td id="btxtfocus<%=i+1%>">
							<%if (v_issul.equals("0")) {%>
								<a href="javascript:commonWright('COMMON', '<%=dbox2.getString("d_grcode")%>', '<%=v_sulpapernum%>')" onfocus="txtlink('b',<%=i+1%>)" onblur="txtlink('b',<%=i+1%>)" tabindex="<%=i+200%>">���ð���</a>
							<%} else { %>
								�Ϸ�
							<% } %>
						</td>
					</tr>
					<% } %>	
					<% if(list2.size() == 0){ %>
			    <tr>
			    	<td colspan="5" align="center" class="linefirst">�ش��ϴ� �����Ͱ� �����ϴ�.</td>
			    </tr>
			    <% } %>
				</table>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
