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
    String v_action    = box.getString("p_action");
    String v_process = box.getString("p_process");

    String v_sindate  = box.getStringDefault("p_project_year_s",  FormatDate.getDate("yyyy"));
    String v_eindate  = box.getStringDefault("p_project_year_e",  FormatDate.getDate("yyyy"));

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
    
    String 	gubundisplay = "";
    String 	v_woman = "";
    

    ArrayList list = null;
    int listsize = 0;
    list = (ArrayList)request.getAttribute("selectList");
    listsize = list.size();

%>

        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="14" class="table_top_line"></td>
          </tr>

          <tr>
            <td class="table_title" width="5%">����</td>  
            <td class="table_title" width="5%">1��</td>                        
            <td class="table_title" width="5%">2��</td>
            <td class="table_title" width="5%">3��</td>                        
            <td class="table_title" width="5%">4��</td>
            <td class="table_title" width="5%">5��</td>                        
            <td class="table_title" width="5%">6��</td>
            <td class="table_title" width="5%">7��</td>                        
            <td class="table_title" width="5%">8��</td>
            <td class="table_title" width="5%">9��</td>                        
            <td class="table_title" width="5%">10��</td>
            <td class="table_title" width="5%">11��</td>                        
            <td class="table_title" width="5%">12��</td>
            <td class="table_title" width="5%">����</td>
            
          </tr>
<%
        for ( int i=0; i<list.size(); i++ ) {
            DataBox dbox = (DataBox)list.get(i);  
            
            gubundisplay = dbox.getString("d_gubun2");
            
            if (gubundisplay.equals("01")) {
            	gubundisplay = "Ȩ������";
            } else if (gubundisplay.equals("02")) {
            	gubundisplay = "��������";
            } else if (gubundisplay.equals("03")) {
            	gubundisplay = "��������";
            } else if (gubundisplay.equals("04")) {
            	gubundisplay = "�ý���";
            } else if (gubundisplay.equals("05")) {
            	gubundisplay = "��������";
            } else if (gubundisplay.equals("06")) {
            	gubundisplay = "�̺�Ʈ";
            } else if (gubundisplay.equals("07")) {
            	gubundisplay = "������";
            } else if (gubundisplay.equals("08")) {
            	gubundisplay = "Ư��";
            } else if (gubundisplay.equals("09")) {
            	gubundisplay = "Ȩ������";
            } else if (gubundisplay.equals("10")) {
            	gubundisplay = "��Ÿ";
            }
     
%>
          <tr class="table_02_1">
           <td class="table_02_1"><%=gubundisplay%></td>
           <td class="table_02_1"><%=dbox.getString("d_jan")%></td>
            <td class="table_02_1"><%=dbox.getString("d_feb")%></td>
            <td class="table_02_1"><%=dbox.getString("d_mar")%></td>
            <td class="table_02_1"><%=dbox.getString("d_apr")%></td>
            
            <td class="table_02_1"><%=dbox.getString("d_may")%></td>
            <td class="table_02_1"><%=dbox.getString("d_jun")%></td>
            
            <td class="table_02_1"><%=dbox.getString("d_jul")%></td>
            <td class="table_02_1"><%=dbox.getString("d_aug")%></td>
            
            <td class="table_02_1"><%=dbox.getString("d_sep")%></td>
            <td class="table_02_1"><%=dbox.getString("d_oct")%></td>
            
            <td class="table_02_1"><%=dbox.getString("d_nov")%></td>
            <td class="table_02_1"><%=dbox.getString("d_dec")%></td>
            <td class="table_02_1"><%=dbox.getString("d_tot")%></td>
           </tr>
<%
        }
%>
        
          </tr>
          </table>

       

          
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>

