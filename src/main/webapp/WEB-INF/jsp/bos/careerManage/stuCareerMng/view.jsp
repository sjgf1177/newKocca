<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
//<![CDATA[
	$(document).ready(function(){
		var interFieldStr = "<c:out value='${result.interField}'/>";
		var interFieldArr = interFieldStr.split(",");
		for (var i=0; i<interFieldArr.length; i++) {
			for (j=0; j<$("input[name='interFieldCheck']").length; j++) {
				if (interFieldArr[i] == $("input[name='interFieldCheck']")[j].value){
					$("input[name='interFieldCheck']")[j].checked = true;
				}
			}
		}
		
		var interJobStr = "<c:out value='${result.interJob}' />";
		var interJobArr = interJobStr.split(",");
		for (var i=0; i<interJobArr.length; i++) {
			for (j=0; j<$("input[name='interJobCheck']").length; j++) {
				if (interJobArr[i] == $("input[name='interJobCheck']")[j].value){
					$("input[name='interJobCheck']")[j].checked = true;
				}
			}
		}
		
		$("#email3").on("change", function(){
			$("#email2").val($("#email3").val());
		});
		
		$("#interField1").on("change",function(){
			if($("#interField1").is(":checked") == true){
				$("input[name=fldStrDtl]").removeAttr("disabled");
			} else {
				$("input[name=fldStrDtl]").val("");
				$("input[name=fldStrDtl]").attr("disabled","disabled");
			}
		});
		
		$("#interField15").on("change",function(){
			if($("#interField15").is(":checked") == true){
				$("input[name=fldEtcDtl]").removeAttr("disabled");
			} else {
				$("input[name=fldEtcDtl]").val("");
				$("input[name=fldEtcDtl]").attr("disabled","disabled");
			}
		});
		
		$("#interJobEtc").on("change",function(){
			if($("#interJobEtc").is(":checked") == true){
				$("input[name=jobEtcDtl]").removeAttr("disabled");
			} else {
				$("input[name=jobEtcDtl]").val("");
				$("input[name=jobEtcDtl]").attr("disabled","disabled");
			}
		});
		
		
	})
	
	function update(){
		var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
		var email = $("#email1").val() + "@" + $("#email2").val();
		var interField = "";
		var interJob = "";
		
		for (var i=0; i<$("input[name='interFieldCheck']").length; i++) {
			if($("input[name='interFieldCheck']")[i].checked){
				if(interField.length > 0){
					interField = interField + "," + $("input[name='interFieldCheck']")[i].value;
				} else {
					interField = interField + $("input[name='interFieldCheck']")[i].value;
				}
			}
		}
		
		for (var i=0; i<$("input[name='interJobCheck']").length; i++) {
			if($("input[name='interJobCheck']")[i].checked){
				if(interJob.length > 0){
					interJob = interJob + "," + $("input[name='interJobCheck']")[i].value;
				} else {
					interJob = interJob + $("input[name='interJobCheck']")[i].value;
				}
			}
		}
		
		$("#phone").val(phone);
		$("#email").val(email);
		$("#interField").val(interField);
		$("#interJob").val(interJob);
		
		var form = $("#stuDetailForm")[0];
		var v = new MiyaValidator(form);
		
		v.add("stuNm", {
	        required: true
	    });
		
		v.add("gender", {
	        required: true
	    });
		
		v.add("birth", {
	        required: true
	    });
		
		v.add("email1", {
			required : true,
			span : 2,
			glue : "@",
			option : "email"
		});

		v.add("phone1", {
			required : true,
			span : 3,
			glue : "-",
			option : "handphone"
		});
		
		v.add("jobSearchYn", {
	        required: true
	    });
		
		v.add("interField", {
	        required: true
	    });
		
		v.add("interJob", {
	        required: true
	    });
		
		var result = v.validate();
		if (!result) {
			alert(v.getErrorMessage());
			v.getErrorElement().focus();
			return;
		}
		
		if (confirm("?????????????????????????")) {
			form.submit();
		}
		
	}
	
	function del(){
		
	}
	
//]]>
</script>
<form id="stuDetailForm" name="stuDetailForm" method="post" action="/bos/careerManage/stuCareerMng/update.do?menuNo=100245" class="form-inline">
	<input type="hidden" name="stuSn" id="stuSn" value="<c:out value='${result.stuSn }' />" />
	<input type="hidden" name="phone" id="phone" value="" />
	<input type="hidden" name="email" id="email" value="" />
	<input type="hidden" name="interField" id="interField" value="" />
	<input type="hidden" name="interJob" id="interJob" value="" />
	<div class="bdView">
		<table class="table table-bordered">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="stuNm">??? ???</label></th>
					<td colspan="3"><input type="text" name="stuNm" id="stuNm" value="<c:out value="${result.stuNm}" />" style="width:40%;" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="gender">??? ???</label></th>
					<td>
						<label><input type="radio" name="gender" value="M" <c:if test="${result.gender eq 'M'}">checked</c:if>>??????</label>
						<label><input type="radio" name="gender" value="F" <c:if test="${result.gender eq 'F'}">checked</c:if>>??????</label>
					</td>
					<th scope="row"><label for="birth">????????????</label></th>
					<td>
						<input type="text" id="birth" name="birth" class="sdate" title="????????????" style="width:130px" value="<fmt:formatDate value="${result.birth }" pattern="yyyy-MM-dd"/>" />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="phone">?????????</label></th>
					<td colspan="3">
						<select name="phone1" id="phone1">
							<option value="">??????</option>
							<option value="010" <c:if test="${result.phone1 eq '010'}">selected</c:if>>010</option>
							<option value="011" <c:if test="${result.phone1 eq '011'}">selected</c:if>>011</option>
							<option value="016" <c:if test="${result.phone1 eq '016'}">selected</c:if>>016</option>
							<option value="017" <c:if test="${result.phone1 eq '017'}">selected</c:if>>017</option>
							<option value="018" <c:if test="${result.phone1 eq '018'}">selected</c:if>>018</option>
							<option value="019" <c:if test="${result.phone1 eq '019'}">selected</c:if>>019</option>
						</select> - 
						<input type="text" name="phone2" id="phone2" value="${result.phone2}"/> - 
						<input type="text" name="phone3" id="phone3" value="${result.phone3}"/>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="email">?????????</label></th>
					<td colspan="3">
						<input type="text" name="email1" id="email1" value="${result.email1}"/>
						@
						<input type="text" name="email2" id="email2" value="${result.email2}"/>
						<select name="email3" id="email3">
							<option value="">????????????</option>
							<option value="naver.com" <c:if test="${result.email2 eq 'naver.com'}">selected</c:if>>naver.com</option>
							<option value="daum.net" <c:if test="${result.email2 eq 'daum.net'}">selected</c:if>>daum.net</option>
							<option value="gmail.com" <c:if test="${result.email2 eq 'gmail.com'}">selected</c:if>>gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="jobSearchYn">?????? ??? ????????????</label></th>
					<td colspan="3">
						<label><input type="radio" name="jobSearchYn" value="Y" <c:if test="${result.jobSearchYn eq 'Y'}">checked</c:if>>??????</label>
						<label><input type="radio" name="jobSearchYn" value="N" <c:if test="${result.jobSearchYn eq 'N'}">checked</c:if>>??????</label>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="interField">????????????</label></th>
					<td colspan="3">
						<label class="interFieldLabel col3">
							<input type="checkbox" name="interFieldCheck" id="interField1" value="01"/>??? ?????????(???????????? : 
								<input type="text" name="fldStrDtl" value="<c:out value='${result.fldStrDtl}'/>" style="width:50%;" <c:if test="${empty result.fldStrDtl}">disabled="disabled"</c:if> /> )
						</label> 
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="02"/>??? ??????(???????????????/??????/??????/??????/???????????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="03"/>??? ??????(???????????????/??????/??????/??????/???????????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="04"/>??? ??????(???????????????/??????/??????/?????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="05"/>??? ??????(???????????????/??????/??????/??????/?????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="06"/>??? ???????????????(???????????????/??????/??????/?????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="07"/>??? ??????(?????????/??????/??????/????????????/?????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="08"/>??? ??????(??????????????? ????????? ???????????????/??????/??????/????????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="09"/>??? ?????????(??????/??????/??????????????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="10"/>??? ??????(??????/??????/??????/?????????/???????????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="11"/>??? ????????? ?????????(????????? ??????/??????????????????/?????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="12"/>??? ????????????(e-??????/????????? DB??????/????????? ????????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="13"/>??? ??????(???????????????/??????/?????????/???????????? ???)
						</label>
						<label class="interFieldLabel col1">
							<input type="checkbox" name="interFieldCheck" value="14"/>??? ???????????????(5G, AR, VR, AI, ???????????? ???)
						</label>
						<label class="interFieldLabel col3">
							<input type="checkbox" name="interFieldCheck" id="interField15" value="15"/>??? ??????(????????? : 
								<input type="text" name="fldEtcDtl" value="<c:out value='${result.fldEtcDtl}'/>" style="width:50%;" <c:if test="${empty result.fldEtcDtl}">disabled="disabled"</c:if> /> )
						</label> 
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="interJob">???????????? ??????</label></th>
					<td colspan="3">
						<c:forEach var="interJobList" items="${COM163CodeList }">
							<c:choose>
								<c:when test="${interJobList.code eq '06'}">
									<label class="interJobLabel col3">
										<input type="checkbox" name="interJobCheck" id="interJobEtc" value="<c:out value='${interJobList.code}'/>" />
										<c:out value='${interJobList.codeNm}' /> &nbsp;
										<input type="text" name="jobEtcDtl" value="<c:out value='${result.jobEtcDtl}'/>" style="width:50%;" <c:if test="${empty result.jobEtcDtl}">disabled="disabled"</c:if> />
									</label>
								</c:when>
								<c:otherwise>
									<label class="interJobLabel">
										<input type="checkbox" name="interJobCheck" value="<c:out value='${interJobList.code}'/>" />
										<c:out value='${interJobList.codeNm}'/>
									</label>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</form>

<div class="btnSet clear mt20">

	<div class="row">
		<div class="col-md-12 tac">
			<a class="btn btn-primary" href="javaScript:update();"><span>??????</span></a>
			<!-- <a class="btn btn-default" href="javaScript:del();" id="delBtn"><span>??????</span></a> -->
			<a class="btn btn-info" href="/bos/careerManage/stuCareerMng/list.do?menuNo=100245${pageQueryString }"><span>??????</span></a>
		</div>
	</div>
</div>

<style>
	input[type=text]{
		padding-left:5px;
	}
	input[type=radio]{
		margin-left:10px;
	}
	input[type=checkbox]{
		margin-left:15px;
	}
	th label {position:relative; top:6px;}
	td label {position:relative; top:6px; line-height: 15px;}
	.interFieldLabel{line-height: 30px;}
	.interFieldLabel.col3{width:100%;}
	.interFieldLabel.col1{width:45%;}
	.interJobLabel{line-height: 30px;}
	.interJobLabel.col3{width:100%;}
</style>
