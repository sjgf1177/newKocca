<%
//**********************************************************
//  1. ��      ��: SUBJ QNA READ
//  2. ���α׷���: zu_SubjBulletin_R.jsp
//  3. ��      ��: ���� ���� �б�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 8. 15
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");  
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");   

    String  v_subj       = box.getString("p_subj");        //�����ڵ�
    String  v_year       = box.getString("p_year");         //�⵵
    String  v_subjseq    = box.getString("p_subjseq");       //���� ����
    String  v_gubun     = box.getString("p_gubun");
    String  s_userid     = box.getSession("userid");

    String  v_title="",  v_jikwinm="",  v_asgnnm="" ,v_cono="", v_inuserid="",v_inusernm="";
    String  v_indate="", v_contents="", v_replygubun = "", v_replygubun_view = "";
    String  v_isopen="", v_isopen_value="";
    int  v_kind = 0;
    int  v_seq = 0, v_anscnt = 0 ;
    int  v_qcnt     = 0;
    int  v_nanscnt  =0;
    int     i            = 0;
    ArrayList list1      = null;

    list1 = (ArrayList)request.getAttribute("SubjBulletinDetail");

%>
<html>
<head>
<title>::: ���̹� ��ȭ������ ��ī���� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">    
	td {font-size :12px; font-family : ����; color : #757575; line-height:135%}
	  :link		{  text-decoration : none; color: #757575 }
	  :active	{  text-decoration : none; color: #ee6600 }
	  :visited  {  text-decoration : none; color: #999999 }
	  :hover 	{  text-decoration : none; color: #ff6600 }

</style>
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �亯�ϱ�
    function reply_qna(seq, kind) {
        document.ff.action = "/servlet/controller.study.SubjBulletinServlet";
        document.ff.p_seq.value = seq;
        document.ff.p_kind.value = kind;
        document.ff.p_process.value = "SubjBulletinReplyPage";
        document.ff.submit();
    }

    // �����ϱ� 
    function modify_qna(seq, kind) {
        document.ff.action = "/servlet/controller.study.SubjBulletinServlet";
        document.ff.p_seq.value = seq;
        document.ff.p_kind.value = kind;
        document.ff.p_process.value = "SubjBulletinUpdatePage";
        document.ff.submit();
    }

    // ����
    function delete_qna(seq, kind) {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.ff.action = "/servlet/controller.study.SubjBulletinServlet";
            document.ff.p_seq.value = seq;
            document.ff.p_kind.value = kind;
            document.ff.p_process.value = "SubjBulletinDelete";
            document.ff.submit();
        }
        else {
            return;
        }
    }

    function list_qna() {
        document.ff.action = "/servlet/controller.study.SubjBulletinServlet";
        document.ff.p_process.value = "SubjBulletinList";
        document.ff.submit();
    }

//-->
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('/contents/sws/sws002/01/img/close2.gif')">
<form name="ff" method="post" action="/servlet/controller.study.SubjBulletinServlet">
        <input type="hidden" name="p_process"    value="SubjBulletinList">
        <input type="hidden" name="p_search"     value = "<%=v_search %>">
        <input type="hidden" name="p_searchtext" value = "<%=v_searchtext %>">
        <input type="hidden" name="p_subj"       value="<%=v_subj%>">
        <input type="hidden" name="p_year"       value="<%=v_year%>">
        <input type="hidden" name="p_subjseq"    value="<%=v_subjseq%>">
        <input type="hidden" name="p_gubun"     value="<%=v_gubun%>">
        <input type="hidden" name="p_seq"        value="<%=v_seq%>">
        <input type="hidden" name="p_job"        value="">
        <input type="hidden" name="p_kind"      value="">

<table width="800" height="600" border="0" cellpadding="0" cellspacing="0">

  <!-- Ÿ��Ʋ ���� -->
  <tr> 
    <td colspan="2">
    <% if (v_gubun.equals("1")) { %>
    	<img src="/contents/sws/sws002/01/img/board.jpg" width="800" height="100">
    <% } else if (v_gubun.equals("2")) { %>
    	<img src="/contents/sws/sws002/01/img/idea.jpg" width="800" height="100">
    <% } %>
    
    </td>
  </tr>
  <tr valign="top"> 
    <td height="55" colspan="2"><div align="right"></div>
      </td>
  </tr>
  <!-- Ÿ��Ʋ �� -->
  <tr valign="top"> 
    <td height="400" colspan="2"><div align="center"> 
    
<%

            for(i = 0; i < list1.size(); i++) {
				DataBox dbox = (DataBox)list1.get(i);

				
				v_seq        = dbox.getInt("d_seq");
                v_kind       = dbox.getInt("d_kind");
                v_title      = dbox.getString("d_title");
                v_inuserid   = dbox.getString("d_inuserid");
                v_inusernm   = dbox.getString("d_name");
                v_contents   = dbox.getString("d_contents");
                v_indate     = FormatDate.getFormatDate(dbox.getString("d_indate"),"yyyy/MM/dd");;
                v_replygubun = dbox.getString("d_replygubun");
                v_seq        = dbox.getInt("d_seq");
                v_isopen     = StringManager.chkNull(dbox.getString("d_isopen"));
                String v_togubun = dbox.getString("d_togubun");

				/*
                QnaData data = (QnaData)list1.get(i);
                v_seq        = data.getSeq();
                v_kind       = 0;//data.getKind();
                v_title      = data.getTitle();
                v_inuserid   = data.getInuserid();
                v_inusernm   = data.getInusernm();
                v_contents   = data.getContents();
                v_indate     = FormatDate.getFormatDate(data.getIndate(),"yyyy/MM/dd");;
                v_replygubun = data.getReplygubun();
                v_seq        = data.getSeq();
                v_isopen     = StringManager.chkNull(data.getIsOpen());
                String v_togubun = data.getTogubun();

				*/
                
                v_contents   = StringManager.replace(StringManager.replace(v_contents,"\r\n","<br>")," ","&nbsp;");
                if(v_isopen.equals("Y")){ v_isopen_value="����";   }
                else                    { v_isopen_value="�����"; }
                if (v_replygubun.equals("1"))      v_replygubun_view = "<font color='#0036D9'>��</font>";
                else if (v_replygubun.equals("2")) v_replygubun_view = "<font color='#0036D9'>��</font>";
                else if (v_replygubun.equals("3")) v_replygubun_view = "<font color='#0036D9'>��</font>";

            if(v_kind == 0 ){    
%>  
            <!----------------- ������ ���� ���� ---------------->
          
            <table width="90%" cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr> 
                      <td class="board_title_bg1" width="15%">�� ��</td>
                      <td class="board_title_bg3" width="85%" colspan="3"><%= v_title %></td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg1" width="15%">�����</td>
                      <td class="board_title_bg3"><%=v_indate%></td>
                      <td class="board_title_bg1" width="15%">�ۼ���</td>
                      <td class="board_title_bg3"><%=v_inusernm%></td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg1">÷������</td>
                      <td class="board_title_bg3" colspan=3>
                      <%=SubjBulletinBean.selectQnaFileList(v_subj, v_year, v_subjseq, v_seq, v_kind)%>
                      </td>
                    </tr>

                    
                    <tr> 
                      <td colspan="4" class="board_text1" align="center"> 
                        <table width="98%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><%=v_contents%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

            
            <br><br>
            
            <!----------------- ����, ����, ��� ��ư �� ----------------->
			<table width="230" border="0" cellspacing="0" cellpadding="0" align="center">
			  <tr> 
			
			<%
			    if (s_userid.equals(v_inuserid) ) {
			%>
			    <td align="center"><a href="javascript:delete_qna('<%=v_seq%>','<%=v_kind%>')" ><img src="/images/user/button/btn_del.gif"  alt="����" border="0"></a>
			    <a href="javascript:modify_qna('<%=v_seq%>','<%=v_kind%>')" ><img src="/images/user/button/btn_mod.gif" alt="����"  border="0"></a>
			<%
			      }
			%>
				<a href="javascript:reply_qna('<%=v_seq%>','<%=v_kind%>')" ><img src="/images/admin/button/btn_answer.gif"  alt="�亯�ϱ�"  border="0"></a>
			    <a href="javascript:list_qna()" ><img src="/images/user/button/btn_list.gif"  alt="���"  border="0"></a></td>
			
			  </tr>
			</table>
            <!----------------- ����, ����, ��� ��ư �� ----------------->
                        
                        
            <!----------------- �亯 ���� ���� ----------------->


<%          }else{ %> 
            
            <br>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
                <tr> 
                    <td colspan="2" height="25" align="left"><b>�亯 <%=v_kind%></b></td>
                </tr>
            </table>    
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
              <tr> 
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr> 
                      <td class="board_title_bg1" width="15%">�� ��</td>
                      <td class="board_title_bg3" width="85%" colspan='3'><%= v_title %></td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg1" width="15%">�����</td>
                      <td class="board_title_bg3" width="35%"><%=v_indate%></td>
                      <td class="board_title_bg1" width="15%">�ۼ���</td>
                      <td class="board_title_bg3" width="35%"><%=v_inusernm%>&nbsp;&nbsp;<%=v_replygubun_view%></td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg1">÷������</td>
                      <td class="board_title_bg3" colspan=3>
                      <%=SubjBulletinBean.selectQnaFileList(v_subj, v_year, v_subjseq, v_seq, v_kind)%>
                      </td>
                    </tr>                    
                    <tr> 
                      <td colspan="4" class="board_text1" align="center"> 
                        <table width="98%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><%=v_contents%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

            <!----------------- ������ ���� �� ---------------->
            <br>
            <br>
              
            <!----------------- ����, ����, ��� ��ư ���� ---------------->
            
			<table width="210" border="0" cellspacing="0" cellpadding="0" align="center">
			  <tr> 
			
			<%
			    if (box.getSession("gadmin").equals("A1") || s_userid.equals(v_inuserid) ) {
			%>
			    <td align="center"><a href="javascript:delete_qna('<%=v_seq%>','<%=v_kind%>')" ><img src="/images/user/button/btn_del.gif" alt="����"   border="0"></td>
			    <td align="center"><a href="javascript:modify_qna('<%=v_seq%>','<%=v_kind%>')" ><img src="/images/user/button/btn_mod.gif" alt="����"  border="0"></a></td>
			<%  
			    }
			%>
			    <td align="center"><a href="javascript:list_qna()" ><img src="/images/user/button/btn_list.gif" alt="���" border="0"></a></td>
			
			  </tr>
			</table>
            <!----------------- ����, ����, ��� ��ư �� ----------------->
<%          }      %>
            <!-----------------�亯 ����  �� ----------------->
<%          }      %>

            <br>
            
            
            <!-- �������� �� -->
      </div></td>
  </tr>
  <tr> 
    <td height="20" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="749" height="25" bgcolor="#999999"><div align="left"><font color="#333333"><strong>KOCCA 
        </strong><font size="-2">- KOREA CULTURE &amp; CONTNENTS ASENCY</font></font></div></td>
    <td width="52" bgcolor="#999999">
    <div align="right"><a href="javascript:self.close()" onFocus="this.blur();" onMouseOut="MM_swapimgRestore()" onMouseOver="MM_swapImage('close','','/contents/img/close1.gif',1)"><img src="/contents/img/close1.gif" width="50" height="16" border="0"></a></div></td>
  </tr>
</table>
</form>
</body>
</html>

            
            
