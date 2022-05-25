<%
//**********************************************************
//  1. ��      ��: �ð��뺰�н�����
//  2. ���α׷���: za_SubjTime.jsp
//  3. ��      ��: 
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 6. 30
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
            
    ReportingBean bean = new ReportingBean();
    ArrayList    list1 = bean.SelectSubjTimeList(box);   
    DataBox   data  = null; 
    int total = 0;        
    DecimalFormat df_f= new DecimalFormat("#,##0");    
    for(int v=0; v<list1.size(); v++) {
        data  = (DataBox)list1.get(v);
        total = total+data.getInt("d_cnt");
    }
System.out.println("list1.size()"+list1.size());      
%>
time,rate,count
<%  
for(int i = 1; i <= 24; i++) {
    int v_cnt = 0;
    double v_rate = 0;
    for(int j=0; j<list1.size(); j++){    
        data = (DataBox)list1.get(j);
        
        String dtime   = data.getString("d_date_time");        
   
        if(Integer.parseInt(dtime)==i) {
            v_cnt = data.getInt("d_cnt");
            break;  
        }
    }
    if(v_cnt!=0)
        v_rate = (double)v_cnt/total*100;

%><%=i%>,<%=v_rate%>,<%=v_cnt%>
<%                
} // for end
%>
