
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>

<%-- <ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO" /> --%>


<!--content-->

<form id="frm" name="frm" action="/edu/onlineEdu/${paramVO.programId}/listQestnr.do?menuNo=<c:out value='${paramVO.menuNo }'/>" method="post" class="form-inline">
	<input type="hidden" name="p_subj" id="p_subj" value="${param.p_subj }" />
	<input type="hidden" name="p_subjnm" id="p_subjnm" value="${param.p_subjnm }" />
	<input type="hidden" name="p_grcode" id="p_grcode" value="" />
	<input type="hidden" name="p_gyear" id="p_gyear" value="" />
	<input type="hidden" name="p_subjseq" id="p_subjseq" value="${param.p_subjseq }" />
	
	<input type="hidden" name="p_sulpapernum" id="p_sulpapernum" value="" />
	<input type="hidden" name="p_sulpapernm" id="p_sulpapernm" value="" />
	<input type="hidden" name="p_sulstart" id="p_sulstart" value="" />
	<input type="hidden" name="p_sulend" id="p_sulend" value="" />
	<input type="hidden" name="p_sulnums" id="p_sulnums" value="" />
	
	<input type="hidden" name="s_subj" id="s_subj" value="" />
	<input type="hidden" name="s_grcode" id="s_grcode" value="" />
	<input type="hidden" name="p_listok" id="p_listok" value="" />
	
    <input type="hidden" name="p_answers" id="p_answers" value="" />
	<input type="hidden" name="p_reloadlist" id="p_reloadlist" value="" />
	<input type="hidden" name="p_isalways" id="p_isalways" value="<c:out value="${param.p_isalways }"/>" />
	
	<input type="hidden" name="p_searchtext" id="p_searchtext" value="${param.p_searchtext }" />
	<input type="hidden" name="p_orders" id="p_orders" value="<c:out value="${param.p_orders }"/>" />
	<input type="hidden" name="p_ordersnm" id="p_ordersnm" value="<c:out value="${param.p_ordersnm }"/>" />
	
	
	<input type="hidden" name="pGubun1" id="pGubun1" value="${param.pGubun1 }" />
	<input type="hidden" name="pGubun2" id="pGubun2" value="${param.pGubun2 }" />
	<input type="hidden" name="pGubun3" id="pGubun3" value="${param.pGubun3 }" />
	
	<!-- paging s -->
	<input type="hidden" name="gubun" id="gubun" value="<c:out value='${param.gubun }' />" />
	<input type="hidden" name="option1" id="option1" value="<c:out value='${param.option1 }' />" />
	<input type="hidden" name="option5" id="option5" value="<c:out value='${param.option5 }' />" />
	<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${param.pageIndex }' />" />
	<!-- paging e -->
	
	
	<!-- setp menu param s -->
	<input type="hidden" name="p_subj_step" id="p_subj_step" value="${param.p_subj_step }" />
	<input type="hidden" name="p_subjnm_step" id="p_subjnm_step" value="${param.p_subjnm_step }" />
	<input type="hidden" name="p_isonoff" id="p_isonoff" value="${param.p_isonoff }" />
	<input type="hidden" name="p_scupperclass" id="p_scupperclass" value="${param.p_scupperclass }" />
	<input type="hidden" name="p_uclassnm" id="p_uclassnm" value="${param.p_uclassnm }" />
	<input type="hidden" name="p_year" id="p_year" value="${param.p_year }" />
	<input type="hidden" name="p_subjseq_step" id="p_subjseq_step" value="${param.p_subjseq_step }" />
	<input type="hidden" name="p_tabselect" id="p_tabselect" value="<c:out value="${param.p_tabselect }"/>" />
	<!-- setp menu param e -->
	
</form>

<div class="sub_title s_tit02">
	<div class="">
		<div class="col-12 mb30 alert big_box" style="background-color: #222;">
			<!-- ??????????????? -->
			<div class="lectProgressSet">
				<div class="lecProgress"></div>
				<div class="lectProBar mt5">
					<div class="progress-bar progress-bar-success" style="width:<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%" title="<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />% ?????????">
						<%--<span class="icon progressInfo"><fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" /><span class="sr-only">% ?????????</span></span>--%>
					</div>
					<%--<c:choose>
                        <c:when test="${p_subj eq 'CK20010'}">
                            <div class="progress-bar progressIng" style="width: 100%;" title="???????????? ??????100%">
                                <span class="sr-only">???????????? ??????100%</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="progress-bar progressIng" style="width: 70%;" title="???????????? ??????70%">
                                <span class="sr-only">???????????? ??????70%</span>
                            </div>
                        </c:otherwise>
                    </c:choose>--%>

				</div>
				<p class="point" align="left"><strong>????????? : <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%</strong></p>
				<%--<c:choose>
                    <c:when test="${p_subj eq 'CK20010'}">
                        <div class="row">
                            <div class="col-md-6">???????????? ?????? 100%</div>
                            <c:if test="${myProgress ge 100.0 }">
                                <div class="col-md-6 tar"><span class="icon icoSm lectCheck"></span> ?????????</div>
                            </c:if>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <div class="col-md-6">???????????? ?????? 70%</div>
                            <c:if test="${myProgress ge 70.0 }">
                                <div class="col-md-6 tar"><span class="icon icoSm lectCheck"></span> ?????????</div>
                            </c:if>
                        </div>
                    </c:otherwise>
                </c:choose>--%>
			</div>
			<!-- //??????????????? -->
			<%--<p class="alert_title" style="margin-bottom:0;">${view.subjnm }</p>--%>
			<%-- <c:set var="arrayofedumans" value="${fn:split(view.edumans,'-')}"/>
            <c:forEach var="i" begin="0" end="${fn:length(arrayofedumans)-1 }" varStatus="status">
                - ${arrayofedumans[i] } <c:if test="${not status.last }"> <br /></c:if>
            </c:forEach> --%>
			<a href="javascript:void(0);" onclick="fnCmdSubjList('${paramVO.menuNo }', '${param.pGubun1 }', '${param.pGubun2 }', '${param.pGubun3 }'); return false;" class="return_list_box gnb_close">
				<img src="/edu/img/gnb_close.png" alt="GNB ?????? ??????" style="padding: 0px; display: inline-block;">
				<%--<input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="GNB ?????? ??????" style="padding: 0px; display: inline-block;">--%>
			</a>
		</div>
	</div>
</div>

<!-- step ?????? s -->
<jsp:include page="/WEB-INF/jsp/edu/onlineEdu/realm/eduStep.jsp" flush="true" />
<!-- step ?????? e -->


<div class="col-center mw-1280">
	<div class="table-responsive">
		<table class="table table-styling pc_table table-hover txt_ct">
		<caption>????????? ??????(??????, ?????????, ???????????????, ????????? ???????????? ???)</caption>
		<colgroup>
		<col style="width:10%;" />
		<col  />
		<col style="width:12%;" />
		<col style="width:12%;" />
		</colgroup>
		<thead>
			<tr>
				<th>??????</th>
				<th>?????????</th>
				<th scope="col">???????????????</th>
				<th scope="col">??????</th>
			</tr>
		</thead>
		<tbody>
			<!-- ?????? ?????? ?????? -->
			<c:forEach items="${subjQestnrList }" var="item" varStatus="status">
				<tr>
					<td class="vt_mid"><c:out value="${status.count }" /></td>
					<td class="tal vt_mid">[<c:out value="${item.subjnm }" />] <c:out value="${item.sulpapernm }" /> </td>
					<td class="vt_mid"><fmt:parseNumber integerOnly="true" value="${item.tstep }" type="number" /> / <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" /></td>
					<td class="vt_mid">
						<c:choose>
							<c:when test="${item.eachcnt eq '1'}">
								<a href="javascript:void(0);" onclick="return false;" class="btn btn-xs btn-default">??????</a>
							</c:when>
							<c:when test="${item.eachcnt eq '0' and myProgress >= item.progress }">
								<c:choose>
									<c:when test="${item.dispyn eq 'Y' }">
										<a href="javascript:void(0);" onclick="fnCmdQestnr('${item.subjnm}', '${item.subj }', '${item.grcode }', '${item.year }', '${item.subjseq }', '${item.sulpapernum }', '${item.sulpapernm }', '', '', '${item.sulnums }'); return false;" class="btn btn-xs btn-default" style="color:#3B85FF; font-weight: 600;">??????</a>
									</c:when>
									<c:otherwise>
										??????????????????
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${item.eachcnt eq '0' and myProgress < item.progress }">
								<c:choose>
									<c:when test="${item.dispyn eq 'Y' }">
										????????????
									</c:when>
									<c:otherwise>
										??????????????????
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>????????????</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			
			<!-- ?????? ?????? ?????? -->
			<c:forEach items="${contentsQestnrList }" var="item" varStatus="status">
				<tr>
					<td><c:out value="${status.count }" /></td>
					<td class="tal">[<c:out value="${item.subjnm }" />] <c:out value="${item.sulpapernm }" /> </td>
					<td><fmt:parseNumber integerOnly="true" value="${item.tstep }" type="number" /> / <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" /></td>
					<td>
						<c:choose>
							<c:when test="${item.contentsdata eq '0'}">
								<a href="javascript:void(0);" onclick="fnCmdQestnr('${item.subjnm}', '${item.subj }', '${item.grcode }', '${item.year }', '${item.subjseq }', '${item.sulpapernum }', '${item.sulpapernm }', '', '', '${item.sulnums }'); return false;" class="btn btn-xs btn-default"><span class="ico icoEdu"></span>??????</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="return false;" class="btn btn-xs btn-default"><span class="ico icoEdu"></span>??????</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			
			
			<c:if test="${empty contentsQestnrList && empty subjQestnrList }">
				<tr><td colspan="4" style="text-align: center">?????? ????????? ????????????</td></tr>
			</c:if>
			
		
		</tbody>
	</table>
	
	
	
		
	<div class="bdPoll" style="display: none;" id="qestnrArea">
		<h2></h2>
		<fieldset>
			<legend>????????? ????????????</legend>
			<form id="frm2" name="frm2" action="" method="post" class="form-inline">
				<ol class="decimal" id="qestnrExamArea"></ol>
			</form>
		</fieldset>
		<div class="btnSet tac">
			<a href="javascript:void(0);" onclick="fnCmdQestnrInsert(); return false;" class="btn btn-whitegray"><span class="ico icoList"></span> ????????? ??????</a>
		</div>
	
	</div>

	
	
</div>

	<!-- mobile table -->
	<ul class="board_type_0 mo_table">
		<!-- ?????? ?????? ?????? -->
		<c:forEach items="${subjQestnrList }" var="item" varStatus="status">
			<li class="table_list _notice">
					<div class="left_box">
						<c:out value="${status.count }" />
					</div>
					<div class="right_box">
						<p class="title">
							[<c:out value="${item.subjnm }" />] <c:out value="${item.sulpapernm }" />
						</p>
						<p class="date_view">
							<span><fmt:parseNumber integerOnly="true" value="${item.tstep }" type="number" /> / <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" /></span>
							<span>
							?????? :
								<c:choose>
									<c:when test="${item.eachcnt eq '1'}">
										<a href="javascript:void(0);" onclick="return false;" class="btn btn-xs btn-default"></span>??????</a>
									</c:when>
									<c:when test="${item.eachcnt eq '0' and myProgress >= item.progress }">
										<c:choose>
											<c:when test="${item.dispyn eq 'Y' }">
												<a href="javascript:void(0);" onclick="fnCmdQestnr('${item.subjnm}', '${item.subj }', '${item.grcode }', '${item.year }', '${item.subjseq }', '${item.sulpapernum }', '${item.sulpapernm }', '', '', '${item.sulnums }'); return false;" class="btn btn-xs btn-default"></span>??????</a>
											</c:when>
											<c:otherwise>
												??????????????????
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${item.eachcnt eq '0' and myProgress < item.progress }">
										<c:choose>
											<c:when test="${item.dispyn eq 'Y' }">
												????????????
											</c:when>
											<c:otherwise>
												??????????????????
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>????????????</c:otherwise>
								</c:choose>
							</span>
						</p>
					</div>
			</li>
		</c:forEach>

		<!-- ?????? ?????? ?????? -->
		<c:forEach items="${contentsQestnrList }" var="item" varStatus="status">
			<tr>
				<td><c:out value="${status.count }" /></td>
				<td class="tal">[<c:out value="${item.subjnm }" />] <c:out value="${item.sulpapernm }" /> </td>
				<td><fmt:parseNumber integerOnly="true" value="${item.tstep }" type="number" /> / <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" /></td>
				<td>
					<c:choose>
						<c:when test="${item.contentsdata eq '0'}">
							<a href="javascript:void(0);" onclick="fnCmdQestnr('${item.subjnm}', '${item.subj }', '${item.grcode }', '${item.year }', '${item.subjseq }', '${item.sulpapernum }', '${item.sulpapernm }', '', '', '${item.sulnums }'); return false;" class="btn btn-xs btn-default"><span class="ico icoEdu"></span>??????</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="return false;" class="btn btn-xs btn-default"><span class="ico icoEdu"></span>??????</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>

		<c:if test="${empty contentsQestnrList && empty subjQestnrList }">
			<tr><td colspan="4" style="text-align: center">?????? ????????? ????????????</td></tr>
		</c:if>
	</ul>
</div>


<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript">
//<![CDATA[
           
           
	$(document).ready(function(){
		$('header').remove();

		$('.wrapper, .bg_gray_slide_box, .sub_title.s_tit02').css('padding-top','0');
	});
	
	
	//?????? ??????
	function fnCmdQestnr(p_subjnm, p_subj, p_grcode, p_gyear, p_subjseq, p_sulpapernum, p_sulpapernm, p_sulstart, p_sulend, p_sulnums){
		
		$("#p_subj").val(p_subj);
		$("#p_subjnm").val(p_subjnm);
		$("#p_grcode").val(p_grcode);
		$("#p_gyear").val(p_gyear);
		$("#p_subjseq").val(p_subjseq);
		$("#p_sulpapernum").val(p_sulpapernum);
		$("#p_sulpapernm").val(p_sulpapernm);
		$("#p_sulstart").val(p_sulstart);
		$("#p_sulend").val(p_sulend);
		$("#p_sulnums").val(p_sulnums);
		
		$("#s_subj").val(p_subj);
		$("#s_grcode").val(p_grcode);
		$("#p_listok").val("0");
		
		$.ajax({
			type:"POST",
			url:"/edu/onlineEdu/mylctrum/listQestnar.json?menuNo=<c:out value='${paramVO.menuNo }'/>",
			data:{
				"p_subjnm":p_subjnm,
				"p_subj":"ALL",
				"p_grcode":"ALL",
				"p_gyear":p_gyear,
				"p_subjseq":p_subjseq,
				"p_sulpapernum":p_sulpapernum,
				"p_sulpapernm":p_sulpapernm,
				"p_sulstart":p_sulstart,
				"p_sulend":p_sulend,
				"p_sulnums":p_sulnums
				},
			cache:false,
			async:false,
			dataType:"JSON",
			success:function(data){
				
				if(data != null){
					$("#qestnrArea > h2").html("["+p_subjnm+"] "+p_sulpapernm+"");
					$("#qestnrExamArea").html(data.qestnarList);
					$("#qestnrArea").show();
				}
			},
			error:function(){
				alert("????????? ?????? ??????");
			}
			
		});
	}
	
	
	//????????? ??????
	function fnCmdQestnrInsert(){
		
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
		
		for(i = 0; i < document.frm2.length; i++) {
			c_name  = document.frm2.elements[i].name;
			c_value = document.frm2.elements[i].value;
			
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
			
			if (document.frm2.elements[i].type=="checkbox") {
				b_type="checkbox";
				if (document.frm2.elements[i].checked==true) {
					temp = temp+c_value+':';
				}
			} else if (document.frm2.elements[i].type=="radio") {
				b_type="radio";
				
				if (document.frm2.elements[i].checked==true) {
					temp = c_value;
				}
			} else if (document.frm2.elements[i].type=="text"||document.frm2.elements[i].type=="textarea") {
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
		
		if (replycnt < answercnt) {
			alert("???????????? ?????? ????????? ????????????.");
			return;
		}
		
		$("#p_answers").val(result);
		$("#p_reloadlist").val("true");
		
		var options = {
			url: "/edu/onlineEdu/mylctrum/insertQestnar.json?menuNo=<c:out value='${paramVO.menuNo }'/>",
			dataType: "json",
			type: "post",
			success : function(data) {
				
				alert(data.system_msg);
				$(location).attr("href", "/edu/onlineEdu/mylctrum/listQestnr.do?menuNo=<c:out value='${paramVO.menuNo }'/>&p_subj="+$("#p_subj").val()+"&p_year="+$("#p_year").val()+"&p_subjseq="+$("#p_subjseq").val()+"&p_isonoff="+$("#p_isonoff").val()+"&p_scupperclass="+$("#p_scupperclass").val()+"&p_uclassnm="+$("#p_uclassnm").val());
				
			},
			error:function (){
				alert("????????? ????????? ??????????????????.\n?????? ??? ?????? ??????????????????!");
				return false;
			}
		}
		$("#frm").ajaxSubmit(options);
		
	}
	
//]]>
</script>

