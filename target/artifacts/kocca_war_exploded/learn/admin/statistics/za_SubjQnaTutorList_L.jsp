<%
//**********************************************************
//  1. ��      ��: �������
//  2. ���α׷��� : za_UserEntryList_L.jsp
//  3. ��      ��: ������� - ������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.statistics.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }


    String v_fmt_usercnt = "";
    String v_indate      = "";
    String v_usercnt     = "";
    int    v_maxcnt      = 0;
    int    v_usercnt_i   = 0;
    int    v_percent     = 0;
    
    int    v_man_i = 0;
    int    v_woman_i = 0;
    
    int    v_man_total = 0;
    int    v_woman_total = 0;    
    
    int    v_fmt_usercnt_tatal = 0;

    int     v_sindate_i = 0;
    int     v_eindate_i = 0;
    
    String  v_repstatus = "";

    ArrayList list, list2 = null;
    int listsize = 0;
    list = (ArrayList)request.getAttribute("selectList");
    listsize = list.size();

%>
          
          <table cellspacing="1" class="table_out" cellpadding="5">
          <tr>
            <td colspan="3" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="8%">��ȣ</td>
            <td class="table_title" width="50%">������</td>
            <td class="table_title" width="5%">�亯�Ǽ�</td>                        
          
          </tr>
<%
        for ( int i=0; i<list.size(); i++ ) {
            DataBox dbox = (DataBox)list.get(i);  
         
%>
          <tr class="table_02_1">
           <td class="table_02_1"><%=i+1%></td>
            <td class="table_02_1"><%=dbox.getString("d_subjnm")%></td>
            <td class="table_02_1"><%=dbox.getString("d_cnt")%></td>
           </tr>
<%    } %>
          </table>
		
          
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>

