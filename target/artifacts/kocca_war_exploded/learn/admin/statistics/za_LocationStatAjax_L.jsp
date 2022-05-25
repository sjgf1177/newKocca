<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
    int i = 0;
    
	
    String v_areaname = "";
    String v_cate = "";
    String v_grseqnm = "";
    
    int v_rank = 0;
    int v_rowspan = 0;
    
    double v_grad_rate = 0;
    double v_sul_rate = 0;
    
    int v_rowspantmp = 0;
    
    int v_seoul_cnt		= 0;
    int v_kyunggi_cnt	= 0;
    int v_busan_cnt		= 0;
    int v_incheon_cnt	= 0;
    int v_daegu_cnt		= 0;
    int v_daejeon_cnt	= 0;
    int v_kwangju_cnt	= 0;
    int v_jeonbook_cnt	= 0;
    int v_jeonnam_cnt	= 0;
    int v_chungbook_cnt	= 0;
    int v_choongbook_cnt= 0;
    int v_choongnam_cnt	= 0;
    int v_gangwon_cnt	= 0;
    int v_gyungbook_cnt	= 0;
    int v_gyungnam_cnt	= 0;
    int v_woolsan_cnt	= 0;
    int v_jejoo_cnt		= 0;
    int v_etc_cnt		= 0;
    int v_total_cnt	= 0;
    int v_tot = 0;
    
    int v_total_seoul_cnt = 0, v_sum_seoul_cnt	= 0;
    int v_total_kyunggi_cnt = 0, v_sum_kyunggi_cnt	= 0;
    int v_total_busan_cnt = 0, v_sum_busan_cnt	= 0;
    int v_total_incheon_cnt = 0, v_sum_incheon_cnt	= 0;
    int v_total_daegu_cnt = 0, v_sum_daegu_cnt	= 0;
    int v_total_daejeon_cnt = 0, v_sum_daejeon_cnt	= 0;
    int v_total_kwangju_cnt = 0, v_sum_kwangju_cnt	= 0;
    int v_total_jeonbook_cnt = 0, v_sum_jeonbook_cnt	= 0;
    int v_total_tot = 0, v_sum_tot	= 0;
    
    int v_total_jeonnam_cnt = 0, v_sum_jeonnam_cnt	= 0;
    int v_total_choongbook_cnt = 0, v_sum_choongbook_cnt	= 0;
    int v_total_choongnam_cnt = 0, v_sum_choongnam_cnt	= 0;
    int v_total_gangwon_cnt = 0, v_sum_gangwon_cnt	= 0;
    int v_total_gyungbook_cnt = 0, v_sum_gyungbook_cnt	= 0;
    int v_total_gyungnam_cnt = 0, v_sum_gyungnam_cnt	= 0;
    int v_total_woolsan_cnt = 0, v_sum_woolsan_cnt	= 0;
    int v_total_jejoo_cnt = 0, v_sum_jejoo_cnt	= 0;
    
    int v_total_etc_cnt = 0, v_sum_etc_cnt	= 0;
    int v_total_total_cnt = 0, v_sum_total_cnt	= 0;
    
    
%>
<script language="JavaScript">
<!--
function whenExcel() {
	document.form1.target = 'mainFrame';
    $("#isExcel").val("true");
    document.form1.submit();
    $("#isExcel").val("false");
}
//-->
</script>
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left" height="20">&nbsp;<b>������ �˻�</b></td>
          <td align="right">
          <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
             <!-- <button id="exCel">�������</button> -->
          </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>           
      <!----------------- ��ȸ ���� ----------------->
      <form name = "form1" method = "post">
        <input type="hidden" name="p_process" value="selectLocationStat">
        <input type="hidden" name="p_action" value ="/servlet/controller.course.CourseStateAdminServlet">
        <input type="hidden" name="param"    id ="param" value="<%=box.getString("param")%>">
        <input type="hidden" name="param1" 	id ="param1" value="<%=box.getString("param1")%>">
        <input type="hidden" name="param2" 	id ="param2" value="<%=box.getString("param2")%>">
        <input type="hidden" name="isExcel" id="isExcel" value="false">
      </form>
      
      <table class="table_out" cellspacing="1" cellpadding="5">		
        <tr>
          <td colspan="21" class="table_top_line"></td>
        </tr>
        <tr>
          
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>�з�</b></td>
          <td class="table_title"><b>�о�</b></td>
          <td class="table_title"><b>��ü</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>���</b></td>
          <td class="table_title"><b>�λ�</b></td>
          <td class="table_title"><b>��õ</b></td>
          <td class="table_title"><b>�뱸</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>���</b></td>
          <td class="table_title"><b>�泲</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>���</b></td>
          <td class="table_title"><b>�泲</b></td>
          <td class="table_title"><b>���</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>��Ÿ</b></td>
          
          
          
         </tr>
         
 <%  	
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");
 			DecimalFormat df = new DecimalFormat("###,##0.00");

        	for (i=0; i<list.size(); i++) {
        		
				DataBox dbox = (DataBox)list.get(i);
				
				v_grseqnm		= dbox.getString("d_grseqnm");
				v_areaname		= dbox.getString("d_areaname");
				v_cate			= dbox.getString("d_cate");
				
		        v_seoul_cnt		= dbox.getInt("d_seoul");
		        v_kyunggi_cnt	= dbox.getInt("d_kyunggi");
		        v_busan_cnt		= dbox.getInt("d_busan");
		        v_incheon_cnt	= dbox.getInt("d_incheon");
		        v_daegu_cnt		= dbox.getInt("d_daegu");
		        v_daejeon_cnt	= dbox.getInt("d_daejeon");
		        v_kwangju_cnt	= dbox.getInt("d_kwangju");
		        v_jeonbook_cnt	= dbox.getInt("d_jeonbook");
		        v_jeonnam_cnt	= dbox.getInt("d_jeonnam");
		        v_chungbook_cnt	= dbox.getInt("d_chungbook");
		        v_choongnam_cnt	= dbox.getInt("d_choongnam");
		        v_gangwon_cnt	= dbox.getInt("d_gangwon");
		        v_gyungbook_cnt	= dbox.getInt("d_gyungbook");
		        v_gyungnam_cnt	= dbox.getInt("d_gyungnam");
		        v_woolsan_cnt	= dbox.getInt("d_woolsan");
		        v_jejoo_cnt		= dbox.getInt("d_jejoo");
		        v_etc_cnt		= dbox.getInt("d_etc_cnt");
		        v_rank 			= dbox.getInt("d_rank"); 
		        v_rowspan		= dbox.getInt("d_rowspan"); 	
		        v_tot			= dbox.getInt("d_tot"); 	
		        
		        
		        v_total_seoul_cnt	+= v_seoul_cnt;
			    v_total_kyunggi_cnt	+= v_kyunggi_cnt;
			    v_total_busan_cnt	+= v_busan_cnt;
			    v_total_incheon_cnt	+= v_incheon_cnt;
			    v_total_daegu_cnt	+= v_daegu_cnt;
			    v_total_daejeon_cnt	+= v_daejeon_cnt;
			    v_total_kwangju_cnt	+= v_kwangju_cnt;
			    v_total_jeonbook_cnt	+= v_jeonbook_cnt;
			    v_total_jeonnam_cnt	+= v_jeonnam_cnt;
			    v_total_choongbook_cnt+= v_chungbook_cnt;
			    v_total_choongnam_cnt	+= v_choongnam_cnt;
			    v_total_gangwon_cnt	+= v_gangwon_cnt;
			    v_total_gyungbook_cnt	+= v_gyungbook_cnt;
			    v_total_gyungnam_cnt	+= v_gyungnam_cnt;
			    v_total_woolsan_cnt	+= v_woolsan_cnt;
			    v_total_jejoo_cnt	+= v_jejoo_cnt;
			    v_total_etc_cnt	+= v_etc_cnt;
			    v_total_tot	+= v_tot;
		        
			    if (v_rowspan != 0) {
			    	v_rowspantmp = v_rowspan;   // �Ұ� �� tr
			    }
		%>
		 <tr class="table_02_1">
		 
		  <% if (v_rank == 1) { %> 
		  <td class="table_02_1" rowspan="<%=v_rowspan+1%>"><%= v_grseqnm %></td> 
		  <td class="table_02_1" rowspan="<%=v_rowspan+1%>"><%= v_cate %></td> 
		  <% } %> 
		  
          <td class="table_02_1"><%= v_areaname %></td>
          
          <td class="table_02_1"><strong><%= v_tot %></strong></td>
          <td class="table_02_1"><%= v_seoul_cnt %></td>
          <td class="table_02_1"><%= v_kyunggi_cnt %></td>
          <td class="table_02_1"><%= v_busan_cnt %></td>
          <td class="table_02_1"><%= v_incheon_cnt %></td>
          <td class="table_02_1"><%= v_daegu_cnt %></td>
          <td class="table_02_1"><%= v_daejeon_cnt %></td>
          <td class="table_02_1"><%= v_kwangju_cnt %></td>
          <td class="table_02_1"><%= v_jeonbook_cnt %></td>
          <td class="table_02_1"><%= v_jeonnam_cnt %></td>
          <td class="table_02_1"><%= v_choongbook_cnt %></td>
          <td class="table_02_1"><%= v_choongnam_cnt %></td>
          <td class="table_02_1"><%= v_gangwon_cnt %></td>
          <td class="table_02_1"><%= v_gyungbook_cnt %></td>
          <td class="table_02_1"><%= v_gyungnam_cnt %></td>
          <td class="table_02_1"><%= v_woolsan_cnt %></td>
          <td class="table_02_1"><%= v_jejoo_cnt %></td>
          <td class="table_02_1"><%= v_etc_cnt %></td>
        </tr>
      <% if (v_rank == v_rowspantmp) { 
          %>
          	<tr class="table_02_3">
	          <td class="table_02_3">�Ұ�</td>
	          <td class="table_02_1"><strong><%= v_total_tot %></strong></td>
	          <td class="table_02_1"><%= v_total_seoul_cnt %></td>
	          <td class="table_02_1"><%= v_total_kyunggi_cnt %></td>
	          <td class="table_02_1"><%= v_total_busan_cnt %></td>
	          <td class="table_02_1"><%= v_total_incheon_cnt %></td>
	          <td class="table_02_1"><%= v_total_daegu_cnt %></td>
	          <td class="table_02_1"><%= v_total_daejeon_cnt %></td>
	          <td class="table_02_1"><%= v_total_kwangju_cnt %></td>
	          <td class="table_02_1"><%= v_total_jeonbook_cnt %></td>
	          <td class="table_02_1"><%= v_total_jeonnam_cnt %></td>
	          <td class="table_02_1"><%= v_total_choongbook_cnt %></td>
	          <td class="table_02_1"><%= v_total_choongnam_cnt %></td>
	          <td class="table_02_1"><%= v_total_gangwon_cnt %></td>
	          <td class="table_02_1"><%= v_total_gyungbook_cnt %></td>
	          <td class="table_02_1"><%= v_total_gyungnam_cnt %></td>
	          <td class="table_02_1"><%= v_total_woolsan_cnt %></td>
	          <td class="table_02_1"><%= v_total_jejoo_cnt %></td>
	          <td class="table_02_1"><%= v_total_etc_cnt %></td>
	        </tr>
          <% 
          
          	v_sum_seoul_cnt +=  v_total_seoul_cnt	;
		    v_sum_kyunggi_cnt	+= v_total_kyunggi_cnt;
		    v_sum_busan_cnt	+= v_total_busan_cnt;
		    v_sum_incheon_cnt	+= v_total_incheon_cnt;
		    v_sum_daegu_cnt	+= v_total_daegu_cnt;
		    v_sum_daejeon_cnt	+= v_total_daejeon_cnt;
		    v_sum_kwangju_cnt	+= v_total_kwangju_cnt;
		    v_sum_jeonbook_cnt	+= v_total_jeonbook_cnt;
		    v_sum_jeonnam_cnt	+= v_total_jeonnam_cnt;
		    v_sum_choongbook_cnt+= v_total_choongbook_cnt;
		    v_sum_choongnam_cnt	+= v_total_choongnam_cnt;
		    v_sum_gangwon_cnt	+= v_total_gangwon_cnt;
		    v_sum_gyungbook_cnt	+= v_total_gyungbook_cnt;
		    v_sum_gyungnam_cnt	+= v_total_gyungnam_cnt;
		    v_sum_woolsan_cnt	+= v_total_woolsan_cnt;
		    v_sum_jejoo_cnt	+= v_total_jejoo_cnt;
		    v_sum_etc_cnt	+= v_total_etc_cnt;
		    v_sum_tot	+= v_total_tot;
            
          } // �Ұ� %>
		<%
        	 }
        	if (i == 0) { 
		%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="15">��ϵ� ������ �����ϴ�.</td>
        </tr>
       
       <% } else { %>
       		<tr class="table_02_3">
       		<td class="table_02_3" colspan="2">�հ�</td>
	          <td class="table_02_3">-</td>
	         <td class="table_02_1"><strong><%= v_sum_tot %></strong></td>
	          <td class="table_02_1"><%= v_sum_seoul_cnt %></td>
	          <td class="table_02_1"><%= v_sum_kyunggi_cnt %></td>
	          <td class="table_02_1"><%= v_sum_busan_cnt %></td>
	          <td class="table_02_1"><%= v_sum_incheon_cnt %></td>
	          <td class="table_02_1"><%= v_sum_daegu_cnt %></td>
	          <td class="table_02_1"><%= v_sum_daejeon_cnt %></td>
	          <td class="table_02_1"><%= v_sum_kwangju_cnt %></td>
	          <td class="table_02_1"><%= v_sum_jeonbook_cnt %></td>
	          <td class="table_02_1"><%= v_sum_jeonnam_cnt %></td>
	          <td class="table_02_1"><%= v_sum_choongbook_cnt %></td>
	          <td class="table_02_1"><%= v_sum_choongnam_cnt %></td>
	          <td class="table_02_1"><%= v_sum_gangwon_cnt %></td>
	          <td class="table_02_1"><%= v_sum_gyungbook_cnt %></td>
	          <td class="table_02_1"><%= v_sum_gyungnam_cnt %></td>
	          <td class="table_02_1"><%= v_sum_woolsan_cnt %></td>
	          <td class="table_02_1"><%= v_sum_jejoo_cnt %></td>
	          <td class="table_02_1"><%= v_sum_etc_cnt %></td>
	        </tr>
        <% } %>
     
      </table>
      
    <!----------------- ����������ȸ �� ----------------->
   
<!----------------- íƮ ----------------->
<script type="text/javascript">
		//��Ʈ1
    var params = { wmode:"transparent" };
    var flashVars1 = 
    {
        path: "/js/assets/amcharts/flash/",
        chart_data: "����;<%=v_sum_seoul_cnt%>\n���;<%=v_sum_kyunggi_cnt%>\n�λ�;<%=v_sum_busan_cnt%>\n��õ;<%=v_sum_incheon_cnt%>\n�뱸;<%=v_sum_daegu_cnt%>\n����;<%=v_sum_daejeon_cnt%>\n����;<%=v_sum_kwangju_cnt%>\n����;<%=v_sum_jeonbook_cnt%>\n����;<%=v_sum_jeonnam_cnt%>\n���;<%=v_sum_choongbook_cnt%>\n�泲;<%=v_sum_choongnam_cnt%>\n����;<%=v_sum_gangwon_cnt%>\n���;<%=v_sum_gyungbook_cnt%>\n�泲;<%=v_sum_gyungnam_cnt%>\n���;<%=v_sum_woolsan_cnt%>\n����;<%=v_sum_jejoo_cnt%>\n��Ÿ;<%=v_sum_etc_cnt%>",
        chart_settings: "<settings><data_type>csv</data_type><text_size>13</text_size><legend><align>center</align><enabled>0</enabled></legend><pie><brightness_step>-15</brightness_step><base_color>#ffffff</base_color><inner_radius>30</inner_radius><height>7</height><angle>10</angle><gradient></gradient></pie><animation><start_time>1</start_time><pull_out_time>1</pull_out_time></animation><data_labels><show>{title}</show><max_width>100</max_width></data_labels></settings>"
    };
    $(function(){ swfobject.embedSWF("/js/assets/amcharts/flash/ampie.swf", "chartdiv", "400", "460", "8.0.0", "/js/assets/amcharts/flash/expressInstall.swf", flashVars1, params); });


  	//��Ʈ2
    var params = { wmode:"transparent" };
    var flashVars = 
    {
        path: "/js/assets/amcharts/flash/",       
        chart_data: "����;<%=v_sum_seoul_cnt%>\n���;<%=v_sum_kyunggi_cnt%>\n�λ�;<%=v_sum_busan_cnt%>\n��õ;<%=v_sum_incheon_cnt%>\n�뱸;<%=v_sum_daegu_cnt%>\n����;<%=v_sum_daejeon_cnt%>\n����;<%=v_sum_kwangju_cnt%>\n����;<%=v_sum_jeonbook_cnt%>\n����;<%=v_sum_jeonnam_cnt%>\n���;<%=v_sum_choongbook_cnt%>\n�泲;<%=v_sum_choongnam_cnt%>\n����;<%=v_sum_gangwon_cnt%>\n���;<%=v_sum_gyungbook_cnt%>\n�泲;<%=v_sum_gyungnam_cnt%>\n���;<%=v_sum_woolsan_cnt%>\n����;<%=v_sum_jejoo_cnt%>\n��Ÿ;<%=v_sum_etc_cnt%>",
        chart_settings: "<settings><text_size>13</text_size><data_type>csv</data_type><plot_area><margins><left>50</left><right>40</right><top>50</top><bottom>40</bottom></margins></plot_area><grid><category><dashed>1</dashed><dash_length>4</dash_length></category><value><dashed>1</dashed><dash_length>4</dash_length></value></grid><axes><category><width>1</width><color>888888</color></category><value><width>1</width><color>888888</color></value></axes><values><value><min>0</min></value></values><legend><enabled>0</enabled></legend><angle>0</angle><column><width>40</width><balloon_text>{title}: {value}</balloon_text><grow_time>3</grow_time><sequenced_grow>1</sequenced_grow></column><graphs><graph gid='0'><title>�л���</title><color>#df3d1d,#dfaf1d</color></graph></graphs><labels><label lid='0'><text><![CDATA[]]></text><y>18</y><text_color>000000</text_color><align>center</align></label></labels></settings>"
    };
    $(function(){ swfobject.embedSWF("/js/assets/amcharts/flash/amcolumn.swf", "chartdiv1", "400", "460", "8.0.0", "/js/assets/amcharts/flash/expressInstall.swf", flashVars, params); });
</script>
<style>
div.chartbox { width:968px; height:540px; position:relative; border:1px solid #77a3eb; }
div.chartbox table.chartset { width:1000px; padding:0; position:absolute; top:0px; left:-16px; }
div.chartbox table.chartset td { padding:0; margin:0; text-align:center; }
div.chartbox table.chartset td p { width:100px; height:29px; margin:0 auto; font-family:"malgun gothic","gulim","sans-serif"; font-size:14px; font-weight:bold; background-image:url("/js/assets/amcharts/images/bg_chart_title.png"); background-repeat:no-repeat; background-color:#ffffff; text-align:center; line-height:26px; }
</style>
<div class="chartbox">
	<table class="chartset" cellpadding="0" cellspacing="0">
		<tr>
			<td><div id="chartdiv"></div><br><br><p>������ �����</p></td>
			<td><div id="chartdiv1"></div><br><br><p>������</p></td>
		</tr>
	</table>
</div>   
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>