<%@ page import = "com.credu.library.RequestBox" %>

<%
    String visualFlashGubun = box.getSession("s_gubun").equals("99") ? "7" : box.getSession("s_gubun") ;

    RequestBox rBox = new RequestBox("temp");
    rBox.put("p_grcode", tem_grcode);
    rBox.put("p_gubun", visualFlashGubun);
    DataBox flashBox = templetBeans.selectSubMainTemplet(rBox);
    String flashFilePath = flashBox != null ? flashBox.get("d_flashfilename").equals("") ? "/images/portal/flash/top"+visualFlashGubun+".swf" : "/images/portal/menu/"+visualFlashGubun+"/"+flashBox.get("d_flashfilename") : "/images/portal/flash/top7.swf";

%>
<script language="JavaScript">
<!--//
    // �α���
    function login() {
            document.topForm1.p_process.value = "login";
            document.topForm1.p_topuserid.value = document.getElementById('p_userid').value;
            document.topForm1.p_toppwd.value =  document.getElementById('p_pwd').value;

            document.topForm1.action =  https_host() + "/servlet/controller.homepage.LoginServlet";
            document.topForm1.submit();
    }
    /* �н����� ����Ű üũ */
    function password_enter(e) {
        if (e.keyCode =='13'){  login();  }
    }

    /* �˻� ����Ű üũ */
    function search_enter(e) {
        if (e.keyCode =='13'){  totalSubjSearch();  }
    }

//-->
</script>
<form name="topForm1" method="post">
    <input type="hidden" name="p_topuserid" value=""/>
    <input type="hidden" name="p_toppwd"    value=""/>
    <input type="hidden" name="p_process"   value=""/>
</form>
    <div id="topVisual" class="visual">
    <%if( box.getSession("tem_grcode").equals("N000001")) { %>
    <table height="47" width="995" border="0" align="center" cellpadding="0" cellspacing="0" background="/images/portal/homepage_renewal/common/main_v_bg.jpg">
        <tr>
            <td height="40" valign="top" align="center">
                <!--

                    <script language="javascript">object_menuflash(<%="'"+flashFilePath+"'"%>);</script>

                -->
                <!--�α��� �޴��κ�-->
                <table width="995" border="0" cellpadding="3" cellspacing="0">
                  <tr>
                    <td width="30" height="35"><div align="right"><img src="/images/portal/homepage_renewal/common/icon_login.jpg" /></div></td>
                    <% if(topWarp_userid.equals("")) {%>     <%--�α����� �ȵǾ��� ���--%>
                    <td width="99"><input name="p_userid" type="text" id="p_userid" width="91px" value="���̵�" onfocus="javascript:this.value='';" /></td>
                    <td width="95"><input name="p_pwd" type="password" id="p_pwd" width="87px" value="��й�ȣ" onfocus="javascript:this.value='';" onkeypress="password_enter(event)"/></td>
                    <td width="54"><a href="javascript:login();"><img src="/images/portal/homepage_renewal/common/btn_login.jpg" alt="�α���" /></a></td>
                    <td width="71"><a href="javascript:menuForward('90', '02');"><img src="/images/portal/homepage_renewal/common/btn_find.jpg" alt="ID/PWã��"  /></a></td>
                    <td width="254"><a href="javascript:menuForward('90', '01');"><img src="/images/portal/homepage_renewal/common/btn_join.jpg" alt="ȸ������" /></a></td>
                    <td width="64"><img src="/images/portal/homepage_renewal/common/txt_search.jpg" alt="�����˻�" /></td>
                    <td width="66"><img src="/images/newmain_20100625/search_online.gif" width="72" height="20" <% if(s_tem_grcodeGLB.equals("N000001")) { out.print("onclick='onoffselect()' style='CURSOR:POINTER;'"); } %> id="mainSearch"/></td>
                    <td width="152"><input name="topWarp_searchText" type="text" id="topWarp_searchText" size="30" onkeypress="search_enter(event)"/></td>
                    <td width="49"><a href="javascript:totalSubjSearch();"><img src="/images/portal/homepage_renewal/common/btn_search.jpg" alt="�˻�" /></a></td>
                    <%}else{ %>
                    <td class="wt"><strong><%=topWarp_usernm%></strong> �� ȯ���մϴ�.</td>
                    <td width="54"><a href="javascript:mainmenu('998');"><img src="/images/portal/homepage_renewal/common/btn_logout.jpg" alt="�α׾ƿ�" /></a></td>
                    <td width="71"><a href="javascript:menuForward('90', '03');"><img src="/images/portal/homepage_renewal/common/btn_edit.jpg" alt="ȸ����������"  /></a></td>
                    <td width="254">&nbsp;</td>
                    <td width="64"><img src="/images/portal/homepage_renewal/common/txt_search.jpg" alt="�����˻�" /></td>
                    <td width="66"><img src="/images/newmain_20100625/search_online.gif" width="72" height="20" <% if(s_tem_grcodeGLB.equals("N000001")) { out.print("onclick='onoffselect()' style='CURSOR:POINTER;'"); } %> id="mainSearch"/></td>
                    <td width="152"><input name="topWarp_searchText" type="text" id="topWarp_searchText" size="30" onkeypress="search_enter(event)"/></td>
                    <td width="49"><a href="javascript:totalSubjSearch();"><img src="/images/portal/homepage_renewal/common/btn_search.jpg" alt="�˻�" /></a></td>
                    <%} %>

                  </tr>
                </table>
                <!--�α��� �޴��κ�//-->

                <!--��ܹ�� �޴��κ�-->
                 <!--<table border="0" align="center" cellpadding="10" cellspacing="0">
                   <tr>
                     <td height="150"><a href="#"><img src="/images/portal/homepage_renewal/common/bn_topimg_01.jpg" /></a></td>
                     <td><a href="#"><img src="/images/portal/homepage_renewal/common/bn_topimg_02.jpg" /></a></td>
                     <td><a href="#"><img src="/images/portal/homepage_renewal/common/bn_topimg_03.jpg" /></a></td>
                     <td><a href="#"><img src="/images/portal/homepage_renewal/common/bn_topimg_04.jpg" /></a></td>
                     <td><a href="#"><img src="/images/portal/homepage_renewal/common/bn_topimg_05.jpg" /></a></td>
                   </tr>
                 </table>
                 --><!--��ܹ�� �޴��κ�//-->
            </td>
        </tr>
    </table>
<%
    } else {
        if (visualFlashGubun.equals("5")) {
%>
        <img src="/images/asp/type1/kv_open.jpg" alt="��������"/>

<%
        } else {
%>
        <img src="/images/asp/type1/kv_online.jpg" alt="�¶��ΰ���"/>
<%
        }
%>

    <!-- <script language="javascript">object_menuflash(<%="'"+flashFilePath+"'"%>);</script> //-->
<%
    }
%>
</div>