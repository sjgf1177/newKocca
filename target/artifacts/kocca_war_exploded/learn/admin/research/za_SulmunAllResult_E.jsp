<%
/**
 * file name : za_SulmunSubjResult_E.jsp
 * date      : 2003/10/09
 * programmer:
 * function  : ������ ���������ȸ(����)
 */
%>
<%//@ page language="java" contentType="application/vnd.ms-excel;name=My_Excel;charset=euc-kr" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%	
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_SulmunSubjResult.xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_grcode        = box.getString("p_grcode");
	String  v_subj        = box.getString("p_subj");
    String  v_subjseq        = box.getString("s_subjseq");
    String  v_gyear       = box.getString("p_gyear");
    String  v_grseq       = box.getString("s_grseq");
    int v_sulpapernum  = box.getInt("s_sulpapernum");

    int     v_replycount  = box.getInt("p_replycount");
    int     v_studentcount= box.getInt("p_studentcount");
    double  v_replyrate   = 0;
    if (v_studentcount != 0) {
        v_replyrate = (double)Math.round((double)v_replycount/v_studentcount*100*100)/100;
    }
	String  ss_action    = box.getString("p_action");
%>
<html>
<head>
<title>������� ������ Excel����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
      �������ڼ� : <%=v_replycount%>�� / ��ü������ : <%=v_studentcount%>�� / ���������� : <%=v_replyrate%>%
      <br>
      <table  width=600 border=1>
          <tr>
            <td width="4%">No</td>
            <td width="6%">�����ڵ�</td>
            <td width="*">������</td>
            <td width="8%">���̵�</td>
            <td width="8%">����</td>
            <td width="14%">�Ҽ�</td>
            <td width="6%">������<br/>�ڵ�</td>
            <td width="10%">������</td>
            <td width="8%">��������</td>
            <td width="16%">���</td>
            <td width="6%">���</td>
          </tr>
<%
	ArrayList listUsr      = null;
	if(ss_action.equals("go")) {
    listUsr = (ArrayList)request.getAttribute("SulmunUserList");
					int v_total = listUsr.size();
					for (int i = 0; i < v_total; i++) {
					 DataBox dbox = (DataBox) listUsr.get(i);
					  if (dbox != null) {
%>
          <tr>
            <td><%=String.valueOf(i+1)%></td>
            <td><%=dbox.getString("d_subj")%></td>
			<td><%=dbox.getString("d_subjnm")%></td>
            <td><%=dbox.getString("d_userid")%></td>
            <td><%=dbox.getString("d_name")%></td>
            <td><%=dbox.getString("d_comp")%></td>
            <td><%=dbox.getString("d_sulpapernum")%></td>
            <td><%=dbox.getString("d_sulpapernm")%></td>
            <td><%=dbox.getString("d_ldate")%></td>
            <td><%=dbox.getString("d_answers")%></td>
            <td><%=dbox.getString("d_distcode1_avg")%></td>
          </tr>
<%
					  }
				   }
	}
%>
     </table>
     <br>
      <table width=600 border=1>
<%  ArrayList    list = (ArrayList)request.getAttribute("SulmunResultList");
    SulmunQuestionExampleData data    = null;
    SulmunExampleData         subdata = null;
 
	int k = 0;
	int l = 0;

    for (int i=0; i < list.size(); i++) {
        data = (SulmunQuestionExampleData)list.get(i);
        if (data.getSultype().equals("1") || data.getSultype().equals("2")) { %>
                    <tr>
                      <td>����<%=i+1%></td>
                      <td colspan="3"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
                    </tr>
<%          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) { %>
                    <tr>
                      <td width="7%"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6"><%=subdata.getSeltext()%></td>
                      <td  width="11%"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%"><%=subdata.getReplyrate()%>%</td>
                   </tr>
<%              }
            }
       } else if (data.getSultype().equals(SulmunSubjBean.SUBJECT_QUESTION)) {

%>
                    <tr>
                      <td>����<%=i+1%></td>
                      <td colspan="3" style="padding-left:4px"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
                    </tr>
<%          for (int j=0; j < data.getSubjectAnswer().size(); j++) {
%>
					<tr>
                      <td width="7%"></td>
                      <td  colspan="3" style="padding-left=6"><%=(String)data.getSubjectAnswer().get(j)%></td>
                    </tr>

<%         }

       } else if (data.getSultype().equals(SulmunSubjBean.COMPLEX_QUESTION)) {

%>
                    <tr>
                      <td>����<%=i+1%></td>
                      <td colspan="3" style="padding-left:4px"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
                    </tr>
<%          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) { %>
                    <tr>
                      <td width="7%"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6"><%=subdata.getSeltext()%></td>
                      <td  width="11%"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%"><%=subdata.getReplyrate()%>%</td>
                    </tr>
<%           }
           }
%>
<%       int n = 0;
			int etc = 0;
            for (int j=0; j < data.getComplexAnswer().size(); j++) {
				if(((data.getComplexAnswer().size() / v_replycount)*n + (l+1)) == (j+1)) {
					if(n < v_replycount) n++;
						if( !((String)data.getComplexAnswer().get(j)).equals("")) {
							etc++;
%>

					<tr>
                      <td width="7%"><%if(j==0){%>��Ÿ<%}%></td>
                      <td  colspan="3" style="padding-left=6"><%=(String)data.getComplexAnswer().get(j)%></td>
                    </tr>
<%
					}
                }
		   }
           l++;
       } else if (data.getSultype().equals(SulmunSubjBean.FSCALE_QUESTION)) {

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
%>
                    <tr>
                      <td>����<%=i+1%></td>
                      <td colspan="3" style="padding-left:4px"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
					  <td width="7%"><%if(v_point >=0){%><%=v_point%>��<%}%></td>
                    </tr>
<%

		   for (int j=1; j <= data.size(); j++) {

                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {
%>

					<tr>
                      <td width="7%"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6"><%=subdata.getSeltext()%></td>
                      <td  width="11%"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%"><%=subdata.getReplyrate()%>%</td>
                      <td width="39%">
                      <table cellspacing="0" cellpadding="0" class="s_table">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>" class="graph">&nbsp;</td>
<%                  } %>
                          <td>&nbsp;</td>
                        </tr>
                        </table>
                      </td>
                    </tr>
<%           }
            }
       } else if (data.getSultype().equals(SulmunSubjBean.SSCALE_QUESTION)) {

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
%>
                    <tr>
                      <td>����<%=i+1%></td>
                      <td colspan="3" style="padding-left:4px"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
					  <td width="7%"><%if(v_point >=0){%><%=v_point%>��<%}%></td>
                    </tr>
<%

		   for (int j=1; j <= data.size(); j++) {

                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {
%>

					<tr>
                      <td width="7%"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6"><%=subdata.getSeltext()%></td>
                      <td  width="11%"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%"><%=subdata.getReplyrate()%>%</td>
                      <td width="39%">
                      <table cellspacing="0" cellpadding="0">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>">&nbsp;</td>
<%                  } %>
                          <td style="padding-left:5px">&nbsp;</td>
                        </tr>
                        </table>
                      </td>
                    </tr>
<%           }
            }
	   }
    } %>
      </table>

</table>
</body>
</html>
