<%
//********************************************************************
//  1. ��      ��: Object ����Ʈ ��ȸȭ��
//  2. ���α׷��� : za_Object_L.jsp
//  3. ��      ��: ��ϵ� Object�� ����Ʈ�� ��ȸ�ϴ� ȭ���̴�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 3
//  7. ��      ��:
//  8. COMMENT   : p_process = 'listPage' �̸� Object����ȭ�� ����Ʈ��
//                 p_process = 'searchList'�̸� Object�˻�ȭ���
//********************************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    String v_process2 = box.getString("p_process");
    
    String s_subj = box.getString("s_subj");
    String v_subjnm="";
    
%>

    <html>
    <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <link rel="stylesheet" href="/css/admin_style.css" type="text/css">
    <script language="JavaScript" src="/js/default.js"></script>
    </head>
    
    <script language="javascript">

<%  if (v_process2.equals("listPage")){ %>
        function whenSelection(p_action) {
            document.form1.p_process.value="listPage";
            document.form1.p_action.value = p_action;
            if (p_action=="go") top.ftop.setPam();			
            document.form1.submit();
        }
        function whenInsert(){
            document.form1.p_process.value = "insertPage";
            document.form1.p_job.value = "insert";
            
            document.form1.submit();
        }
        
        function whenUpdate(oid){
            document.form1.p_process.value = "updatePage";
            document.form1.p_job.value = "update";
            document.form1.p_oid.value = oid;
            
            document.form1.submit();
        }
<%  }else { %>  
        function whenSelection(p_action) {
            document.form1.p_process.value="searchList";
            document.form1.p_action.value = p_action;
            document.form1.submit();
        }
        function whenSelect(oid,sdesc){
            top.fdown.receive_obj(oid,sdesc);
        }
        function whenView(oid){
            document.form1.p_process.value = "viewPage";
            document.form1.p_job.value = "view";
            document.form1.p_oid.value = oid;
            
            document.form1.submit();
        }   
<%  }   %>  
        function init(){
            if(document.form1.p_subj.value=="NO-SUBJ")
                document.form1.s_subj.options[document.form1.s_subj.length] = new Option("==�����̿���==","NO-SUBJ",true,true);
            else
                document.form1.s_subj.options[document.form1.s_subj.length] = new Option("==�����̿���==","NO-SUBJ");
        }
    </script>
    
    <body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onload="init()">
    <table width="95%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" valign="top">

<!--------Ÿ��Ʋ ��� 2004.12.21����
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
<%  if (v_process2.equals("listPage")){ %>         
          <td background="/images/admin/community/title_bg.gif"><img src="/images/admin/system/system_title18.gif" border="0"></td>
<%  } else {    %>  
          <td background="/images/admin/community/title_bg.gif"><img src="/images/admin/contents/contents_title11.gif" border="0"></td>
<%  }   %>  
        </tr>
      </table>
   Ÿ��Ʋ ��� 2004.12.21 ��------------->

      <!----------------- title ���� ----------------->
     <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/c_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
          
      <br>
      <!----------------- �ڽ� ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <FORM name="form1" method="post" action="/servlet/controller.contents.SCObjectServlet">
          <input type="hidden" name="p_process"  value="<%=v_process2%>">
          <input type="hidden" name="p_action" value="">
          <input type="hidden" name="p_job"   value="">
          <input type="hidden" name="p_subj"   value="<%=s_subj%>">
          <input type="hidden" name="p_oid"   value="">
          
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class=""form_table">
                    <tr>
                      <td align=center>
                      ������ 
                      <%=SCObjectBean.makeObcSubjSelect(s_subj,"")%>  
                      &nbsp;&nbsp;
                      �˻���
                      <input type=text name="s_gubun" value="<%=box.getString("s_gubun")%>">
                      </td>
                      <td>
                      <a href="javascript:whenSelection('go')"><img src="/images/admin/button/b_go.gif"  border="0" align=absmiddle></a>
<%  if (v_process2.equals("listPage")){ %>                      
                      &nbsp;
                      <a href="javascript:whenInsert()"><img src="/images/admin/button/btn_add.gif"  border="0" align=absmiddle></a>
<%  }   %>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
        </FORM>
      </table>
      <!----------------- �ڽ� �� ----------------->
      <br>
      <!----------------���̺� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="9" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title" width="6%"><b>No</b></td>
          <td class="table_title" width="16%"><b>Object ID</b></td>
          <td class="table_title"><b>Object��</b></td>
          <td class="table_title"><b>���</b></td>
          <td class="table_title"><b>�����</b></td>
          <td class="table_title"><b>����������</b></td>
          <td class="table_title"><b>����������</b></td>
          <td class="table_title" width="18%"><b>������</b></td>
          <td class="table_title" width="12%"><b>���</b></td>
        </tr>
<%
    if (box.getString("p_action").equals("go")){
        ArrayList  list = (ArrayList)request.getAttribute("ObjectList");
        SCObjectData d = null;
        Hashtable   ht;
        
        for (int i=0; i<list.size(); i++) {
            d = (SCObjectData)list.get(i); 
            
%>

        <tr>
          <td class="table_01"><%=(i+1)%></td>
          <td class="table_02_1"><%=d.getOid()%></td>
          <td class="table_02_2"><%=d.getSdesc()%></td>
          <td class="table_02_2"><%=d.getSdesc2()%></td>
          <td class="table_02_1"><%=d.getMastername()%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(d.getLdate(),"yyyy/MM/dd-HH:mm:ss")%></td>
          <td class="table_02_1"><%=d.getNpage()%></td>
          <td class="table_02_1">
<%          
            if((Hashtable)d.getSubjList() != null){
                ht  = (Hashtable)d.getSubjList();
                for(int j=0;j<ht.size();j++)    {
                    v_subjnm = (String)ht.get(String.valueOf(j));
%>                  <%=v_subjnm%><br>   <%
                }
            }
%>
          </td>
          <td class="table_02_1">
<%          if (v_process2.equals("listPage")){ %>          
                <a href="javascript:whenUpdate('<%=d.getOid()%>')"><img src="/images/admin/button/b_modify.gif"  border="0"></a>
<%          } else { %>                 
                <a href="javascript:whenSelect('<%=d.getOid()%>','<%=d.getSdesc()%>')"><img src="/images/admin/button/b_selectbutt.gif"  border="0"></a>
                <a href="javascript:whenView('<%=d.getOid()%>')"><img src="/images/admin/button/b_resarchbutt.gif"  border="0"></a>
<%          } %>                
          </td>
        </tr>

<%      }
    } %>


      </table>
      <!----------------- ���̺� �� ----------------->
      <br>
    </td>
  </tr>
    </table>
    </body>
    </html>
<%@ include file = "/learn/library/getJspName.jsp" %>
