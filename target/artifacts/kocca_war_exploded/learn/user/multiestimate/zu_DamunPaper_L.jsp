<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.multiestimate.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    DataBox dbox0 = (DataBox)request.getAttribute("DamunPaperData");
			
			String v_grcode     = dbox0.getString("d_grcode"); 
	        String v_subj     = dbox0.getString("d_subj"); 
	        String v_subjseq     =box.getString("p_subjseq");
            String v_gyear     = dbox0.getString("d_year"); 
            int v_damunpapernum = dbox0.getInt("d_damunpapernum"); 
            String v_damunpapernm = dbox0.getString("d_damunpapernm"); 
            String v_damunnums = dbox0.getString("d_damunnums"); 

			String v_subjuserid = box.getString("p_subjuserid");
			String v_obuserid = box.getString("p_obuserid");
            String v_name = box.getString("p_name");
            String v_relation = box.getString("p_relation");
			String v_mailgubun = box.getString("p_mailgubun");
            int v_isobserver = box.getInt("p_isobserver"); 

			String v_relationnm = "";
			if (v_relation.equals("1")) {
				v_relationnm = "����";
			} else if (v_relation.equals("2")) {
				v_relationnm = "����";
			} else if (v_relation.equals("3")) {
				v_relationnm = "����";
			} else if (v_relation.equals("4")) {
				v_relationnm = "���";
			} 

			String v_content1 = "";
			if (v_mailgubun.equals("1")) {
				v_content1 = "�̼���";
			} else if (v_mailgubun.equals("2")) {
				v_content1 = "�̼��ϱ� ��";
			} else if (v_mailgubun.equals("3")) {
				v_content1 = "�̼��� ����";
			} 
			String v_content2 = "";
			if (v_relation.equals("1")) {
				v_content2 = "����";
			} else  {
				v_content2 = "��������";
			} 

	ArrayList mlist = (ArrayList)request.getAttribute("DamunMemberData");
         DataBox mdbox = (DataBox)mlist.get(0);

%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="/css/style_myhome.css" type="text/css">
<script src="/script/cafe_select.js" language="JavaScript"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
function whenSubmit1(){
  document.form2.submit();
}
function whenSubmit(){
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
  
  for(i=0;i<document.form3.length;i++) {
    c_name  = document.form3.elements[i].name;
    c_value = document.form3.elements[i].value;
    if (i == 0) {
      b_name=c_name;
    } else {
      if (eval(b_name.indexOf("|")) > 0) {
        answercnt++;
        if (b_type=="text" || temp !="") {
          replycnt++;
        }
        if (answercnt==1) {
          result = temp;
        } else {
          result = result + temp  ;
        }
        b_name = c_name;
        temp = "";	  
	  } else if (c_name != b_name ) {
        answercnt++;
        if (b_type=="text" || temp !="") {
          replycnt++;
        }
        if (answercnt==1) {
          result = temp;
        } else {
          result = result + ","+ temp;
        }
        b_name = c_name;
        temp = "";
      }
    }
    if (document.form3.elements[i].type=="checkbox") {
      b_type="checkbox";
      if (document.form3.elements[i].checked==true) {
        temp = temp+c_value+':';
      }
    } else if (document.form3.elements[i].type=="radio") {
      b_type="radio";
      if (document.form3.elements[i].checked==true) {
        temp = c_value;
      }
    } else if (document.form3.elements[i].type=="text"||document.form3.elements[i].type=="textarea") {
            b_type="text";
            temp  = "";
            textarr = c_value.split(",");
		 if (eval(c_name.indexOf("|"))>0){
            for(var j=0; j<textarr.length; j++) {
               temp =  temp + textarr[j];
            }
			if(temp.length>0){
			temp = ":" + temp + ":";
			}
		 } else {
             for(var j=0; j<textarr.length; j++) {
                 temp = temp + textarr[j];
             }
         }
	}
  }
  if (b_type=="text" || temp !="") {
    replycnt++;
  }
  answercnt++;
  if (answercnt==1) {
    result = temp;    
  } else if (eval(b_name.indexOf("|"))>0) {
    result = result + temp  ;  
  }else {
    result = result + ","+ temp;
  }

//alert(result);

  if (replycnt < answercnt) {
    alert("�������� ���� ������ �ֽ��ϴ�.��� ������ �������ֽñ� �ٶ��ϴ�.");
    return;
  }
  document.form2.p_answers.value = result;
  document.form2.submit();
}
//-->
</script>
</HEAD>

<BODY topmargin="0" leftmargin="0">
<TABLE cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">

	<tr class="tableheight1" valign="top">
		<td background="/images/common/bg_myhome.gif">
			<TABLE cellpadding="0" cellspacing="0" border="0" width="950">
				<tr class="tableheight2">
					<td>
						<!-- TOP ���� -->
						<%@include file="/incmenu/top.jsp"%>
						<!-- TOP �� -->
					</td>
				</tr>
				<tr class="tableheight3">
					<td style="BORDER-LEFT:#FFFFFF 10px solid">
						<!-- ���� �÷��� ���� -->
						<%@include file="/incmenu/myhome.jsp"%>
						<!-- ���� �÷��� �� -->
					</td>
				</tr>
				<tr class="tableheight4">
					<td style="BORDER-LEFT:#FFFFFF 10px solid">
						<!-- �޴��� ���� -->
						<%@include file="/incmenu/menu.jsp"%>
						<!-- �޴��� �� -->
					</td>
				</tr>
			</TABLE>
		</td>
	</tr>
	<tr valign="top">
		<td>
			<TABLE cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
				<tr valign="top">
					<td width="200" background="/images/common/left_bg.gif">
						<!-- ���� �޴� ���� -->
						<%@include file="/incmenu/left_myhome.jsp"%>
						<!-- ���� �޴� �� -->
					</td>
					<td>
						<!-- �˻� ���� -->
						<!--%@include file="/incmenu/search_myhome.jsp"%-->
						<jsp:include page="/incmenu/search_main.jsp" flush="true">
							<jsp:param name="GUBUN" value="EDUCATION"/>
						</jsp:include>
						<!-- �˻� �� -->
						<!-- ���� ���� -->
						<TABLE cellpadding="0" cellspacing="0" border="0" width="735">
							<tr>
								
                <td class="bodypd"> 
                  <!-- ���� ��ġ ���� -->
                               <TABLE cellpadding="0" cellspacing="0" border="0" width="100%">
                                 <tr>
                                    <td align="right" class="location"><img src="/images/common/bullet_location.gif"><a href="http://www.hkhrd.com"> HOME</a> > <a href="http://www.hkhrd.com/learn/user/study/myhome_main.jsp">����Ȩ</a> > �ٸ�������</td>
                                 </tr>
                                 <tr height="3">
                                    <td></td>
                                 </tr>
                               </table>
                  <!-- ���� ��ġ �� -->
                  <TABLE cellpadding="0" cellspacing="0" border="0" width="735">
                    <tr> 
                      <td> <TABLE cellpadding="0" cellspacing="0" border="0">
                          <tr height=22> 
                            <td></td>
                            <td></td>
                          </tr>
                        </TABLE></td>
                    </tr>
                    <tr height="1"> 
                      <td bgcolor="DAD8D8"></td>
                    </tr>
                    <tr> 
                      <td>
                         <TABLE cellpadding="0" cellspacing="0" border="0" width="735">
                          <tr> 
                            <td>
							   <TABLE cellpadding="0" cellspacing="0" border="0" width="735">
                                <tr height="15"> 
                                </tr>
                                <tr> 
                                  <td height=15><table width="735" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td width=10 style=padding-left:6><img src="/images/user/myhome/bullet_03.gif" ></td>
                                        <td  class=guidetitle>�ٸ��򰡸�   :   <%=v_damunpapernm%></td>
                                      </tr>
                                    </table></td>
                                </tr>
								<tr> 
                                  <td style=padding-left:6>
								  <br>
								  �� ������ "<%=GetCodenm.get_subjnm(v_subj)%>"�� <%=v_content1%> ���� <%=v_content2%>�� �ൿ����� �˾ƺ��� ���� ���Դϴ�.<br><br>
								  ������ ����� ���� �ش� ������ ����ȿ���� ���ϰ� �����ϴµ� ���� ���Դϴ�.<br><br>
								  �����ϰ� �亯�� �ֽñ� �ٶ�� <%=v_content2%>�� ��������� �ൿ�� ���ø��鼭 ����� �ൿ�� ���� �� ��Ÿ���� �ִ� �Ϳ� üũ�� �ֽñ� �ٶ��ϴ�.<br><br>
								  �� ��������� �λ�� ��� ���⵵ ��ġ�� ������, �����������θ� Ȱ��� �����Դϴ�. �����մϴ�.<br>
                                  </td>
                                </tr>
                                <tr> 
                                  <td height=8></td>
                                </tr>
                                <tr> 
                                  <td height=8></td>
                                </tr>
                                <tr> 
                                  <td height=15><table width="735" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td width=10 style=padding-left:6><img src="/images/user/myhome/bullet_03.gif" ></td>
                                        <td  class=guidetitle>���� ����� ���� ( ����ڿ��� ���� : <%=v_relationnm%>)</td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td><table border="0" cellpadding="0" cellspacing="0" width="735">
                                      <tr> 
                                        <td class="boardskin1_color" height="3"></td>
                                      </tr>
                                      <tr> 
                                        <td height="2"></td>
                                      </tr>
                                      <tr> 
                                        <td><table width="735" border="0" cellspacing="1" cellpadding="0" class=boardskin1_out >
                                            <tr> 
                                              <td width="100"  class=boardskin1_textb>���</td>
                                              <td width="192"  class=boardskin1_textb>����</td>
                                              <td class=boardskin1_textb>�Ҽ�</td>
                                              <td width="100"  class=boardskin1_textb>����</td>
                                             </tr>
                                            <tr> 
											  <td  class=boardskin1_textn><%=mdbox.getString("d_userid")%></td>
											  <td  class=boardskin1_textn><%=mdbox.getString("d_name")%></td>
											  <td  class=boardskin1_textn><%=mdbox.getString("d_asgnnm")%></td>
											  <td  class=boardskin1_textn><%=mdbox.getString("d_jikwinm")%></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td class="boardskin1_bottom"></td>
                                </tr>
                                <tr> 
                                  <td height=30></td>
                                </tr>
                                <tr> 
                                  <td height=8></td>
                                </tr>
                                <tr> 
                                  <td>
<table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
<form name='form2' method='post' action='/servlet/controller.multiestimate.DamunSubjResultServlet'>
  <input type='hidden' name='p_process'    value='DamunUserResultInsert'>         
  <input type='hidden' name='p_grcode'    value='<%=v_grcode%>'>          
  <input type='hidden' name='p_subj'    value='<%=v_subj%>'>          
  <input type='hidden' name='p_gyear'      value='<%=v_gyear%>'>          
  <input type='hidden' name='p_subjseq'    value='<%=v_subjseq%>'>          
  <input type='hidden' name='p_damunpapernum'      value='<%=v_damunpapernum%>'>          
  <input type='hidden' name='p_subjuserid'      value='<%=v_subjuserid%>'>          
  <input type='hidden' name='p_obuserid'      value='<%=v_obuserid%>'>          
  <input type='hidden' name='p_mailgubun'      value='<%=v_mailgubun%>'>          
  <input type='hidden' name='p_isobserver'      value='<%=v_isobserver%>'>          
  <input type='hidden' name='p_damunnums'   value='<%=v_damunnums%>'>          
  <input type='hidden' name='p_answers'      value=''>                 
<!--</form>--> 
  <tr> 
    <td> 
      <table cellspacing="1" cellpadding="3" class="table2">
<!--      <form name="form3" method="post" action="/servlet/controller.multiestimate.DamunSubjResultServlet">-->
<% 
        ArrayList    blist = (ArrayList)request.getAttribute("PaperQuestionExampleList");
    
	for (int i=0; i < blist.size(); i++) {
        ArrayList list = (ArrayList)blist.get(i);  
        DataBox dbox = (DataBox)list.get(0);  
%>
        <tr> 
          <td class="board_title_bg0"><%="["+String.valueOf(i+1)+"]"+ dbox.getString("d_damuntext")%></td>
        </tr>
<%      if (dbox.getString("d_damuntype").equals(DamunSubjBean.OBJECT_QUESTION)) {   // ���ϼ��� 
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_damunnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%              }
            }
        } else if (dbox.getString("d_damuntype").equals(DamunSubjBean.MULTI_QUESTION)) {  // ��������
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="<%=dbox.getInt("d_damunnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%              } 
            }
        } else if (dbox.getString("d_damuntype").equals(DamunSubjBean.SUBJECT_QUESTION)) {  // ������  %>
        <tr> 
          <td class="board_text3"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<textarea name="<%=dbox.getInt("d_damunnum")%>" cols="83" rows="5" class="input"></textarea>
          </td>
        </tr>
<%
		} else if (dbox.getString("d_damuntype").equals(DamunSubjBean.COMPLEX_QUESTION)) {  // ������
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_damunnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          }
           } 
%>
        <tr> 
          <td class="board_text4">��Ÿ�ǰ�</td>
        </tr>
        <tr> 
          <td class="board_text3"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<textarea name="<%=dbox.getInt("d_damunnum")%>|C" cols="83" rows="5" class="input"></textarea>
          </td>
        </tr>
<%				
				

        } else if (dbox.getString("d_damuntype").equals(DamunSubjBean.FSCALE_QUESTION)) {  // 5��ô��
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_damunnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          
                }
           } 
        } else if (dbox.getString("d_damuntype").equals(DamunSubjBean.SSCALE_QUESTION)) {  // 7��ô��
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_damunnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          
                }
           } 
        } else if (dbox.getString("d_damuntype").equals(DamunSubjBean.GSCALE_QUESTION)) {  // GAP��
            for (int j=0; j < 5; j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { 
                if (j == 0) {
%>
        <tr> 
          <td class="board_text3"><%=dbox.getString("d_scalename")%></td>
        </tr>
<%
                }	
%>
		<tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_damunnum")%>|F" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          
                }
           } 
            for (int j=5; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) {
                if (j == 5) {
%>
        <tr> 
          <td class="board_text3"><%=dbox.getString("d_scalename")%></td>
        </tr>
<%
                }	
%>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_damunnum")%>|S" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")-5%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          
                }
           } 
        } 
	}
%>
      </form>
      </table>
    </td>
  </tr>
</table>
<!----------------- �ٸ������� �� ---------------->
<br>
<!----------------- ���� ��ư ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
    <tr>                
        <td align="right"><a href="javascript:whenSubmit1()"><img src="/images/user/study/presentation_butt1.gif" alt="����" width="54" height="20" border="0"></a></td>
        <td align="right" width="65"><a href="javascript:self.close()"><img src="/images/user/study/close_butt.gif" alt="�ݱ�" width="54" height="20" border="0"></a></td>
    </tr>
</table>
<!----------------- ���� ��ư �� ----------------->
                                  </td>               
                                </tr>								
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                              </TABLE></td>
                          </tr>
                        </TABLE></td>
                    </tr>
                  </table> </td>
							</tr>
						</TABLE>
            <!-- ���� �� -->
          </td>
				</tr>
			</TABLE>
		</td>
	</tr>
	<tr height="51">
		<td valign="top">
			<!-- FOOTER ���� -->
			<jsp:include page="/incmenu/footer.jsp" flush="true">
				<jsp:param name="sUrl" value="<%=request.getServletPath().toString()%>"/>
			</jsp:include>
			<!-- FOOTER �� -->
		</td>
	</tr>
</TABLE>
</BODY>
</HTML>