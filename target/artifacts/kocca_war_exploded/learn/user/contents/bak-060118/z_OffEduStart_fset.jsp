<%@ page contentType = "text/html;charset=MS949" %>
<%@ page import = "com.credu.library.*" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
    	box = RequestManager.getBox(request);
    }

    String	p_process	= box.getString("p_process");
    String  p_subj   	= box.getString("p_subj");
    String  p_year   	= box.getString("p_year");
    String  p_subjseq  	= box.getString("p_subjseq");
    String	c_gadmin	= box.getSession("gadmin");
    
    box.setSession("s_subj",	p_subj);
    box.setSession("s_year",	p_year);
    box.setSession("s_subjseq",	p_subjseq);
    
    //�н����� ��� (Y/P/N)
    String	v_eduauth = EduEtc1Bean.get_eduAuth(box);
    
    box.setSession("s_eduauth",v_eduauth);	//������ ���� ���� ����(P:������ ��ȸ�� ����, �ԷºҰ�)
    
    if(v_eduauth.equals("N")){
%>
	<html><head><title>Sorry</title>
	<script>
	alert("[<%=box.getSession("gadmin")%>][<%=box.getSession("s_subj")%>]�˼��մϴ�. �н������� �����Ƿ� �н�â�� �ݽ��ϴ�.\n\n���ǻ����� ��ڿ��� �����Ͽ� �ֽʽÿ�");
	window.close();
	</script>
	</head><body></body></html>
<%    
    }


%>
<script language="javascript">
    function init() {
        this.moveTo(0,0);
        this.resizeTo(800,600);
    }
init();
</script>


<html>
<head>
<title>Education Start</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

</head>
<frameset rows="68,*" cols="*" frameborder="NO" border="0" framespacing="0"> 
  <frame name="etop"  src="/servlet/controller.study.OffEduStartServlet?p_process=selectTop&p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>" scrolling="NO" noresize  frameborder="NO" >
  <frame name="ebody" src="/servlet/controller.study.SubjGongStudyServlet?p_process=Offselect&p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>" frameborder="NO" scrolling="AUTO">
</frameset>
<noframes> 
<body bgcolor="#FFFFFF" text="#000000">
</body>
</noframes> 
</html>
