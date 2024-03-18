<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication var="user" property="principal"/>
<c:set value="${user != 'anonymousUser' ? user.username : '' }" var="userVrify" />
<c:set value="${userVrify }" var="idCeck" />

<c:set value="${not empty param.p_subj_step?param.p_subj_step:param.p_subj }" var="stepsubj" />
<c:set value="${not empty param.p_subjnm_step?p_subjnm_step:param.p_subjnm }" var="stepsubjnm" />
<c:set value="${not empty param.p_subjseq_step?p_subjseq_step:param.p_subjseq }" var="stepsubjseq" />

<div class="tab_style_1_con mg_b40">
	<ul class="tab_style_1 three_tab size_24">
		<li <c:if test="${empty param.p_tabselect}">class="active"</c:if>>
			<c:if test="${empty param.p_tabselect}">
				<a href="javascript:void(0);">
					<span>학습하기</span>
				</a>
			</c:if>
			<c:if test="${not empty param.p_tabselect}">
				<a href="javascript:void(0);" onclick="fnCmdLrnActionView('${param.p_year}', '', '', '', '${param.s_contenttype }', '${param.p_subj }', '${param.p_subjseq }', '${param.s_lesson }', '${param.p_subjnm }', '${param.p_scupperclass }'); return false;">
					<span>학습하기</span>
				</a>
			</c:if>
		</li>

		<c:if test="${not empty idCeck  }">
			<c:if test="${param.pGubun1 ne 'Y0' }">
				<li <c:if test="${param.p_tabselect eq 'qestnr' }">class="active"</c:if>>
					<c:if test="${param.p_tabselect eq 'qestnr' }">
						<a href="javascript:void(0);"><span>설문</span></a>
					</c:if>
					<c:if test="${param.p_tabselect ne 'qestnr' }">
						<a href="javascript:void(0);" onclick="fnCmdQestnrList('${stepsubj }', '${stepsubjnm }', '${param.p_isonoff }', '${param.p_scupperclass }', '${param.p_scupperclass }', '${param.p_year }', '${stepsubjseq }'); return false;"><span>설문</span></a>
					</c:if>
				</li>
			</c:if>

			<c:if test="${param.pGubun1 ne 'Y0' }">
				<li <c:if test="${param.p_tabselect eq 'listData' }">class="active"</c:if>>
					<c:if test="${param.p_tabselect eq 'listData' }">
						<a href="javascript:void(0);">
							<span>자료실</span>
						</a>
					</c:if>
					<c:if test="${param.p_tabselect ne 'listData' }">
						<a href="javascript:void(0);" onclick="fnCmdDataList(); return false;">
							<span>자료실</span>
						</a>
					</c:if>
				</li>
			</c:if>

		</c:if>
	</ul>
</div>

<c:set var="subTitle" value=""/>
<c:set var="removeTitle" value="N"/>

<c:if test="${param.p_tabselect eq 'view' or param.p_tabselect eq '' }">
	<c:set var="subTitle" value="과정정보 | "/>
</c:if>

<c:if test="${param.p_tabselect eq 'qestnr' }">
	<c:set var="subTitle" value="설문(목록) | "/>
	<c:set var="removeTitle" value="Y"/>
</c:if>

<c:if test="${param.p_tabselect eq 'listData' }">
	<c:set var="subTitle" value="자료실(목록) | "/>
	<c:set var="removeTitle" value="Y"/>
</c:if>

<script type="text/javascript">
    if('<c:out value="${removeTitle}" />' == 'Y'){
	    $('title').html( $('title').html().replace('(목록)', '') );
	    $('title').html( $('title').html().replace(' |', '<') );
    }
    $('title').html( '<c:out value="${subTitle}"/>' + $('title').html() );

	//학습하기
	function fnCmdLrnActionView(year, cpsubj, cpsubjseq, company, contenttype, subj, subjseq, lesson, subjnm, upperclass) {
		if (typeof previewPopupWin !== "undefined") previewPopupWin.close();

		if (lesson == "") {
			lesson = "001";
		}

		$("#s_year").val(year);
		$("#s_cpsubj").val(cpsubj);
		$("#s_cpsubjseq").val(cpsubjseq);
		$("#s_company").val(company);
		$("#s_contenttype").val(contenttype);
		$("#s_subj").val(subj);
		$("#s_subjseq").val(subjseq);
		$("#s_lesson").val(lesson);
		$("#p_subjnm").val(subjnm);
		$("#p_tabselect").val("");

		$("#frm").attr({
			action: "/edu/onlineEdu/realm/viewEdu.do?menuNo=<c:out value='${param.menuNo }'/>",
			method: "post",
			target: "_self"
		});
		$("#frm").submit();
	}

	//과정 상세화면
	function fnCmdViewPage(subj, subjnm, isonoff, scupperclass, uclassnm, year, subjseq){

		$("#p_subj").val(subj);
		$("#p_subjnm").val(subjnm);
		$("#p_isonoff").val(isonoff);
		$("#p_scupperclass").val(scupperclass);
		$("#p_uclassnm").val(uclassnm);
		$("#p_year").val(year);
		$("#p_subjseq").val(subjseq);

		$("#p_tabselect").val("view");

		$("#frm").attr({
					action:"/edu/onlineEdu/realm/view.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun="+$("#pGubun1").val()+"&option1="+$("#pGubun2").val()+"&option5="+$("#pGubun3").val()+"&pageIndex=<c:out value='${param.pageIndex}' />",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}

	//과정 조회
	function fnCmdSubjList(menuNo, gubun1, gubun2, gubun3){

		var menu = "";
		if(menuNo == "500029"){
			menu = "occp";
		}else{
			menu = "realm";
		}

		$("#pGubun1").val(gubun1);
		$("#pGubun2").val(gubun2);
		$("#pGubun3").val(gubun3);
		$("#frm").attr({
					action:"/edu/onlineEdu/"+menu+"/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun="+gubun1+"&option1="+gubun2+"&option5="+gubun3+"&pageIndex=<c:out value='${param.pageIndex}' />",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}

	//설문 목록화면
	function fnCmdQestnrList(subj, subjnm, isonoff, scupperclass, uclassnm, year, subjseq){
		$("#p_subj").val(subj);
		$("#p_subjnm").val(subjnm);
		$("#p_isonoff").val(isonoff);
		$("#p_scupperclass").val(scupperclass);
		$("#p_uclassnm").val(uclassnm);
		$("#p_year").val(year);
		$("#p_subjseq").val(subjseq);

		$("#p_tabselect").val("qestnr");

		$("#frm").attr({
					action:"/edu/onlineEdu/mylctrum/listQestnr.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun="+$("#pGubun1").val()+"&option1="+$("#pGubun2").val()+"&option5="+$("#pGubun3").val()+"&pageIndex=<c:out value='${param.pageIndex}' />",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}

	//찜하기, 취소
	function fnCmdRegSubjFavor(classtype, subj, jobtype){
		$.ajax({
			type:"POST",
			url:"/edu/onlineEdu/mylctrum/regSubjFavorInsert.json?menuNo=<c:out value='${paramVO.menuNo }'/>",
			data:{
				"p_classtype":classtype,
				"p_subj":subj,
				"p_jobtype":jobtype
				},
			cache:false,
			async:false,
			dataType:"JSON",
			success:function(data){

				if(data.result == "1"){

					if(jobtype == "register"){
						$("#regsubjfavor").html("<a href=\"#\" onclick=\"fnCmdRegSubjFavor('01', '"+subj+"', 'cancel'); return false;\"><span><span class=\"ico ico03\"></span>찜취소</span></a>");

					}else if(jobtype == "cancel"){
						$("#regsubjfavor").html("<a href=\"#\" onclick=\"fnCmdRegSubjFavor('01', '"+subj+"', 'register'); return false;\"><span><span class=\"ico ico03\"></span>찜하기</span></a>");
					}

					alert(data.system_msg);

				}else{
					alert(data.system_msg);
					return;
				}

			},
			error:function(){
				alert("서버와 통신 실패");
			}

		});
	}

	//과정 자료실 목록화면
	function fnCmdDataList(){
		$("#p_tabselect").val("listData");
		$("#frm").attr({
					action:"/edu/onlineEdu/realm/listData.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun="+$("#pGubun1").val()+"&option1="+$("#pGubun2").val()+"&option5="+$("#pGubun3").val()+"&pageIndex=<c:out value='${param.pageIndex}' />",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}
</script>