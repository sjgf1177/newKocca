
<%
//**********************************************************
//  1. ��      ��: Ȩ������ ��õ����
//  2. ���α׷��� : BookInfo.jsp
//  3. ��      ��: Ȩ������ ��õ����
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
<%@ page import = "com.credu.book.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);


    String v_bookcode      = "";          // �����ڵ�
    String v_bookname      = "";          // �����
    String v_intro         = "";          // ����Ұ�
    String v_writer        = "";          // ���ڼҰ�
    String v_content       = "";          // ����
    String v_review        = "";          // ����
    String v_realfilename1 = "";          // ū�̹���   �������ϸ�
    String v_newfilename1  = "";          // ū�̹���   �������ϸ�
    String v_realfilename2 = "";          // �����̹��� �������ϸ�
    String v_newfilename2  = "";          // �����̹��� �������ϸ�
    String v_image_view1   = "";
    String v_image_view2   = "";
    String upload_url = conf.getProperty("url.upload");

    BookBean bookbean = new BookBean();
    //DataBox dbox = bookbean.selectRecomBook(box);
    
    ArrayList list = bookbean.selectRecomBookList(box);


%>

<SCRIPT LANGUAGE="JavaScript">
<!--
//�󼼺���
function bookView(bookcode) {
    document.frmbook.p_bookcode.value = bookcode;
    document.frmbook.action = "/servlet/controller.book.BookServlet";
    document.frmbook.target = "_self";
    document.frmbook.p_process.value = "selectPage";
    document.frmbook.submit();
}

//-->
</SCRIPT>
<form name="frmbook" method="post">
    <input type = "hidden" name="p_process"    value = "">
    <input type = "hidden" name="p_bookcode"   value = "">
</form>


          <table cellpadding="0" cellspacing="0" width="190">
            <tr><td><img src="/images/user/game/homepage/type1/textbook_top.gif"></td></tr>
            <tr><td background="/images/user/game/homepage/type1/textbook_mid.gif" align="center"><a href="javascript:menuForward('6', '01', '1')"><img src="/images/user/game/homepage/type1/tit_textbook.gif" border="0" vspace="5"></a></td></tr>            
            <tr valign="top">
            <td align="center" background="/images/user/game/homepage/type1/textbook_mid.gif">
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
	    int rndcnt = 2; //�迭����
		int[] seq = new int[3]; //����Ʈ ����   
		for (int xx=0;xx<3;xx++) {
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
		
		
		//for (int xx=0;xx<3;xx++) {
		//	out.println("seq[] = " + seq[xx] + "<br>");
		//}

%>     
<% if (list.size()>0) {
    for(int i = 0; i < list.size() && i < 3; i++) {
    	//RANDOM
    	DataBox dbox = null;
    	if (seq[i] > list.size()) {
        	dbox  = (DataBox)list.get(i);
        } else {
        	dbox  = (DataBox)list.get(seq[i]);
        }
        
        v_bookcode      = dbox.getString("d_bookcode");
        v_bookname      = dbox.getString("d_bookname");
        v_intro         = dbox.getString("d_intro");
        v_writer        = dbox.getString("d_writer");
        v_content       = dbox.getString("d_content");
        v_review        = dbox.getString("d_review");
        v_realfilename1 = dbox.getString("d_realfilename1");
        v_newfilename1  = dbox.getString("d_newfilename1");
        v_realfilename2 = dbox.getString("d_realfilename2");
        v_newfilename2  = dbox.getString("d_newfilename2");

        if (v_newfilename1.equals("")) v_image_view1 = "/images/user/game/book/blank_book1.gif";
        else                           v_image_view1 = upload_url + "bulletin/" + v_newfilename1;
        if (v_newfilename2.equals("")) v_image_view2 = "/images/user/game/book/blank_book2.gif";
        else                           v_image_view2 = upload_url + "bulletin/" + v_newfilename2;
%>

            	<!-- ��õ���� ���� -->
                <table cellpadding="0" cellspacing="0" width="178">
                <tr>
                <td width="61" align="center">
                    <a href="javascript:bookView('<%=v_bookcode%>')"><img src="<%=v_image_view2%>" width="53" height="79" border="0"></a><br>
                </td>
                <td width="117">
                    <div style="width:117px;height:19px;background-color:#ededee;font-size:12px;">
                    <strong><a href="javascript:bookView('<%=v_bookcode%>')"><%=v_bookname%></a></strong>
                    </div>
                    <div style="width:117px;font-size:11px;padding:10px 0px 0px 5px;">
                    <a href="javascript:bookView('<%=v_bookcode%>')"><%=StringManager.formatTitle(v_intro, 30)%></a>
                    </div>
                </td>
                </tr>
                <tr>
                	<td height="7"></td>
                </tr>
                </table>
                
                <% if (i+1 < list.size()) { %>
                <table>
                  <tr>
                  	<td width=10>
                  	</td>
                  </tr>
                </table>
                <% } %>
<%		}
    } else {

%>
<table cellpadding="0" cellspacing="0" width="178">
                <tr>
                <td width="61" align="center"><img src="/images/user/game/book/blank_book2.gif" width="53" height="79" border="0"></a><br>
                </td>
                <td width="117">
				<!--
                    <div style="width:117px;height:19px;background-color:#ededee;font-size:12px;">
                    &nbsp;
                    </div>
				--->
                    <div style="width:117px;font-size:11px;padding:10px 0px 0px 5px;">
                    ��õ������ �����ϴ�.<br><br>
                    </div>
                </td>
                </tr>
                </table>
<%
    }
%>
                
                <!-- ��õ���� �� -->
            </td>
            </tr>
            <tr><td><img src="/images/user/game/homepage/type1/textbook_bot.gif"></td></tr>
            <tr height="21"><td></td></tr>
          </table>


