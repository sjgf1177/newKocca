<%
//**********************************************************
//  1. ��      ��: SEARCH POSTCODE
//  2. ���α׷���: zu_SearchPost.jsp
//  3. ��      ��: �����ȣ �˻�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 28
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");  
    String v_process    =  box.getString("p_process");
    String v_zipcode    = "";
    String v_sido       = "";
    String v_gugun      = "";
    String v_dong       = "";
    String v_bunji      = "";
    String v_post1      = "";
    String v_post2      = "";
    String v_addr       = "";
    int    idx          =  0;
    ArrayList list          =  null;
    
	String v_postgubun = box.getString("p_postgubun");
	System.out.println(" jsp v_postgubun : "+v_postgubun);

    if(v_process.equals("SearchPostAtOpenWin")){
        list = (ArrayList)request.getAttribute("SearchPost");    
    }    
%>    
<html>
<head>
<title>::: �����ȣã�� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language="JavaScript">
<!--
    function text_enter(e)
    {
        if (e.keyCode =='13'){	whenInsetDong();  }
    } 
    function whenInsetDong(){
        document.form1.target = "_self";
		document.form1.action='/servlet/controller.library.PostSearchServlet';
        document.form1.p_process.value = "SearchPostAtOpenWin";
        document.form1.submit();	
    }    
    
    function whenSelectZipcode(post1,post2,addr,gubun){
		if( gubun == "1" ){
			opener.document.mform1.p_post1.value = post1;
			opener.document.mform1.p_post2.value = post2;
			opener.document.mform1.p_home_addr1.value = addr;
			opener.document.mform1.p_home_addr2.focus();
			self.close();
		}else if( gubun == "2" ){
			opener.document.mform1.p_comp_post1.value = post1;
			opener.document.mform1.p_comp_post2.value = post2;
			opener.document.mform1.p_comp_addr1.value = addr;
			opener.document.mform1.p_comp_addr2.focus();
			self.close();
		}else{alert('�����ȣ�� �����ϼ���');}
    }    
    
    function dong_focus() {
      form1.p_dong.focus();
    }    
//-->
</script>    
</head>

<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" onLoad='dong_focus()'>
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="370">
    <tr>
        <td height="380">
            <table cellpadding="0" cellspacing="1" bgcolor="#bebebe" class="table2" height="100%">
        <tr> 
          <td align="center" valign="top" bgcolor="#FFFFFF" class="body_color"> 
            <form name = "form1" method = "post">
              <input type="hidden" name="p_process">
              <input type="hidden" name="p_zipcode">
              <input type="hidden" name="p_postgubun" value="<%=v_postgubun%>">

              <table width="350" border="0" cellspacing="0" cellpadding="0" height="100%">
                <tr> 
                  <td height="3"> <table cellspacing="0" cellpadding="0" class="table2">
                      <tr> 
                        <td background="/images/user/study/postsearch_top_line2.gif" height="8" width="27"><img src="/images/user/study/postsearch_top_line1.gif" width="27" height="8" border="0"></td>
                        <td background="/images/user/study/postsearch_top_line2.gif" width="291"></td>
                        <td align="right" background="/images/user/study/postsearch_top_line2.gif" width="32"><img src="/images/user/study/postsearch_top_line3.gif" width="32" height="8" border="0"></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="88"  valign="top" ><img src="../../images/user/common/st_post.jpg" ></td>
                </tr>
                <tr> 
                  <td align="center" valign="top" class="body_color"> 
                    <br>
                    <!----------------- �����ȣã�� ���� ----------------->
                    <table width="334" border="0" cellspacing="1" cellpadding="2">
                      <tr> 
                        <td align="center"> �� ã�����ϴ� ��/��/�� �̸��� �Է��ϼ���.</td>
                      </tr>
                      <tr> 
                        <td align="center">��) �Ｚ��, ����</td>
                      </tr>
                      <tr> 
                        <td align="center"> <table width="170" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td> <input type="text" name="p_dong" onkeypress="text_enter(event)" size="18" maxlength="25" class="input"> 
                              </td>
                              <td><a href="javascript:whenInsetDong()"><img src="/images/user/button/btn_j.gif" border="0" style="cursor:hand"></a></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <!----------------- �����ȣã�� �� ----------------->
                    <br> <%  if(v_process.equals("SearchPostAtOpenWin")){  %> 
                    <!----------------- �����ȣ �˻���� ���� ----------------->
                    <table cellspacing="1" cellpadding="0" class="postsearch_table1">
                      <tr> 
                        <td width="70" class="postsearch_title">�����ȣ</td>
                        <td class="postsearch_title">��&nbsp;&nbsp; ��</td>
                      </tr>
                      <%
            for(int i = 0; i < list.size(); i++) {
                PostSearchData data    = (PostSearchData)list.get(i);	
                v_zipcode           =  data.getZipcode();
                v_sido              =  data.getSido();
                v_gugun             =  data.getGugun();
                v_dong              =  data.getDong();
                v_bunji             =  data.getBunji();      
                
                idx = v_zipcode.indexOf("-");
                v_post1             = v_zipcode.substring(0, idx);
                v_post2             = v_zipcode.substring(idx+1);
                v_addr              = v_sido+" "+v_gugun+" "+v_dong;
                             
%>
                      <tr> 
                        <td class="postsearch_text1"><a href="javascript:whenSelectZipcode('<%=v_post1%>','<%=v_post2%>','<%=v_addr%>','<%=v_postgubun%>')"><%=v_zipcode%></a></td>
                        <td class="postsearch_text2">&nbsp;<%=v_sido%>&nbsp;<%=v_gugun%>&nbsp;<%=v_dong%>&nbsp;<%=v_bunji%></td>
                      </tr>
                      <% } %>
                    </table>
                    <!----------------- �����ȣ �˻���� �� ----------------->
                    <% } %>  </td>
                </tr>
			 </table>
            </form>
            <%@ include file = "/learn/library/getJspName.jsp" %>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
