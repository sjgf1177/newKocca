<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int     v_seq      = box.getInt("p_seq");     
    String  v_process  = box.getString("p_process");

    String s_userid   = box.getSession("userid");
    String s_usernm   = box.getSession("name");
    String s_email    = box.getSession("email");
    String s_handphone    = box.getSession("handphone");
    
    String s_handphone1 = "";
    String s_handphone2 = "";
    String s_handphone3 = "";
    
    if(s_handphone.indexOf("-") == -1){
        try {
            s_handphone1 = s_handphone.substring(0,3); 
            
            if(s_handphone.length() < 11 ) {
                s_handphone2 = s_handphone.substring(3,6);
                s_handphone3 = s_handphone.substring(6,10);
            } else {
                s_handphone2 = s_handphone.substring(3,7);
                s_handphone3 = s_handphone.substring(7,11);
            }
            
            
        } catch(Exception e) {
            //System.out.println(e.toString());
            s_handphone1 = "";
            s_handphone2 = "";
            s_handphone3 = "";
        }
    } else {
    	try {
	        StringTokenizer st = new StringTokenizer(s_handphone, "-");
	        
	        s_handphone1 = st.nextToken();
	        s_handphone2 = st.nextToken();
	        s_handphone3 = st.nextToken();
    	} catch(Exception e) {
            //System.out.println(e.toString());
            s_handphone1 = "";
            s_handphone2 = "";
            s_handphone3 = "";
        }
    }
    
    String v_startdate    = "";
    String v_enddate      = "";
    String v_shour        = "";
    String v_ehour        = "";
    String v_propstart    = "";
    String v_propend      = "";
    String v_seminarnm    = "";
    String v_seminargubun = "";
    String v_seminargubunnm = "";
    
    String seminardate = "";    //���̳� ����
    String propdate     = "";   // ��û �Ⱓ

    DataBox dbox = (DataBox)request.getAttribute("selectView");

    if (dbox != null) {
        v_startdate    = dbox.getString("d_startdate");
        v_enddate      = dbox.getString("d_enddate");
        v_shour        = dbox.getString("d_starttime");
        v_ehour        = dbox.getString("d_endtime");
        v_propstart    = dbox.getString("d_propstart");
        v_propend      = dbox.getString("d_propend"); 
        v_seminarnm    = dbox.getString("d_seminarnm");
        v_seminargubun = dbox.getString("d_seminargubun");
        v_seminargubunnm = dbox.getString("d_seminargubunnm");
        
       	// ��ũ�� ���� ����
       	if(v_startdate.equals(v_enddate)) {
       		seminardate = FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd") + " "+ v_shour + "�� ~ " + v_ehour + "��";  
       	} else {
       		seminardate = FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd") + " "+ v_shour + "�� ~ " + FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd") + " "+v_ehour + "��";
       	}
       	
       	// ��ũ�� ��û�Ⱓ ����
       	propdate= FormatDate.getFormatDate(v_propstart, "yyyy.MM.dd")+"~"+FormatDate.getFormatDate(v_propend, "MM.dd");
       	
     }
    
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�����ڹ�ǥ</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    // ��ũ�� ��û
    function reqSeminar(){

        var frm = document.nform1;

        if(frm.p_handphone1.value == "" || frm.p_handphone2.value == "" ||frm.p_handphone3.value == ""){
            alert("�ڵ��� ��ȣ�� �Է��ϼ���");
            return;
        }

        if(frm.p_email.value == ""){
            alert("�̸����� �Է��ϼ���");
            frm.p_email.focus();
            return;
        }

        var bRtn = confirm("��û�Ͻðڽ��ϱ�?");

        if(bRtn){
            frm.p_handphone.value = frm.p_handphone1.value +"-"+ frm.p_handphone2.value  +"-"+ frm.p_handphone3.value;
	        document.nform1.action = "/servlet/controller.homepage.SeminarHomePageServlet";
	        document.nform1.p_process.value = "insertRequest";
	        document.nform1.submit();
        }
    }

//-->
</SCRIPT>
</head>
<body id="popup" onload="self.focus();"><!-- popup size : 400* -->
<form name="nform1" method="post" onsubmit="javascript:select();">
    <input type = "hidden" name = "p_process" />
    <input type = "hidden" name = "p_seq"     value="<%=v_seq %>" />
    <input type = "hidden" name = "p_handphone" />

    <div id="pop_header">
        <h1><img src="/images/portal/information/pop_h1_tit3.gif" alt="�����ڹ�ǥ" /></h1>
    </div>
    <div id="pop_container">
        <div id="contentwrap" class="message_top">
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_applystep.gif" alt="��û����" class="fl_l" /> </h3>
            <table class="write">
            <colgroup><col width="18%" /><col width="34%" /><col width="18%" /><col width="30%" /></colgroup>
            <tr>
                <th>��ũ����</th>
                <td colspan="3" class="end"><%=v_seminarnm %></td>
            </tr>
            <tr>
                <th>�з�</th>
                <td><%=v_seminargubunnm %></td>
                <th>��û�Ⱓ</th>
                <td class="end"><%=propdate%></td>
            </tr>                                                         
            <tr>                                                          
                <th>��ũ������</th>                                            
                <td><%=seminardate%></td>
                <th>��û�ڸ�</th>
                <td class="end"><%=s_usernm %></td>
            </tr>
            <tr>
                <th>�޴���ȭ</th>
                <td><input type="text" name="p_handphone1" class="inbox" style="width:40px;" value="<%=s_handphone1 %>"/> <input type="text" name="p_handphone2" size=4 class="inbox" style="width:40px;" value="<%=s_handphone2 %>"/> <input type="text" name="p_handphone3" class="inbox" style="width:40px;" value="<%=s_handphone3 %>"/></td>
                <th>�̸���</th>
                <td class="end"><input type="text" class="inbox" style="width:162px;" name = "p_email" value="<%=s_email %>" /></td>
            </tr>
            </table>
        </div>
    </div>
    <div id="pop_footer">
        <p class="f_btn"><a href="javascript:reqSeminar();" class="btn_violet"><span>��û�ϱ�</span></a><a href="javascript:self.close();" class="btn_gr"><span>���</span></a></p>
    </div>
</form>
</body>
</html>
