

<%
//**********************************************************
//  1. ��      ��: Ȩ������ ȸ������
//  2. ���α׷��� : Forum.jsp
//  3. ��      ��: Ȩ������ ȸ������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.homepage.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	ConfigSet conf = new ConfigSet();
	
	box.put("p_types","D");
	OpenForumUserBean bean = new OpenForumUserBean();
    ArrayList list1 = bean.SelectForumSubjectList(box);

	String v_seq        =  "";
	String v_types      =  "";   													        
	String v_title      =  "";
	String v_contents	=  "";															
	String v_indate     =  "";
	String v_upfile     =  "";													        
	String v_cnt        =  "";
	String v_subject    =  "";
	Vector v_realfileVector = null;
    Vector v_savefileVector = null;
    Vector v_fileseqVector  = null;

%>	

<SCRIPT LANGUAGE="JavaScript">
<!--

	//���� �󼼺���
    function selectForumView(seq, types) {

		v_url = "/servlet/controller.homepage.OpenForumUserServlet?p_process=selectView";
		document.Forumform1.p_seq.value = seq;
		document.Forumform1.p_types.value = types;
        document.Forumform1.action = v_url;
        document.Forumform1.submit();
    }

//-->
</SCRIPT>

<form name="Forumform1" method="post">
          <input type=hidden name=p_seq value="">
          <input type=hidden name=p_types value="">

	<!--�ӽ�ó��-->
	<!--table width="223" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td>
			<img src="/images/user/kocca/homepage/type1/st_forum.gif" width="223" height="19" border="0" usemap="#Map5">
		</td>
	  </tr>
	  <tr> 
		<td height="7"></td>
	  </tr>
	  <tr> 
			<td valign="top">
			  <table width="223" border="0" cellspacing="0" cellpadding="0">
				<tr> 
				  <td width="4" rowspan="3">&nbsp;</td>
				  <td width="78" rowspan="3"-->
<% if (list1 != null){
	  for(int i = 0; i <list1.size(); i++) {
			DataBox dbox    = (DataBox)list1.get(i);
			 v_seq        =  dbox.getString("d_seq");
			 v_types      =  dbox.getString("d_types");   													        
			 v_title      =  dbox.getString("d_title");
			 v_contents	  =  dbox.getString("d_contents");															
			 v_indate     =  dbox.getString("d_indate");
			 v_upfile     =  dbox.getString("d_upfile");													        
			 v_cnt        =  dbox.getString("d_cnt");
			 v_subject    =  dbox.getString("d_subject");
			 v_realfileVector = (Vector)dbox.getObject("d_realfile");
 			 v_savefileVector = (Vector)dbox.getObject("d_savefile");
 			 v_fileseqVector = (Vector)dbox.getObject("d_fileseq");

	  %>
	  				<!--�ӽ�ó��-->
				    <!--table width="78" border="1" cellpadding="0" cellspacing="0" bordercolor="cccccc">
					  <tr> 
						<td>
						  <table width="77" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
							<tr> 
							  <td>
								<%if(!v_upfile.equals("")){
									for( i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
										String v_realfile = (String)v_realfileVector.elementAt(i);
										String v_savefile = (String)v_savefileVector.elementAt(i);  
										String v_fileseq  = (String)v_fileseqVector.elementAt(i);  
										
										if(v_realfile != null && !v_realfile.equals("")) {  
											String v_savefile1 = conf.getProperty("url.upload") + "bulletin/" + v_savefile;								
									%>
									<img src="<%=v_savefile1%>" width="74" height="56"></td>
								<%		}else{%>
									<img src="/images/user/kocca/homepage/type1/photo_forum.gif" width="74" height="56"></td>
								<%		}
									}
								}else{%>
									<img src="/images/user/kocca/homepage/type1/blank_photo1.gif" width="74" height="56"></td>
								<% } %>
							  
							</tr>
						  </table>
						</td>
					  </tr>
					</table></td>
				  <td width="6" rowspan="3">&nbsp;</td>
				  <td width="67" class="font_specialroom_list">
						<%if(v_types.equals("A")){%><%=v_subject%>
						<%}else{%>�ִϸ��̼�<%}%></td>
				  <td><img src="/images/user/kocca/homepage/type1/vline_offline.gif" width="2" height="8"></td>
				  <td class="tbl_gleft"><%=FormatDate.getFormatDate(v_indate,"yyyy/MM/dd")%></td>
				</tr>
				<tr> 
				  <td height="1" colspan="3" background="/images/user/kocca/homepage/type1/bg_dot_line.gif"></td>
				</tr>
				<tr> 
				  <td colspan="3" class="tbl_gleft_small"><a href="javascript:selectForumView('<%=v_seq%>','<%=v_types%>')">
					<%if(v_title.length() < 20){
						  v_title = v_title;
					  }else{  v_title = (v_title).substring(0,15)+"...";
					  }%>
					<%=v_title%></a></td>
				</tr>
<%			}
	  }%>
			  </table></td>
		  </tr>
		  <tr> 
			<td height="15"></td>
		  </tr>
		</table>
</form>


<map name="Map5">
  <area shape="rect" coords="187,1,219,17" href="/servlet/controller.homepage.OpenForumUserServlet?p_process=MainPage">
</map-->