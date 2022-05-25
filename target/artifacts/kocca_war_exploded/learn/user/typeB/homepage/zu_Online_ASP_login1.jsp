<%@ page import="com.credu.library.RequestBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on("click", "#btn_cancel", function(){
			location.href = '/';
		});
		
		$(document).on("click", "#btn_next", function(){
			if($("input[name='agree1']:checked").val() != 1){
				alert("사이트 이용약관에 동의하여 주십시오.");
				return;
			}
			if($("input[name='agree2']:checked").val() != 1){
				alert("개인정보 보호방침에 동의하여 주십시오.");
				return;
			}
			
			document.form1.p_process.value = "ASP_Login";
            document.form1.menuid.value = "0";
            document.form1.gubun.value = "3";
            document.form1.action = "/servlet/controller.homepage.MainServlet";
            document.form1.submit();
		});
	});
</script>
<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_0.jsp">
                    	<jsp:param value="1" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>회원가입</span>
                                <div class="linemap_wrap">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <span>
                                                    <img src="/common/image/home_icon.png" alt="메인">
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"><span>회원/로그인</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>회원가입</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_boarder_body join_box">
                                    <div class="signUp_step_bar">
                                        <div class="step_wrap active">
                                            <p>
                                                <span>STEP1</span>
                                                이용약관 동의
                                            </p>
                                        </div>
                                        <div class="step_line_wrap">
                                            <div class="step_right_arrow"></div>
                                        </div>
                                        <div class="step_wrap">
                                            <p>
                                                <span>STEP2</span>
                                                회원정보 입력
                                            </p>
                                        </div>
                                        <div class="step_line_wrap">
                                            <div class="step_right_arrow"></div>
                                        </div>
                                        <div class="step_wrap">
                                            <p>
                                                <span>STEP3</span>
                                                가입완료
                                            </p>
                                        </div>
                                    </div>
                                    
                                    <div class="agree_box">
                                        <span>사이트 이용약관</span>
                                        <div class="agree_con">
                                            <p>제1장 총칙</p>
                                            <span>제1조 목적</span>
                                            1.이 약관은 "한국콘텐츠아카데미 (이하 "콘텐츠아카데미"이라 한다.)에서 운영하는 웹서비스의 이용조건 및 절차에 관한 사항을 명시합니다.<br/>
                                            2.회원가입에 대한 내용을 충분히 숙지하신 후 가입하여 주시고, 이 약관은 본 콘텐츠아카데미에서 운영하는 모든 웹서비스를 이용하는 모든 회원에게 적용되며 이를 읽고 이해하는 것은 귀하의 책임입니다.<br/>
                                            <span>제2조 약관의 공지 및 효력 </span>
                                            1.이 약관의 내용은 웹서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다.<br/>
                                            2.콘텐츠아카데미는 이 약관을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.<br/>
                                            3.회원가입이란 콘텐츠아카데미에서 제공하는 웹서비스에 가입하는 것으로 웹서비스의 조건과 규정에 합의함을 의미하며, 콘텐츠아카데미는 웹서비스의 조건과 조항을 항시 통고와 함께 또는 통고 없이 전부 또는 일부를 바꿀 권리를 갖습니다. 이런 변화에 대해 빠른 회신을 못하거나, 고지 받지 못했다는 사유로 이의를 제기할 수 없으므로 추후에 착오 없으시길 당부 드립니다.<br/>
                                            <span>제3조 약관 외 준칙 </span>
                                            이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 전자거래 기본법, 전자서명법, 통신판매법 및 기타 관계법령의 규정에 의합니다.<br/>
                                            <span>제4조 용어의 정의 </span>
                                            이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br/>
                                            1.회원 : 콘텐츠아카데미의 웹서비스 이용에 관한 계약을 체결한 자 <br/>
                                            2.아이디(ID) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 콘텐츠아카데미가 승인하는 문자와 숫자의 조합<br/>
                                            3.비밀번호 : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합 <br/>
                                            4.탈퇴 : 회원이 서비스 이용 이후 그 이용계약을 종료 시키는 의사표시 <br/>
                                            5.휴면 계정 : 최근 3년동안 로그인 하지 않은 이용자로 가입한 회원을 정의<br/>
                                            휴면계정에 해당하는 회원은 개인정보의 보호 및 관리를 위하여 개인정보 및 학습이력이 삭제될 수 있습니다.(단, 휴면계정 일괄 삭제 후에는 기존에 사용하던 아이디로 콘텐츠아카데미 사이트에 재가입할 수 없으니 이점 유의하시기 바랍니다.)<br/>
                                            <p>제2장 서비스 이용계약 </p>
                                            <span>제1조 이용 계약의 성립</span>
                                            1.서비스 가입 신청 시 본 약관을 읽고 "동의함" 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.<br/>
                                            2.이용계약은 회원 정보 입력 후 완료를 선택하게 되면 성립합니다.<br/>
                                            3.회원에 가입하여 서비스를 이용하고자 하는 희망자는 콘텐츠아카데미에서 요청하는 개인신상정보를 제공해야 합니다.<br/>
                                            4.이용계약은 회원 1인당 1개의 ID로 체결하는 것을 원칙으로 합니다.<br/>
                                            <span>제2조 이용신청</span>
                                            이용신청은 온라인상의 가입신청 양식에 준합니다.<br/>
                                            <span>제3조 이용신청의 승낙 </span>
                                            회원이 제2장 제2조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다.<br/>
                                            <span>제4조 이용신청의 불 승낙 </span>
                                            1.웹서비스는 다음에 해당하는 이용신청에 대하여 등록을 거부하거나 등록 후에라도 회원에게 고지하지 않고 회원정보를 수정 또는 삭제할 수 있습니다.<br/>
                                            1) 다른 사람의 명의를 사용하여 신청하였을 경우 <br/>
                                            2) 이용 신청 시 필요내용을 허위로 기재하여 신청하였을 경우 <br/>
                                            3) 사회의 안녕질서 및 미풍양속을 저해할 목적으로 신청하였을 경우 <br/>
                                            4) 신용정보의 이용과 보호에 관한 법률에 의거 신용불량자로 등록되어 있는 경우<br/>
                                            5) 기타 이용신청자의 귀책사유로 이용승낙이 곤란한 경우 <br/><br/>
                                            2.콘텐츠아카데미는 다음에 해당하는 이용신청에 대하여 승낙 제한 사유가 해소될 때까지 승낙을 하지 않을 수 있습니다.<br/>
                                            1) 콘텐츠아카데미가 설비의 여유가 없는 경우 <br/>
                                            2) 콘텐츠아카데미의 기술상 지장이 있는 경우 <br/>
                                            3) 기타 콘텐츠아카데미가 필요하다고 인정되는 경우 <br/><br/>
                                            3.콘텐츠아카데미는 이용신청이 불,승낙 되거나 승낙을 제한하는 경우에는 이를 이용신청자에게 알려야 합니다.<br/>
                                            <span>제5조 계약사항의 변경 </span>
                                            회원은 이용 신청 시 기재한 사항이 변경되었을 경우에는 온라인 수정을 해야 합니다.<br/>
                                            <span>제6조 회원정보의 공유</span>
                                            1.콘텐츠아카데미가 더 좋은 서비스를 위하여 타 기관과 제휴, 인수, 분사, 합병 시 회원의 정보는 공유될 수 있다.<br/>
                                            2.각종 경품이 제공되는 이벤트의 경우, 경품 협찬사와의 협의에 의해 당첨자 등록정보를 공유할 수 있습니다.<br/>
                                            3.1항, 2항의 사유가 발생할 경우 콘텐츠아카데미는 회원에게 해당 사실을 공지해야 합니다.<br/>
                                            <span>제7조 추가적인 회원정보의 사용 </span>
                                            콘텐츠아카데미는 회원이 커뮤니티 서비스 이용 시 제공하는 회원의 추가 정보를 관리용, 통계용의 정보로만 사용합니다.<br/>
                                            <span>제8조 정보의 제공</span>
                                            콘텐츠아카데미는 회원이 서비스 이용 및 콘텐츠아카데미의 각종 행사 또는 정보서비스에 대해서는 전자우편이나 서신우편 등의 방법으로 회원들에게 제공할 수 있습니다.<br/>
                                            <span>제9조 개인정보보호 의무 </span>
                                            1.콘텐츠아카데미는 이용자의 개인정보를 수집할 때 반드시 당해 이용자의 동의를 받습니다.<br/>
                                            2.개인정보를 내부 관리용, 통계용 및 제2장 제6조 이외의 용도로 이용하거나 이용자의 동의 없는 제3자에게 제공, 분실, 도난, 유출, 변조시 그에 따른 이용자의 피해에 대한 모든 책임은 콘텐츠아카데미가 집니다.<br/>
                                            3.개인정보의 보호 및 사용에 대해서는 관련법 및 "콘텐츠아카데미"의 개인정보처리방침이 적용됩니다. 다만, "콘텐츠아카데미"의 공식 사이트 이외의 링크된 사이트에서는 "콘텐츠아카데미"의 개인정보처리방침이 적용되지 않습니다.<br/>
                                            <p>제3장 서비스 이용 </p>
                                            <span>제1조 서비스 이용 </span>
                                            서비스 이용은 콘텐츠아카데미의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다. 단, 정기점검 등 서비스 개선을 위하여 콘텐츠아카데미가 필요하다고 인정되는 때에는 미리 공지한 후 서비스가 일시 중지될 수 있습니다.<br/>
                                            <span>제2조 서비스 제공의 중지 </span>
                                            콘텐츠아카데미는 다음 항에 해당하는 경우 서비스의 제공을 중지할 수 있습니다.<br/>
                                            1.설비의 보수 등을 위하여 부득이한 경우 <br/>
                                            2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우 <br/>
                                            3.기타 서비스를 제공할 수 없는 사유가 발생한 경우 <br/>
                                            <span>제3조 파일정보의 소거 및 회원 권한의 삭제</span>
                                            1.콘텐츠아카데미는 서비스용 설비의 용량에 여유가 없다고 판단되면 필요에 따라 회원의 정보 및 신상정보를 삭제할 수 있습니다.<br/>
                                            2.콘텐츠아카데미는 서비스 운영상 또는 보안에 문제가 있다고 판단되는 회원의 정보 및 신상정보를 사전통지 없이 검색할 수 있습니다.<br/>
                                            3.제1항의 경우에 콘텐츠아카데미는 해당 사항을 사전에 서비스 또는 전자우편을 통하여 공지합니다.<br/>
                                            <p>제4장 서비스 사용 제한 및 계약 해지 </p>
                                            <span>제1조 서비스 사용 제한 </span>
                                            1.회원은 서비스의 사용에 있어서 다음 각 호에 해당되지 않도록 하여야 하며, 이에 해당하는 경우 서비스 사용을 제한할 수 있습니다.<br/>
                                            1) 다른 회원의 아이디(ID)를 부정 사용하는 행위 <br/>
                                            2) 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 <br/>
                                            3) 선량한 풍속, 기타 사회질서를 해하는 행위 <br/>
                                            4) 타인의 명예를 훼손하거나 모욕하는 행위 <br/>
                                            5) 타인의 지적재산권 등의 권리를 침해하는 행위<br/>
                                            6) 해킹행위 또는 컴퓨터바이러스의 유포행위 <br/>
                                            7) 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위 <br/>
                                            8) 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위 <br/>
                                            9) 기타 관계법령에 위배되는 행위 <br/>
                                            <span>제2조 계약 해지 </span>
                                            1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자우편을 통하여 해지하고자 하는 날의 1일전까지(단, 해지일이 법정공휴일인 경우 공휴일 개시 2일전까지) 이를 콘텐츠아카데미에 신청하여야 합니다.<br/>
                                            2.콘텐츠아카데미는 회원이 제4장 제1조의 내용을 위반하고, 콘텐츠아카데미 소정의 기간 이내에 이를 해소하지 아니하는 경우 서비스 이용계약을 해지할 수 있습니다.<br/>
                                            3.콘텐츠아카데미는 제2항에 의해 해지된 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.<br/>
                                            <p>제5장 책임 </p>
                                            <span>제1조 회원의 의무 </span>
                                            1.회원아이디(ID) 및 비밀번호에 관한 모든 관리의 책임은 회원에게 있습니다.<br/>
                                            2.회원아이디(ID) 및 비밀번호는 콘텐츠아카데미의 사전승낙 없이는 다른 사람에게 양도, 임대, 대여할 수 없습니다.<br/>
                                            3.자신의 회원아이디(ID)가 부정하게 사용된 경우, 회원은 반드시 콘텐츠아카데미에 그 사실을 통보해야 합니다.<br/>
                                            4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 콘텐츠아카데미에 통지하여야 합니다.<br/>
                                            5.회원은 이 약관 및 관계법령에서 규정한 사항을 준수해야 합니다.<br/>
                                            <span>제2조 콘텐츠아카데미의 의무 </span>
                                            1.콘텐츠아카데미는 제3장 제1조 및 제2조에서 정한 경우를 제외하고 이 약관에서 정한 바에 따라 회원이 신청한 서비스 제공 개시일에 서비스를 이용할 수 있도록 합니다.<br/>
                                            2.콘텐츠아카데미는 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있습니다. 단, 부득이한 경우로 회원 개인정보의 손실이 발생했을 지라도 콘텐츠아카데미는 전혀 책임지지 않습니다.<br/>
                                            3.콘텐츠아카데미는 회원의 개인신상정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다.단, 개인정보보호법, 전기통신관련법령 등 관계법령에 의해 국가기관 등의 요구가 있는 경우에는 그러하지 않습니다.<br/>
                                            4.콘텐츠아카데미는 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정되는 경우에는 즉시 처리해야 합니다. 다만 즉시 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 통보하여야 합니다.<br/>
                                            <span>제3조 게시물 또는 내용물의 삭제 </span>
                                            콘텐츠아카데미는 서비스의 게시물 또는 내용물이 제4장 제1조의 규정에 위반되거나 콘텐츠아카데미 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.<br/>
                                            <p>제6장 손해배상 및 면책조항 </p>
                                            <span>제1조 손해배상</span>
                                            콘텐츠아카데미는 서비스 이용과 관련하여 회원에게 어떠한 손해가 발생하더라도 동 손해가 콘텐츠아카데미의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을 지지 않습니다.<br/>
                                            <span>제2조 면책조항 </span>
                                            1.콘텐츠아카데미는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br/>
                                            2.콘텐츠아카데미는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br/>
                                            3.콘텐츠아카데미는 회원이 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br/>
                                            4.콘텐츠아카데미는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br/>
                                            5.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.<br/>
                                            6.회원이 제4장 제1조, 기타 이 약관의 규정을 위반함으로 인하여 콘텐츠아카데미가 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 콘텐츠아카데미에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 콘텐츠아카데미에게 발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 콘텐츠아카데미를 면책시켜야 합니다.<br/>
                                            <p>제7장 커뮤니티 이용 </p>
                                            <span>제1조 커뮤니티 이용 제한 </span>
                                            1.콘텐츠아카데미는 이용자들이 자신의 의견을 개진하고, 공동의 관심사를 공유할 수 있도록 커뮤니티 서비스를 운영하고 있습니다.<br/>
                                            2.다음 사항은 커뮤니티 이용을 제한할 수 있는 항목들이며, 이들 항목에만 국한되는 것은 아닙니다.<br/>
                                            1) 타인의 프라이버시 및 공표 공표권과 같은 법적권리를 훼손, 악용, 도용, 위협하거나 괴롭히거나 또는 달리 위반하는 행위 <br/>
                                            2) 부적절, 모독적, 명예 훼손적, 침해적, 음란, 상스럽거나 또는 불법적인 제목, 이름, 자료 또는 정보를 출판, 우송, 게시, 배포 또는 유포시키는 행위 <br/>
                                            3) 지적소유권법에 의하여 보호되는 소프트웨어 또는 기타 자료를 포함하는 파일을 업로드 하는 행위, 다만 이용자가 그에 대한 권리를 소유 또는 관리하는 경우, 또는 필요한 동의를 모두 얻은 경우는 제외합니다.<br/>
                                            4) 타인의 컴퓨터를 손상시킬 수 있는 바이러스, 오염된 화일, 또는 기타 유사한 소프트웨어 또는 프로그램을 포함하는 자료를 업로드 하는 행위 <br/>
                                            5) 상업적인 목적으로 상품 또는 서비스를 광고 또는 판매하는 행위 <br/>
                                            6) 자료조사, 콘테스트, 피라미드 체계를 행하거나 행운의 편지를 보내는 행위 <br/>
                                            7) 다른 커뮤니티 이용자가 게재한 것으로 적법하게 배포될 수 없는 것으로 이용자가 알고 있거나 합리적으로 알 것으로 기대되는 파일을 다운로드하는 행위 <br/>
                                            8) 업로드 된 파일에 포함된 소프트웨어 또는 기타 자료의 저자표시, 법률상 또는 기타 적절한 유의사항, 또는 상표명, 또는 그 출처 내지 근원이 되는 표식을 위조 또는 제거하는 행위 <br/>
                                            9) 다른 이용자가 커뮤니티를 사용하거나 즐기는 것을 제한하거나 금지시키는 행위 <br/>
                                            10) 공공질서 및 미풍양속에 반하는 음란한 내용이나, 특정 종교를 선전·선교하거나 비방하는 내용, 기타 지역감정을 유발시키는 등의 비 양식적인 내용을 게재하는 행위 3. 콘텐츠아카데미는 언제든지 어떤 이유로든 아무런 통지 없이 귀하가 커뮤니티의 일부 또는 전부에 접속하는 것을 종료시킬 수 있는 권한을 보유합니다.<br/>
                                            <span>제2조 콘텐츠아카데미의 책임</span>
                                            1.콘텐츠아카데미는 커뮤니티를 검열할 의무를 지지 않습니다. 그러나, 콘텐츠아카데미는 적용되는 법률, 규정, 법적 절차 또는 정부의 요청을 충족하기 위하여 정보를 공개하거나, 또는 콘텐츠아카데미의 전적인 재량으로 정보 내지 자료의 전부 또는 일부를 편집 또는 송부 거절하거나, 또는 이를 제거할 권리를 보유합니다.<br/>
                                            2.귀하는 모든 커뮤니티 서비스가 공공적인 통신으로 사적인 통신이 아니며, 그 결과 이용자의 통신이 귀하가 알지 못하게 다른 사람에 의하여 읽힐 수 있음을 인정합니다. 누구에 관한 것인지 식별할 수 있는 이용자 또는 이용자의 자녀들에 관한 정보를 커뮤니티에 보낼 때는 항상 주의를 기울여야 합니다. 콘텐츠아카데미는 커뮤니티에 있는 내용, 메시지 또는 정보를 관리하거나 이를 승인하지 아니합니다.<br/>
                                            3.콘텐츠아카데미는 커뮤니티에 관한 책임 및 이용자가 커뮤니티에 참여함으로써 발생하는 어떠한 사건에 대한 책임을 명백히 부인합니다.<br/>
                                            <p>제8장 기타 </p>
                                            <span>제1조 약관의 변동</span>
                                            이용약관 개정 시 최소 7일 이전 고지의 의무가 있고 소비자에게 불리한 경우 30일 이전 고지해야 합니다.<br/>
                                            <span>제2조 분쟁의 해결</span>
                                            1.콘텐츠아카데미와 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br/>
                                            2.제1항의 규정에도 불구하고, 동 분쟁으로 인하여 소송이 제기될 경우 민사소송법상의 관할법원을 전속적 관할 법원으로 합니다.<br/>
                                            <span>부칙</span>
                                            개정일 :이 약관은 2009년 6월 19일부터 개정되었습니다.<br/>
                                            수정일 :이 약관은 2011년 9월 30일 수정되었습니다.<br/>
                                            시행일 :수정사항은 2011년 10월 1일부터 시행합니다.<br/>
                                        </div>
                                        <div>
                                            <input type="checkbox" name="agree1" id="agree1" value="1" title="사이트이용약관 동의">
                                            <label for="agree1">위 약관에 동의합니다.</label>
                                        </div>
                                        <div class="agree_con">
                                            한국 콘텐츠아카데미는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 필수 정보와 선택정보를 수집합니다. 
                                            <p>개인정보보호를 위한 이용자 동의사항</p>
                                            
                                            <span>1. 수집·이용 목적</span>
                                            회원제 서비스 제공 및 고객 맞춤형 서비스 목적
                                            
                                            <span>2. 개인정보 수집 항목</span>
                                            <span class="point_blue">[개인회원]</span>
                                            <ul>
                                                <li>
                                                    <span>필수항목 : </span>
                                                    이름, 생년월일, 성별, 아이디, 비밀번호, 이메일, 휴대폰, 인재캠퍼스 정보수신 여부, 콘텐츠문화광장 정보수신 여부, 직업, 거주지역, 소속, 14세 미만인 경우 보호자의 이름, 휴대폰 번호
                                                </li>
                                                <li>
                                                    <span>선택항목 : </span>
                                                    거주지
                                                </li>
                                            </ul>
                                            <span class="point_blue">[기업회원]</span>
                                            <ul>
                                                <li>
                                                    <span>필수항목 : </span>
                                                    성명, 생년월일, 성별, 아이디, 비밀번호, 전화번호, 휴대폰, 이메일, 정보수신 여부
                                                </li>
                                                <li>
                                                    <span>선택항목 : </span>
                                                    소속부서
                                                </li>
                                            </ul>
                                            <span class="point_blue">[온라인교육 수강정보]</span>
                                            <ul>
                                                <li>
                                                    <span>필수항목 : </span>
                                                    아이디, 성명, 휴대폰, 이메일, 수강과목정보
                                                </li>
                                            </ul>
                                            <span class="point_blue">[문의하기]</span>
                                            <ul>
                                                <li>
                                                    <span>필수항목 : </span>
                                                    아이디, 성명, 휴대폰, 이메일
                                                </li>
                                            </ul>
                                            <span class="point_blue">[오프라인교육 신청]</span>
                                            <ul>
                                                <li>
                                                    <span>필수항목 : </span>
                                                    아이디, 이름, 생년월일, 성별, 이메일, 자택 전화번호, 휴대폰번호, 회사 전화번호, 주소, 거주지역, 직업, 소속
                                                </li>
                                                <li>
                                                    <span>선택항목 : </span>
                                                    전문분야, 직위, 경력, 학력 등 교육프로그램에 따라 다르며 정보주체로부터 별도의 동의를 얻어 수집 및 처리합니다.
                                                </li>
                                            </ul>
                                            <span class="point_blue">[시설예약 신청]</span>
                                            <ul>
                                                <li>
                                                    <span>필수항목 : </span>
                                                    이름, 휴대폰, 이메일, 사용인원, 사용목적, 예약정보수신방법
                                                </li>
                                                <li>
                                                    <span>선택항목 : </span>
                                                    시설예약신청에 따라 다르며 정보주체로부터 별도의 동의를 얻어 수집 및 처리합니다.

                                                </li>
                                            </ul>
                                            <span class="point_blue">[시설예약 신청]</span>
                                            <ul>
                                                <li>
                                                    <span>필수항목 : </span>
                                                    이름, 휴대폰, 이메일, 사용인원, 사용목적, 예약정보수신방법
                                                </li>
                                                <li>
                                                    <span>선택항목 : </span>
                                                    시설예약신청에 따라 다르며 정보주체로부터 별도의 동의를 얻어 수집 및 처리합니다.

                                                </li>
                                            </ul>
                                            
                                            <span>3. 개인정보 보유 및 이용기간 : 3년 혹은 회원 탈퇴 후 즉시 삭제</span>
                                            
                                            <span>4. 자동 수집 정보 : 인터넷 서비스 이용과정에서 아래의 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.</span>
                                            IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등 
                                            
                                            <span>5. 동의 거부 시 불이익에 관한 사항 : 수집 ·이용에 관한 사항의 동의를 거부할 때에는 서비스의 이용이 제한됩니다. 단, 선택정보 사항을 획득하지 못한 사유로 인하여 서비스 제공을 거부하지 않습니다.</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" name="agree2" id="agree2" value="1" title="개인정보 수집 및 이용동의">
                                            <label for="agree2">위 약관에 동의합니다.</label>
                                        </div>
                                        <div class="agree_btn_box">
                                            <a href="javascript:void(0);" id="btn_cancel" title="취소" class="btn_cancel">취소</a>
                                            <a href="javascript:void(0);" id="btn_next" title="다음" class="btn_next">다음</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>