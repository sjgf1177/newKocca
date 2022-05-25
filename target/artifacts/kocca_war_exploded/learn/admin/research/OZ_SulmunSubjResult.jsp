<%
//**********************************************************
//  1. ��      ��: ����
//  2. ���α׷���: OZ_SulmunSubjResult.jsp
//  3. ��      ��: �������� - ���������ȸ
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
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_grcode       = box.getString("p_grcode");
    String  v_gyear        = box.getString("p_gyear");
    String  v_subj         = box.getString("p_subj");
    String  v_subjseq      = box.getString("p_subjseq");
  
    DecimalFormat  df = new DecimalFormat("0.00");
%>
�������ڼ�|��ü������|������|������ȣ|��������|�����󼼹�ȣ|�󼼼���|���|�ۼ�Ʈ|����
<%
    box.put("p_action", "go" );
    box.put("s_grcode", v_grcode );
    box.put("s_gyear",  v_gyear ); 
    box.put("s_subjcourse",v_subj );       
    box.put("s_subj",   v_subj );    
    box.put("s_subjseq",v_subjseq );

    SulmunSubjResultBean bean = new SulmunSubjResultBean();
    ArrayList    list = bean.SelectObectResultList(box);

    int     v_replycount  = box.getInt("p_replycount");
    int     v_studentcount= box.getInt("p_studentcount");
    double  v_replyrate   = 0;
    if (v_studentcount != 0) {
        v_replyrate = (double)Math.round((double)v_replycount/v_studentcount*100*100)/100;
    }
    
    
    SulmunQuestionExampleData data    = null;
    SulmunExampleData         subdata = null;   
    for (int i=0; i < list.size(); i++) {
        data = (SulmunQuestionExampleData)list.get(i);
        if (data.getSultype().equals(SulmunContentsBean.OBJECT_QUESTION) || data.getSultype().equals(SulmunContentsBean.MULTI_QUESTION)) {//����,����

          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) { %><%=v_replycount%>|<%=v_studentcount%>|<%=v_replyrate%>|<%=subdata.getSulnum()%>|<%=data.getSultext()%>|<%=subdata.getSelnum()%>|<%=subdata.getSeltext()%>|<%=subdata.getReplycnt()%>|<%=subdata.getReplyrate()%>
<%              }
            }
       } else if (data.getSultype().equals(SulmunContentsBean.SUBJECT_QUESTION)) {


       } else if (data.getSultype().equals(SulmunContentsBean.COMPLEX_QUESTION)) {

          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) { %><%=v_replycount%>|<%=v_studentcount%>|<%=v_replyrate%>|<%=subdata.getSulnum()%>|<%=data.getSultext()%>|<%=subdata.getSelnum()%>|<%=subdata.getSeltext()%>|<%=subdata.getReplycnt()%>|<%=subdata.getReplyrate()%><%           }
           }

%><%=v_replycount%>|<%=v_studentcount%>|<%=v_replyrate%>|<%=subdata.getSulnum()%>|<%=data.getSultext()%>||��Ÿ|<%=data.getComplexAnswer().size()%>|0|0
<%

       } else if (data.getSultype().equals(SulmunContentsBean.FSCALE_QUESTION)) {//5��ô��
              double d = 0;
              int person = 0;
              double v_point = 0;

           for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {        
                    d +=  (subdata.getReplycnt()) * subdata.getSelpoint();
                    person += subdata.getReplycnt();
                }
            }

        v_point = d / person;

           for (int j=1; j <= data.size(); j++) {

                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {                                               
%><%=v_replycount%>|<%=v_studentcount%>|<%=v_replyrate%>|<%=subdata.getSulnum()%>|<%=StringManager.replace(data.getSultext(),"\n","&nbsp;")%>|<%=subdata.getSelnum()%>|<%=subdata.getSeltext()%>|<%=subdata.getReplycnt()%>|<%=subdata.getReplyrate()%>|<%if(v_point >=0){%><%=df.format(v_point)%><%}%>
<%           }
            }
       } else if (data.getSultype().equals(SulmunContentsBean.SSCALE_QUESTION)) {

              double d = 0;
              int person = 0;
              double v_point = 0;

           for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {

                    d +=  (subdata.getReplycnt()) * subdata.getSelpoint();
                    person += subdata.getReplycnt();
                }
            }

        v_point = d / person;

           for (int j=1; j <= data.size(); j++) {

                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {
%><%=v_replycount%>|<%=v_studentcount%>|<%=v_replyrate%>|<%=subdata.getSulnum()%>|<%=data.getSultext()%>|<%=subdata.getSelnum()%>|<%=subdata.getSeltext()%>|<%=subdata.getReplycnt()%>|<%=subdata.getReplyrate()%>|<%if(v_point >=0){%><%=df.format(v_point)%><%}%>
<%           }
            }
       }
    } %>

