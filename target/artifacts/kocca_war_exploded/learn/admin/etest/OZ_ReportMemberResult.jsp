<%
//**********************************************************
//  1. ��      ��: e-test
//  2. ���α׷���: OZ_ReportMemberResult.jsp
//  3. ��      ��: 
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 9. 30
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
<%@ page import = "com.credu.etest.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  p_etestsubj = box.getString("p_etestsubj");
    String  p_year = box.getString("p_year");
      
    box.put("p_action", "go");
    box.put("p_etestsubj", p_etestsubj);
    box.put("p_year", p_year);
    
    ETestResultBean bean = new ETestResultBean();
    Vector    vlist = bean.ReportMemberResult(box);
        
    DataBox data    = null;    
    Vector  vect_etestnum = null;  
    Vector  vect_answer   = null;     
    Vector  vect_corrected= null;      
    int etestsize     = Integer.parseInt((String)vlist.elementAt(0));  // ��������  
    ArrayList alist = (ArrayList)vlist.elementAt(1); // ����Ÿ
    ArrayList blist = (ArrayList)vlist.elementAt(2); // ����    
    ArrayList clist = (ArrayList)vlist.elementAt(3); // ���δ�    
    ArrayList dlist = (ArrayList)vlist.elementAt(4); // ���俩��    
        
%>e-test�ڵ�|e-test��|e-test��������ȣ|ID|����|������|����|����|���δ�|���俩��
<% for(int i=0; i<alist.size(); i++){   
        data  = (DataBox)alist.get(i);
        vect_etestnum = (Vector)blist.get(i); 
        vect_answer   = (Vector)clist.get(i);        
        vect_corrected= (Vector)dlist.get(i);         
        for(int j=0; j<etestsize; j++){
%><%=data.getString("d_etestcode")%>|<%=data.getString("d_etesttext")%>|<%=data.getString("d_etestnum")%>|<%=data.getString("d_userid")%>|<%=data.getString("d_name")%>|<%=data.getString("d_jikwinm")%>|<%=data.getInt("d_score")%>|<%=vect_etestnum.get(j)%>|<%=vect_answer.get(j)%>|<%=vect_corrected.get(j)%>
<%}%><%}%>

        