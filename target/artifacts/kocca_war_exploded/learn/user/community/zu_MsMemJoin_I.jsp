<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process      = box.getStringDefault("p_process","gomsmemberPop");
    String  v_cmuno      = box.getString("p_cmuno");//������ ������������ ������ ������.
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);

    int v_dispnum    = 0;
    int v_totalpage  = 0;
    int v_rowcount   = 1;
    int v_upfilecnt  = 0;
    int v_pageno             = box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));

    ArrayList list       = (ArrayList)request.getAttribute("list");

%>  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//�������̵�
function goPage(pageNum) {
    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmemberjoinPage";
    document.form1.submit();
}

//��ȸ
function uf_searchOK() {
    if(document.form1.p_searchtext.value ==''){
       alert('�˻�� �Է��Ͽ����մϴ�.');document.form1.p_searchtext.focus();return;
    }

    document.form1.p_pageno.value  = 1;
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmemberjoinPage";
    document.form1.submit();
}
//����
function uf_sendOK(close_fg) {
   var rowcnt   =<%=list.size()%>;
   var userid   ="";
   var kor_name ="";
   var email    ="";
   var cnt      =0;

   if(rowcnt>0){
          if(rowcnt ==1){
             if(document.form1.p_list_userid.checked==true){
                 userid   +=document.form1.p_list1_userid.value+"/";
                 kor_name +=document.form1.p_list1_kor_name.value+"/";
                 email    +=document.form1.p_list1_email.value+"/";
                 cnt++;
             }
          } else {
             for(var i=0;i<rowcnt;i++){
                 if(document.form1.p_list_userid[i].checked==true){
                     userid   +=document.form1.p_list1_userid[i].value+"/";
                     kor_name +=document.form1.p_list1_kor_name[i].value+"/";
                     email    +=document.form1.p_list1_email[i].value+"/";
                     cnt++;
                 }
             }  
          }
   }

    if(cnt<1){
        alert("���õ� ȸ���� �����ϴ�.");return;
    }
    document.form1.p_close_fg.value=close_fg;
    document.form1.p_pageno.value  = 1;
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "insertmsmemberjoinData";
    document.form1.submit();
}

//��ü����üũ
function uf_allCheck(){
   var rowcnt = <%=list.size()%>;
   if(rowcnt>0){
      if(document.form1.allcheck.checked == true){
          if(rowcnt ==1){
             document.form1.p_list_userid.checked=true;
          } else {
             for(var i=0;i<rowcnt;i++){
                document.form1.p_list_userid[i].checked=true;
             }  
          }
      }else {
          if(rowcnt ==1){
             document.form1.p_list_userid.checked=false;
          } else {
             for(var i=0;i<rowcnt;i++){
                document.form1.p_list_userid[i].checked=false;
             }  
          }

      }
   }
}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"    method = "post">
<input type = "hidden" name = "p_process"     value="">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_cmuno"      value = "<%=v_cmuno%>">
<input type = "hidden" name = "p_pageno"      value = "">
<input type = "hidden" name = "p_close_fg"    value = "">
            <h1><img src="/images/portal/community/tit_19.gif" alt="ȸ�����԰���" /></h1>

            <p class="searchbox mg_tn">
                <select name="p_select">>
                    <option value="userid"   <%if("userid".equals(v_select)) out.print(" selected");%>>���̵�</option>
                    <option value="kor_name" <%if("kor_name".equals(v_select)) out.print(" selected");%>>����</option>
                </select>
                <input type="text" class="inbox" style="width:285px;" value="<%=v_searchtext%>" onkeypress="javascript:fnKeyPressEnter(event, 'uf_searchOK');"/>
                <input type="image" src="/images/portal/btn/btn_serbox_search.gif" class="va_m mg_r12" alt="�˻�" onclick="uf_searchOK()"/>
            </p>

            <table class="list">
            <!--[if ie]><colgroup><col width="80px" /><col width="120px" /><col width="220px" /><col width="100" /><col width="140" /></colgroup><![endif]-->
            <colgroup><col width="80px" /><col width="120px" /><col width="200px" /><col width="100" /><col width="140" /></colgroup>
            <thead>
            <tr>
                <th class="end"><input type=checkbox name=allcheck onclick="javascript:uf_allCheck();"></th>
                <th class="end">����</th>
                <th class="end">�̸���</th>
                <th class="end">���</th>
                <th class="end">���Խ�û��</th>
            </tr>
            </thead>
            <tbody>
            <%  if(list != null && list.size() != 0){
                    for(int i = 0; i < list.size(); i++) {
                        DataBox dbox = (DataBox)list.get(i);

				        String v_title  =dbox.getString("d_title");
				        String v_name   =dbox.getString("d_kor_name");
                        v_totalpage  = dbox.getInt("d_totalpage");
            %>
<input type=hidden name=p_list1_userid value="<%=dbox.getString("d_userid")%>">
<input type=hidden name=p_list1_kor_name value="<%=dbox.getString("d_kor_name")%>">
<input type=hidden name=p_list1_email value="<%=dbox.getString("d_email")%>">
            <tr>
                <td class="end in"><input type="checkbox" name="p_list_userid" value="<%=dbox.getString("d_userid")%>"/></td>
                <td class="end"><%=v_name%></td>
                <td class="ta_l end"><%=dbox.getString("d_email")%></td>
                <td class="end"><%=dbox.getString("d_grade_kor_nm")%></td>
                <td class="num end"><%=FormatDate.getFormatDate(dbox.getString("d_request_dte"), "yyyy.MM.dd")%></td>
            </tr>
			<%      }
			    } else {%>
            <tr> 
              <td colspan=5>���� ��û�� ȸ���� �������� �ʽ��ϴ�..</td>
            </tr>
            <% }%>
            </tbody>
            </table>
            
            <p class="board_btn"><a href="javascript:uf_sendOK(1);" class="btn_gr"><span>���Խ���</span></a><a href="javascript:uf_sendOK(2);" class="btn_gr"><span>���԰ź�</span></a></p>
            
        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
        
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->
