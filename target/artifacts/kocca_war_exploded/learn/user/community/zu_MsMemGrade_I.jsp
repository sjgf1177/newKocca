<%@ page contentType = "text/html;charset=euc-kr" %>
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
    
    String v_selGrade    = box.getString("p_selGrade");

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
    ArrayList gradeList  = (ArrayList)request.getAttribute("gradeList");

%>  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//�������̵�
function goPage(pageNum) {
    document.form1.p_close_fg.value = 1;
    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmembergradePage";
    document.form1.submit();
}
//��ȸ
function uf_searchOK() {
    document.form1.p_close_fg.value = 1;
    //if(document.form1.p_searchtext.value ==''){
    //   alert('�˻�� �Է��Ͽ����մϴ�.');document.form1.p_searchtext.focus();return;
    //}

    document.form1.p_pageno.value  = 1;
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmembergradePage";
    document.form1.submit();
}

//��޺� ��ȸ
function uf_searchGrade(pageNum) {
    v_select = document.form1.p_grade.value;
    //alert('�˻�� �Է��Ͽ����մϴ�.'+v_select); //document.form1.p_searchtext.focus();return;
	
	document.form1.p_grcode.value  = v_select;
    document.form1.p_pageno.value  = pageNum;
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmembergradePage";
    document.form1.submit();
}

//����
function uf_sendOK() {
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
    document.form1.p_close_fg.value = 1;
    document.form1.p_pageno.value  = 1;
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "insertmsmembergradeData";
    document.form1.submit();
}

//��ü����
var allcheck = false;
function uf_allCheck(){
   var rowcnt = <%=list.size()%>;
   if(rowcnt>0){
      if(allcheck == false){
          if(rowcnt ==1){
             document.form1.p_list_userid.checked=true;
          } else {
             for(var i=0;i<rowcnt;i++){
                document.form1.p_list_userid[i].checked=true;
             }  
          }
          allcheck = true;
      }else {
          if(rowcnt ==1){
             document.form1.p_list_userid.checked=false;
          } else {
             for(var i=0;i<rowcnt;i++){
                document.form1.p_list_userid[i].checked=false;
             }  
          }
          allcheck = false;

      }
   }
}

function uf_outOK(close_fg) {
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
    document.form1.p_process.value = "updatememberoutData";
    document.form1.submit();
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

<input type = "hidden" name = "p_grcode"    value = "">

            <h1><img src="/images/portal/community/tit_20.gif" alt="ȸ������" /></h1>

            <p class="searchbox mg_tn">
                <span class="fl_l pd_l25">
                    <img src="/images/portal/board/class_box_tit.gif" alt="��޺�����" class="mg_r6" />
                    <select name="p_selGrade" style="width:115px;" onchange="uf_searchOK();">
                        <option value="">::��ü::</option>
                    <%  for(int i = 0; i < gradeList.size(); i++) {
                        DataBox dbox = (DataBox)gradeList.get(i);
                        if("01".equals(dbox.getString("d_grcode"))) continue;
                    %>
                        <option value="<%=dbox.getString("d_grcode")%>" <%=v_selGrade.equals(dbox.getString("d_grcode")) ? "selected" : ""%> ><%=dbox.getString("d_kor_nm")%></option>
                    <%  } %>
                    </select>
                </span>
                <span class="fl_r pd_r25">
                    <select name="p_select" style="width:95px;">
                        <option value="userid"   <%if("userid".equals(v_select)) out.print(" selected");%>>���̵�</option>
                        <option value="kor_name" <%if("kor_name".equals(v_select)) out.print(" selected");%>>����</option>
                    </select>
                    <input type="text" name="p_searchtext" class="inbox" style="width:160px;" value="<%=v_searchtext%>" onkeypress="javascript:fnKeyPressEnter(event, 'uf_searchOK');"/>
                    <input type="image" src="/images/portal/btn/btn_serbox_search.gif" class="va_m mg_r12" alt="�˻�" onclick="uf_searchOK();"/>
                </span>
            </p>

            <table class="list">
            <!--[if ie]><colgroup><col width="80px" /><col width="120px" /><col width="220px" /><col width="100" /><col width="140" /></colgroup><![endif]-->
            <colgroup><col width="80px" /><col width="120px" /><col width="200px" /><col width="100" /><col width="140" /></colgroup>
            <thead>
            <tr>
                <th class="end"><a href="javascript:uf_allCheck();">��ü</a></th>
                <th class="end">����</th>
                <th class="end">�̸���</th>
                <th class="end">���</th>
                <th class="end">���Խ�û��</th>
            </tr>
            </thead>
            <tbody>
			<%  
			    if(list.size() != 0){
				    for(int i = 0; i < list.size(); i++) {
				        DataBox dbox = (DataBox)list.get(i);
				        v_totalpage  = dbox.getInt("d_totalpage");
				
				        String v_title  =dbox.getString("d_title");
				        String v_name   =dbox.getString("d_kor_name");
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
              <td colspan=5>ȸ���� �������� �ʽ��ϴ�..</td>
            </tr>
            <% }%>
            </tbody>
            </table>
            
            <p class="fl_l board_btn"><a href="javascript:uf_outOK(2);" class="btn_gr"><span>����Ż��</span></a></p>
            <p class="board_btn">
                <strong class="mg_r6">��޺���</strong>
                <select name="p_grade" style="width:95px;">
                <%  for(int i = 0; i < gradeList.size(); i++) {
                	    DataBox dbox = (DataBox)gradeList.get(i);
                	    if("01".equals(dbox.getString("d_grcode"))) continue;
                %>
                    <option value="<%=dbox.getString("d_grcode")%>" <%="grade".equals(v_select) ? "selected" : ""%> ><%=dbox.getString("d_kor_nm")%></option>
                <%  } %>
                </select>
                <a href="javascript:uf_sendOK();" class="btn_gr mg_ln"><span>��޼���</span></a>
            </p>
            
        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->

</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->
