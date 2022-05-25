<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷��� : gu_KnowBoard_L.jsp
//  3. ��      ��: ���İ��� �ֱ����� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.03
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
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

String v_title = "", v_contents = "", v_inuserid = "", v_indate = "" , v_types = "";
Vector v_realfileVector = null;
Vector v_savefileVector = null;
int    v_seq        = box.getInt("p_seq");
int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
int    v_pageno     = box.getInt("p_pageno");
String v_searchtext = box.getString("p_searchtext");            //  ������ ������ִ� ���ϼ� 
String v_select     = box.getString("p_select"); 
String v_name = "";
String v_repstatus  = "";
String v_subjnm = "";
String tabimg1 ="tab01.gif";
String tabimg2 ="tab02.gif";
String tabimg3 ="tab03.gif";
String tabimg4 ="tab04.gif";
String tabimg5 ="tab05.gif";

DataBox dbox        = (DataBox)request.getAttribute("SelectView");

int v_commentseq    = 0;
 

v_inuserid          = dbox.getString("d_inuserid");
v_name              = dbox.getString("d_name");
v_types             = dbox.getString("d_types");
v_indate            = dbox.getString("d_indate");
v_title             = dbox.getString("d_title");
v_subjnm             = dbox.getString("d_subjnm");
v_seq               = dbox.getInt("d_seq");
v_contents          = dbox.getString("d_contents");
v_realfileVector    = (Vector)dbox.getObject("d_realfile");
v_savefileVector    = (Vector)dbox.getObject("d_savefile");
String v_categorynm = dbox.getString("d_categorynm");
int v_recommend = dbox.getInt("d_recommend");
int v_cnt       = dbox.getInt("d_cnt");
v_repstatus         = dbox.getString("d_okyn1");

String  v_categorycd= dbox.getString("d_categorycd").substring(0,2);
String s_userid     = box.getSession("userid");

int    v_filecount = v_realfileVector.size();

String p_categorycd = box.getString("p_categorycd");            // request ī�װ�

/*
if(p_categorycd.equals("")){
    p_categorycd=v_categorycd;
}
*/
String v_process= box.getString("p_process");

if (p_categorycd.equals("CB")){
	tabimg2 ="tab02over.gif";
} else if (p_categorycd.equals("CG")){
	tabimg3 ="tab03over.gif";
} else if (p_categorycd.equals("CK")){
	tabimg4 ="tab04over.gif";
}else if (p_categorycd.equals("MINE")){
	tabimg5 ="tab05over.gif";
} else {
	tabimg1 ="tab01over.gif";
}
	
	

%>


<script language="JavaScript" type="text/JavaScript">
<!--

//����Ʈ�������� �̵�
function selectList() {
   	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "ListPage";     
	document.form1.submit();	
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
    document.form1.submit();
}

//������������ �̵�
function updatePage() {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "updatePage";
	document.form1.submit();
}

//�亯 ��� �������� �̵�
function replyPage() {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "replyPage";
	document.form1.submit();
}   

//������ ���
function insertcomment() {
	if(document.form2.commentqna.value==""){
		alert("�������� ����ϼ���");
		return;
	}
	document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
	document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form2.p_process.value = "commentInsert";
	document.form2.submit();
}

//�� ȭ�� ����
function deleteAction() {
	if (confirm("������ �����Ͻðڽ��ϱ�?")) {
		
		document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form1.p_process.value = "delete";
		document.form1.submit();
	}
	else {
		return;
	}
}

//������ ����
function deleteComment(v_commentseq) {
	if (confirm("������ �����Ͻðڽ��ϱ�?")) {
		document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
		document.form2.p_commentseq.value = v_commentseq;
		document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form2.p_process.value = "deleteComment";
		document.form2.submit();
	}
	else {
		return;
	}
}

// ��õ�ϱ�
function InsertRecommend(seq) {
//alert(document.form1.p_categorycd.value);
	if (confirm("��õ�Ͻðڽ��ϱ�?")) {
		document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form1.p_process.value = "insertRecommend";
		document.form1.submit();
	}
	else {
		return;
	}
}
//-->
</script>
<%@ include file="/learn/user/portal/include/topfactory.jsp"%>
	<!-- ��� -->
	<div id="container">
		<div class="contentL">
		
			<!-- ���� ������ ���� -->
			<div><img src="/images/factory/show.gif"></div>
			<ul class="tabmenu">
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><img src="/images/factory/<%=tabimg1%>" id="tab01" alt="����"></a></li>				
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CB"><img src="/images/factory/<%=tabimg2%>" id="tab02"  alt="��ۿ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CG"><img src="/images/factory/<%=tabimg3%>" id="tab03"  alt="���Ӱ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CK"><img src="/images/factory/<%=tabimg4%>" id="tab04"  alt="��ȭ������"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=MINE"><img src="/images/factory/<%=tabimg5%>" id="tab05"  alt="���� �ۼ��� ��"></a></li>
			
			
				
				<!-- 
				<li><img src="/images/factory/tab01over.gif" id="tab01" onclick="postchg('1');" alt="����"></li>
				<li><img src="/images/factory/tab02.gif" id="tab02" onclick="postchg('2');" alt="��ۿ���"></li>
				<li><img src="/images/factory/tab03.gif" id="tab03" onclick="postchg('3');" alt="���Ӱ���"></li>
				<li><img src="/images/factory/tab04.gif" id="tab04" onclick="postchg('4');" alt="��ȭ������"></li>
				<li><img src="/images/factory/tab05.gif" id="tab05" onclick="postchg('5');" alt="���� �ۼ��� ��"></li>
				 -->
			</ul>
			<form name = "form1" method = "post">
				
			<!-- ���� �� ���� -->
			<table class="viewform" cellpadding="0" cellspacing="0">
				
				<colgroup><col width="150"><col width="*"></colgroup>
				<tr>
					<th class="colorA">������</th>
					<td class="colorA noline"><p><%=v_subjnm%></p></td>
				</tr>
				<tr>
					<th class="colorA">����</th>
					<td class="colorA noline"><strong><%=v_title%></strong></td>
				</tr>
				
				<tr>
		           <th class="colorA">÷������ </td>
		           <td class="colorA noline">
		            <%
		                if( v_realfileVector != null ) {
		                    for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
		
		                        String v_realfile = (String)v_realfileVector.elementAt(i);
		                        String v_savefile = (String)v_savefileVector.elementAt(i);
		
		                        if(v_realfile != null && !v_realfile.equals("")) {  %>
		                            &nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'>
		
		                            <%= v_realfile%></a><br>
		                            <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
		                <%      }   %>
		        <%          }
		                }
		        %>
		           </td>
		       </tr>
       
       
				<tr>
					<td colspan="2" class="colorC noline">
						<b>�۾���</b> : <%=v_name%> &nbsp; &nbsp; <span>l</span> &nbsp; &nbsp;
						<b>��ȸ��</b> : <%=v_cnt%> &nbsp; &nbsp; <span>l</span> &nbsp; &nbsp;
						<b>��¥</b> : <%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="colorB noline">
						<div class="question">
							<%=v_contents%>
						</div>
					</td>
				</tr>
				
				<input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
				<input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
				<input type = "hidden" name = "p_select"      value = "<%= v_select %>">
				<input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
				<input type = "hidden" name = "p_process"     value = "">
				<input type = "hidden" name = "p_userid"      value = "<%= v_inuserid %>">
				<input type = "hidden" name = "p_types"       value = "<%=v_types%>">
				<input type = "hidden" name = "p_categorycd"  value = "<%=p_categorycd%>">				
				<input type = "hidden" name = "p_upfilecnt"   value = "<%= v_upfilecnt %>">
	
	
	
<%    if(v_repstatus.equals("3")){ 

	  DataBox Ansbox = (DataBox)request.getAttribute("selectAns");
	    
		String v_anstitle      = "";
		String v_anscontents   = "";
		String v_ansinuserid   = "";
		String v_ansindate     = "";
		String v_ansname       = "";
		String v_anscategorynm = "";		
		
		if(Ansbox != null) {
		    v_ansinuserid          = Ansbox.getString("d_inuserid");
		    v_ansname              = Ansbox.getString("d_name");
		    v_ansindate            = Ansbox.getString("d_indate");
		    v_anstitle             = Ansbox.getString("d_title");
		    v_anscontents          = Ansbox.getString("d_contents");
		    v_anscategorynm        = Ansbox.getString("d_categorynm");
		    
		}

%>				
				<tr>
					<th class="colorA">�亯</th>
					<td class="colorA noline">
						<div class="answer">
							<B><%=v_anstitle %></B><BR><BR> 
							<%=v_anscontents%>
							<table class="recom" cellpadding="0" cellspacing="0">
								<colgroup><col width="*"><col width="81"></colgroup>
								<tr>
									<td><a href="javascript:InsertRecommend('<%=v_seq%>');"><img src="/images/factory/btn_recom.gif" alt="��õ�ϱ�"></a></td>
									<td><div class="recomtotal"><p><%=v_recommend%></p></div></td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				 <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = (Vector)Ansbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)Ansbox.getObject("d_savefile");        // ���� ���ϸ�
            String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
            
             int i_fileCnt = i_realfileVector != null ? i_realfileVector.size() : 0 ; %>

            <%  if( i_realfileVector != null && i_realfileVector.size() > 0) { %>
            <%if( box.getSession("tem_grcode").equals("N000001")) { %>
         
            	<%if(i_realfileVector != null && !i_realfileVector.equals("") ){ %>
            		<tr>
						<th class="colorA">÷������</td>
						<td class="colorA noline">
							 <%      for(int i_i = 0; i_i < i_realfileVector.size(); i_i++) {      //     ÷������ ������ ����
            
                        String v_realfile = (String)i_realfileVector.elementAt(i_i);
                        String v_savefile = (String)i_savefileVector.elementAt(i_i);      

                        if(v_realfile != null && !v_realfile.equals("")) {  %>
                        
	                    <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6 va_t" />
	                    <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
	                    <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
	                    
	                    <%              }   
                        }  %>
						</td>
					  </tr>
					 
					  <%} %>
					
            <%}else{ %>
           
           
            <tr >
                <th class="colorA">÷������</th>
                <td class="colorA noline">
            <%      for(int i_i = 0; i_i < i_realfileVector.size(); i_i++) {      //     ÷������ ������ ����
            
                        String v_realfile = (String)i_realfileVector.elementAt(i_i);
                        String v_savefile = (String)i_savefileVector.elementAt(i_i);      

                        if(v_realfile != null && !v_realfile.equals("")) {  %>
                    <p>
                    <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6 va_t" />
                    <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
                    <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
                    </p>
            <%              }   
                        }  %>
            
                </td>
            </tr>
        
            <%} %>
            <input type = "hidden" name="p_upfilecnt"  value = "<%=i_fileCnt%>">
 <%        } }%>
 
 			<!-- 
            <!--%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %-
            --><!-- ����÷�� ����-->
			
			</table>
			</form>
			
			<div class="viewfooter">
			
			<%if(s_userid.equals(v_inuserid)){	%>	
				<a href="javascript:updatePage()" target="_self" onfocus=this.blur()><img src="/images/factory/btn_update.gif"></a> 
				<a href="javascript:deleteAction()" target="_self" onfocus=this.blur()><img src="/images/factory/btn_del.gif"></a> 
			 <%
				}
			 %>  
 
			<a href="javascript:selectList()" target="_self" onfocus=this.blur()><img src="/images/factory/btn_list.gif" alt="���" border=0></a>
			</div>
			
			<% ArrayList list = (ArrayList)request.getAttribute("selecCommentList"); %>
			<!-- ��۴ޱ� table -->
				  <form name = "form2" method = "post">
				  <input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
				  <input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
				  <input type = "hidden" name = "p_select"      value = "<%= v_select %>">
				  <input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
				  <input type = "hidden" name = "p_process"     value = "">
				  <input type = "hidden" name = "p_userid"      value = "<%= v_inuserid %>">
				  <input type = "hidden" name = "p_types"       value = "<%=v_types%>">
				  <input type = "hidden" name = "p_commentseq" value ="">
				  <input type = "hidden" name = "p_categorycd" value ="">
			

			<table class="replylist" cellpadding="0" cellspacing="0">
				<colgroup><col width="16"><col width="*"><col width="80"></colgroup>
				<!-- ��� �ݺ� ���� ���� -->
				<%if(list.size() != 0){
 
				for(int i = 0; i < list.size(); i++) {
                   dbox = (DataBox)list.get(i);  
                   v_inuserid      = dbox.getString("d_inuserid");
                   String c_name   = dbox.getString("d_name");
                   v_indate        = dbox.getString("d_cdate");
                   String v_commentqna    = dbox.getString("d_commentqna");
				   v_commentseq    = dbox.getInt("d_commentseq");
				%>

				<tr>
					<td class="meminfo"><img src="/images/factory/icon_reply.gif" align="absmiddle"></td>
					<td class="meminfo alignL"><b><%=v_inuserid%></b></td>
					<td class="meminfo alignC"><span><%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%></span></td>
				</tr>
				<tr>
					<td colspan="3" class="replytext"><%=v_commentqna%></td>
				</tr>
				<%}}%>
				<!-- ��� �ݺ� ���� �� -->
			</table>
			<div class="replywrite">
				<table class="inwrite" cellpadding="0" cellspacing="0">
					<colgroup><col width="*"><col width="96"></colgroup>
					<tr>
						<td>
							<textarea name="commentqna" onfocus="this.style.background='#ffffff'"></textarea>
							<p><b>0</b> / 300 byte</p>
						</td>
						<td><a href="javascript:insertcomment()"><img src="/images/factory/btn_replywrite.gif"></a></td>
					</tr>
				</table>
			</div>
			<!-- ���� �� �� -->
		<!-- ���� ������ �� -->
		</div>
		<%@ include file="/learn/user/portal/include/rightmenu.jsp"%>	
		<div class="clearL"><!-- no cut --></div>
	</div>
	<!-- �ϴ� ���� -->
	<div id="footer">
		<%@ include file="/learn/user/portal/include/footerfactory.jsp"%>	
	</div>
	<!-- �ϴ� �� -->
</div>
</body>
</html>
