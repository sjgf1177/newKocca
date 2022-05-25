<%
//**********************************************************
//  1. ��      ��: ���� ��� - ��ü ��Ȳ
//  2. ���α׷��� : za_TotalStat_L.jsp
//  3. ��      ��: ����� ��� - ��ü
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.07
//  7. ��      ��:
//***********************************************************
%>
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
	
    String v_year = "";
    String v_chartdate = "";
    
    int v_tot = 0;
    int v_man_cnt	= 0;
    int	v_woman_cnt		= 0;
    int v_johndoe_cnt	= 0;
    
    int v_total_man_cnt = 0, v_sum_man_cnt	= 0;
    int v_total_woman_cnt = 0, v_sum_woman_cnt	= 0;
    int v_total_johndoe_cnt = 0, v_sum_johndoe_cnt	= 0;
    int v_total_tot = 0, v_sum_tot	= 0;
    
%>
<script language="JavaScript">
<!--
function whenExcel() {
	document.form1.target = 'mainFrame';
    document.form1.submit();
}
//-->
</script>
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left" height="20">&nbsp;<b>ȸ�� ���� ����</b></td>
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
      <form name = "form1" method = "post" action="/servlet/controller.statistics.UserCountServlet">
        <input type="hidden" name="p_process" id="p_process" value="selectYearStat">
        <input type="hidden" name="param"    id ="param" value="<%=box.getString("param")%>">
        <input type="hidden" name="param1" 	id ="param1" value="<%=box.getString("param1")%>">
        <input type="hidden" name="param2" 	id ="param2" value="<%=box.getString("param2")%>">
        <input type="hidden" name="isExcel" id="isExcel" value="true">
      </form>
      
      <table class="table_out" cellspacing="1" cellpadding="5">		
        <tr>
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr>
          
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>��ü</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>��Ȯ��</b></td>
         </tr>
 		<%  	
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");
        	for (i=0; i<list.size(); i++) {
        		
				DataBox dbox = (DataBox)list.get(i);

				v_year			= dbox.getString("d_indate");
				v_tot			= dbox.getInt("d_usercnt");
		        v_man_cnt		= dbox.getInt("d_man");
		        v_woman_cnt		= dbox.getInt("d_woman");
		        v_johndoe_cnt	= dbox.getInt("d_johndoe");
		       
		        v_total_man_cnt		+= v_man_cnt;
			    v_total_woman_cnt	+= v_woman_cnt;
			    v_total_johndoe_cnt	+= v_johndoe_cnt;
			    v_total_tot 		+= v_tot;
			    
			    if (i!=0) v_chartdate += "\\n";
			    v_chartdate += v_year+";"+v_tot+";"+v_man_cnt+";"+v_woman_cnt;
			    
			    
		%>
		 <tr class="table_02_1">
          <td class="table_02_1"><%= v_year %></td>
          <td class="table_02_1"><%= v_tot %></td>
          <td class="table_02_1"><%= v_man_cnt %></td>
          <td class="table_02_1"><%= v_woman_cnt %></td>
          <td class="table_02_1"><%= v_johndoe_cnt %></td>
        </tr>
        
     	<%}
        if (i == 0) { %>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="15">��ϵ� ������ �����ϴ�.</td>
        </tr>
       
       <% } else { %>
       		<tr class="table_02_3">
       		<td class="table_02_3">�հ�</td>
	          <td class="table_02_3"><%= v_total_tot %></td>
	          <td class="table_02_3"><%= v_total_man_cnt %></td>
	          <td class="table_02_3"><%= v_total_woman_cnt %></td>
	          <td class="table_02_3"><%= v_total_johndoe_cnt %></td>
	        </tr>
        <% } %>
     
      </table>
      <br/>
<!----------------- ����������ȸ �� ----------------->
 
<!----------------- íƮ ----------------->
<script type="text/javascript">
		//��Ʈ1 chart_data: "����;51041\n����;36913",
    var params = { wmode:"transparent" };
    var flashVars1 = 
    {
        path: "/js/assets/amcharts/flash/",
        chart_data: "����;<%=v_total_man_cnt%>\n����;<%=v_total_woman_cnt%>",
        chart_settings: "<settings><data_type>csv</data_type><text_size>13</text_size><legend><align>center</align><enabled>1</enabled></legend><pie><brightness_step>-15</brightness_step><base_color>#ffffff</base_color><inner_radius>30</inner_radius><height>7</height><angle>10</angle><gradient></gradient></pie><animation><start_time>1</start_time><pull_out_time>1</pull_out_time></animation><data_labels><show>{title}</show><max_width>100</max_width></data_labels></settings>"
    };
    $(function(){ swfobject.embedSWF("/js/assets/amcharts/flash/ampie.swf", "chartdiv", "400", "350", "8.0.0", "/js/assets/amcharts/flash/expressInstall.swf", flashVars1, params); });


  	//��Ʈ2 chart_data: "����;<%=v_total_man_cnt%>\n����;<%=v_total_woman_cnt%>",
    var params = { wmode:"transparent" };
    var flashVars = 
    {
        path: "/js/assets/amcharts/flash/",       
        chart_data: "����;<%=v_total_man_cnt%>\n����;<%=v_total_woman_cnt%>",
        chart_settings: "<settings><text_size>13</text_size><data_type>csv</data_type><plot_area><margins><left>60</left><right>40</right><top>50</top><bottom>40</bottom></margins></plot_area><grid><category><dashed>1</dashed><dash_length>4</dash_length></category><value><dashed>1</dashed><dash_length>4</dash_length></value></grid><axes><category><width>1</width><color>888888</color></category><value><width>1</width><color>888888</color></value></axes><values><value><min>0</min></value></values><legend><enabled>0</enabled></legend><angle>0</angle><column><width>40</width><balloon_text>{title}: {value}</balloon_text><grow_time>3</grow_time><sequenced_grow>1</sequenced_grow></column><graphs><graph gid='0'><title>ȸ��</title><color>#df3d1d,#dfaf1d</color></graph></graphs><labels><label lid='0'><text><![CDATA[]]></text><y>18</y><text_color>000000</text_color><align>center</align></label></labels></settings>"
    };
    $(function(){ swfobject.embedSWF("/js/assets/amcharts/flash/amcolumn.swf", "chartdiv1", "400", "350", "8.0.0", "/js/assets/amcharts/flash/expressInstall.swf", flashVars, params); });
    
  //��Ʈ3chart_data: "<%=v_chartdate %>",         chart_data: "2010;29782;15370;11595\n2011;46586;15724;10481\n2012;37092;19947;14837",

    var params = { wmode:"transparent" };
    var flashVars = 
    {
        path: "/js/assets/amcharts/flash/",       
        chart_data: "<%=v_chartdate %>",
        chart_settings: "<settings><hide_bullets_count>18</hide_bullets_count><data_type>csv</data_type><plot_area><margins><left>50</left><right>40</right><top>55</top><bottom>30</bottom></margins></plot_area><grid><x><alpha>10</alpha><approx_count>8</approx_count></x><y_left><alpha>10</alpha></y_left></grid><axes><x><width>1</width><color>0D8ECF</color></x><y_left><width>1</width><color>0D8ECF</color></y_left></axes><indicator><color>0D8ECF</color><x_balloon_text_color>FFFFFF</x_balloon_text_color><line_alpha>50</line_alpha><selection_color>0D8ECF</selection_color><selection_alpha>20</selection_alpha></indicator><zoom_out_button><text_color_hover>FF0F00</text_color_hover></zoom_out_button><help><button><color>FCD202</color><text_color>000000</text_color><text_color_hover>FF0F00</text_color_hover></button><balloon><color>FCD202</color><text_color>000000</text_color></balloon></help><graphs><graph gid='0'><title>��ü</title><color>0D8ECF</color><color_hover>FF0F00</color_hover><selected>0</selected></graph><graph gid='1'><title>����</title><color>B0DE09</color><color_hover>FF0F00</color_hover><line_width>2</line_width><fill_alpha>30</fill_alpha><bullet>round</bullet></graph><graph gid='2'><title>����</title><color>B0DE09</color><color_hover>FF0F00</color_hover><line_width>2</line_width><fill_alpha>30</fill_alpha><bullet>round</bullet></graph></graphs><labels><label lid='0'><text><![CDATA[<b>����������</b>]]></text><y>15</y><text_size>13</text_size><align>center</align></label></labels></settings>"
    };
    $(function(){ swfobject.embedSWF("/js/assets/amcharts/flash/amline.swf", "chartdiv2", "400", "350", "8.0.0", "/js/assets/amcharts/flash/expressInstall.swf", flashVars, params); });

    
</script>
<style>
div.chartbox { width:968px; height:400px; position:relative; border:1px solid #77a3eb; }
div.chartbox table.chartset { width:1000px; padding:0; position:absolute; top:0px; left:-16px; }
div.chartbox table.chartset td { padding:0; margin:0; text-align:center; }
div.chartbox table.chartset td p { width:100px; height:29px; margin:0 auto; font-family:"malgun gothic","gulim","sans-serif"; font-size:14px; font-weight:bold; background-image:url("/js/assets/amcharts/images/bg_chart_title.png"); background-repeat:no-repeat; background-color:#ffffff; text-align:center; line-height:26px; }
</style>
<div class="chartbox">
	<table class="chartset" cellpadding="0" cellspacing="0">
		<tr>
			<td><div id="chartdiv"></div><p>���� �����</p></td>
			<% if (i==1) { %>
			<td><div id="chartdiv1"></div><p>����</p></td>
			<% } else { %>
			<td><div id="chartdiv2"></div><p>������</p></td>
			<% } %>
		</tr>
		
	</table>
	
	
	
</div>    
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>