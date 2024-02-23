<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>
<%@ page import="kr.co.unp.mpm.vo.*" %>
<%@ page import="kr.co.unp.member.vo.*" %>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>카테고리</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>테마과정</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">테마과정</div>
</div>

<!--content-->
<div class="col-center mw-1280">
	<div class="lecture_info_box style_2">
		<div class="col-12 mb37 alert big_box type_1">
			<p class="alert_title" style="margin-bottom:35px; padding-left: 20px;">
			${result.title }
			</p>
			<div class="txt_ct mb40">
				<c:if test="${result.posterImg ne null && result.posterImg ne ''}">
					<img alt="${result.title }${result.description}" src="${result.posterImg}" style="width:100%;"/>
				</c:if>
			</div>
		</div>
	</div>

	<div class="col-12 mb17">
			<h2 class="main_title" style="margin-bottom: 10px;">PICK LIST</h2>
			<p class="guide_txt_box">
				아래 과정 중 <strong>수강을 원하는 과정</strong>만 선택해서 신청해 주세요.<br>
				<strong>썸네일</strong>을 누르시면 과정을 <strong>선택</strong> 할 수 있습니다.
			</p>
	</div>

	<div class="col-12 sub_board_body rowcard_box">
		<div class="col-12 theme_process_list_wrap">
			<!-- 반복 -->
			<c:forEach items="${themeSubjList }" var="list" varStatus="status" >
				<c:if test="${not empty list.courseId }">
				<div class="col-12 theme_process_list_con">
					<div class="theme_process_list">
						<div class="img_box">
							<img src="${list.imgfile}" alt="${list.courseName }">
						</div>
						<div class="text_box">
							<div class="check_style_0_con">
								<input type="checkbox" class="check_style_0" name="checkname" id="checkid_${list.courseSeq }" value="${list.courseSeq }">
								<%--<label for="checkid_${list.courseSeq }"><span class="tindent">${list.courseName}_체크박스</span></label>--%>
								<label for="checkid_${list.courseSeq }"><span></span></label>
							</div>
							<div class="online_edu_card_icon_con">
								<%--<span class="online_edu_card_icon">
									<img src="/edu/images/bm/online_pc_icon.png" alt="pc에서 재생가능" title="pc에서 재생가능">
								</span>
								<c:if test="${list.mobileUseYn eq 'Y' }">
								<span class="online_edu_card_icon">
									<img src="/edu/images/bm/online_mobile_icon.png" alt="모바일에서 재생가능" title="모바일에서 재생가능">
								</span>
								</c:if>--%>
								<h5>${list.courseName }</h5>
							</div>
							<p class="theme_process_list_desc">
								${list.intro }
							</p>
							<div class="theme_process_list_more_btn_con">
								<a href="javascript:void(0)"  onclick="javascript:fnCmdViewPage('${list.type }', '${list.courseId }', '${list.courseName }', '${list.isonoff }', '${list.scupperclass }', '${list.uclassnm }', '${list.year }', '${list.subjseq }'); return false;" class="btn_style_0">
									상세보기
								</a>
							</div>
						</div>

					</div>
					<div class="select_bg_box"></div>
				</div>
				</c:if>
			</c:forEach>
			<!-- //반복 -->
		</div>
	</div>
	<!--//content-->

	<div class="fixbar_box">
		<div class="inner-box col-center">
			<p>내가 PICK한 과정 수 <span> <b>0</b></span></p>
			<span>
			<a href="javascript:void(0)" class="btn_style_0 img_left edit online_edu blue" id="studySubj">학습하기</a>
			</span>
		</div>
	</div>

	<form id="frm" name="frm" method="post" class="form-inline">
		<input type="hidden" name="p_subj" id="p_subj" />
		<input type="hidden" name="p_subjnm" id="p_subjnm" />
		<input type="hidden" name="p_subjseq" id="p_subjseq" />
		<input type="hidden" name="p_year" id="p_year" value="" />
		<input type="hidden" name="s_subj" id="s_subj" value="" />
		<input type="hidden" name="s_year" id="s_year" value="" />
		<input type="hidden" name="s_subjseq" id="s_subjseq" value="" />
	</form>
</div>

<style>
	.board_util_btn_con .btn_style_0.img_left{padding-left: 20px;}
	/*[class*="col-"] [class*="col-"] img{width: 305px;}*/
	@media all and (max-width:640px) {
		[class*="col-"] [class*="col-"] img{width:100%;}
	}


</style>
<script type="text/javascript">
//과정 상세화면
function fnCmdViewPage(type, subj, subjnm, isonoff, scupperclass, uclassnm, year, subjseq){
	
	var url = "";
	if(type == "S"){
		$("#s_subj").val(subj);
		$("#s_year").val(year);
		$("#s_subjseq").val(subjseq);
		$("#p_subj").val(subj);
		$("#p_year").val(year);
		$("#p_subjseq").val(subjseq);
		$("#p_subjnm").val(subjnm);
		url = "/edu/onlineEdu/realm/view.do?menuNo=500027";
	}else{
		url = "/edu/onlineEdu/openLecture/view.do?pSeq="+subj+"&menuNo=500085&pageIndex=1";
	}
	
	$("#frm").attr({
				action:url,
				method:"post",
				target:"_self"
				});
	$("#frm").submit();
}
$(document).ready(function(){
	$("#studySubj").click(function(){
		var check_array = Array();
		var check_cnt = 0;
		var chkbox = $('input[name="checkname"]');
		
		for(i=0; i<chkbox.length; i++){
			if(chkbox[i].checked == true){
				check_array[check_cnt] 		= chkbox[i].value;
				check_cnt++;
			}
		}
		
		if(check_cnt == 0){
			alert("학습할 강의를 선택해 주세요.");
			return;
		}
		
		$.ajax({
			type:"POST",
			url:"/edu/onlineEdu/themeLecture/studySubjReg.json?menuNo=<c:out value='${paramVO.menuNo }'/>",
			data:{"p_course_id":JSON.stringify(check_array)},
			cache:false,
			async:false,
			dataType:"JSON",
			success:function(data){
				var result = data.result;
				if(result.sReturnCode == 'needLogin'){
					alert("로그인 후 사용해 주세요.");
					return;
				}else{
					var msg = "";
// 					msg += "정규강좌 " + result.sReturnSubjCnt + "건\n"
// 					msg += "열린강좌 " + result.sReturnGoldClassCnt + "건\n"
					msg += "수강 신청이 완료되었습니다.";
					alert(msg);
					location.replace("/edu/onlineEdu/mylctrum/list.do?menuNo=500061");
					return;
				}
				
			},
			error:function(){
				alert("서버와 통신 실패");
			}
			
		});
	});

	//card 선택 애니메이션

	$('.rowcard_box .theme_process_list .img_box').click(function (){
		//var selectbox = $(this).parent('.theme_process_list').hasClass('select');

		$(this).parent('.theme_process_list').addClass('select');
		$(this).siblings('.text_box').children('.check_style_0_con').children('.check_style_0').prop('checked',true);

		$(".fixbar_box b").text($("input:checkbox[name=checkname]:checked").length);
	});

	$('.rowcard_box .select_bg_box').click(function (){
		//var chkbox = $(this).siblings('.text_box').children('.check_style_0').is(':checked');

		$(this).siblings('.theme_process_list').removeClass('select');
		$(this).siblings('.theme_process_list').children('.text_box').children('.check_style_0_con').children('.check_style_0').prop('checked',false);

		$(".fixbar_box b").text($("input:checkbox[name=checkname]:checked").length);
	});

	$('.check_style_0').click(function (){
		var chkbox = $(this).is(':checked');
		if(chkbox){
			$(this).parents('.theme_process_list').addClass('select');
		} else{
			$(this).parents('.theme_process_list').removeClass('select');
		}

		$(".fixbar_box b").text($("input:checkbox[name=checkname]:checked").length);
	});

	
});
</script>
