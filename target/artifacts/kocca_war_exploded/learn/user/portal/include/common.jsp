<%
    // �޴� ���� �Ķ���� ���� - �� �޴� �̵��� ����Ʈ �޴� ����(on/off) ����
    String gubun     = box.getString("gubun");  // ž �޴�
	String menuid    = box.getString("menuid"); // ����Ʈ �޴�
	String orders    = box.getString("orders"); // ����Ʈ �޴� ����

	// ���� �޴� ����(�޴� �̵��� ���� ����)
	if(!gubun.equals("") && gubun != null)  box.setSession("s_gubun", gubun);
	if(!menuid.equals("") && menuid != null) box.setSession("s_menuid", menuid);

	String v_return_url = request.getRequestURI();
	String v_return_process = box.getString("p_process");

%>

<script language="JavaScript">
    function mainOut(imgs, idx) {
        <%  // KOCCA �� ����ȭ���϶��� ����޴��� �Ⱥ���.
        if( (koccaYn && box.getSession("s_gubun").equals("0"))) { %>
        imgout(imgs);
        <% } %>

    }


  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-54003956-1', 'auto');
  ga('send', 'pageview');

</script>

<form name="topdefaultForm" method="post" action="javascript:return;" id="topdefaultForm">
  <input type='hidden' name='p_process'   value=''>
  <input type='hidden' name='gubun'       value='0'>
  <input type='hidden' name='menuid'      value=''>
  <input type='hidden' name='url'         value=''>
  <input type='hidden' name='p_cmuno'     value=''>
  <input type='hidden' name='searchClass' value=''>
  <input type='hidden' name='p_auth'      value=''>
  <input type='hidden' name='p_topuserid' value=''>
  <input type='hidden' name='p_toppwd'    value=''>
  <input type='hidden' name='p_area'    value=''>
</form>