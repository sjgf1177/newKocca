<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: ���ǰ��ǽ�> �н�����â
//  2. ���α׷��� : gu_JindanUserPaper_I.jsp
//  3. ��      ��: �н�����â
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.27
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.jindan.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	String v_upperclass = (String)request.getAttribute("p_upperclass"); 
	String v_middleclass = (String)request.getAttribute("p_middleclass"); 
	String v_lowerclass = (String)request.getAttribute("p_lowerclass");  
	String v_classname = (String)request.getAttribute("p_classname"); 
	String v_jindancnt = (String)request.getAttribute("p_jindancnt");	//����� �������� ������

	int v_jindanpoint = 100 / Integer.parseInt(v_jindancnt);

		String v_subj = "";
	    String v_userid = box.getSession("userid");
	    String v_urldir = "/dp/exam/";

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�н������ϱ�</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<link rel="stylesheet" type="text/css" href="/css/user_style1.css"/>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function init() {
    this.moveTo(0,0);
    this.resizeTo(screen.availWidth,screen.availHeight);
}

function onload() {
	window.self.close();
}

function whenSubmit(){
	var exam ="";
	var a_name ="";
	var examnum = "";
	var i=0;
	var b_name="";
	var c_name="";
	var c_value="";
	var b_type=""; 
	var result="";
	var temp=""; 
	var textarr ="";
	var answercnt=0;
	var replycnt =0;
	
	var v_current = new Date();
	var v_ended = "";
	var v_temp = "";

	for(i=0;i<document.form3.length;i++) {
		//alert(document.form3.p_jindan.length);
		c_name  = document.form3.elements[i].name;
		c_value = document.form3.elements[i].value;
		if (i == 0) {
			b_name=c_name;
			c_name = document.form3.elements[i].name + ",";
			examnum += c_name;
		} else {
		  	if (c_name != b_name) {
			answercnt++;
	//		alert("temp" + temp.length);
			if (b_type=="text" && temp.length > 1) {
				replycnt++;//alert("replycnt1" + replycnt);
			}
			else if(b_type!="text" && temp.length > 0) {
				replycnt++;//alert("replycnt1" + replycnt);
			}
			if (answercnt==1) {
				result = temp;
			} else {
				result = result + ","+ temp;
			}
			b_name = c_name;
			temp = "";
			c_name = document.form3.elements[i].name + ",";
	    	examnum += c_name;
		}

	}
	//	alert(result);
		
	if (document.form3.elements[i].type=="radio") {
		b_type="radio";
		if (document.form3.elements[i].checked==true) {
			temp = c_value;
		}
	} else if (document.form3.elements[i].type=="text"||document.form3.elements[i].type=="textarea") {
		b_type="text";
		temp  = "";
		textarr = c_value.split(",");
		for(var j=0; j<textarr.length; j++) {
			temp = temp + textarr[j];
		}
			temp = temp + " ";
		}
	} 
//  alert("temp" + temp.length);
	if (b_type=="text" && temp.length > 1) {
		replycnt++;//alert("replycnt1" + replycnt);
	}
	else if(b_type!="text" && temp.length > 0) {
		replycnt++;//alert("replycnt1" + replycnt);
	}
	answercnt++;
	if (answercnt==1) {
		result = temp;    
	} else {
		result = result + ","+ temp + ",";
	}  
  
	if (replycnt < answercnt) {
		alert("�������� ���� ������ �ֽ��ϴ�.��� ������ �������ֽñ� �ٶ��ϴ�.");
		return;
	}
	document.form2.p_answer.value = result;
	document.form2.p_ended.value = v_ended;
	document.form2.p_process.value = 'JindanUserResultInsert';
	document.form2.p_jindan.value = examnum;
	document.form2.submit();
}
-->
</script>
</head>
<body id="popup">
	<form name="form2" method="post" action="/servlet/controller.jindan.JindanUserServlet">
		<input type="hidden" name="p_subj" />
		<input type="hidden" name="p_upperclass"   value="<%=v_upperclass%>"/>
		<input type="hidden" name="p_middleclass"  value="<%=v_middleclass%>"/>
		<input type="hidden" name="p_lowerclass"   value="<%=v_lowerclass%>"/>
		<input type="hidden" name="p_classname"    value="<%=v_classname%>"/>
		<input type="hidden" name="p_userid"       value="<%=v_userid%>"/>
		<input type="hidden" name="p_jindan"       value=""/>
		<input type="hidden" name="p_started"      value="<%//=v_started%>"/>
		<input type="hidden" name="p_jindancnt"    value="<%=v_jindancnt%>"/>
		<input type="hidden" name="p_jindanpoint"  value="<%=v_jindanpoint%>"/>
		<input type="hidden" name="p_ended"        value=""/>
		<input type="hidden" name="p_answer"       value=""/>
		<input type="hidden" name="p_process"      value=""/>
		<input type="hidden" name="p_isopenanswer" value="<%//=v_isopenanswer%>"/>
	</form>
    <form name="form3" method="post" action="/servlet/controller.exam.JindanUserServlet">

	<div id="pop_header">
		<h1><img src="/images/portal/myclass/pop_h1_tit6.gif" alt="�н������ϱ�" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap" class="message_top">
			
			<h3 class="pop_tit_txt"><%= v_classname %> �н�����</h3>
<%
	ArrayList    blist = (ArrayList)request.getAttribute("PaperQuestionJindanList");

	if(blist.size() != 0 ){			//������ �ִٸ�

		for (int i=0; i < blist.size(); i++) {
			ArrayList list = (ArrayList)blist.get(i);  
			//System.out.println("list ������:"+list.size());
			DataBox dbox = (DataBox)list.get(0);  
			v_subj += dbox.getString("d_subj")+",";
%>
			<table class="write">
			<tbody>
			<tr>
				<th class="end ta_l"><strong><%=String.valueOf(i+1)+". " + dbox.getString("d_jindantext")%></strong></th>
			</tr>

<%      
        if (!dbox.getString("d_saveimage").equals("")) { %> 
			<tr>
	            <td class="img_table" height="26"><img src='<%=v_urldir+dbox.getString("d_saveimage")%>'></td>
	        </tr>
<%      }  %>  

<%      if (!dbox.getString("d_saveaudio").equals("")) { %>
			<tr> 
                <td class="board_text4"><img src="/images/user/study/voice_icon1.gif" width="20" height="17" border="0"><a href="<%=v_urldir+dbox.getString("d_saveaudio")%>"><%=dbox.getString("d_realaudio")%></a></td>
            </tr>
<%      }  %>  

<%      if (!dbox.getString("d_savemovie").equals("")) { %>
			<tr> 
                <td class="board_text3"><img src="/images/user/study/meida_icon1.gif" width="20" height="17" border="0"><a href="<%=v_urldir+dbox.getString("d_savemovie")%>"><%=dbox.getString("d_realmovie")%></a></td>
            </tr>
<%      }  %>        

			<tr>
				<td class="examine">
<%      if (dbox.getString("d_jindantype").equals(JindanBean.OBJECT_QUESTION)) {   // ���ϼ��� 
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { 
%>
					<dl class="<%= (j==0) ? "examine_list first" : "examine_list" %>">
						<dt><input name="<%=dbox.getString("d_subj")%>_<%=dbox.getInt("d_jindannum")%>" type="radio" value="<%=dbox.getInt("d_selnum")%>" /></dt>
						<dd><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></dd>				
					</dl>
<%              } 
            }

        } else if (dbox.getString("d_jindantype").equals(JindanBean.OX_QUESTION)) {   // ox���� 
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { 
%>
					<dl class="<%= (j==0) ? "examine_list first" : "examine_list" %>">
						<dt><input name="<%=dbox.getString("d_subj")%>_<%=dbox.getInt("d_jindannum")%>" type="radio" value="<%=dbox.getInt("d_selnum")%>" /></dt>
						<dd><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></dd>				
					</dl>
<%              } 
            }            
        } else if (dbox.getString("d_jindantype").equals(JindanBean.SUBJECT_QUESTION)) {  // �ְ���  
%>
					<dl class="examine_list first">
						<dt></dt>
						<dd><textarea name="<%=dbox.getString("d_subj")%>_<%=dbox.getInt("d_jindannum")%>" cols="90" rows="5" class="input"></textarea></dd>				
					</dl>
<%             
            
        } else if (dbox.getString("d_jindantype").equals(JindanBean.MULTI_QUESTION)) {  // �ٴ��
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { 
%>
					<dl class="<%= (j==0) ? "examine_list first" : "examine_list" %>">
						<dt><input name="<%=dbox.getString("d_subj")%>_<%=dbox.getInt("d_jindannum")%>" type="checkbox" value="<%=dbox.getInt("d_selnum")%>" /></dt>
						<dd><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></dd>				
					</dl>
<%            	}
			}
		}
%>
				</td>
			</tr>
			<tr>
				<td hgight="20">&nbsp;</td>
			</tr>
			</tbody>
			</table>
<%
	}
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	//������ ������ �޸��α����ؼ� ����
	document.form2.p_subj.value = "<%=v_subj%>";
//-->
</SCRIPT>
<%
	} else {			//������ ���ٸ�
%>	
			<table class="write">
			<tbody>
			<tr>
				<th class="end ta_l"><strong>��ϵ� ���ܹ����� �����ϴ�.</strong></th>
			</tr>
			</tbody>
			</table>
<%
	}	
%>
		</div>
	</div>
	</form>
	<div id="pop_footer">
		<p class="f_btn"><% if(blist.size() != 0 ){ %><a href="javascript:whenSubmit()" class="btn_gr"><span>����</span></a><% } %><a href="javascript:self.close()" class="btn_gr"><span>���</span></a></p>
	</div>
</body>
</html>
