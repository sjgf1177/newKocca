<%
//**********************************************************
//  1. ��      ��: STUDENT MEMBER COUNT LIST
//  2. ���α׷���: za_SelectedSubjFinish_E.jsp
//  3. ��      ��: �԰��ο���ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
//***********************************************************
%>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%//@ page language="java" contentType="application/vnd.ms-excel;name=My_Excel;charset=euc-kr" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%	
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_SelectedSubjFinish_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");    

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	ArrayList list = null;
    list = (ArrayList)request.getAttribute("StudentMemberCountExcel");

	String  v_grseq         =  "";
    String  v_grseqnm       =  "";
    String  v_course        =  "";
    String  v_cyear         =  "";
    String  v_courseseq     =  "";
    String  v_coursenm      =  "";
    String  v_subj          =  "";
    String  v_year          =  "";
    String  v_subjnm        =  "";
    String  v_subjseq       =  "";
    String  v_subjseqgr     =  "";
    String  v_propstart     =  "";
    String  v_propend       =  "";
    String  v_edustart      =  "";
    String  v_eduend        =  "";
    String  v_isonoff       =  "";
    String  v_isonoff_value = "";
    String  v_isnewcourse   = "";
    String  v_studentcnt    = "";
    String  v_totalcnt      = "";

    int     v_studentlimit =  0;
    int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;
    int     v_procnt    =  0;
    int     v_proycnt    =  0;
    int     v_stucnt    =  0;
    int     v_comcnt    =  0;
    int     v_cancnt    =  0;
    int     v_totalstucnt   =  0;
    int     v_totalcomcnt   =  0;
    int     v_totalcancnt   =  0;
    int     v_totalprocnt   =  0;
    int     v_totalproycnt  =  0;
    int     v_totalstulimit =  0;
    int     v_personcnt     =  0;

    int		v_today = 0;
    int		v_dday = 0;                     //D���� ���� ����
    int		v_edustart_value = 0;
    int		v_eduend_value = 0;
    int		v_count = 0;
%>
<HTML>
<HEAD>
<TITLE></TITLE>

</HEAD>

<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >
<!----------------- �԰������ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out" border="1">
          <tr>
            <td colspan="13" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title">No</td>
            <td class="table_title">��������</td>
            <td class="table_title">����</td>
            <td class="table_title" width="4%">����<br>����</td>
            <!--td class="table_title">����</td-->
            <td class="table_title">��û�Ⱓ</td>
            <td class="table_title">�����Ⱓ</td>
            <td class="table_title">�н��Ϸ�</td>
            <td class="table_title">����</td>
            <td class="table_title">�ѽ�û�ο�</td>
            <td class="table_title">��û���<br>�ο�</td>
            <td class="table_title">�̼���<br>�ο�</td>
            <td class="table_title">����<br>�ο�</td>
          </tr>
          <%
                v_total = list.size();

if(list.size() != 0) {		// ������ �ִٸ�

                for(i = 0; i < v_total; i++) {
                    StudentStatusData data  = (StudentStatusData)list.get(i);
                    v_grseq         = data.getGrseq();
                    v_grseqnm       = data.getGrseqnm();
                    v_course        = data.getCourse();
                    v_cyear         = data.getCyear();
                    v_courseseq     = data.getCourseseq();
                    v_coursenm      = data.getCoursenm();
                    v_subj          = data.getSubj();
                    v_year          = data.getYear();
                    v_subjnm        = data.getSubjnm();
                    v_subjseq       = data.getSubjseq();
                    v_subjseqgr     = data.getSubjseqgr();
                    v_propstart     = data.getPropstart();
                    v_propend       = data.getPropend();
                    v_edustart      = data.getEdustart();
                    v_eduend        = data.getEduend();
                    v_studentlimit  = data.getStudentlimit();
                    v_procnt        = data.getProcnt();
                    v_stucnt        = data.getStucnt();
                    v_comcnt        = data.getComcnt();
                    v_cancnt        = data.getCancnt();
                    v_isnewcourse   = data.getIsnewcourse();
                    v_rowspan       = data.getRowspan();
                    v_totalpage     = data.getTotalPageCount();
                    v_rowcount      = data.getRowCount();
                    v_isonoff       = data.getIsonoff();


                    v_totalstulimit += v_studentlimit;

                    //if(v_isonoff.equals("ON")){     v_isonoff_value="���̹�";   }
                    //else                      {     v_isonoff_value="����";     }

                    v_personcnt     = v_procnt + v_cancnt;    //������û�ο�(��û��+�����)

                    if(!v_eduend.equals("")&&v_eduend.length() == 10){

                        v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));
                        v_edustart_value = Integer.parseInt(v_edustart);
                        v_eduend_value   = Integer.parseInt(v_eduend);
                        v_propstart      = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");
                        v_propend        = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");
                        v_edustart       = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                        v_eduend         = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");
												
                    		if(v_studentlimit == 0) {
                    			v_studentcnt = "-";
                    		} else {
                    			v_studentcnt = String.valueOf(v_studentlimit);
                    		}
                    		
                    		if(v_totalstulimit == 0) {
                    			v_totalcnt = "-";
                    		} else {
                    			v_totalcnt = String.valueOf(v_totalstulimit);
                    		}
												
                        if(v_today>v_eduend_value){
                            v_dday = FormatDate.datediff("date",data.getEduend(),FormatDate.getDate("yyyyMMddHH"));
%>
                        <tr>
                          <td class="table_01"><%= data.getDispnum() %></td>
                          <td class="table_02_1"><%=v_grseqnm%></td>
                          <td class="table_02_2" ><font class="text_color04"><%=v_subjnm%></font></td>
                          <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
                          <!--td class="table_02_1"><%//=v_isonoff_value%></td-->
                          <td class="table_02_1"><%= v_propstart %>~<%= v_propend %></td>
                          <td class="table_02_1"><%= v_edustart %>~<%= v_eduend %></td>
                          <td class="table_02_1">D+<%=v_dday%> </td>
                          <td class="table_02_1"><%= v_studentcnt %></td>
                          <td class="table_02_1"><%= v_personcnt %></td>
                          <td class="table_02_1"><%= v_cancnt %></td>
                          <td class="table_02_1"><%= v_stucnt %></td>
                          <td class="table_02_1"><%= v_comcnt %></td>
                        </tr>
                        <%
                        v_totalprocnt =v_totalprocnt+v_personcnt;            //�Ѽ�����û�ο�
                        v_totalcancnt =v_totalcancnt+v_cancnt;             //��������ο�
                        v_totalproycnt=v_totalproycnt+v_proycnt;          //�н������ο�
			            v_totalstucnt =v_totalstucnt+v_stucnt;             //�н������ο�
			            v_totalcomcnt =v_totalcomcnt+v_comcnt;             //�н��Ϸ��ο�

                        v_count = v_count+1;
                        }
                    }
        }

%>
                <tr>
                   <td class="table_02_1" colspan="8">��</td>
                   <td class="table_02_1"><%= v_totalcnt %></td>
                   <td class="table_02_1"><%= v_totalprocnt %></td>
                   <td class="table_02_1"><%= v_totalcancnt %></td>
                   <td class="table_02_1"><%= v_totalstucnt %></td>
                   <td class="table_02_1"><%= v_totalcomcnt %></td>
                </tr>
			</table>
<%

	}else{		//������ ���ٸ�
%>
              <tr>
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="13">��ϵ� ������ �����ϴ�</td>
              </tr>
			</table>
            <%
}
            %>
      
      <!----------------- �԰���� ��ȸ �� ----------------->
</body>
</HTML>

