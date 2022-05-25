<%
//********************************************************************
//  1. ��      ��: �������� Module ����ȭ��
//  2. ���α׷��� : za_MasterFormModule_U.jsp
//  3. ��      ��: �������� Module ����ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 3
//  7. ��      ��:
//  8. COMMENT   : ���ް����� ��� ����� �ϳ��� ���߱� ������ ��� �߰���
//                 ����/���� �� �� ������ ���� �ο�
//********************************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.beta.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
    String  p_subj      	= box.getString("p_subj");
    String  c_gadmin    	= box.getSession("s_gadmin");
    if(c_gadmin==null || c_gadmin.equals(""))   c_gadmin="A1";
    
    String  p_process   	= box.getString("p_process");
    String  ss_contenttype  = box.getString("s_contenttype");   //�������� ����Ʈ ContentType
    String  ss_upperclass 	= box.getString("s_upperclass");	//�������� ����Ʈ ȭ�� ��з�
    String  ss_middleclass 	= box.getString("s_middleclass");	//�������� ����Ʈ ȭ�� �ߺз�
    String  ss_lowerclass  	= box.getString("s_lowerclass");	//�������� ����Ʈ ȭ�� �Һз�
    int     p_cnt_module= box.getInt("p_cnt_module");
    BetaMasterFormData  da  =(BetaMasterFormData)request.getAttribute("BetaMasterFormData");
    String  v_subjnm        = da.getSubjnm();
    String  v_dir           = da.getDir();
    String  v_contenttypetxt= da.getContenttypetxt();
    int     v_cnt_module    = da.getCnt_module();
    if(p_cnt_module>v_cnt_module)   v_cnt_module = p_cnt_module;
    
    ArrayList       list1 = (ArrayList)request.getAttribute("BetaMfModuleData");
    DataBox         dbox  = null;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
</head>
<script language="javascript">
function whenModuleCnt(){
    document.f2.p_process.value="updateModulePage";
    document.f2.submit();
}
function whenSubmit(){
    if(!checkOK())  return;
    document.f2.p_process.value="updateModule";
    document.f2.submit();
}
function checkOK(){
    var isExist=false;
    for(var i=0;document.f2.length;i++){
        if(document.f2.elements[i].name=="p_sdesc" && document.f2.elements[i].value.length > 0){
            isExist=true;
            break;
        }
    }
    
    return isExist;
}
function whenDeleteModule(module){
    var f_del = false;
    for(var i=0;i<document.f2.length;i++){
        if(document.f2.elements[i].name=="p_module" && document.f2.elements[i].value==module){
            document.f2.elements[(i+1)].value="";
            f_del = true;
        }
        if(f_del && (document.f2.elements[i].name=="p_sdesc") ){
            if( i < (document.f2.length-2) ){
                document.f2.elements[i].value=document.f2.elements[(i+2)].value;
            }else{
                document.f2.elements[i].value="";
            }
        }
    }
}
</script>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">



  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
     <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/beta/tit_masterform.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	          <!----------------- title �� ----------------->
        <br>
        <!-------------������ ����-------------------------->
 <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�����������</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
    <%@ include file="/beta/admin/include_BetaMasterFormAdmin.jsp" %> 

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td bgcolor="#636563"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <FORM name = "f2" method = "post" action="/servlet/controller.beta.BetaMasterFormServlet">
                    <input type='hidden' name='p_process'   	value="">
                    <input type='hidden' name='p_action'    	value="">
                    <input type='hidden' name='p_subj'      	value="<%=p_subj%>">
                    <input type='hidden' name='s_upperclass' 	value="<%=ss_upperclass%>">
                    <input type='hidden' name='s_middleclass' 	value="<%=ss_middleclass%>">
                    <input type='hidden' name='s_lowerclass' 	value="<%=ss_lowerclass%>">
                    <input type=hidden name=s_contenttype   value="<%=ss_contenttype%>">
            
                <tr> 
                  <td bgcolor="#FFFFFF" align="center" valign="top"> 
                  <br>

                    <!----------------- ������ ���� ���� ----------------->
                    <%
                    //    if (ss_contenttype.equals("O")){
                    %>
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td valign="bottom" height="20" width="195">������ ���� : 
                          <input name="p_cnt_module" type="text" class="input" size="2" maxlength="2" value="<%=v_cnt_module%>">
                        </td>
                        <td><a href="javascript:whenModuleCnt()"><img src="/images/admin/button/b_go.gif" border="0"></a></td>
                      </tr>
                      <tr> 
                        <td height="3"></td>
                      </tr>
                    </table>
                    <%
                    //    }
                    %>
                    <!----------------- ������ ���� �� ----------------->



                    <table width="99%" border="0" cellspacing="1" cellpadding="5" class="table_out">
                      <tr> 
                        <td colspan="3" class="table_top_line"></td>
                      </tr>
                      <tr> 
                        <td width="12%" height="25" class="table_title"><b>���</b></td>
                        <td class="table_title"><b>����</b></td>
                        <td class="table_title"><b>������ Lesson ����</b></td>
                      </tr>
<%          for (int i=0; i<list1.size(); i++) {
                dbox  = (DataBox)list1.get(i); %>
                      <tr> 
                        <td align="center" bgcolor="#EEEEEE" height="25"><%=dbox.getString("d_module")%></td>
                        <td bgcolor="#F7F7F7" align="left">&nbsp;&nbsp;&nbsp;
                            <input type=hidden name="p_module"  value="<%=dbox.getString("d_module")%>">
                            <input type="text" name="p_sdesc" class="input"value="<%=dbox.getString("d_sdesc")%>"  size="50" maxlength=100>
                            <%
                                if(ss_contenttype.equals("O")){
                            %>
                            <a href="javascript:whenDeleteModule('<%=dbox.getString("d_module")%>')"><img src="/images/admin/button/btn_del.gif" border=0></a>
                            <%
                                }
                            %>
                        </td>
                        <td class="table_02_1"><font color=blue><b><%=dbox.getString("d_cnt_lesson")%></b></font> ��</td>
                      </tr>
<%          }

            int list_size = 1;
            if (list1 != null)  list_size = list1.size() + 1;

            String  v_module = "";
            for (int i=list_size;i<=v_cnt_module;i++){
                v_module = new DecimalFormat("00").format(i);
            %>
                      <tr>
                        <td align="center" bgcolor="#EEEEEE" height="25"><%=v_module%></td>
                        <td bgcolor="#F7F7F7" align="left">&nbsp;&nbsp;&nbsp;
                            <input type=hidden name="p_module"  value="<%=v_module%>">
                            <input type="text" name="p_sdesc"  class="input" value=""  size="100" maxlength=100>
                        </td>
                        <td class="table_02_1">&nbsp;</td>
                      </tr>
<%
            }
%>

                    </table>
                    <!----------------- ����������� �� ----------------->
                    <br>
                    <!----------------- �����ư ���� ----------------->
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td>
                        <%
                        //    if (ss_contenttype.equals("O")){
                        %>
                            <a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                        <%
                        //    }
                        %>
						<td width=8></td>
                        <td><a href="javascript:whenList()"><img src="/images/admin/button/btn_list.gif"  border="0"></a></td>       
                      </tr>
                      <tr> 
                        <td height="8"></td>
                      </tr>
                    </table>
                    <!----------------- �����ư �� ----------------->
                  </td>
                </tr>
                </FORM>
              </table>
            </td>
          </tr>
        </table>
        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
