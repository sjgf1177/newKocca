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
    String v_month = "";
    
    int v_1st	= 0;
    int v_2nd	= 0;
    int v_3rd	= 0;
    int v_4th	= 0;
    int v_5th	= 0;
    int v_6th	= 0;
    int v_7th	= 0;
    int v_8th	= 0;
    int v_9th	= 0;
    int v_10th	= 0;
    int v_11th= 0;
    int v_12th= 0;
    
    int v_tot = 0;
    
    int v_total_1st = 0;
    int v_total_2nd = 0;
    int v_total_3rd = 0;
    int v_total_4th = 0;
    int v_total_5th = 0;
    int v_total_6th = 0;
    int v_total_7th = 0;
    int v_total_8th = 0;
    int v_total_9th = 0;
    int v_total_10th = 0;
    int v_total_11th = 0;
    int v_total_12th = 0;
    
    
    int v_total_tot = 0, v_sum_tot	= 0;
    
  
    
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
          <td align="left" height="20">&nbsp;<b>�ð��� ���</b></td>
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
        <input type="hidden" name="p_process" id="p_process" value="selectHourStat">
        <input type="hidden" name="param"    id ="param" value="<%=box.getString("param")%>">
        <input type="hidden" name="param1" 	id ="param1" value="<%=box.getString("param1")%>">
        <input type="hidden" name="param2" 	id ="param2" value="<%=box.getString("param2")%>">
        <input type="hidden" name="isExcel" id="isExcel" value="true">
      </form>
      
      <table class="table_out" cellspacing="1" cellpadding="5">		
        <tr>
          <td colspan="15" class="table_top_line"></td>
        </tr>
        <tr>
          
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>��</b></td>
          <td class="table_title"><b>��ü</b></td>
          <td class="table_title"><b>0~2</b></td>
          <td class="table_title"><b>2��~4��</b></td>
          <td class="table_title"><b>4��~6��</b></td>
          <td class="table_title"><b>6��~8��</b></td>
          <td class="table_title"><b>8��~10��</b></td>
          <td class="table_title"><b>10��~12��</b></td>
          <td class="table_title"><b>12��~14��</b></td>
          <td class="table_title"><b>14��~16��</b></td>
          <td class="table_title"><b>16��~18��</b></td>
          <td class="table_title"><b>18��~20��</b></td>
          <td class="table_title"><b>20��~22��</b></td>
          <td class="table_title"><b>22��~24��</b></td>
         
         </tr>
         
 <%  	
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");

        	for (i=0; i<list.size(); i++) {
        		
				DataBox dbox = (DataBox)list.get(i);

				v_year			= dbox.getString("d_date_year");
				v_month			= dbox.getString("d_date_month");
				v_tot			= dbox.getInt("d_tot");
				v_1st			= dbox.getInt("d_first");
				v_2nd			= dbox.getInt("d_second");
				v_3rd			= dbox.getInt("d_third");
				v_4th			= dbox.getInt("d_fourth");
				v_5th			= dbox.getInt("d_fifth");
				v_6th			= dbox.getInt("d_sixth");
				v_7th			= dbox.getInt("d_seventh");
				v_8th			= dbox.getInt("d_eightth");
				v_9th			= dbox.getInt("d_nineth");
				v_10th			= dbox.getInt("d_tenth");
				v_11th			= dbox.getInt("d_eleventh");
				v_12th			= dbox.getInt("d_twelveth");
		       
		       
				v_total_tot			+= v_tot;
				v_total_1st			+= v_1st;
				v_total_2nd			+= v_2nd;
				v_total_3rd			+= v_3rd;
				v_total_4th			+= v_4th;
				v_total_5th			+= v_5th;
				v_total_6th			+= v_6th;
				v_total_7th			+= v_7th;
				v_total_8th			+= v_8th;
				v_total_9th			+= v_9th;
				v_total_10th		+= v_10th;
				v_total_11th		+= v_11th;
				v_total_12th		+= v_12th;
		       
		%>
		 <tr class="table_02_1">
		 
          <td class="table_02_1"><%= v_year %></td>
          <td class="table_02_1"><%= v_month %></td>
          <td class="table_02_1"><%= v_tot %></td>
          <td class="table_02_1"><%= v_1st %></td>
          <td class="table_02_1"><%= v_2nd %></td>
          <td class="table_02_1"><%= v_3rd %></td>
          <td class="table_02_1"><%= v_4th %></td>
          <td class="table_02_1"><%= v_5th %></td>
          <td class="table_02_1"><%= v_6th %></td>
          <td class="table_02_1"><%= v_7th %></td>
          <td class="table_02_1"><%= v_8th %></td>
          <td class="table_02_1"><%= v_9th %></td>
          <td class="table_02_1"><%= v_10th %></td>
          <td class="table_02_1"><%= v_11th %></td>
          <td class="table_02_1"><%= v_12th %></td>
        </tr>
        
     	<%}
        if (i == 0) { %>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="15">��ϵ� ������ �����ϴ�.</td>
        </tr>
       
       <% } else { %>
       		<tr class="table_02_3">
       		<td class="table_02_3" colspan="2">�հ�</td>
	          <td class="table_02_3"><%= v_total_tot %></td>
	         <td class="table_02_1"><%= v_total_1st %></td>
	          <td class="table_02_1"><%= v_total_2nd %></td>
	          <td class="table_02_1"><%= v_total_3rd %></td>
	          <td class="table_02_1"><%= v_total_4th %></td>
	          <td class="table_02_1"><%= v_total_5th %></td>
	          <td class="table_02_1"><%= v_total_6th %></td>
	          <td class="table_02_1"><%= v_total_7th %></td>
	          <td class="table_02_1"><%= v_total_8th %></td>
	          <td class="table_02_1"><%= v_total_9th %></td>
	          <td class="table_02_1"><%= v_total_10th %></td>
	          <td class="table_02_1"><%= v_total_11th %></td>
	          <td class="table_02_1"><%= v_total_12th %></td>
	        </tr>
        <% } %>
     
      </table>
      <br/>
    <!----------------- ����������ȸ �� ----------------->
   
<!----------------- íƮ ----------------->
<script type="text/javascript">
		//��Ʈ1
    var params = { wmode:"transparent" };
    var flashVars1 = 
    {
        path: "/js/assets/amcharts/flash/",
        chart_data: "2��;<%=v_total_1st%>\n4��;<%=v_total_2nd%>\n6��;<%=v_total_3rd%>\n8��;<%=v_total_4th%>\n10��;<%=v_total_5th%>\n12��;<%=v_total_6th%>\n14��;<%=v_total_7th%>\n16��;<%=v_total_8th%>\n18��;<%=v_total_9th%>\n20��;<%=v_total_10th%>\n22��;<%=v_total_11th%>\n24��;<%=v_total_12th%>",
        chart_settings: "<settings><data_type>csv</data_type><text_size>13</text_size><legend><align>center</align><enabled>0</enabled></legend><pie><x>200%</x><y>350%</y><brightness_step>-15</brightness_step><base_color>#ffffff</base_color><inner_radius>30</inner_radius><height>7</height><angle>10</angle><gradient></gradient></pie><animation><start_time>1</start_time><pull_out_time>1</pull_out_time></animation><data_labels><show>{title}</show><max_width>100</max_width></data_labels></settings>"
    };
    $(function(){ swfobject.embedSWF("/js/assets/amcharts/flash/ampie.swf", "chartdiv", "400", "460", "8.0.0", "/js/assets/amcharts/flash/expressInstall.swf", flashVars1, params); });


  	//��Ʈ2
    var params = { wmode:"transparent" };
    var flashVars = 
    {
        path: "/js/assets/amcharts/flash/",       
        chart_data: "2��;<%=v_total_1st%>\n4��;<%=v_total_2nd%>\n6��;<%=v_total_3rd%>\n8��;<%=v_total_4th%>\n10��;<%=v_total_5th%>\n12��;<%=v_total_6th%>\n14��;<%=v_total_7th%>\n16��;<%=v_total_8th%>\n18��;<%=v_total_9th%>\n20��;<%=v_total_10th%>\n22��;<%=v_total_11th%>\n24��;<%=v_total_12th%>",
        chart_settings: "<settings><hide_bullets_count>18</hide_bullets_count><data_type>csv</data_type><plot_area><margins><left>50</left><right>40</right><top>55</top><bottom>30</bottom></margins></plot_area><grid><x><alpha>10</alpha><approx_count>8</approx_count></x><y_left><alpha>10</alpha></y_left></grid><axes><x><width>1</width><color>0D8ECF</color></x><y_left><width>1</width><color>0D8ECF</color></y_left></axes><indicator><color>0D8ECF</color><x_balloon_text_color>FFFFFF</x_balloon_text_color><line_alpha>50</line_alpha><selection_color>0D8ECF</selection_color><selection_alpha>20</selection_alpha></indicator><zoom_out_button><text_color_hover>FF0F00</text_color_hover></zoom_out_button><help><button><color>FCD202</color><text_color>000000</text_color><text_color_hover>FF0F00</text_color_hover></button><balloon><color>FCD202</color><text_color>000000</text_color></balloon></help><graphs><graph gid='0'></graph><graph gid='1'><title>Smoothed</title><color>B0DE09</color><color_hover>FF0F00</color_hover><line_width>2</line_width><fill_alpha>30</fill_alpha><bullet>round</bullet></graph></graphs><labels><label lid='0'><text><![CDATA[<b>�ð������ӰǼ�</b>]]></text><y>15</y><text_size>13</text_size><align>center</align></label></labels></settings>"
    };
    $(function(){ swfobject.embedSWF("/js/assets/amcharts/flash/amline.swf", "chartdiv1", "800", "400", "8.0.0", "/js/assets/amcharts/flash/expressInstall.swf", flashVars, params); });
</script>
<style>
div.chartbox { width:968px; height:430px; position:relative; border:1px solid #77a3eb; }
div.chartbox table.chartset { width:1000px; padding:0; position:absolute; top:0px; left:-16px; }
div.chartbox table.chartset td { padding:0; margin:0; text-align:center; }
div.chartbox table.chartset td p { width:100px; height:29px; margin:0 auto; font-family:"malgun gothic","gulim","sans-serif"; font-size:14px; font-weight:bold; background-image:url("/js/assets/amcharts/images/bg_chart_title.png"); background-repeat:no-repeat; background-color:#ffffff; text-align:center; line-height:26px; }
</style>
<div class="chartbox">
	<table class="chartset" cellpadding="0" cellspacing="0">
		<tr>
			<!-- <td><div id="chartdiv"></div><br><br><p>������ �����</p></td> -->
			<td><div id="chartdiv1"></div></td>
		</tr>
	</table>
</div>   
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>