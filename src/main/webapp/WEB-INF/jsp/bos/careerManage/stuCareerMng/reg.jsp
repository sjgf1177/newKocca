<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
//<![CDATA[
	$(document).ready(function(){
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
	
	function insert(){
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
		
		var form = $("#stuInsertForm")[0];
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
	
//]]>
</script>
<form id="stuInsertForm" name="stuInsertForm" method="post" action="/bos/careerManage/stuCareerMng/insert.do?menuNo=100245" class="form-inline">
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
					<td colspan="3"><input type="text" name="stuNm" id="stuNm" value="" style="width:40%;" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="gender">??? ???</label></th>
					<td>
						<label><input type="radio" name="gender" value="M">??????</label>
						<label><input type="radio" name="gender" value="F">??????</label>
					</td>
					<th scope="row"><label for="birth">????????????</label></th>
					<td>
						<input type="text" id="birth" name="birth" class="sdate" title="????????????" style="width:130px" value="" />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="phone">?????????</label></th>
					<td colspan="3">
						<select name="phone1" id="phone1">
							<option value="">??????</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" name="phone2" id="phone2" value=""/> - 
						<input type="text" name="phone3" id="phone3" value=""/>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="email">?????????</label></th>
					<td colspan="3">
						<input type="text" name="email1" id="email1" value=""/>
						@
						<input type="text" name="email2" id="email2" value=""/>
						<select name="email3" id="email3">
							<option value="">????????????</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="jobSearchYn">?????? ??? ????????????</label></th>
					<td colspan="3">
						<label><input type="radio" name="jobSearchYn" value="Y">??????</label>
						<label><input type="radio" name="jobSearchYn" value="N">??????</label>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="interField">????????????</label></th>
					<td colspan="3">
						<label class="interFieldLabel col3">
							<input type="checkbox" name="interFieldCheck" id="interField1" value="01"/>??? ?????????(???????????? : 
								<input type="text" name="fldStrDtl" value="" style="width:50%;" disabled="disabled"/> )
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
								<input type="text" name="fldEtcDtl" value="" style="width:50%;" disabled="disabled"/> )
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
										<input type="text" name="jobEtcDtl" value="" style="width:50%;" disabled="disabled"/>
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
			<a class="btn btn-primary" href="javaScript:insert();"><span>??????</span></a>
			<a class="btn btn-default" href="/bos/careerManage/stuCareerMng/list.do?menuNo=100245${pageQueryString }"><span>??????</span></a>
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
