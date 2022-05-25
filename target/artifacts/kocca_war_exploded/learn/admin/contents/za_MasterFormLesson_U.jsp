<%
//********************************************************************
//  1. ��      ��: OBC�������� Lesson ����ȭ��
//  2. ���α׷��� : za_MasterFormLesson_U.jsp
//  3. ��      ��: OBC�������� Lesson ����ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 3
//  7. ��      ��:
//********************************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%!
    /**
    * Lesson ����URL �����
    @param String   p_gubun : '1':whole url, '2':lesson����
    @return String tz_config.vals
    */
    public String make_startURL(String p_gubun, String p_subj, String p_dir, String ss_middleclass, String p_lesson) throws Exception{
        //������ controlLessonBranch ���� ��!!!
        String  results = "";

        //results = "/contents/"+ss_middleclass+"/"+p_subj+"/"+p_lesson;
        results = "/contents/"+p_subj+"/docs/"+p_lesson.substring(1,3);
        if (p_gubun.equals("1")) results+="/start.html";

        return  results;
    }
%>
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  p_subj      	= box.getString("p_subj");
    String  c_gadmin    	= box.getSession("s_gadmin");
    if(c_gadmin==null || c_gadmin.equals(""))   c_gadmin="A1";

    String  p_process   	= box.getString("p_process");
    String  ss_contenttype  = box.getString("p_contenttype");   //�������� ����Ʈ ContentType
    String  ss_upperclass 	= box.getString("s_upperclass");	//�������� ����Ʈ ȭ�� ��з�
    String  ss_middleclass 	= box.getString("s_middleclass");	//�������� ����Ʈ ȭ�� �ߺз�
    String  ss_lowerclass  	= box.getString("s_lowerclass");	//�������� ����Ʈ ȭ�� �Һз�
    int     p_cnt_lesson	= box.getInt("p_cnt_lesson");

    MasterFormData  da  =(MasterFormData)request.getAttribute("MasterFormData");
    String  v_ismfbranch    = da.getIsmfbranch();
    String  v_subjnm        = da.getSubjnm();
    String  v_dir           = da.getDir();
    String  v_contenttypetxt= da.getContenttypetxt();
    String  v_unchangableMaxLesson = da.getUnchangableMaxLesson();
    int     v_cnt_lesson    = da.getCnt_lesson();

    if(p_cnt_lesson>v_cnt_lesson)   v_cnt_lesson = p_cnt_lesson;

    ArrayList       list1 = (ArrayList)request.getAttribute("MfModuleData");
    ArrayList       list2 = (ArrayList)request.getAttribute("MfLessonData");
    ArrayList       list3 = (ArrayList)request.getAttribute("MfTutorData");
    MfLessonData    data2 = null;

    SelectParam param = new SelectParam("p_isbranch", "", false, 1, box.getHttpSession());

    String sGrcode = box.getSession("tem_grcode");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<script language="javascript">
function whenLessonCnt(){
    document.f2.p_process.value="updateLessonPage";
    document.f2.submit();
}
function whenSubmit(){
    //if(!checkOK())  return;
    document.f2.p_process.value="updateLesson";
    document.f2.submit();
}
function checkOK(){
    var isExist=false;

    for(var i=0;i<document.f2.length;i++){
        if(document.f2.elements[i].name=="p_sdesc" && document.f2.elements[i].value.length > 0){
            if(document.f2.elements[(i-1)].value == '<%=v_unchangableMaxLesson%>'){
                isExist = true;
                break;
            }
        }
    }

    if(!isExist){
        if ("<%=v_unchangableMaxLesson%>" == "000")
                alert("1�� �̻��� ����ϼž� �մϴ�");
        else    alert("<%=v_unchangableMaxLesson%> Lesson���� �Է��ϼž� �մϴ�.");
    }

    return isExist;
}
function whenDelete(lesson){
    var r=$("#tb1");
    $("tr",r).each(function(){
        var c=Number($("td:eq(0)",this).text());
        if(c==Number(lesson))
            $(this).remove();
    });
}


function whenChangeModule(){
    var maxIdx = <%=v_cnt_lesson%>;
    var curIdx = maxIdx;
    var bakIdx = maxIdx;

    for(var i=document.f2.p_module.length; i >0; i--){
        j = i-1;
        curIdx =document.f2.p_module[j].selectedIndex;

        if (curIdx != bakIdx){
            if (curIdx == maxIdx || curIdx > bakIdx){
                document.f2.p_module[j].options[bakIdx].selected = true;
            }else
                bakIdx = curIdx;
        }

    }
}
function whenBranch(lesson){
    var url=document.f2.action;
    url +="?p_process=updateLessonBranchPage&p_subj=<%=p_subj%>&p_lesson="+lesson;
    window.open(url,"branchWin","width=800,height=600");
}

function excelAdd()
{
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�3
    farwindow = window.open("", "openWinAdd", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 520, height = 220, top=0, left=0");
    document.f2.target = "openWinAdd"
    document.f2.p_process.value = "lessonFromExcel";
    document.f2.p_action.value = "go";
    document.f2.submit();

    farwindow.window.focus();
    document.f2.target = window.self.name;

}
</script>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
     <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/c_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   <!----------------- title �� ----------------->
        <br>
		        <!-------------������ ����-------------------------->
 <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>������������</td>
        </tr>
        <tr>
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>
        <!--------------������ ��---------------------------->
    <%@ include file="/learn/admin/contents/include_MasterFormAdmin.jsp" %>

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td bgcolor="#636563">
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <FORM name = "f2" method = "post" action="/servlet/controller.contents.MasterFormServlet">
                    <input type=hidden name=p_process   	value="">
                    <input type=hidden name=p_action    	value="">
                    <input type=hidden name=p_subj      	value="<%=p_subj%>">
                    <input type=hidden name=p_contenttype   value="<%=da.getContenttype()%>">
                    <input type=hidden name=s_upperclass 	value="<%=ss_upperclass%>">
                    <input type=hidden name=s_middleclass 	value="<%=ss_middleclass%>">
                    <input type=hidden name=s_lowerclass 	value="<%=ss_lowerclass%>">
                    <input type=hidden name=s_contenttype   value="<%=ss_contenttype%>">
                <tr>
                  <td bgcolor="#FFFFFF" align="center" valign="top">
                  <br>
                    <!----------------- ������ ���ü� ���� ----------------->
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="bottom" height="20" width="195">������ ���ü� :
                          <input name="p_cnt_lesson" type="text" class="input" size="2" value="<%=v_cnt_lesson%>">&nbsp;&nbsp;
                            <a href="javascript:whenLessonCnt()"><img src="/images/admin/button/b_go.gif" border="0"></a>
                        </td>
                        <td align="right"><img src="/images/admin/button/btn_fileplus.gif" alt="���Ϸ��߰�" onclick="excelAdd()" style="CURSOR:POINTER"></td>
                      </tr>
                      <tr>
                        <td height="3"></td>
                      </tr>
                    </table>
                    <!----------------- ������ ���ü� �� ----------------->

                    <table width="99%" border="0" cellspacing="1" cellpadding="5" id="tb1">
                      <tr>
                        <td colspan="7" class="table_top_line"></td>
                      </tr>
                      <tr>
                        <td width="5%" height="25" class="table_title"><b>Lesson</b></td>
                        <td class="table_title"><b>����(Lesson)��</b></td>
                        <td class="table_title"><b>Module</b></td>
                        <td class="table_title"><b>��������</b></td>
                        <td class="table_title"><b>��������ġ[/contents/�а��ڵ�/�����ڵ�/���ù�ȣ/�������ϸ�]</b><br/><b>����� ��������ġ</b></td>                        
                        <td class="table_title"><b>�����</b></td>
                        <td class="table_title"><b>����</b></td>
                      </tr>
<%          for (int i=0; i<list2.size(); i++) {
                data2  = (MfLessonData)list2.get(i);
%>
                      <tr>
                        <td align="center" bgcolor="#EEEEEE" height="25" rowspan="2"><%=data2.getLesson()%></td>
                        <td class="table_02_1">
                          <input name="p_lesson" type="hidden" value="<%=data2.getLesson()%>">
                          <input name="p_sdesc" type="text" class="input" value="<%=data2.getSdesc()%>" size="30">
                        </td>
                        <td class="table_02_1">
                          <!--<select name="p_module" onChange="whenChangeModule('<%=data2.getModule()%>')">-->
                          <select name="p_module">
                          <%=MasterFormBean.make_moduleSelect(list1,data2.getModule())%>
                          </select>
                        </td>
                        <td class="table_02_1">
                          <input name="p_owner" type="text" class="input" size="10" value="<%=data2.getOwner()%>">
                        </td>
                        <td class="table_02_1">
                          <input name="p_starting" type="text" class="input" size="50" value="<%=data2.getStarting()%>">
                          <input name="p_mobile_url" type="text" class="input" size="50" value="<%=data2.getMobile_url() %>">
                        </td>                        
                        <td class="table_02_1">
                           <select name="p_userid">
                          <option value="">���缱��</option>
                          <%=MasterFormBean.make_tutorSelect(list3,data2.getUserid())%>
                          </select>
                        </td>
                        <td class="table_02_1"><a href="javascript:whenDelete('<%=i+1%>')"><img src="/images/admin/button/btn_del.gif" border=0></a></td>
                            
                <%--<%  if(Integer.parseInt(data2.getLesson()) > Integer.parseInt(v_unchangableMaxLesson.trim())){  %>--%>
                            <%--<a href="javascript:whenDelete('<%=data2.getLesson()%>')"><img src="/images/admin/button/btn_del.gif" border=0></a></td>--%>
                <%--<%  }   %>--%>
                      </tr>
                      <tr>
                      	<td colspan="6">
                      		<label for="p_subtitle_<%=i %>"><b><%=data2.getLesson() %>���� �ڸ�</b></label><br />
                      		<textarea rows="2" style="width: 99%;" name="p_subtitle" id="p_subtitle_<%=i %>"><%=data2.getSubTitle() %></textarea>
                      	</td>
                      </tr>
<%          }

            int list_size = 1;
            if (list2 != null)  list_size = list2.size() + 1;

            String  v_lesson = "";
            String  v_setUrl = "";
            for (int i=list_size;i<=v_cnt_lesson;i++){
            	if(sGrcode.equals("N000002")) {	//���Ӿ�ī����
            		v_lesson = new DecimalFormat("000").format(i);
            		String v_lesson_tmp = new DecimalFormat("00").format(i);
            		//v_setUrl = make_startURL("1",p_subj,da.getDir(),ss_middleclass,v_lesson);
            		v_setUrl = EduEtc1Bean.make_startURL("1",p_subj,da.getServer(),da.getPort(),da.getDir(),v_lesson_tmp);
            	} else {
            		v_lesson = new DecimalFormat("000").format(i);
            		v_setUrl = EduEtc1Bean.make_startURL("1",p_subj,da.getServer(),da.getPort(),da.getDir(),v_lesson);
            	}
%>
                      <tr>
                        <td align="center" bgcolor="#EEEEEE" height="25" rowspan="2"><%=v_lesson%></td>
                        <td class="table_02_1">
                          <input name="p_lesson" type="hidden" value="<%=v_lesson%>">
                          <input name="p_sdesc" type="text" class="input" value="" size="30">
                        </td>
                        <td class="table_02_1">
                          <!--<select name="p_module" onChange="whenChangeModule('<%=v_lesson%>')">-->
                          <select name="p_module">
                          <%=MasterFormBean.make_moduleSelect(list1, "")%>
                          </select>
                        </td>
                        <td class="table_02_1">
                          <input name="p_owner" type="text" class="input" size="10" value="<%=p_subj%>">
                        </td>
                        <td class="table_02_1">
                          <input name="p_starting" type="text" class="input" size="50" value="<%=v_setUrl%>">
                          <input name="p_mobile_url" type="text" class="input" size="50" value="">
                        </td>
                        <td class="table_02_1">
                          <select name="p_userid">
                          <option value="">���缱��</option>
                          <% if (data2!=null) { %>
                          <%=MasterFormBean.make_tutorSelect(list3,data2.getRepuserid())%>
                          <%} %>
                          </select>
                        </td>
                        <td class="table_02_1">&nbsp;</td>
                      </tr>
                      <tr>
                      	<td colspan="6">
                      		<label for="p_subtitle_<%=i %>"><b><%=v_lesson%>���� �ڸ�</b></label><br />
                      		<textarea rows="2" style="width: 99%;" name="p_subtitle" id="p_subtitle_<%=i %>"></textarea>
                      	</td>
                      </tr>
<%
            }
%>

                    </table>
                    <!----------------- ������������ �� ----------------->
                    <br>
                    <!----------------- �����ư ���� ----------------->
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td> <a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
						<td width=8></td>
						<td><a href="javascript:whenList()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
                      </tr>
                      <tr>
                        <td height="8"></td>
						<td height="8"></td>
						<td height="8"></td>
                      </tr>
                    </table>
                    <!----------------- �����ư �� ----------------->
                  </td>
                </tr>
                </FORM>
              </table>
            </td>
          </tr>
        </table>
        <br>

      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
