<%
//**********************************************************
//  1. ��      ��: COMPLETE MEMBER LIST
//  2. ���α׷���: za_CompleteMember_E.jsp
//  3. ��      ��: ��������ȸ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 26
//  7. ��      ��: 
//**********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_CompleteMember_E.xls");
	  response.setHeader("Content-Description", "JSP Generated Data");
	  
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  ss_grcode      = box.getString("s_grcode");           //�����׷�
    String  ss_gyear       = box.getString("s_gyear");            //�⵵
    String  ss_grseq       = box.getString("s_grseq");            //��������
    String  ss_grseqnm     = box.getString("s_grseqnm");          //����������
    String  ss_upperclass  = box.getString("s_upperclass");       //������з�
    String  ss_middleclass = box.getString("s_middleclass");      //�����ߺз�
    String  ss_lowerclass  = box.getString("s_lowerclass");       //�����Һз�

    String  ss_uclass      = box.getStringDefault("s_uclass","ALL");        //�����з�
            
    
    String  ss_subjcourse  = box.getString("s_subjcourse");       //����&�ڽ�
    
    String  ss_subjseq     = box.getString("s_subjseq");          //���� ����
    
    String  ss_edustart    = box.getString("s_start");            //����������
    String  ss_eduend      = box.getString("s_end");              //����������
			 			 
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���

	String  v_grseq     =  "";
    String  v_course    =  "";
    String  v_cyear     =  "";
    String  v_courseseq =  "";
    String  v_coursenm  =  "";
    String  v_subj      =  "";
    String  v_year      =  "";
    String  v_subjnm    =  "";
    String  v_subjseq   =  "";
    String  v_subjseqgr =  "";
    String  v_isonoff   =  "";
    String  v_compnm    =  "";
    String  v_companynm =  "";    
    String  v_jikwinm   =  "";
    String  v_jikupnm   =  "";
    String  v_userid    =  "";
    String  v_cono      =  "";
    String  v_name      =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_isgraduated= "";
    String  v_email     =  "";
    String  v_ismailing =  "";
    String  v_place     =  "";
    String  v_isnewcourse= "";
    String  v_isonoff_value="";
	String	v_membergubun = "";

	String v_tmp_subj	= "";
	String v_iscourseYn	= "";

    int     v_tstep     =  0;
    int     v_avtstep   =  0;
    int     v_mtest     =  0;
    int     v_ftest     =  0;
    int     v_htest     =  0;
    int     v_report    =  0;
    int     v_act       =  0;
    int     v_etc1      =  0;
    int     v_etc2      =  0;
    int     v_score     =  0;
    int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     v_subjcnt	=  0;
    int     i           =  0;
	int		l			= 0;
	int		v_usercnt	= 0;

	ArrayList list      = null;

	list = (ArrayList)request.getAttribute("CompleteMemberExcel");
%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >
<table width="1000" border="1" cellspacing="0" cellpadding="0" height="663">
	<tr>
		<td align="center" height="30"><font size="3"><b>������ �����̷� ����Ʈ</b></font></td>
	</tr>
  <tr>
    <td align="center" valign="top">
        <!----------------- ����������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="5" border="1">
          <tr>
            <td rowspan="2"><b>NO</b></td>
            <td rowspan="2" colspan="2"><b>����</b></td>
            <td rowspan="2"><b>ȸ���з�</b></td>
            <td rowspan="2"><b>ID</b></td>
            <td rowspan="2"><b>����</b></td>
            <td rowspan="2"><b>����</b></td>
            <!--td rowspan="2"><b>����</b></td-->
            <td rowspan="2"><b>�����Ⱓ</b></td> 
            <td colspan="7"><b>�� ��</b></td>
            <td rowspan="2"><b>���<br>����</b></td>
            <td rowspan="2"><b>����<br>����</b></td>
          </tr>
          <tr> 
            <td><b>������<br>(����)</b></td>
            <td><b>�߰�<br>��</b></td>
            <td><b>����<br>��</b></td>
            <td><b>����<br>��</b></td>
            <td><b>����Ʈ</b></td>
            <td><b>������</b></td>
            <td><b>��Ÿ</b></td>
          </tr>
<%
		v_total = list.size();
		for(i = 0; i < v_total; i++) {                                    
			DataBox dbox = (DataBox)list.get(i);

			v_grseq         = dbox.getString("d_grseq");    
			v_course        = dbox.getString("d_course");
			v_cyear         = dbox.getString("d_cyear");
			v_courseseq     = dbox.getString("d_courseseq");
			v_coursenm      = dbox.getString("d_coursenm");
			v_subj          = dbox.getString("d_subj");
			v_year          = dbox.getString("d_year");
			v_subjnm        = dbox.getString("d_subjnm");
			v_subjseq       = dbox.getString("d_subjseq");
			v_subjseqgr     = dbox.getString("d_subjseqgr");
			v_isonoff       = dbox.getString("d_isonoff");
			v_compnm        = dbox.getString("d_compnm"); 
			v_companynm     = dbox.getString("d_companynm");                 
			v_jikwinm       = dbox.getString("d_jikwinm");
			v_jikupnm       = dbox.getString("d_jikupnm");
			v_userid        = dbox.getString("d_userid");
			v_cono          = dbox.getString("d_cono");
			v_name          = dbox.getString("d_name");
			v_edustart      = dbox.getString("d_edustart");
			v_eduend        = dbox.getString("d_eduend");
			v_isgraduated   = dbox.getString("d_isgraduated");
			v_email         = dbox.getString("d_email");
			v_ismailing     = dbox.getString("d_ismailing");
			v_place         = dbox.getString("d_place");
			v_isnewcourse   = dbox.getString("d_isnewcourse");
			v_membergubun	= dbox.getString("d_membergubun");
			v_iscourseYn	= dbox.getString("d_isbelongcourse");
			
			v_tstep         = dbox.getInt("d_tstep");
			v_avtstep       = dbox.getInt("d_avtstep");
			v_mtest         = dbox.getInt("d_mtest");
			v_ftest         = dbox.getInt("d_ftest");
			v_htest         = dbox.getInt("d_htest");
			v_report        = dbox.getInt("d_report");
			v_act           = dbox.getInt("d_act");
			v_etc1          = dbox.getInt("d_etc1");
			v_score         = dbox.getInt("d_score");
			v_subjcnt       = dbox.getInt("d_subjcnt");
			v_totalpage     = dbox.getInt("d_totalpage");
			v_rowcount      = dbox.getInt("d_rowcount");

			v_edustart		= FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
			v_eduend		= FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");

			//if(v_isonoff.equals("ON")){     v_isonoff_value="���̹�";   }
			//else                      {     v_isonoff_value="����";     }
			if(v_place == null) v_place = "";

			if(v_membergubun.equals("C"))
			{
				v_membergubun = "���";
			}
			else if(v_membergubun.equals("U"))
			{
				v_membergubun = "����";
			}
			else
			{
				v_membergubun = "����";
			}
	   %>
          <tr align="left">
            <td><%= i+1 %></td>
<% if(v_iscourseYn.equals("Y"))
	{ 
		if(l == v_subjcnt) v_tmp_subj = "";

		if(!v_tmp_subj.equals(v_course) && !v_tmp_subj.equals("000000"))
		{
			l = 1;
			v_usercnt++;
			%>
            <!-- �ڽ��� ��� -->
            <td class="table_02_2" rowspan="<%=v_subjcnt%>"><%=v_coursenm%></td>
            <td class="table_02_2" ><%=v_subjnm %></td>
<%	
			v_tmp_subj = v_course;
		}else{ 
			l++;
		%>
            <td class="table_02_2" ><%=v_subjnm %></td>
<%		}
	} else { 
			v_usercnt++;%>
            <!-- ������ ��� -->
            <td class="table_02_2" colspan="2"><%=v_subjnm %></td>
<% } %>
            <td><%=v_membergubun%></td>              
            <td><%= v_userid %></td>
            <td><%= v_name %></td>
            <td><%=StringManager.cutZero(v_subjseqgr)%></td>
            <!--td><%//=v_isonoff_value%></td-->
            <td><%= v_edustart %>~<br> <%= v_eduend %></td>            
            <td><%=v_tstep%>(<%=v_avtstep%>)</td>
            <td><%=v_mtest%></td><!--�߰�-->
            <td><%=v_ftest%></td><!--����-->
            <td><%=v_htest%></td><!--����-->
            <td><%=v_report%></td>
            <td><%=v_etc1%></td>
            <td><%=v_etc2%></td>
            <td><%=v_score%></td>
            <td><%=v_isgraduated%></td>
          </tr>
          <%
               }
         if(i == 0){ %>
          <tr> 
            <td align="center" bgcolor="#FFFFFF" height="50" colspan="19">�������� �����ϴ�.</td>
          </tr>
		<% } %>
        </table>
      </td>
  </tr>
</table>
</body>
</html>

