<%
/**
 * file name : ku_RecommandList_L.jsp
 * date      : 2005/12/16
 * programmer:  lyh
 * function  : ���� ��õ���� list ���
 */
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);      
    box.put("leftmenu","07"); 
    DataBox dbox = null;
    DataBox dbox2 = null;   
    DataBox dbox3 = null;   
    DataBox dbox4 = null;



    box = (RequestBox)request.getAttribute("requestbox");
    String v_userid = box.getSession("userid");

    String v_ind = box.getString("ind");
    String v_job = box.getString("job");
    
    ArrayList list = (ArrayList)request.getAttribute("UserInfoList");   //���������
    ArrayList selTotList = (ArrayList)request.getAttribute("RecommandSelectbox");   //selectbox����
    ArrayList searchList = (ArrayList)request.getAttribute("RecommandSearch");  //�˻�����
    ArrayList recommandList = (ArrayList)request.getAttribute("RecommandSubj"); //�˻�����
    
    
    ArrayList jikupSelList = (ArrayList)selTotList.get(0);      //���� selectbox
    ArrayList degreeSelList = (ArrayList)selTotList.get(1); //�з� selectbox

    dbox = (DataBox)list.get(0);

%>

<script language="javascript">
<!--

//���㰭�� �˻��� select ��� ��ȭ
function loadDefaults(i, j, s)
{
if (i!='') {
document.IOS['ind'].options[getValueIndex(document.forms['frm3']['ind'], i)].selected=true;
setInd(document.forms['frm3']['ind']);
document.forms['frm3']['job'].options[getValueIndex(document.forms['frm3']['job'], j)].selected=true;
setJob(document.forms['frm3']['job']);
document.forms['frm3']['spe'].options[getValueIndex(document.forms['frm3']['spe'], s)].selected=true;
}
}
function loadDefaultJobs(i,j,s){
if( i != '' ){
document.forms['frm3']['job'].options[getValueIndex(document.forms['frm3']['job'], j)].selected=true;
fillTitle(i);
setJob(document.forms['frm3']['job']);
document.forms['frm3']['spe'].options[getValueIndex(document.forms['frm3']['spe'], s)].selected=true;
}
}
function loadDefaultSpecs(i,j,s){
if( i != '' && j != '' ){
document.forms['frm3']['spe'].options[getValueIndex(document.forms['frm3']['spe'], s)].selected=true;
fillJob(j);
}
}
function removeElement(arr, element)
{
        for(i=0; i<arr.length; i++){
                if(arr[i].search(';'+element)!=-1){
                        arr1 = arr.slice(0, i);
                        arr2 = arr.slice(i+1);
                        arr = arr1.concat(arr2);
                        return arr;
                }
        }
}
function getTitle(industry){
        titleArr = new Array();         

        //������ ���ý�
        if(industry =='age'){

                var i0Arr = new Array(
"10��;10",
"20��;20",
"30��;30",
"40��;40",
"50��;50");
                titleArr=i0Arr.concat(titleArr);
                return titleArr;
        }
        //�з��� ���ý�
        if(industry == 'degree'){
                var i1Arr = new Array(
<%
for(int i=0; i < degreeSelList.size();i++){     // �з�list�� �迭�θ���
    dbox2 = (DataBox)degreeSelList.get(i);
    out.print("\""+dbox2.getString("d_degreenm")+"\"");
    if(i != degreeSelList.size()-1) out.print(",");  
}%>
                );

                titleArr=i1Arr.concat(titleArr);
                return titleArr;
        }
        //������ ���ý�
        if(industry == 'sexdis'){
                var i2Arr = new Array(
"����;F",
"����;M");
                titleArr=i2Arr.concat(titleArr);
                return titleArr;
        }
        //������ ���ý�
        if(industry == 'jikup'){
                var i3Arr = new Array(

<%
for(int i=0; i < jikupSelList.size();i++){      // �з�list�� �迭�θ���
    dbox2 = (DataBox)jikupSelList.get(i);
    out.print("\""+dbox2.getString("d_jikupnm")+"\"");
    if(i != jikupSelList.size()-1) out.print(",");  
}%>
                );                
                titleArr=i3Arr.concat(titleArr);
                return titleArr;
        }

        return titleArr;
}        


function GetSelectedText(box){
var boxText = '';
for(var i=0; i<box.options.length; i++){
if(box.options[i].selected && box.options[i].value != ''){
boxText = box.options[i].value;
}
}
return boxText;
}

function getValueIndex(box, value){
for(var i=0; i<box.options.length; i++){
if(box.options[i].value == value)
return i;
}
return 0;
}

function compare(s1, s2){
        var t1 = s1.toLowerCase();
        var t2 = s2.toLowerCase();
        if(t1 < t2){
                return -1;
        }
        if(t1 > t2){
                return 1;
        }
        return 0;
}

function fillTitle(industry){
document.forms['frm3']['job'].length=1;
var cnt = 0;
var isSelected = false;
var arr = getTitle(industry);
arr.sort(compare);
//document.forms['frm3']['job'].length=arr.length+1;

for(var n=0; n<arr.length; n++){
newOpt=new Option;
        i = arr[n].search(';');
newOpt.value=arr[n].slice(i+1);
newOpt.text=arr[n].slice(0,i);
        if (!isSelected){
         //newOpt.selected = true;
         isSelected = true;
        }
        document.forms['frm3']['job'].options[cnt]=newOpt;
        cnt=cnt+1;
}

}

function fillJob(title){
document.forms['frm3']['spe'].length=0;
var cnt =1;
var isSelected = false;
var arr = getJobFunction(title);
    if(arr.length != 1){
            var tmp = new Array("[���ô�ü ����];-1");
            arr = tmp.concat(arr);
    }
    for(var n=0; n<arr.length; n++){
    newOpt=new Option;
            i = arr[n].search(';');
    newOpt.value=arr[n].slice(i+1);
    newOpt.text=arr[n].slice(0,i);
    if (!isSelected){
             newOpt.selected = true;
             isSelected = true;
            }
            document.forms['frm3']['spe'].options[cnt]=newOpt;
            cnt=cnt+1;
    }
    if(!(NS4)){
        if(arr.length != 1){
                document.forms['frm3']['spe'].style.visibility = 'visible';

        }else{
                document.forms['frm3']['spe'].style.visibility = 'hidden';
        }
    } 
}

function setInd(box) {
ind = GetSelectedText(box);
    if(ind != ''){
    fillTitle(ind);
    }
//alert(ind);
}

function setJob(box) {
title = GetSelectedText(box);
//alert(job);
    if(ind != ''){
    doIt();
    }
}

// ������õ���� �˻��ϱ�
function searchGo(){
    document.frm3.p_process.value = "RecommandList";
    document.frm3.p_searchYn.value = "Y";
    document.frm3.action="/servlet/controller.study.KRecommendServlet";
    document.frm3.submit();

}

// ���� ���뺸��
function whenSubjInfo(subj,sphere){
    document.frm3.p_subj.value       = subj;
    document.frm3.p_sphere.value = sphere;
    document.frm3.p_process.value  = 'SubjectPreviewPage';
    document.frm3.p_rprocess.value = 'SubjectListAlway';
    document.frm3.action='/servlet/controller.course.KCourseIntroServlet';
    document.frm3.target = "_self";
    document.frm3.submit();
}


// -->
</script>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topMyclass.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > ����Ŭ����&gt; ������õ����</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/myclass/<%=tem_subimgpath%>/tit_goodclass.gif" ></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/myclass/text_goodclass.gif" width="680" height="33"></td>
                          </tr>
                          <tr>
                            <td height="15"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="3"><img src="/images/user/kocca/myclass/bar_classroom_top.gif" width="680" height="19"></td>
                          </tr>
                          <tr> 
                            <td width="26" rowspan="4" valign="top"><img src="/images/user/kocca/myclass/bar_classroom_l.gif" width="26" height="80"></td>
                            <td width="627" height="4" valign="top"><img src="/images/user/kocca/myclass/bar_classhistory_top.gif" width="627" height="4"></td>
                            <td width="27" rowspan="4" valign="top"><img src="/images/user/kocca/myclass/bar_classroom_tail.gif" width="27" height="80"></td>
                          </tr>
                          <tr> 
                            <td width="627" valign="top" bgcolor="#D9E9D9"><table width="627" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="84" rowspan="3"><img src="/images/user/kocca/myclass/ico_goodclass.gif" width="89" height="65"></td>
                                  <td height="8" colspan="2"></td>
                                </tr>
                                <tr> 
                                  <td width="129" height="52"><table width="129" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="59"><div align="center" valign="bottom"><strong><font color="#000000"><%=dbox.getString("d_name")%></font></strong></div></td>
                                        <td width="70"><img src="/images/user/kocca/myclass/text_goodclass02.gif" width="70" height="13"></td>
                                      </tr>
                                    </table></td>
                                  <td width="409">
                                  <table width="409" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="3" colspan="9"></td>
                                      </tr>
                                      <tr> 
                                        <td width="10">&nbsp;</td>
                                        <td width="63" height="18" background="/images/user/kocca/myclass/box_bg.gif"><div align="center" class="tbl_myclass_gleft_1">����</div></td>
                                        <td width="17">&nbsp;</td>
                                        <td width="11"><img src="/images/user/kocca/myclass/vline_w.gif" width="1" height="13"></td>
                                        <td width="137"><%=dbox.getString("d_age")%>��</td>
                                        <td width="63" background="/images/user/kocca/myclass/box_bg.gif"><div align="center" class="tbl_myclass_gleft_1">����</div></td>
                                        <td width="17">&nbsp;</td>
                                        <td width="11"><img src="/images/user/kocca/myclass/vline_w.gif" width="1" height="13"></td>
                                        <td width="80"><%=dbox.getString("d_sexdis")%></td>
                                      </tr>
                                      <tr> 
                                        <td height="3" colspan="9"></td>
                                      </tr>
                                    </table>
                                    <table width="409" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="1" bgcolor="#FFFFFF"></td>
                                      </tr>
                                    </table>
                                    <table width="409" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="1" bgcolor="#FFFFFF"></td>
                                      </tr>
                                    </table>
                                    <table width="409" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="3" colspan="9"></td>
                                      </tr>
                                      <tr> 
                                        <td width="10">&nbsp;</td>
                                        <td width="63" height="18" background="/images/user/kocca/myclass/box_bg.gif"><div align="center" class="tbl_myclass_gleft_1">�з�</div></td>
                                        <td width="17">&nbsp;</td>
                                        <td width="11"><img src="/images/user/kocca/myclass/vline_w.gif" width="1" height="13"></td>
                                        <td width="137"><%=dbox.getString("d_degreenm")%></td>
                                        <td width="63" background="/images/user/kocca/myclass/box_bg.gif"><div align="center" class="tbl_myclass_gleft_1">����</div></td>
                                        <td width="17">&nbsp;</td>
                                        <td width="11"><img src="/images/user/kocca/myclass/vline_w.gif" width="1" height="13"></td>
                                        <td width="80"><%=dbox.getString("d_jikupnm")%></td>
                                      </tr>
                                      <tr> 
                                        <td height="3" colspan="9"></td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td height="9" colspan="5"></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="4" valign="top"><img src="/images/user/kocca/myclass/bar_classhistory_bottom.gif" width="627" height="4"></td>
                          </tr>
                          <tr> 
                            <td valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td height="10" colspan="3"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">                          
                          <tr> 
                            <td><img src="/images/user/kocca/myclass/st_gppdclass_term.gif" width="56" height="13"></td>
                          </tr>
                          <tr> 
                            <td height="9"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="10"><table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td colspan="4"><img src="/images/user/kocca/myclass/bar_term_top.gif" width="680" height="7"></td>
                                </tr>
                                <tr> 
                                  <td width="7" rowspan="3" class="linecolor_class">&nbsp;</td>
                                  <td width="14" rowspan="3" class="linecolor_class02">&nbsp;</td>
                                  <td width="652" height="3" class="linecolor_class02"></td>
                                  <td width="6" rowspan="3"class="linecolor_class">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="663" class="linecolor_class03">����: <%=dbox.getString("d_agegubun")%> / �з�: 
                                    <%=dbox.getString("d_degreenm")%> / ����: <%=dbox.getString("d_sexdis")%> / ����: <%=dbox.getString("d_jikupnm")%></td>
                                </tr>
                                <tr> 
                                  <td height="10" class="linecolor_class02"></td>
                                </tr>
                                <tr> 
                                  <td colspan="4"><img src="/images/user/kocca/myclass/bar_term_bottom.gif" width="680" height="7"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/myclass/box_good_top.gif" width="680" height="6"></td>
                          </tr>
                          <tr> 
                            <td background="/images/user/kocca/myclass/box_good_bg.gif"><table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="27">&nbsp;</td>
                                  <td width="625"> <table width="625" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="22" colspan="3">&nbsp;</td>
                                      </tr>
                                      <tr> 
                                          <!--����Ұ� _������-->
<%
    String v_newphoto = "";
    if(recommandList.size() != 0 ){     // �˻��� ������ �ִٸ�

    for(int i = 0 ; i < recommandList.size();i++){
        dbox4 = (DataBox)recommandList.get(i);
        
        if(dbox4.getString("d_newphoto") != ""){
            v_newphoto = conf.getProperty("url.upload")+"bulletin/" + dbox4.getString("d_newphoto");
        }else{
            v_newphoto = "/images/user/kocca/course/photo_blank.gif";
        }

%>
                                        <td width="208"  valign="top"> 
                                          <!--����Ұ� _������-->

                                          <table width="208" border="0" cellspacing="0" cellpadding="0">
                                            <tr> 
                                              <td width="90" rowspan="4" valign="top"><table width="90" border="0" cellpadding="0" cellspacing="3" bgcolor="#e7e7e7">
                                                  <tr> 
                                                    <td><table width="84" border="0" cellpadding="0" cellspacing="2" bgcolor="#cccccc">
                                                        <tr> 
                                                          <td>
                                                          <img src="<%=v_newphoto%>" border="0" width="80" height="70" ></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                </table></td>
                                              <td width="107" class="tbl_bleft_black"><%=dbox4.getString("d_subjnm")%></td>
                                              <td width="13" rowspan="4">&nbsp;</td>
                                            </tr>
                                            <tr> 
                                              <td class="linecolor_course01" height="1"></td>
                                            </tr>
                                            <tr> 
                                              <td height="39" valign="top" class="tbl_bleft">å�ӱ���:<%=dbox4.getString("d_name")%></td>
                                            </tr>
                                            <tr> 
                                              <td height="15" class="tbl_bleft"><a href="javascript:whenSubjInfo('<%=dbox4.getString("d_subj")%>','<%=dbox4.getString("d_sphere")%>')"><img src="/images/user/kocca/button/btn_more.gif" width="25" height="9" border="0"></a></td>
                                            </tr>
                                          </table>
                                          
                                        </td>
<%
    }
%>

<%
    int blankCnt2 = 3 - recommandList.size(); 
if(blankCnt2 > 0 ){                 //3�� �̸��ϰ�� ������� td ����ֱ�
    for(int i =0 ; i <blankCnt2; i++){
%>
                                      <td width="208"> 
                                      </td>
<%
    }   
}
%>

                                      </tr>
                                      <tr> 
                                        <td height="10" colspan="3"></td>
                                      </tr>
                                      <tr > 
                                        <td height="1" colspan="3" background="/images/user/kocca/course/bg_dot_line03.gif"></td>
                                      </tr>
<%
}else{      // ������ ���ٸ�                                            
%>
                                        <td colspan="3"  align="center" valign="middle">
                                            �˻��� ������ �����ϴ�.
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td height="10" colspan="3"></td>
                                      </tr>

<%}%>


                                    </table></td>
                                  <td width="27">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/kocca/myclass/box_good_bottom.gif" width="680" height="6" ></td>
                          </tr>
                        </table>
                        
<!-- 2nd Table -->


                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                        <form name="frm3" action="">
                            <input type="hidden" name="p_searchYn">
                            <input type='hidden' name='p_sphere' >
                            <input type='hidden' name='p_subj'    value="">
                            <input type='hidden' name='p_rprocess' value="">
                            <input type='hidden' name='p_process' value="">
                          <tr>
                            <td height="20" colspan="2"></td>
                          </tr>
                          <tr> 
                            <td colspan="2"><img src="/images/user/kocca/myclass/st_goodclass_search.gif" ></td>
                          </tr>
                          <tr> 
                            <td height="9" colspan="2"></td>
                          </tr>
                          <tr>
                            <td width="7%"><img src="/images/user/kocca/myclass/text_search.gif"></td>
                            <td>
                                <select name="ind" class="input2"  onChange="setInd(this)" >
                                    <option value="age">:: ����</option>
                                    <!--option value="degree">:: �з�</option-->
                                    <option value="sexdis">:: ����</option>
                                    <option value="jikup">:: ����</option>
                                  </select>&nbsp;&nbsp;
                                  <select name="job" class="input2"  onChange="searchGo();" >
                                    <option>&nbsp;&nbsp;</option>
                                    <option>&nbsp;&nbsp;</option>
                                    <option>&nbsp;&nbsp;</option>
                                  </select>&nbsp;
                                  <img src="/images/user/kocca/button/btn_search.gif" border="0" onclick="searchGo();" align="absmiddle" style="cursor:hand">
                                  
                                  </td>
                          </tr>
                          <tr> 
                            <td height="9" colspan="2"></td>
                          </tr>
                        </table>                        
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/myclass/box_good_top.gif" width="680" height="6"></td>
                          </tr>
                          <tr> 
                            <td background="/images/user/kocca/myclass/box_good_bg.gif"><table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="27">&nbsp;</td>
                                  <td width="625"> <table width="625" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="22" colspan="3">&nbsp;</td>
                                      </tr>
                                      <tr> 

<%
    if(searchList.size() != 0 ){        // �˻��� ������ �ִٸ�

    for(int i = 0 ; i < searchList.size();i++){
        dbox3 = (DataBox)searchList.get(i);

        if(dbox3.getString("d_newphoto") != ""){
            v_newphoto = conf.getProperty("url.upload")+"bulletin/" + dbox3.getString("d_newphoto");
        }else{
            v_newphoto = "/images/user/kocca/course/photo_blank.gif";
        }

%>
                                        <td width="208"> 
                                          <!--����Ұ� _������-->

                                          <table width="208" border="0" cellspacing="0" cellpadding="0">
                                            <tr> 
                                              <td width="90" rowspan="4" valign="top"><table width="90" border="0" cellpadding="0" cellspacing="3" bgcolor="#e7e7e7">
                                                  <tr> 
                                                    <td><table width="84" border="0" cellpadding="0" cellspacing="2" bgcolor="#cccccc">
                                                        <tr> 
                                                          <td><img src="<%=v_newphoto%>" border="0" width="80" height="70" ></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                </table></td>
                                              <td width="107" class="tbl_bleft_black"><%=dbox3.getString("d_subjnm")%></td>
                                              <td width="13" rowspan="4">&nbsp;</td>
                                            </tr>
                                            <tr> 
                                              <td class="linecolor_course01" height="1"></td>
                                            </tr>
                                            <tr> 
                                              <td height="39" valign="top" class="tbl_bleft">å�ӱ���:<%=dbox3.getString("d_name")%></td>
                                            </tr>
                                            <tr> 
                                              <td height="15" class="tbl_bleft"><a href="javascript:whenSubjInfo('<%=dbox4.getString("d_subj")%>','<%=dbox4.getString("d_sphere")%>')"><img src="/images/user/kocca/button/btn_more.gif" width="25" height="9" border="0"></a></td>
                                            </tr>
                                          </table>
                                          
                                        </td>
<%
    }
%>
<%
    int blankCnt = 3 - searchList.size(); 
if(blankCnt > 0 ){                  //3�� �̸��ϰ�� ������� td ����ֱ�
    for(int i =0 ; i <blankCnt; i++){
%>
                                      <td width="208"> 
                                      </td>
<%
    }   
}
%>
                                      </tr>
                                      <tr> 
                                        <td height="10" colspan="3"></td>
                                      </tr>
                                      <tr > 
                                        <td height="1" colspan="3" background="/images/user/kocca/course/bg_dot_line03.gif"></td>
                                      </tr>
<%
}else{      // ������ ���ٸ�                                            
%>
                                        <td colspan="3"  align="center" valign="middle">
                                            �˻��� ������ �����ϴ�.
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td height="10" colspan="3"></td>
                                      </tr>

<%}%>


                                    </table></td>
                                  <td width="27">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/kocca/myclass/box_good_bottom.gif" width="680" height="6" ></td>
                          </tr>
                        </table>
    </FORM>

<SCRIPT LANGUAGE="JavaScript">
<!--
    var loadSelectChk = document.frm3.ind; 
    setInd(loadSelectChk);
    //���� �˻������� selectbox�� selected �ϱ�
    document.frm3.ind.value = "<%=v_ind%>";
    var jikup = "<%=v_ind%>";
    fillTitle(jikup);                       // ù��° selectbox�� ���� �ι�° selectbox ����ֱ�
    document.frm3.job.value ="<%=v_job%>";  // �ι�° selectbox selected

//-->
</SCRIPT>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
