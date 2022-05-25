<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    // ��������
    ArrayList<DataBox> noticeListTop = (ArrayList) request.getAttribute("noticeListTop");
    
    // �˾� ��������
    ArrayList<DataBox> noticeListPopup = (ArrayList) request.getAttribute("noticePopup");
    
    // �˸��� �α���� 
    ArrayList<DataBox> mainSubjectList   = (ArrayList)request.getAttribute("mainSubjectList");
    
    String courseImgPath = "";
    
    HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>
    
    upperMap   = ClassifySubjectBean.getMenuId(box);
%>

<%@ include file="/learn/user/portal/include/topMain-o.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script language="javascript">

    /* �˾� ���� ��ũ��Ʈ */
    var  width  = 0;
    var  height = 0;
    var  left   = 0;
    var  top    = 0;

    <%  for(int i=0; i < noticeListPopup.size(); i++){
            DataBox dbox =    noticeListPopup.get(i);  %>
      width  = <%=dbox.getString("d_popwidth")%>;
      height = <%=dbox.getString("d_popheight")%>;
      left   = <%=dbox.getString("d_popxpos")%>;
      top    = <%=dbox.getString("d_popypos")%>;
      url    = "/servlet/controller.homepage.MainServlet?p_process=popupview&p_seq=<%=dbox.getString("d_seq")%>&p_useframe=<%=dbox.getString("d_useframe")%>&p_popUpPreview=popUpPreview<%=dbox.getString("d_seq")%>";

        if ( notice_getCookie( "popUpPreview<%=dbox.getString("d_seq")%>" ) != "done" ){
          open_window("popUpPreview<%=dbox.getString("d_seq")%>",url,left,top,width,height, "no","no","no","yes","no");
        }
    <%  }  %>
//    if ( notice_getCookie( "popUppop_0414" ) != "done" ){
//        open_window("popUppop_0414","/popup/20100414/pop_0414.htm",100,100,400,400, "no","no","no","yes","no");
//      }


</script>
<SCRIPT LANGUAGE="JavaScript">

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
	
    function openMenu(p) {
        if(p == 'open') {
	        $('#main_menu').hide();
	        $('#menu_content').show();

	        run = setInterval("getNextIdx()", 2000); //�ڵ��϶� �̹��� ��ȯ�ð�����(2��)
        } else {
        	$('#main_menu').show();
            $('#menu_content').hide();
        }
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

    // �������� ������
    function moreNotice() {
        document.form1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.form1.p_process.value = "List";
        document.form1.menuid.value = "07";
        document.form1.gubun.value = "4";
        document.form1.target = "_self";
        document.form1.submit();
    }

    // �������� �󼼺���
    function viewNotice(seq) {
       document.form1.action = "/servlet/controller.homepage.HomeNoticeServlet";
       document.form1.p_process.value = "selectView";
       document.form1.menuid.value = "07";
       document.form1.gubun.value = "4";
       document.form1.p_seq.value= seq;
       document.form1.target = "_self";
       document.form1.submit();
    }

 	// ���� ���뺸��
    function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq, menuid){
	    document.form1.p_subj.value = subj;
	    document.form1.p_subjnm.value = subjnm;
	    document.form1.p_iscourseYn.value = courseyn;
	    document.form1.p_upperclass.value = upperclass;
	    document.form1.p_upperclassnm.value = upperclassnm;
	    document.form1.p_year.value = year;
	    document.form1.p_subjseq.value = subjseq;
	    document.form1.menuid.value = menuid;
	    document.form1.gubun.value = "1";
	    document.form1.p_process.value = 'SubjectPreviewPage';
	    document.form1.p_rprocess.value = 'SubjectList';
	    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
	    document.form1.target = "_self";
	    document.form1.submit();
    }
//-->
</SCRIPT>

<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" method="post">
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" name="p_rprocess" value="" />
    <input type="hidden" name="menuid" value="" />
    <input type="hidden" name="gubun" value="" />
    <input type="hidden" name="p_seq" value="" />
    
    <input type="hidden" name="p_subj" value="" />
    <input type="hidden" name="p_subjnm" value="" />
    <input type="hidden" name="p_iscourseYn" value="" />
    <input type="hidden" name="p_upperclass" value="" />
    <input type="hidden" name="p_upperclassnm" value="" />
    <input type="hidden" name="p_year" value="" />
    <input type="hidden" name="p_subjseq" value="" />
	    
	    <!--div id="topVisual" class="visual">
	    <script language="javascript">object_menuflash('intro.swf');</script>
	    </div-->
    
        <div class="visual">
            <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="920" height="480" id="top1" align="middle">
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="movie" value="/images/portal/flash/intro.swf" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <embed src="/images/portal/flash/intro.swf" wmode="transparent" quality="high" bgcolor="#ffffff" width="920" height="480" name="top1" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
                </object>
        </div>

        <div id="main_menu">
            <a href="javascript:openMenu('open');"><img src="/images/portal/btn/mainmenu_1.gif" alt="�˸���" /></a>
            <a href="javascript:openMenu('open');"><img src="/images/portal/btn/mainmenu_2.gif" alt="��������" /></a>
            <a href="javascript:openMenu('open');"><img src="/images/portal/btn/mainmenu_3.gif" alt="����ã�� �޴�" /></a>
        </div>
        
        <div id="menu_content" style="display:none;">
            <p class="close_btn"><a href="javascript:openMenu('close');"><img src="/images/portal/btn/btn_main_close.gif" alt="close" /></a></p>
            
            <div class="menu1">
                <p class="tit">
                    <img src="/images/portal/common/main_tit1.gif" alt="�˸���(�α����)" class="fl_l" />
                    <%  if(mainSubjectList != null && mainSubjectList.size() > 0) { %>
                    	<span class="fl_r">
                    <%
                    		for(int i = 0 ; i < mainSubjectList.size() ; i++) {
                    			if( i == 0) {
                    %>
                    				<a href="javascript:clickBanner(<%=i %>);"><img id="bannerImg" name="bannerImg" src="/images/portal/btn/btn_main_on.gif" alt="" border="0" /></a>
                    <%
                    			} else {
                    %>
                        			<a href="javascript:clickBanner(<%=i %>);"><img id="bannerImg" name="bannerImg" src="/images/portal/btn/btn_main_off.gif" onmouseover="imgover(this);" onmouseout="imgout(this);" alt="" border="0" /></a>
                    <% 			}
                    		} %>
                    	</span>
                    <% } %>
                </p>
                
                <%  if(mainSubjectList != null && mainSubjectList.size() > 0) { 
	                	for(int i = 0 ; i < mainSubjectList.size() ; i++) {
	                		DataBox dbox = mainSubjectList.get(i);
	                		if( !dbox.get("d_introducefilenamenew").equals("") ) {
                	        	if( dbox.get("d_introducefilenamenew").indexOf("upload") < 0 ) {
                	        		courseImgPath = "/servlet/controller.library.DownloadServlet?p_savefile=upload/bulletin/"+dbox.get("d_introducefilenamenew");
                	        	} else {
                	        		courseImgPath = "/servlet/controller.library.DownloadServlet?p_savefile="+dbox.get("d_introducefilenamenew");
                	        	}
                	        } else  {
                	        	courseImgPath = "/images/portal/thumb/photo_professor.jpg";
                	        }
	                		
	            			if( i == 0) {
	            %>
                	<p id="offline_banner" name="offline_banner"  class="banner">
                		<a href="javascript:view_On_Subj('<%=dbox.get("d_subj")%>','<%=dbox.get("d_subjnm")%>','<%=dbox.get("d_isonoff")%>','<%=dbox.get("d_scupperclass")%>','<%=dbox.get("d_uclassnm")%>','<%=dbox.get("d_scyear")%>','<%=dbox.get("d_subjseq")%>','<%=upperMap !=null && upperMap.get(dbox.get("d_scupperclass")) != null ?  upperMap.get(dbox.get("d_scupperclass")) : "00" %>')">
                		<img src="<%=courseImgPath %>" height="90" alt="<%=dbox.get("d_subjnm")%>" /></a>
                	</p>
                <%		
	            			} else {
	            %>
	            	<p id="offline_banner" name="offline_banner"   class="banner" style="display:none;">
	            		<a href="javascript:whenSubjInfo('<%=dbox.get("d_subj")%>','<%=dbox.get("d_subjnm")%>','<%=dbox.get("d_isonoff")%>','<%=dbox.get("d_scupperclass")%>','<%=dbox.get("d_uclassnm")%>','<%=dbox.get("d_scyear")%>','<%=dbox.get("d_subjseq")%>','<%=upperMap !=null && upperMap.get(dbox.get("d_scupperclass")) != null ?  upperMap.get(dbox.get("d_scupperclass")) : "00" %>')">
	            		<img src="<%=courseImgPath %>" height="90" alt="<%=dbox.get("d_subjnm")%>" /></a>
	            	</p>
	            <%			
	            			}
	                	}
                	}
                %>
            </div>

            <div class="menu2">
                <p class="tit">
                    <img src="/images/portal/common/main_tit2.gif" alt="��������" class="fl_l" />
                    <a href="javascript:moreNotice();" class="fl_r"><img src="/images/portal/btn/btn_main_more.gif" alt="������" /></a>
                </p>
                <ul class="list">
                <%  if(noticeListTop != null && noticeListTop.size() > 0 ) {
                		String v_onoffgubun = "";
                		
                	    int noticeListTopSize =  noticeListTop.size() > 5 ? 5 : noticeListTop.size(); 
                	    for(int i = 0 ; i < noticeListTopSize ; i++) {
                		    DataBox noticeBox = noticeListTop.get(i); 
                		    v_onoffgubun = noticeBox.getString("d_onoffgubun");
	                		if( v_onoffgubun.equals("C") ) {
	                			v_onoffgubun = "[ON]";
	                        } else if( v_onoffgubun.equals("C") ) {
	                        	v_onoffgubun = "[OFF]";
	                        } else {
	                        	v_onoffgubun = "";
	                        }
	             %>
                    <li><a href="javascript:viewNotice(<%=noticeBox.getString("d_seq") %>);">
                    <%	if( !v_onoffgubun.equals("") ) { %>
                    	<%=v_onoffgubun %><%=StringManager.formatTitle(StringManager.removeHTML(noticeBox.getString("d_adtitle")), 20) %>
                    <%  } else { %>
                    	<%=StringManager.formatTitle(StringManager.removeHTML(noticeBox.getString("d_adtitle")), 25) %>
                    <%  } %>
                    </a></li>
                <%      }
                	}%>
                </ul>
            </div>

            <div class="menu3" >
                <p class="tit"><img src="/images/portal/common/main_tit3.gif" alt="����ã�¸޴�" /></p>
                <ul class="list2">
                    <li><a href="javascript:menuForward(1, '01')">���������ȳ�</a></li>
                    <!-- <li><a href="javascript:menuForward(4, '06')">�¶��θ޴���</a></li> -->
                    <li><a href="javascript:menuForward(1, '12')">(ON)������������</a></li>
                    <li><a href="javascript:menuForward(1, '11')">(ON)������������</a></li>
                </ul>
                <ul class="list2">
                    <!-- <li><a href="javascript:menuForward(3, '11')">�������� ����</a></li>  
                    <li><a href="javascript:menuForward(3, '17')">������û Ȯ��/���</a></li> 
                    <li><a href="javascript:menuForward(3, '12')">���ǻ�㳻��</a></li> -->
                    <li><a href="javascript:menuForward(5, '08')">�����ı�</a></li>
                    <li><a href="javascript:menuForward(2, '05')">(OFF)������������</a></li>
                    <li><a href="javascript:menuForward(2, '06')">(OFF)������������</a></li>
                </ul>
                <ul class="list3">
                    <li><a href="javascript:menuForward(5, '03')">�����ڷ��</a></li>
                    <li><a href="javascript:menuForward(5, '01')">���Ŭ����</a></li>
                    <li><a href="javascript:menuForward(5, '02')">�ǹ�����</a></li>
                </ul>
            </div>
        </div>
        
        <div id="allmenu" style="display:none;"></div>
</form>
<!-- form �� -->
<%//���̾ƿ� ������ ���� ���� ǥ�� %>
<!-- footer -->
    </div>
    
</div>
<!--// container -->
<hr />

    <!-- Footer Menu ���� -->
    <%@ include file="/learn/user/portal/include/footer_include.jsp" %>
    <!-- Footer Menu ���� -->

</body>
</html>
<!--// footer -->


