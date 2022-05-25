<%@ page language="java" contentType="text/html; charset=euc-kr" %>

<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_grcode    = box.getStringDefault("s_grcode","ALL");        //�����ְ�

//    String  v_subj        = box.getStringDefault("p_subj",  SulmunSubjBean.DEFAULT_SUBJ);
    String  v_subj        = box.getString("s_subjcourse");
    String  v_gyear       = box.getStringDefault("s_gyear","2005");
    String  v_subjseq       = box.getString("s_subjseq");

    String  v_company        = box.getStringDefault("s_company", "ALL");
    String  v_jikwi       = box.getStringDefault("s_jikwi", "ALL");
    String  v_jikun       = box.getStringDefault("s_jikun", "ALL");
    String  v_workplc       = box.getStringDefault("s_workplc", "ALL");
    
    int     v_replycount  = box.getInt("p_replycount");
    int     v_studentcount= box.getInt("p_studentcount");
    double  v_replyrate   = 0;
    if (v_studentcount != 0) {
        v_replyrate = (double)Math.round((double)v_replycount/v_studentcount*100*100)/100;
    }
    
	String  s_gadmin = box.getSession("gadmin");

%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="/css/style_course.css" type="text/css">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script src="/script/cafe_select.js" language="JavaScript"></script>
<script language="JavaScript">
<!--
function whenSelection(p_action) {
    if (p_action=="go") {
        if (document.form2.s_subjcourse.value=="----"){
            alert("������ �����ϼ���");
            return;
        }
        if (document.form2.s_subjseq.value=="----"){
            alert("������ �����ϼ���");
            return;
        }
    }
  document.form2.target = "_self";
  document.form2.p_action.value  = p_action;
  document.form2.p_process.value = 'SulmunEachResultPage';
  document.form2.submit();
}
-->
</script>
</HEAD>

<BODY topmargin="0" leftmargin="0">
<TABLE cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
	<tr class="tableheight1" valign="top">
		<td background="/images/common/bg_course.gif">
			<TABLE cellpadding="0" cellspacing="0" border="0" width="950">
				<tr class="tableheight2">
					<td>
						<!-- TOP ���� -->
						<!-- TOP �� -->
					</td>
				</tr>
				<tr class="tableheight3">
					<td style="BORDER-LEFT:#FFFFFF 10px solid">
						<!-- ���� �÷��� ���� -->
						<%@include file="/incmenu/course.jsp"%>
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
						<%@include file="/incmenu/left_course.jsp"%>
						<!-- ���� �޴� �� -->
					</td>
					<td>
						<!-- �˻� ���� -->

						<!-- �˻� �� -->
						<!-- ���� ���� -->
						<TABLE cellpadding="0" cellspacing="0" border="0" width="735">
							<tr>
								
                <td class="bodypd"> 
                  <!-- ���� ��ġ ���� -->
                  <%@include file="/incmenu/location.jsp"%>
                  <!-- ���� ��ġ �� -->
                  <TABLE cellpadding="0" cellspacing="0" border="0" width="735">
        <tr> 
          <td> <TABLE cellpadding="0" cellspacing="0" border="0">
              <tr> 
                <td><IMG src="/images/common/title_bullet.gif" border="0"></td>
                <td><img src="/images/user/course/title_course_07.gif" alt="�����������"></td>
              </tr>
            </TABLE></td>
        </tr>
        <tr height="1"> 
          <td bgcolor="E5E5E5"></td>
        </tr>
        <tr> 
          <td>&nbsp; </td>
        </tr>
		<tr> 
          <td><TABLE cellpadding="0" cellspacing="0" border="0">
                  <form name="form2" method="post" action="/servlet/controller.research.SulmunSubjResultServlet">
                    <input type="hidden" name="p_process"  value="">
                    <input type="hidden" name="p_action"   value="">
                	<input type="hidden" name="p_grcode"      value="<%=v_grcode%>">
                	<input type="hidden" name="p_gyear"      value="<%=v_gyear%>">
	                <input type="hidden" name="p_subj"      value="<%=v_subj%>">
	                <input type="hidden" name="p_subjseq"      value="<%=v_subjseq%>">
	                <input type="hidden" name="p_company"      value="<%=v_company%>">
	                <input type="hidden" name="p_jikwi"      value="<%=v_jikwi%>">
	                <input type="hidden" name="p_jikun"      value="<%=v_jikun%>">
	                <input type="hidden" name="p_workplc"      value="<%=v_workplc%>">
                	<input type="hidden" name="p_gubun"       value="">
              <tr> 
				<td width=60>����
				  <select name="s_gyear">
<%
								for(int y=2010; y>2004; y--) {
									out.print("<option value=" + y);
									out.println(">" + y + "</option>");
								}
%>
				  </select>	
				  <script>document.form2.s_gyear.value = <%=v_gyear%>;</script>
				</td>
                <td width=12></td>
				<td  width=60><%= SelectSubjBean.getSubj(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  --></td>
                <td width=12></td>
                <td  width=60><%= SelectSubjBean.getSubjseq(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  --></td>
                <td width=6></td>
                <td><A HREF="javascript:whenSelection('go')"><IMG src="/images/common/bt_y_search.gif" border="0"></A></td>
              </tr>
			  </form>
            </TABLE> </td>
        </tr>
		<tr> 
          <td height=6> </td>
        </tr>
<%  ArrayList    list = (ArrayList)request.getAttribute("SulmunResultList");
    SulmunQuestionExampleData data    = null;
    SulmunExampleData         subdata = null;
%>
		<tr> 
          <td><table width="735" border="0" cellspacing="1" cellpadding="2" class=research_skin>
              <tr>
               <!-- <td width="62" height="16" class=research_txt>�������� :</td>
                <td width="438" class=research_txt02></td>
                <td width="36" class=research_txt>�Ⱓ :</td>
                <td width="178" class=research_txt02>2004.05.02 ~ 2004.05.25 </td>//-->
              </tr>
            </table> </td>
        </tr>
		<tr> 
          <td height=6></td>
        </tr>
		<tr> 
          <td><table width="735" border="0" cellspacing="1" cellpadding="2" class=boardskin1_out>
              <tr>
                <td class=research_txt>�� �����ڼ� <%=v_replycount%>��</td>
              </tr>
            </table> </td>
        </tr>
		<tr> 
          <td height=6></td>
        </tr>
<%
 if(v_replycount > 0){

    for (int i=0; i < list.size(); i++) {
        data = (SulmunQuestionExampleData)list.get(i);
        if (data.getSultype().equals(SulmunSubjBean.OBJECT_QUESTION) || data.getSultype().equals(SulmunSubjBean.MULTI_QUESTION)) { %>  
		<tr> 
          <td><table width="735" border="0" cellspacing="1" cellpadding="2" class=boardskin1_out>
              <tr> 
                <td width="49" class=boardskin1_textb>����<%=i+1%></td>
                <td colspan="4" class=research_txt><%="["+data.getDistcodenm()+"]" + data.getSultext()%></td>
              </tr>
			  
<%          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j); 
                if (subdata != null) { %>
              <tr> 
                <td width="49" class=boardskin1_textb><%=subdata.getSelnum()%></td>
                <td width="304" class=boardskin1_textn_l><%=subdata.getSeltext()%>
                </td>
                <td width="61" class=boardskin1_textn><%=subdata.getReplycnt()%>��</td>
                <td width="53" class=boardskin1_textn><%=subdata.getReplyrate()%>%</td>
                <td width="242" bgcolor="#FFFFFF">
                      <table cellspacing="0" cellpadding="0" class="s_table">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>" class="graph">&nbsp;</td>
<%                  } %>
                          <td style="padding-left:5px">&nbsp;</td>
                        </tr>
                        </table>				
				</td>
              </tr>

<%              }
            }
%>
            </table> </td>
        </tr>
<%
	   } else if (data.getSultype().equals(SulmunSubjBean.SUBJECT_QUESTION)) {
          
%>
		<tr> 
          <td><table width="735" border="0" cellspacing="1" cellpadding="2" class=boardskin1_out>
              <tr> 
                <td width="49" class=boardskin1_textb>����<%=i+1%></td>
                <td colspan="4" class=research_txt><%="["+data.getDistcodenm()+"]" + data.getSultext()%></td>
              </tr>
<%          for (int j=0; j < data.getSubjectAnswer().size(); j++) {
%>
					<tr>
                      <td width="49" class="table_01"></td>
                      <td  colspan="4" style="padding-left=6" class="table_02_2"><%=(String)data.getSubjectAnswer().get(j)%></td>
                    </tr>

<%         }
%>
			</table> </td>
        </tr>
<%		
       } else if (data.getSultype().equals(SulmunSubjBean.COMPLEX_QUESTION)) {
%>          
		<tr> 
          <td><table width="735" border="0" cellspacing="1" cellpadding="2" class=boardskin1_out>
              <tr> 
                <td width="49" class=boardskin1_textb>����<%=i+1%></td>
                <td colspan="4" class=research_txt><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
              </tr>
			  
<%          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j); 
                if (subdata != null) { %>
              <tr> 
                <td width="49" class=boardskin1_textb><%=subdata.getSelnum()%></td>
                <td width="304" class=boardskin1_textn_l><%=subdata.getSeltext()%>
                </td>
                <td width="61" class=boardskin1_textn><%=subdata.getReplycnt()%>��</td>
                <td width="53" class=boardskin1_textn><%=subdata.getReplyrate()%>%</td>
                <td width="242" bgcolor="#FFFFFF">
                      <table cellspacing="0" cellpadding="0" class="s_table">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>" class="graph">&nbsp;</td>
<%                  } %>
                          <td style="padding-left:5px">&nbsp;</td>
                        </tr>
                        </table>				
				</td>
              </tr>

<%        }
          }
	
                 for (int j=0; j < data.getComplexAnswer().size(); j++) {
%>
					<tr>
                      <td width="49" class="table_01"><%if(j==0){%>��Ÿ<%}%></td>
                      <td  colspan="4" style="padding-left=6" class="table_02_2"><%=(String)data.getComplexAnswer().get(j)%></td>
                    </tr>
<%
                }
%>
			</table> </td>
        </tr>
<%
       } else if (data.getSultype().equals(SulmunSubjBean.FSCALE_QUESTION)) {
          
	          double d = 0; 
			  int person = 0;
			  double v_point = 0;
      
		   for (int j=1; j <= data.size(); j++) {
	            subdata  = (SulmunExampleData)data.get(j); 
                if (subdata != null) { 

					d +=  (subdata.getReplycnt()) * subdata.getSelpoint();
					person += subdata.getReplycnt();
				}
            }	
               
		v_point = d / person;	  
%>
		<tr> 
          <td><table width="735" border="0" cellspacing="1" cellpadding="2" class=boardskin1_out>
              <tr> 
                <td width="43" class=research_txt>����<%=i+1%></td>
                <td width="457" class=boardskin1_textn_l><%="["+data.getDistcodenm()+"] " + data.getSultext()%></td>
                <td width="35" class=research_txt>����</td>
                <td width="180" class=boardskin1_textn_l><%if(v_point >=0){%><%=v_point%>��<%}%></td>
              </tr>
            </table></td>
        </tr>
<%

       } else if (data.getSultype().equals(SulmunSubjBean.SSCALE_QUESTION)) {
          
	          double d = 0; 
			  int person = 0;
			  double v_point = 0;
      
		   for (int j=1; j <= data.size(); j++) {
	            subdata  = (SulmunExampleData)data.get(j); 
                if (subdata != null) { 

					d +=  (subdata.getReplycnt()) * subdata.getSelpoint();
					person += subdata.getReplycnt();
				}
            }	
               
		v_point = d / person;	  
%>
		<tr> 
          <td><table width="735" border="0" cellspacing="1" cellpadding="2" class=boardskin1_out>
              <tr> 
                <td width="43" class=research_txt>����<%=i+1%></td>
                <td width="457" class=boardskin1_textn_l><%="["+data.getDistcodenm()+"] "+ data.getSultext()%></td>
                <td width="35" class=research_txt>����</td>
                <td width="180" class=boardskin1_textn_l><%if(v_point >=0){%><%=v_point%>��<%}%></td>
              </tr>
            </table></td>
        </tr>
<%
	   } 
    } 
 }	
%>
		
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
			
			<!-- FOOTER �� -->
		</td>
	</tr>
</TABLE>
</BODY>
</HTML>