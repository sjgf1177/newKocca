<%
//**********************************************************
//  1. ��      ��: Ȩ������ �α����
//  2. ���α׷��� : PopCourse.jsp
//  3. ��      ��: Ȩ������ �α����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.21
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.propose.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_subj    = "";
    String v_subjnm  = "";
    String v_isonoff = "";
    double v_sul_avg = 0; // ���� ������ 

    double tmp_sul_avg = 0;
    String v_imgStart = "";
    int i = 0;

    MainSubjSearchBean bean = new MainSubjSearchBean();
    ArrayList list = bean.selectSubjTopRecomList(box);
%>

<SCRIPT LANGUAGE="JavaScript">
<!--
// ���� ���뺸��
function whenSubjInfo(subj,subjnm,isonoff){
    document.Popform.p_subj.value = subj;
    document.Popform.p_subjnm.value = subjnm;
    document.Popform.p_isonoff.value = isonoff;
    document.Popform.p_process.value = 'SubjectPreviewPage';
    document.Popform.action='/servlet/controller.propose.ProposeCourseServlet';
    document.Popform.target = "_self";
    document.Popform.submit();
}

//-->
</SCRIPT>
<form name="Popform" method="post">
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="p_subj"    value="">
    <input type="hidden" name="p_subjnm"  value="">
    <input type="hidden" name="p_isonoff" value="">
</form><br>
<iframe src="/learn/user/game/homepage/hit_go1.html" frameborder="no" width="536" height="164" scroll="no" name="hitlink"></iframe>
<!--<a href="/images/user/game/homepage/type1/main.html" target="_blank"><img src='/images/user/game/homepage/type1/tmp_img2.gif' border="0"></a>-->
<!--            <table cellpadding="0" cellspacing="0" width="256" style="table-layout:fixed;" border="0">
            <col width="121"><col width="107"><col width="28">
              <tr height="28"><td colspan="3"><a href="javascript:menuForward('1', '06', '6')"><img src="/images/user/game/homepage/type1/tit_popular.gif" border="0"></a></td></tr>
<%!
	public int getRANDOM(int v_from,int v_to) {
		//int num = (int)(Math.random() * 10);
		int num = (int)(Math.random() * v_to);
		
		loop: while(true) {
			if (num<v_from) num = (int)(Math.random() * v_to); else break loop;
		}
		
		loop: while(true) {
			if (num>v_to) num = (int)(Math.random() * v_to); else break loop;
		}
		
		return num;
	}
	


%>
<%
		//������ ����
	    int v_from = 0; //����
	    int v_to = list.size(); //��
	    int rndcnt = 3; //�迭����
		int[] seq = new int[4]; //����Ʈ ����   
		for (int xx=0;xx<4;xx++) {
			seq[xx]=999;
		} 
	    
	    //���� ����
		int cnt = 0;	//ä���� ����
		int errchkcnt = 0; //���ѷ��� ����
		
		//rndcnt���� ä���������� �ݺ�
		while(cnt<=rndcnt) {
			//���� �� ��������
			int rnd = getRANDOM(v_from, v_to);
			
			//������ �ִ��� �˻�
			boolean v_exists = false;

			for(int rnd_i=0;rnd_i<=rndcnt;rnd_i++) {
				if (seq[rnd_i]==rnd) {
					v_exists = true;
				}
				errchkcnt++;
				
				if (errchkcnt>1000) break;
			}
			
			if (v_exists==false) {
				seq[cnt]=rnd;
				cnt++;
			}
			
			errchkcnt++;
			if (errchkcnt>1000) break;
			
		}
		
		
		//for (int xx=0;xx<4;xx++) {
		//	out.println("seq[] = " + seq[xx] + "<br>");
		//}



//out.println("list.size() = "+list.size());

if(list.size() !=  0 ){         //������ �ִٸ�

    for(i = 0; i < list.size() && i < 4; i++) {
    	//RANDOM
    	DataBox dbox = null;
    	if (seq[i] > list.size()) {
        	dbox  = (DataBox)list.get(i);
        } else {
        	dbox  = (DataBox)list.get(seq[i]);
        }
        v_subj       = dbox.getString("d_subj");
        v_subjnm     = dbox.getString("d_subjnm");
        v_isonoff    = dbox.getString("d_isonoff");
        v_sul_avg    = dbox.getDouble("d_sul_avg");

        v_imgStart = "";
        tmp_sul_avg = v_sul_avg * 10;

        for(int k = 0; k < 5; k++) {
            if(tmp_sul_avg > 10) {
                v_imgStart += "<img src='/images/user/game/course/i_star_on.gif'>";
            } else {
                if(tmp_sul_avg >= 5) {
                    v_imgStart += "<img src='/images/user/game/course/i_star_half.gif'>";
                } else {
                    v_imgStart += "<img src='/images/user/game/course/i_star_off.gif'>";
                }
            }

            tmp_sul_avg = tmp_sul_avg - 10;
        }
%>
              <tr height="5"><td colspan="3"></td></tr>
              <tr height="17">
                <td><%=v_subjnm%></td>
                <td background="/images/user/game/homepage/type1/popular_star.gif" style="color:#e5bc10;padding-left:37px;letter-spacing:1;"><%=v_imgStart%></td>
                <td align="center">
                    <a href="javascript:whenSubjInfo('<%=v_subj%>','<%=v_subjnm%>','<%=v_isonoff%>')"><img src="/images/user/game/homepage/type1/popular_join.gif"></a>
                </td>
              </tr>
<%
    }
    // ����� ä���
    for(int j = 0; j < 4 - i; j++) {
%>
              <tr height="5"><td colspan="3"></td></tr>
              <tr height="17">
                <td></td>
                <td></td>
                <td></td>
              </tr>
<%
    }

}else{          //������ ���ٸ�
%>
              <tr height="5"><td colspan="3" rowspan="4" valign="center" align="center">������ �����ϴ�.</td></tr>
              <tr height="17">
                <td></td>
                <td></td>
                <td></td>
              </tr>

<%
}
%>
            </table>-->