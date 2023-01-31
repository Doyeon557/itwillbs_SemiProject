<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<!--css폼 넣기  -->
<link rel="stylesheet" href="./qnaboard_css/112d047cbc73ad853e80.css"/>
<link rel="stylesheet" href="./qnaboard_css/a0638d6382138f57c1d8.css"/>
<link rel="stylesheet" href="./qnaboard_css/ac7c14ec7628a388f577.css"/>
<link rel="stylesheet" href="./qnaboard_css/se.viewer.css"/>

<!-- 리스트  -->
<link rel="stylesheet" type="text/css" href="./qnalist_css/froala_style_ec.min.css"/>
<link rel="stylesheet" type="text/css" href="./qnalist_css/optimizer.css"/>
<link rel="stylesheet" type="text/css" href="./qnalist_css/optimizer2.css"/>
<!-- 리스트  -->

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<div><jsp:include page="../member/top.jsp"></jsp:include></div>	
<!--css폼 넣기  -->
<
<br>
<br>
<br>

<%
BoardDTO dto=(BoardDTO)request.getAttribute("dto");
%>
<br>
<br>	
<title>공지사항</title>
</head>
<body>
	<div id="__next">
		<div class="input_help_suggest_home_end__O9TV-">
			<div class="GNB_gnb__239d4"> </div>
			<div class="input_help_content__2WOyU">
				<div class="EndSuggest_suggest_list__3j1rq">
					<div class="inner">
						<div class="EndTopTitle_top_title__1TJpl">
							<div class="EndTopTitle_title_box__5AWVA">
								<h2>
									<button class="EndTopTitle_title__l_GCS"
										style="cursor: default">공지사항 수정</button>
								</h2>
							</div>
						</div>
						<div class="EndSuggest_notice_area__3wo1T" style="display: block">
						</div>
						<div class="EndSuggest_guide_text__3UWWL" style="display: block">
							<ul>
								<li>
<!-- 								<span class="EndSuggest_gray__3NPTw">✓작성하신 -->
<!-- 										내용에 욕설, 성희롱 등의 내용이 포함된 경우 관련 법령에 따라 조치될 수 있습니다. -->
<!-- 								</span> -->
								</li>
							</ul>
						</div>
						<div class="field_wrap" style="display: block">
							<form action="./BoardUpdatePro.bo" method="post">
								<fieldset class="EndSuggest_field_set__1aLaM">
									<legend class="blind">제안하기 작성</legend>
									
									<div class="EndSuggest_field_box__2Rb3-">
										<dl>
											<dt class="EndSuggest_essential__iYBLH">글번호</dt>
											<dd>
												<div
													class="EndSuggest_input_box__3boVM EndSuggest_mail__1Ihy-">
													<input type="text" name="Notice_num" value="<%=dto.getNotice_num() %>" readonly required id="title" />
												</div>
											</dd>
										</dl>
									</div>
									
									<div class="EndSuggest_field_box__2Rb3-">
									
										<dl>
											<dt class="EndSuggest_essential__iYBLH">제목</dt>
											<dd>
												<div
													class="EndSuggest_input_box__3boVM EndSuggest_mail__1Ihy-">
<!-- 													<input type="text" class="input_text" /> -->
													<input type="text" name="Notice_title" value="<%=dto.getNotice_title() %>" required id="title" />
												</div>
											</dd>
										</dl>
									</div>
									
									
									<div class="EndSuggest_field_box__2Rb3-">
										<dl>
											<dt class="EndSuggest_essential__iYBLH">내용</dt>
											<dd>
												<div class="EndSuggest_input_box__3boVM">
												<textarea name="Notice_content" rows="10" cols="20"><%=dto.getNotice_content() %></textarea>
<!-- 													<textarea maxLength="1000"></textarea> -->
												</div>
											</dd>
										</dl>
									</div>
									<!-- 등록하기버튼-->
<!-- 									<div class="CommonBtn_common_btn_wrap__20kqy"> -->
<!-- 										<div class="CommonBtn_common_btn_box__3iWhO"> -->
<!-- 											<input type="submit" value="등록하기" class="CommonBtn_common_btn__Kg8Jd"> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
									<div align="right">
										<input type="submit" class="btnEmFix" value="수정" class="CommonBtn_common_btn__Kg8Jd">
										<input type="button" class="btnEmFix" value="글목록" onclick="location.href='./BoardList.bo'">
									</div>
									
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script id="__NEXT_DATA__" type="application/json">{"props":{"pageProps":{"initialState":{"browserEnv":{"isPC":true,"isMobile":false,"isIOS":false,"isAOS":false,"isUnderIE11":false,"osType":"PC"},"home":{"info":{"serviceName":"회원정보","serviceNo":5640,"languageCode":"ko","iconNo":0,"iconImagePath":"/files/mobile/icon/202206/2e9ada1f-1f25-4d6d-b00a-b82cda39ae91.png","osFilterStatus":"USE","ecmsCategoryNo":5288,"initialSound":"ㅎ","floatingInfo":{"useYn":"Y","type":"SMART_BOT","linkUrl":"https://nca.naver.com/chat/account/view"},"headerInfo":{"headerLogoBackGroundColor":"#03c75b","headerLogoDisplayYn":"Y"},"serviceAlias":"5640","noticeSectionId":"161","isNew":false},"data":null,"notice":null,"recommendKeywordList":[],"representList":[],"inquiryListBanner":[],"bannerList":[],"footerBannerList":[],"inspectionNotice":null},"user":{"profileImage":"","userInfo":null},"cookie":{"contentFontSize":"type1"},"serviceList":{"isOpenServiceListPopup":false,"list":[],"subjectList":[],"initialList":[]},"search":{"isMobileInputFocus":false,"isGNBInputFocus":false,"useAutoComplete":true,"service":[],"help":null,"kin":null,"autoComplete":null,"autoCompleteService":[],"helpServiceList":[]},"language":{"languageCode":"ko","hasDisplayList":true,"displayList":[{"serviceNo":5640,"globalLanguageCode":"ko","globalLanguageName":"한국어"},{"serviceNo":5640,"globalLanguageCode":"en","globalLanguageName":"English"}],"hasI18n":true,"i18n":{"alert.attach.file.fail":"파일 첨부에 실패하였습니다.\u003cnt\u003e잠시 후 다시 시도해 주세요.   ","alert.file.extension.invalid":"파일 확장자가 올바르지 않습니다.","alert.file.invalid.access.error":"유효하지 않은 접근입니다.","alert.file.upload.malware":"고객님께서 첨부하려는 파일에서 악성 코드가 발견되어 파일을 첨부할 수 없습니다.\u003cbr\u003e첨부 파일을 확인 후 다시 시도하세요.","alert.inquiry.exists":"이미 문의를 접수 하셨습니다. \u003cbr\u003e답변까지 잠시만 기다려 주세요.","alert.inquiry.fail":"문의하기 접수에 실패하였습니다.\u003cbr\u003e잠시 후 다시 시도해 주세요.","alert.inquiry.proceeding":"문의하기 접수중입니다.\u003cbr\u003e잠시만 기다려주세요.","alert.invalid.url":"유효하지 않는 URL입니다.","alert.select.agree":"'동의합니다.'에 체크해 주세요.","alert.suggest.fail":"제안하기 접수에 실패하였습니다.\u003cbr\u003e잠시 후 다시 시도해 주세요.","alert.suggest.proceeding":"제안하기 접수중입니다.\u003cbr\u003e잠시만 기다려주세요.","alert.write.only.number.information":"숫자로만 입력해 주세요.","alert.write.your.name.information":"이름 또는 기관/단체명을 정확하게 입력해 주세요.","alert.write.your.personal.information":"본인확인정보를 예시대로 입력하세요.","attach.file.fail":"파일 첨부 실패","auto.complete.text.close":"닫기","auto.complete.text.off":"자동완성 끄기","auto.complete.text.on":"자동완성 켜기","auto.complete.text.shortcut":"바로가기","browser.title.inqruiy":"문의하기 : 네이버 고객센터","browser.title.inqruiy.service":"문의하기 : [##serviceName##] 고객센터","browser.title.inspection":"네이버 고객센터 : 서비스 점검 중입니다.","browser.title.main":"NAVER HELP","browser.title.notice":"공지사항 : 네이버 고객센터","browser.title.notice.service":"공지사항 : [##serviceName##] 고객센터","browser.title.page.not.found":"네이버 고객센터 : 페이지를 찾을 수 없습니다.","browser.title.search":"검색결과 : 네이버 고객센터","browser.title.search.service":"검색결과 : [##serviceName##] 고객센터","browser.title.service":"[##serviceName##] 고객센터","browser.title.suggest":"제안하기 : 네이버 고객센터","browser.title.suggest.service":"제안하기 : [##serviceName##] 고객센터","common.footer.popup.text":"네이버 고객센터 ARS 안내","common.footer.popup.text.description":"네이버 서비스 관련 궁금한 점은 \u003cbr\u003e스마트봇과 고객센터 도움말을 통해 쉽고\u003cbr class='row_mo' /\u003e 빠르게 확인할 수 있습니다.","common.footer.popup.text.no1":"1번","common.footer.popup.text.no1.section":"비밀번호, 보호조치, 이용제한 등 계정 관련","common.footer.popup.text.no2":"2번","common.footer.popup.text.no2.sectoin":"네이버플러스 멤버십, VIBE, 시리즈, 시리즈온, 프리미엄콘텐츠 등 결제관련","common.footer.popup.text.no3":"3번","common.footer.popup.text.no3.section":"지도, 기차 예매, 지역 업체정보, 스마트플레이스","common.footer.popup.text.no4":"4번","common.footer.popup.text.no4.section":"인물검색, 검색어, 사이트, 게시중단, 유해게시물 신고","common.footer.popup.text.no5":"5번","common.footer.popup.text.no5.section":"메일, MYBOX, 블로그, 카페, 밴드 등 그 외 서비스","common.footer.popup.text.phone":"전화번호 \u003cem\u003e1588-3820\u003c/em\u003e ([#group_begin#]유료[#group_end#])","common.footer.popup.text.time":"평일 09:00 ~ 18:00","common.footer.text.all.service":"전체서비스","common.footer.text.phone":"대표번호 : 1588-3820","common.footer.text.phone.detail":"상세보기","common.footer.text.privacy":"개인정보처리방침","common.footer.text.terms":"이용약관","common.footer.text.youth":"청소년보호정책","common.form.complete.message":"접수 완료","common.form.complete.message.confirm":"확인","common.form.complete.message.list":"접수하신 내용은 빠르게 확인하여 답변 드리겠습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSA":"접수하신 내용은 빠르게 확인하여 답변 드리겠습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSAE":"접수하신 내용은 빠르게 확인하여 답변 드리겠습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSBE":"요청하신 사항은 내부적으로 검토 후 약 3일 정도 이내에 처리될 예정입니다.\u003cbr\u003e처리 결과는 네이버 페이지에서 직접 확인하실 수 있으며 답변을 개별적으로 드리지는 않습니다.","common.form.complete.message.list.MSC":"요청하신 사항은 내부적으로 검토 후 약 7일 정도 이내에 처리될 예정입니다.\u003cbr\u003e처리 결과는 네이버 페이지에서 직접 확인하실 수 있으며 답변을 개별적으로 드리지는 않습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSCE":"요청하신 사항은 내부적으로 검토 후 약 7일 정도 이내에 처리될 예정입니다.\u003cbr\u003e처리 결과는 네이버 페이지에서 직접 확인하실 수 있으며 답변을 개별적으로 드리지는 않습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSD":"의견에 직접 답변을 드리지는 않지만 관련부서에 전달하여 검토될 수 있도록 하겠습니다. \u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSDE":"의견에 직접 답변을 드리지는 않지만 관련부서에 전달하여 검토될 수 있도록 하겠습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSE":"네이버에서는 항상 좋은 검색 서비스를 제공해드리기 위해서 노력하고 있습니다.\u003cbr\u003e요청하신 사항은 검토 후 좋은 검색을 위해 활용되며 답변을 개별적으로 드리지는 않습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSEE":"네이버에서는 항상 좋은 검색 서비스를 제공해드리기 위해서 노력하고 있습니다.\u003cbr\u003e요청하신 사항은 검토 후 좋은 검색을 위해 활용되며 답변을 개별적으로 드리지는 않습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSF":"접수하신 내용은 확인 후 답변 드리겠습니다.\u003cbr\u003e오늘도 밴드로 즐거운 모임 하세요.","common.form.complete.message.list.MSFE":"접수하신 내용은 확인 후 답변 드리겠습니다.\u003cbr\u003e오늘도 밴드로 즐거운 모임 하세요.","common.form.complete.message.list.MSG":"접수하신 내용은 빠르게 확인하여 답변 드리겠습니다.","common.form.complete.message.list.MSGE":"접수하신 내용은 빠르게 확인하여 답변 드리겠습니다.","common.form.complete.message.list.MSH":"인물검색 등록/수정/삭제 요청건은 3~5일의 검토시간이 소요됩니다.\u003cbr\u003e처리 결과는 접수 시 기재하신 메일로 안내 드리니 참고해 주세요.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSHE":"인물검색 등록/수정/삭제 요청건은 3~5일의 검토시간이 소요됩니다.\u003cbr\u003e처리 결과는 접수 시 기재하신 메일로 안내 드리니 참고해 주세요.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSI":"본인확인 방법과 접수경로를 확인하여 문의해 주세요.\u003cbr\u003e네이버 도움말을 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSIE":"본인확인 방법과 접수경로를 확인하여 문의해 주세요.\u003cbr\u003e네이버 도움말을 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSJ":"요청하신 사항은 내부적으로 검토 후 약 7일 이내에 처리될 예정입니다.\u003cbr\u003e처리 결과는 네이버 페이지에서 직접 확인하실 수 있습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSJE":"요청하신 사항은 내부적으로 검토 후 약 7일 이내에 처리될 예정입니다.\u003cbr\u003e처리 결과는 네이버 페이지에서 직접 확인하실 수 있습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSK":"개편 버전 장애/오류 신고 전용 채널로, 그 외 문의는 처리 및 도움을 드리기 어렵습니다.\u003cbr\u003e장애/오류 해결을 위해 필요한 경우 별도로 답변 드리겠습니다.","common.form.complete.message.list.MSKE":"개편 버전 장애/오류 신고 전용 채널로, 그 외 문의는 처리 및 도움을 드리기 어렵습니다.\u003cbr\u003e장애/오류 해결을 위해 필요한 경우 별도로 답변 드리겠습니다.","common.form.complete.message.list.MSL":"네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSLE":"네이버를 이용해 주셔서 감사합니다.","common.form.complete.message.list.MSM":"업무시간 내 접수된 건은 24시간 내에 답변드릴 예정입니다.\u003cbr\u003e요청 내용에 따라 검토가 지연될 수도 있으나 최대한 신속히 답변드리겠습니다.","common.form.complete.message.list.MSME":"업무시간 내 접수된 건은 24시간 내에 답변드릴 예정입니다.\u003cbr\u003e요청 내용에 따라 검토가 지연될 수도 있으나 최대한 신속히 답변드리겠습니다.","common.form.complete.message.list.MSNE":"환불 처리를 위해서는\u003cbr\u003e반드시 아래의 환불 계좌 정보를 입력해 주세요","common.form.complete.message.time":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSA":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSAE":"","common.form.complete.message.time.MSB":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSBE":"","common.form.complete.message.time.MSC":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSCE":"","common.form.complete.message.time.MSD":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSDE":"","common.form.complete.message.time.MSE":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSEE":"","common.form.complete.message.time.MSF":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSFE":"","common.form.complete.message.time.MSG":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSGE":"","common.form.complete.message.time.MSH":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSHE":"","common.form.complete.message.time.MSI":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSIE":"","common.form.complete.message.time.MSJ":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSJE":"","common.form.complete.message.time.MSK":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSKE":"","common.form.complete.message.time.MSL":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSLE":"","common.form.complete.message.time.MSM":"고객센터 상담시간 : 평일 9시 ~ 18시","common.form.complete.message.time.MSME":"","common.form.complete.message.time.MSNE":"","common.form.complete.refund.button.MSNE":"환불 계좌 정보 입력","common.helptext.text.font.big":"크게","common.helptext.text.font.bigger":"아주크게","common.helptext.text.font.biggest":"최대크게","common.helptext.text.font.normal":"보통","common.helptext.text.font.small":"작게","common.message.logout":"로그아웃 하시겠습니까?","common.text.agree":"동의합니다.","common.text.all":"전체","common.text.all.service":"서비스 전체보기","common.text.close":"닫기","common.text.confirm":"확인","common.text.cs":"고객센터","common.text.helptext":"도움말","common.text.helptext.more":"도움말 더보기","common.text.kin.more":"지식인 더보기","common.text.language":"언어명","common.text.login":"로그인","common.text.logout":"로그아웃","common.text.navercs":"네이버 고객센터","common.text.navercs.home":"네이버 고객센터 홈","common.text.necessary":"필수 입력 사항","common.text.prev":"이전 페이지","common.text.service":"서비스","common.text.service.more":"서비스 더보기","common.text.top":"맨위로","delete.file.fail":"파일 삭제에 실패하였습니다.","delete.file.occured.error":"파일 삭제 도중 오류가 발생하였습니다.","emergency.popup.message.complete":"알림 신청이 완료되었습니다.","emergency.popup.message.complete.both":"점검이 완료되면 네이버 알림과 입력하신 휴대전화 번호 [##telNumber##]로 SMS 알림을 보내드리겠습니다.","emergency.popup.message.complete.naver.alarm":"점검이 완료되면 네이버 알림을 보내드리겠습니다.","emergency.popup.message.complete.sms":"점검이 완료되면 휴대전화 번호 [##telNumber##]로 SMS 알림을 보내드리겠습니다.","emergency.popup.text.alarm":"알림 신청","emergency.popup.text.alarm.guide":"점검 완료 시 선택하신 알림으로 안내드립니다.","emergency.popup.text.dont.see.again":"다시 보지 않기","emergency.popup.text.except.dash":"-'를 제외하고 입력해 주세요.","emergency.popup.text.list.naver.alarm.info":"\u003cul\u003e\u003cli\u003e네이버 내 알림 페이지와 네이버 고객센터 톡톡에서 알림을 확인할 수 있습니다.\u003c/li\u003e\u003cli\u003e로그인 중인 네이버 아이디로 알림이 발송됩니다.\u003c/li\u003e\u003cli\u003e알림은 신청하신 건에 한하여 1회 발송됩니다.\u003c/li\u003e\u003c/ul\u003e","emergency.popup.text.naver.alarm":"네이버 알림","emergency.popup.text.naver.alarm.checkbox1":"네이버 알림으로 안내 받겠습니다.","emergency.popup.text.naver.alarm.checkbox2":"21~08시 사이에도 알림 받기","emergency.popup.text.phone":"휴대전화","emergency.popup.text.sms.alarm":"SMS 알림","emergency.popup.text.sms.alarm.checkbox1":"SMS로 안내 받겠습니다.","emergency.popup.text.sms.alarm.checkbox2":"개인정보 수집 및 이용 동의","emergency.popup.text.sms.alarm.checkbox2.guide":"휴대폰 번호는 SMS 알림 발송을 위해서만 수집하며 알림 \u003cem\u003e발송 후 즉시 파기\u003c/em\u003e됩니다. \u003cbr\u003e개인정보 수집 및 이용 동의를 거부하실 수 있으나, 이 경우 SMS 알림 발송이 제한됩니다.","emergency.popup.text.sms.alarm.info":"\u003cul\u003e\u003cli\u003eSMS 알림은 입력하신 휴대전화 번호로 1회만 발송됩니다.\u003c/li\u003e\u003cli\u003eSMS 알림을 받으실 정확한 휴대전화 번호를 입력해 주세요.\u003c/li\u003e\u003c/ul\u003e","emergency.popup.top.description":"현재 서비스 긴급 점검 중입니다.\u003cbr\u003e최대한 빨리 정상화될 수 있도록 최선을 다하겠습니다.\u003cbr\u003e서비스 이용에 불편을 드려 죄송합니다.","emergency.popup.top.text":"긴급 점검 안내","financial.footer.text.terms":"네이버파이낸셜 약관 및 정책","gnb.all.service.message.search.check.again":"서비스명이 정확한지 확인해 주세요.","gnb.all.service.message.search.not.found":"검색결과가 없습니다.","gnb.all.service.text":"고객센터 전체 서비스","gnb.all.service.text.description":"고객센터를 통해 궁금증을 해결하세요.","gnb.all.service.text.initial":"가나다순","gnb.all.service.text.input.placeholer":"서비스명 입력","gnb.all.service.text.section":"주제별","inquiry.file.attach.message":"파일 첨부 중입니다. \u003cbr\u003e잠시만 기다려주세요.","inquiry.form.select.guide.text":"유형을 선택해 주세요.","inquiry.form.text.attach.file":"파일첨부","inquiry.form.text.confirm":"문의하기","inquiry.form.text.file.extension":"exe, zip 등 일부 파일형식은 첨부하실 수 없습니다.","inquiry.form.text.file.size.10":"* 10MB 이하의 파일만 첨부하실 수 있습니다.","inquiry.form.text.file.size.10,5count":"10MB 이하의 파일 5개까지 첨부하실 수 있습니다.","inquiry.form.text.five.files.under.10mb":"파일명은 - , _를 제외한 특수문자는 허용되지 않습니다.\u003cbr\u003e아래 파일 형식만 첨부할 수 있습니다.[#separator#]이미지 : jpeg, jpg, gif, bmp, png\u003cbr\u003eMS오피스 : doc, docx, xls, xlsm, ppt, pptx, nodc, nppt, nxls, nfrm\u003cbr\u003e영상 : mkv, mp4, m4v, flv, avi, mov, wmv\u003cbr\u003e소리 : mp3, m4a, wav, aac, amr\u003cbr\u003e한글 : hwp, hwpx\u003cbr\u003e그 외 : pdf, txt, eml, tif, tiff","inquiry.item.agree.required":"개인정보 수집 미동의 시 문의 접수가 불가능합니다. ","inquiry.item.email.required":"이메일을 입력해주세요.","inquiry.item.emali.domain.select":"선택","inquiry.item.emali.domain.type.address":"직접입력","inquiry.item.text.required":"을(를) 입력해주세요.","inquiry.text.notice":"작성하신 내용에 욕설, 성희롱 등의 내용이 포함된 경우 관련 법령에 따라 조치될 수 있습니다.","inquiry.top.text.description":"궁금하신 점을 남겨주시면 접수 순서대로 답변 드리겠습니다.","inspection.description.text.list":"보다 안정적인 서비스 환경을 만들기 위해 현재 고객센터 서비스를 점검 중입니다.\u003cbr\u003e이용에 불편을 드린 점 진심으로 사과드리며,\u003cbr\u003e예정된 시간 안에 점검을 마칠 수 있도록 최선을 다하겠습니다.","inspection.noti.text.list":"점검 시간 중에는 전화와 이메일로 문의 접수가 가능합니다.\u003cbr\u003e[전화] 고객센터 1588-3820 (평일 09~18시), 장애/유해 대응 센터 1588-3829 (24시간)\u003cbr\u003e[이메일] ccnaver@naver.com","inspection.text.date":"점검 일자","inspection.text.reason":"점검 이유","inspection.text.reason.guide":"더욱 편리한 이용을 위해 고객센터가 개선됩니다.","inspection.text.time":"점검 시간","inspection.text.time.duration":"총 1시간, 한국 시간 기준","inspection.top.text":"서비스 긴급 점검 중 입니다.","keep.customer.privacy.default.message":"개인정보는 문의 접수 및 처리 결과 회신을 위해 3년간 보관합니다.","main,recommend.keyword.text":"추천 검색어","main.faq.get.more.help":"도움말 자세히 보기","main.faq.text":"자주 찾는 도움말","main.faq.text.all.category":"전체","main.input.placeholer":"궁금한 점을 검색해 보세요.","main.represent.service.text":"고객센터를 통해 궁금증을 해결하세요.","main.ticker.text.all.notice.link":"공지 전체보기","main.ticker.text.notice":"공지","main.ticker.text.urgent.notice":"긴급공지","main.top.text.description":"궁금한 점은 검색으로 쉽고 빠르게 확인하세요.","not.found.description.text.list":"주소가 잘못 입력되었거나, 변경 혹은 삭제되어 \u003cbr className={cx('row_mo')} /\u003e요청하신 페이지를 찾을 수 없습니다.\u003cbr\u003e입력하신 주소가 정확한 지 \u003cbr className={cx('row_mo')} /\u003e다시 한번 확인해 주시기 바랍니다.","not.found.top.text":"페이지를 [#group_begin#]찾을 수 없습니다.[#group_end#]","notice.category.text.event":"이벤트","notice.category.text.inspection":"점검","notice.input.placeholder":"공지사항 검색","notice.search.message.not.found":"검색된 공지가 없습니다.","notice.search.message.not.registered":"등록된 공지가 없습니다.","notice.service.top.text":"[##serviceName##] 고객센터 공지사항","notice.text.list":"목록","notice.text.next":"다음","notice.text.previous":"이전","notice.top.text":"공지사항","over.count.file.attachable":"첨부 가능한 파일 개수를 초과했습니다. 최대 5개까지 첨부하실 수 있습니다.","over.size.file.attachable":"첨부 가능한 파일 용량을 초과했습니다.\\n총 20MB까지 첨부하실 수 있습니다.","search.category.text.kin":"지식iN","search.message.list.not.found":"단어의 철자가 정확한 지 확인해 주세요.\u003cbr\u003e다른 검색어로 다시 시도해 보세요.","search.message.not.found":"[#searchKeyword#]에 대한 \u003cbr class='row_mo' /\u003e[#searchName#] 검색 결과가 없습니다.","search.result.title":"검색결과","search.text.sort.newest":"최신순","search.text.sort.relevance":"관련도순","service.category.text.faq":"자주 찾는 도움말","service.helptext.message.share.copied.url":"주소가 복사되었습니다.","service.helptext.message.share.copy.url":"URL 복사","service.helptext.message.share.paste.url":"원하는 곳에 붙여넣기 해주세요.","service.helptext.text.feedback.complete":"평가완료","service.helptext.text.feedback.exceed.alert":"300자를 넘을 수 없습니다.","service.helptext.text.feedback.no":"아니오","service.helptext.text.feedback.no.input.placeholder":"의견을 입력해 주세요.","service.helptext.text.feedback.no.message":"도움이 되지 않은 사유를 알려주세요.\u003cbr\u003e더 나은 도움말 제공을 위해 소중히 활용하겠습니다.","service.helptext.text.feedback.question":"도움말이 도움이 되셨나요?","service.helptext.text.feedback.yes":"예","service.helptext.text.feedback.yes.message":"소중한 의견에 감사합니다.","service.helptext.text.font.bigger.message":"글자 크기가 커졌습니다. ","service.helptext.text.font.smaller.message":"글자 크기가 작아졌습니다. ","service.helptext.text.keyword":"연관키워드","service.helptext.text.os.android":"Android","service.helptext.text.os.ios":"iOS","service.helptext.text.os.mobile":"모바일","service.helptext.text.os.pc":"PC","service.helptext.text.share":"공유하기","service.helptext.text.share.band":"밴드","service.helptext.text.share.blog":"블로그","service.helptext.text.share.cafe":"카페","service.helptext.text.share.facebook":"페이스북","service.helptext.text.share.kakaostory":"카카오스토리","service.helptext.text.share.kakaotalk":"카카오톡","service.helptext.text.share.keep":"Keep","service.helptext.text.share.line":"라인","service.helptext.text.share.mail":"메일","service.helptext.text.share.memo":"메모","service.helptext.text.share.twitter":"트위터","service.helptext.text.tip":"정보/TIP","service.input.placeholer":"궁금한 점을 검색해 보세요.","service.search.input.placeholer":"[#serviceName#] 검색","service.search.text":"[#serviceName#]의 궁금한 점을 검색해 보세요.","service.top.text.title":"[#serviceName#] 고객센터","suggestion.form.complete.message.list":"소중한 의견에 감사드립니다.\u003cbr\u003e의견에 직접 답변을 드리지는 않지만 관련 부서에 전달하여 검토될 수 있도록 하겠습니다.\u003cbr\u003e네이버를 이용해 주셔서 감사합니다.","suggestion.form.text.checkbox":"동의합니다.","suggestion.form.text.confirm":"제안하기","suggestion.form.text.content":"제안사항","suggestion.form.text.content.entered":"[#inputCount#] 자 입력 / 최대 [#inputMaxCount#]자","suggestion.form.text.description":"작성하신 내용에 욕설, 성희롱 등의 내용이 포함된 경우 관련 법령에 따라 조치될 수 있습니다.","suggestion.form.text.email":"이메일","suggestion.form.text.list.privacy.detail":"수집하는 개인정보 항목: 이메일 주소\u003cbr\u003e작성해 주시는 개인정보는 문의 접수 및 고객 불만 해결을 위해 \u003cstrong\u003e3년간 보관됩니다.\u003c/strong\u003e\u003cbr\u003e 이용자는 본 동의를 거부할 수 있으나, 미동의 시 문의 접수가 불가능합니다.","suggestion.form.text.privacy.agree":"개인정보 수집 동의","suggestion.input.placeholder":"서비스명 입력","suggestion.search.message.check.again":"서비스명이 정확한지 확인해 주세요.","suggestion.search.message.not.found":"검색결과가 없습니다.","suggestion.text.list.notice":"제안주신 내용에 대해 별도의 결과를 안내해 드리지 않습니다.\u003cbr\u003e답변을 원하는 요청사항은 각 서비스의 도움말을 확인 후 문의를 접수해 주세요.\u003cbr\u003e보내주신 의견은 서비스 개선을 위해 소중히 활용하고 있습니다.","suggestion.top.text":"제안하기","suggestion.top.text.description":"네이버 서비스에 제안하실 의견을 접수해 주세요","text.can.not.over.write.until":"[#maxlength#]자 이내로 입력해 주세요.","text.login":"로그인하기","validate.inquiry.checkbox":"체크박스를 선택해 주세요.","validate.inquiry.form.select.item":"셀렉트 박스를 선택해 주세요.","validation.need.login":"로그인이 필요합니다.","validation.need.vlive.vid.check":"V LIVE 로그인 후 문의해주세요. 로그인이 불가능한 경우, [ 도움말 \u003e 메일문의하기 \u003e 제안/기타문의 ]를 통해 접수해주세요.","vlive.footer.text.privacy":"개인정보처리방침","vlive.footer.text.terms":"이용약관","vlive.footer.text.youth":"청소년보호정책","vlive.text.login":"로그인하기","webtoon.footer.text.privacy":"네이버웹툰 개인정보처리방침","webtoon.footer.text.terms":"네이버웹툰 이용약관"}},"help":{"category":[],"bookmarkHelpList":[],"helpList":[],"help":[],"scenarioHelp":[],"scenarioChildHelp":[],"satisfaction":null,"satisfactionCompleteList":[],"useScrollTop":true,"isCategoryOpen":false,"subCategoryPage":{"current":1,"total":1},"mobileSubCategoryScroll":{"categoryAlias":"-1","subCategoryAlias":"-1","scrollLeft":0},"subCategoryList":[]},"smartbot":{"smartbot":null,"nShowSmartBot":0},"main":{"bookmarkCategoryList":[],"bookmarkHelpList":[],"representServiceList":[]},"notice":{"category":[],"noticeList":null,"noticeDetail":null},"remedy":{"addressDo":[],"addressSi":[],"addressDong":[]},"reportCenter":{"urlInfo":null},"inquiry":{"categoryList":[],"inquiryContent":{"isRequest":false,"isSuccess":false,"list":[]},"topGuideContent":"","formHeader":"","form":null,"formNHelpToken":"","request":{"isRequest":false,"isSuccess":false},"checkValidationAll":false,"loadingText":"","isLoading":false},"captcha":{"data":{"captcha":null,"hash":0},"isValid":null},"mailForm":{"isLoaded":false,"satisfaction":null},"suggestion":{"list":[],"form":{"ecmsCategory":{"categoryNo":5288,"categoryName":"회원정보 서비스에 제안하기","reInquiryYn":"N"},"inquiryFormItemList":[{"categoryNo":12289,"itemNo":544,"itemType":"HTML","itemKey":"moText2CA","itemKeyValue":null,"dataMakerCode":null,"expresstionPhrase":"의견내용","guidePhraseDisplayYn":"Y","guideClearYn":"Y","guidePhraseContent":null,"essentialityYn":"Y"},{"categoryNo":0,"itemNo":533,"itemType":"EMAIL","itemKey":null,"itemKeyValue":null,"dataMakerCode":null,"expresstionPhrase":null,"guidePhraseDisplayYn":null,"guideClearYn":null,"guidePhraseContent":null,"essentialityYn":null},{"categoryNo":0,"itemNo":534,"itemType":"AGREE","itemKey":null,"itemKeyValue":null,"dataMakerCode":null,"expresstionPhrase":null,"guidePhraseDisplayYn":null,"guideClearYn":null,"guidePhraseContent":null,"essentialityYn":null}],"inquiryResultPageCode":"MSDE"},"formNHelpToken":"6721c7e32c34457ab387016193678bdc"},"vlive":{"vLiveNumber":""},"seViewer":{"isSeViewerLoaded":false}}},"__N_SSP":true},"page":"/suggestion/input.help","query":{"serviceNo":"5640","lang":"ko","as_home":"true"},"buildId":"jfloKpFvw48CRMrW61DVH","isFallback":false,"gssp":true,"scriptLoader":[]}</script>

<br>
<br>	

<jsp:include page="../member/bottom.jsp"></jsp:include>
</body>
</html>