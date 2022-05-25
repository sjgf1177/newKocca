<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process  = box.getString("p_process");

    String  s_userid   = box.getSession("userid");
    String  s_username = box.getSession("name");

    ArrayList<DataBox> middleClassList   = (ArrayList)request.getAttribute("middleClassList");
    ArrayList<DataBox> mainSubjectList   = (ArrayList)request.getAttribute("mainSubjectList");
    ArrayList<DataBox> eventList         = (ArrayList)request.getAttribute("eventList");
    ArrayList<DataBox> noticeList        = (ArrayList)request.getAttribute("noticeList");
    ArrayList<DataBox> letterList        = (ArrayList)request.getAttribute("letterList");
    ArrayList<DataBox> seminarList       = (ArrayList)request.getAttribute("seminarList");
    
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->

<SCRIPT LANGUAGE="JavaScript">

    //���� ���뺸��
	function whenSubjInfo(subj, year, subjseq, seq, ucls){
		document.form1.p_upperclass.value = ucls;
		document.form1.menuid.value = ucls.substr(1,2);
		document.form1.p_subj.value = subj;
		document.form1.p_year.value = year;
		document.form1.p_subjseq.value = subjseq;
		document.form1.p_seq.value = seq;
		document.form1.p_process.value = 'SubjectPreviewPage';
		document.form1.p_rprocess.value = 'SubjectList';
		document.form1.action='/servlet/controller.off.ProposeOffServlet';
		document.form1.target = "_self";
		document.form1.submit();
	}


	function goSubjectList(upper, menuid, middle) {
        document.form1.p_upperclass.value = upper;
        if(middle == null) {
            document.form1.s_mclassnm.value = "";
        } else {
            document.form1.s_mclassnm.value = middle;
        }
        document.form1.menuid.value = menuid;
        document.form1.type.value = upper;
        document.form1.p_process.value = "SubjectList";
        document.form1.action = "/servlet/controller.off.ProposeOffServlet";
        document.form1.submit();
    }
    
    //�˸���
    function selectBanner(idx) {
        var bannerArray = document.getElementsByName("offline_banner");
        var imgArray = document.getElementsByName("bannerImg");
        
        var len = bannerArray.length;

        for(var i = 0 ; i < len ; i++) {
            if(i == idx ) {
            	bannerArray[i].style.display = "block";
            	imgover(imgArray[i]);
            	imgArray[i].onmouseover = function(){return;} 
            	imgArray[i].onmouseout  = function(){return;} 
            } else {
                bannerArray[i].style.display = "none";
                imgout(imgArray[i]);
                imgArray[i].onmouseover = function(){imgover(this);}
                imgArray[i].onmouseout  = function(){imgout(this);}
            } 
        }
    }

    var nextIdx = 0;
    var run;

    function getNextIdx() {
    	var imgCnt = document.getElementsByName("bannerImg").length -1;
        
        if(nextIdx == imgCnt) {
            nextIdx = 0;
        } else {
            nextIdx++;
        }
        selectBanner(nextIdx);        
    }

    function clickBanner(idx){
    	window.clearInterval(run);  // �ڵ� ��ȯ ����
    	selectBanner(idx);  
    }

    window.onload = function () {
    	run = setInterval("getNextIdx()", 2000); //�ڵ��϶� �̹��� ��ȯ�ð�����(2��)
    }

//-->
</SCRIPT>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" method="post">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "p_seq">
    <input type = "hidden" name = "faqcategory">
    <input type = "hidden" name = "p_types">
    <input type = "hidden" name = "gubun" value="2">
    <input type = "hidden" name = "menuid">
    <input type = "hidden" name = "type">

    <input type = "hidden" name = "s_mclassnm">
    
    <input type="hidden" name="p_rprocess"  value=""/>
    <input type="hidden" name="p_year"      value=""/>
    <input type="hidden" name="p_subj"      value=""/>
    <input type="hidden" name="p_subjseq"   value=""/>
    <input type="hidden" name="p_subjnm"    value=""/>
    <input type="hidden" name="p_iscourseYn"    value=""/>
    <input type="hidden" name="p_upperclass"    value=""/>
    <input type="hidden" name="p_upperclassnm"  value=""/>
            
            <div class="offline_visualbox">
                <p class="tit"><img src="/images/portal/offline/main_tit.gif" alt="OFFLINE CURICULUM" /></p>

                <dl>
                    <dt><img src="/images/portal/offline/main_menu1.gif" alt="��ۿ���" /></dt>
                    <%  if(middleClassList != null && middleClassList.size() > 0 ) {
                    	    for(int i = 0 ; i < middleClassList.size() ; i++ ) {
                    	        DataBox dbox = middleClassList.get(i);
                    	        if(dbox.getString("d_upperclass").equals("S01")) { %>
						<dd><a href="javascript:goSubjectList('S01', '01', '<%=dbox.getString("d_middleclass") %>');"><%=dbox.getString("d_middleclassname") %></a></dd>
                    <%          }
                            }
                        } %>
                </dl>
                <dl>
                    <dt><img src="/images/portal/offline/main_menu2.gif" alt="��������" /></dt>
                    <%  if(middleClassList != null && middleClassList.size() > 0 ) {
                    	    for(int i = 0 ; i < middleClassList.size() ; i++ ) {
                    	        DataBox dbox = middleClassList.get(i);
                    	        if(dbox.getString("d_upperclass").equals("S02")) { %>
						<dd><a href="javascript:goSubjectList('S02', '02', '<%=dbox.getString("d_middleclass") %>');"><%=dbox.getString("d_middleclassname") %></a></dd>
                    <%          }
                            }
                        } %>
                </dl>
                <dl>
                    <dt><img src="/images/portal/offline/main_menu3.gif" alt="��ȹâ�� " /></dt>
                    <%  if(middleClassList != null && middleClassList.size() > 0 ) {
                    	    for(int i = 0 ; i < middleClassList.size() ; i++ ) {
                    	        DataBox dbox = middleClassList.get(i);
                    	        if(dbox.getString("d_upperclass").equals("S03")) { %>
						<dd><a href="javascript:goSubjectList('S03', '03', '<%=dbox.getString("d_middleclass") %>');"><%=dbox.getString("d_middleclassname") %></a></dd>
                    <%          }
                            }
                        } %>
                </dl>
                
            </div>
            
            <p class="main_stit mg_t30"><img src="/images/portal/offline/main_stit1.gif" alt="���� ����" /></p>
            <div class="offline_photo">
                <%  if(mainSubjectList != null && mainSubjectList.size() > 0) {
                        String courseImgPath = "";
                        String divId         = "";
                        String alt           = "";                        
                	    for(int i = 0 ; i < mainSubjectList.size() ; i++) { 
                	        DataBox dbox = mainSubjectList.get(i);
                	        //if(dbox.get("d_isunit").equals("Y"))                     { divId= "<img src=\"/images/portal/offline/main_photo_ico1.gif\" alt=\"����\" />"; }
                	        if(dbox.get("d_specials").substring(1,2).equals("Y"))      { divId= "<img src=\"/images/portal/offline/main_photo_ico2.gif\" alt=\"�α�\" />"; }
                	        else if(dbox.get("d_specials").substring(0,1).equals("Y")) { divId= "<img src=\"/images/portal/offline/main_photo_ico3.gif\" alt=\"��õ\" />"; }
                	        else if(dbox.get("d_specials").substring(2,3).equals("Y")) { divId= "<img src=\"/images/portal/offline/main_photo_ico4.gif\" alt=\"�ű�\" />"; }
                	        else { divId = ""; }
                	        
                	        if(!dbox.get("d_submainfilenamenew").equals("")) 
                	        	courseImgPath = "/servlet/controller.library.DownloadServlet?p_savefile="+dbox.get("d_submainfilenamenew");
                	        else courseImgPath = "/images/portal/thumb/photo_professor.jpg"; %>
                <dl<%=i ==   mainSubjectList.size()-1 && mainSubjectList.size() >= 4 ? " class='mg_rn'" : ""%>>
                    <dt><img src="<%=courseImgPath %>" height="70" alt="<%=dbox.getString("d_subjnm") %>" />
                        <div id="offphoto_ico<%=(i+1) > 4 ? 4%(i+1) : i+1%>"><%=divId %></div>
                    </dt>
                    <dd><a href="javascript:whenSubjInfo('<%=dbox.get("d_subj")%>','<%=dbox.get("d_year")%>','<%=dbox.get("d_subjseq")%>','<%=dbox.get("d_seq")%>','<%= dbox.get("d_upperclass") %>')"><%=dbox.getString("d_subjnm") %></a></dd>
                </dl>
                <%      }
                	} else {%>
                <dl class='mg_rn' style='height:70px;'>��ϵ� ���°� �����ϴ�.</dl>
                <%	} %>
            </div>
            
            <div class="main_warp">
                <!-- ���� ����, �̺�, ��ũ, �������� ���� -->
	            <%@ include file="/learn/user/portal/include/subMain_include.jsp"%>
	            <!-- ���� ����, �̺�, ��ũ, �������� ���� -->

                <div class="offline_box wd_250">
                    <p class="main_stit">
                        <!-- <img src="/images/portal/offline/main_stit2.gif" alt="�˸���" class="fl_l" />
                        <span class="fl_r"> --><!-- 
                            <a href="javascript:clickBanner(0);"><img id="bannerImg" name="bannerImg" src="/images/portal/btn/main_roll_num1_on.gif" alt="1" /></a>
                            <a href="javascript:clickBanner(1);"><img id="bannerImg" name="bannerImg" src="/images/portal/btn/main_roll_num2_off.gif" alt="2" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
                            <a href="javascript:clickBanner(2);"><img id="bannerImg" name="bannerImg" src="/images/portal/btn/main_roll_num3_off.gif" alt="3" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
                            <a href="javascript:clickBanner(3);"><img id="bannerImg" name="bannerImg" src="/images/portal/btn/main_roll_num4_off.gif" alt="4" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
                             -->
                        </span>
                    </p>
				<!-- 
                    <p id="offline_banner" name="offline_banner" class="offline_banner"><img src="/images/portal/offline/main_roll_banner1.jpg" /></p>
                    <p id="offline_banner" name="offline_banner" class="offline_banner" style="display:none;"><img src="/images/portal/offline/main_roll_banner2.jpg" /></p>
                    <p id="offline_banner" name="offline_banner" class="offline_banner" style="display:none;"><img src="/images/portal/offline/main_roll_banner3.jpg" /></p>
                    <p id="offline_banner" name="offline_banner" class="offline_banner" style="display:none;"><img src="/images/portal/offline/main_roll_banner4.jpg" /></p>
                -->
                </div>
            </div>

            <div class="main_warp">
                <div class="offline_box wd_400 mg_r30">
                    <ul class="main_banner1 mg_tn">
                        <li><a href="javascript:menuForward('2', '04');"><img src="/images/portal/offline/main_banner1.gif" alt="�������� �ȳ�" /></a></li>
                        <li><a href="javascript:menuForward('2', '06');"><img src="/images/portal/offline/main_banner2.gif" alt="������������" /></a></li>
                        <li class="bgn"><a href="javascript:menuForward('2', '07');"><img src="/images/portal/offline/main_banner3.gif" alt="������û �ȳ�" /></a></li>
                    </ul>
                </div>

                <div class="offline_box wd_250">
                    <p class="main_stit"><img src="/images/portal/offline/main_stit3.gif" alt="�������α�������" /></p>

                    <p class="main_eduinquiry"><img src="/images/portal/offline/offline_eduservice.gif" alt="" /></p>
                    <!--dl class="offline_phone">
                        <dt><img src="/images/portal/online/main_txt1.gif" alt="��ۿ���" /></dt>
                        <dd><img src="/images/portal/online/main_txt11.gif" alt="02 - 3219 - 6519 / 6133" /></dd>
                        <dt><img src="/images/portal/online/main_txt2.gif" alt="���Ӱ���" /></dt>
                        <dd><img src="/images/portal/online/main_txt22.gif" alt="02 - 3219 - 5483 / 6538" /></dd>
                        <dt class="bo_bn"><img src="/images/portal/online/main_txt3.gif" alt="��ȭ������" /></dt>
                        <dd class="bo_bn"><img src="/images/portal/online/main_txt33.gif" alt="02 - 3219 - 6534 / 5720" /></dd>
                    </dl-->
                </div>
            </div>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


