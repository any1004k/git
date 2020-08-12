<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"  %> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>네이버 : 회원가입</title>
        
        
        <link rel="stylesheet" href="../resources/css/memberRegister.css">
        <script src="../resources/js/jquery.min.js"></script>
        <script src="../resources/js/main/memberRegister.js"></script>
        
        <meta name="decorator" content="V2_JOIN">
    </head>
    <body>
        <div id="wrap">
            <!-- 스킵네비게이션 : 웹접근성대응-->
            <div id="u_skip">
                <a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;">
                    <span>본문으로 바로가기</span>
                </a>
            </div>
            <!-- //스킵네비게이션 -->
            <!-- header -->
            <div id="header" class="join_membership" role="banner">
                <h1>
                    <a href="/kteun/main/main" class="h_logo">
                        <span class="blind">장가게</span>
                    </a>
                </h1>
            </div>
            <!-- // header -->
            <form id="join_form" method="post" action="/kteun/main/memberRegister" >
                
                <div id="container" role="main">
                    <div id="content">
                        <!-- tg-text=title -->
                        <h2 class="blind">네이버 회원가입</h2>
                        <div class="join_content">
                            <!-- 아이디, 비밀번호 입력 -->
                            <div class="row_group">
                                <div class="join_row">
                                    <h3 class="join_title">
                                        <label for="id">아이디</label>
                                    </h3>
                                    <span class="ps_box int_id">
                                        <input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                                        
                                    </span>
                                    <span class="error_next_box" id="idMsg"></span>
                                </div>
                                <div class="join_row">
                                    <h3 class="join_title">
                                        <label for="pswd1">비밀번호</label>
                                    </h3>
                                    <span class="ps_box int_pass" id="pswd1Img">
                                        <input type="password" id="pswd1" name="password" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                                      <!--   <span class="lbl">
                                            <span id="pw1Msg" class="step_txt">sdfsdfsdf</span>
                                        </span> -->
                                    </span>
                                    <span class="error_next_box" id="pw1Msg"></span>
                                    <h3 class="join_title">
                                        <label for="pswd2">비밀번호 재확인</label>
                                    </h3>
                                    <span class="ps_box int_pass_check" id="pswd2Img">
                                        <input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
                                        <span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
                                    </span>
                                    <span class="error_next_box" id="pswd2Msg" ></span>
                                </div>
                            </div>
                            <!-- // 아이디, 비밀번호 입력 -->
                            <!-- 이름, 생년월일 입력 -->
                            <div class="row_group">
                                <!-- lang = ko_KR -->
                                <div class="join_row">
                                    <h3 class="join_title">
                                        <label for="name">이름</label>
                                    </h3>
                                    <span class="ps_box box_right_space">
                                        <input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
                                    </span>
                                    <span class="error_next_box" id="nameMsg" style="display:none" aria-live="assertive"></span>
                                </div>
                                <!-- lang = ko_KR -->
                                <div class="join_row join_birthday">
                                    <h3 class="join_title">
                                        <label for="yy">생년월일</label>
                                    </h3>
                                    <div class="bir_wrap">
                                        <div class="bir_yy">
                                            <span class="ps_box">
                                                <input type="text" id="yy" placeholder="년(4자)" name="birth_year" aria-label="년(4자)" class="int" maxlength="4">
                                            </span>
                                        </div>
                                        <div class="bir_mm">
                                            <span class="ps_box">
                                                <select id="mm" class="sel" aria-label="월" name="birth_month">
                                                    <option value="">월</option>
                                                    <option value="01">1
                                                        </option>
                                                    <option value="02">2
                                                        </option>
                                                    <option value="03">3
                                                        </option>
                                                    <option value="04">4
                                                        </option>
                                                    <option value="05">5
                                                        </option>
                                                    <option value="06">6
                                                        </option>
                                                    <option value="07">7
                                                        </option>
                                                    <option value="08">8
                                                        </option>
                                                    <option value="09">9
                                                        </option>
                                                    <option value="10">10
                                                        </option>
                                                    <option value="11">11
                                                        </option>
                                                    <option value="12">12
                                                        </option>
                                                </select>
                                            </span>
                                        </div>
                                        <div class=" bir_dd">
                                            <span class="ps_box">
                                                <input type="text" id="dd" name="birth_day" placeholder="일" aria-label="일" class="int" maxlength="2">
                                                <label for="dd" class="lbl"></label>
                                            </span>
                                        </div>
                                    </div>
                                    <span class="error_next_box" id="birthdayMsg" ></span>
                                </div>
                                <div class="join_row join_sex">
                                    <h3 class="join_title">
                                        <label for="gender">성별</label>
                                    </h3>
                                    <div class="ps_box gender_code">
                                        <select id="gender" name="gender" class="sel" aria-label="성별">
                                            <option value="" selected>성별</option>
                                            <option value="male">남자</option>
                                            <option value="female">여자</option>
                                        </select>
                                    </div>
                                </div>
                                <span class="error_next_box" id="genderMsg" style="display:none" aria-live="assertive"></span>
                                <div class="join_row join_email">
                                    <h3 class="join_title">
                                        <label for="email">
                                           	  이메일
                   	                     </label>
                                    </h3>
                                    <span class="ps_box int_email box_right_space">
                                        <input type="text" id="email" name="email" placeholder="선택입력" aria-label="선택입력" class="int" maxlength="100">
                                    </span>
                                </div>
                                <span class="error_next_box" id="emailMsg"></span>
                            </div>
                            <!-- // 이름, 생년월일 입력 -->
                            <!-- 휴대전화 번호, 인증번호 입력 -->
                            <div class="join_row join_mobile" id="mobDiv">
                                <h3 class="join_title">
                                    <label for="phoneNo">휴대전화</label>
                                </h3>
                               
                                <div class="int_mobile_area">
                                    <span class="ps_box int_mobile"><input type="text" id="phoneNo" class="int" name="phone" placeholder="전화번호 입력"  maxlength="16"></span>
                                   
                                </div>
                               
                                <span class="error_next_box" id="phoneNoMsg"></span>
                                <span class="error_next_box" id="authNoMsg"></span>
                                <span class="error_next_box" id="joinMsg"></span>
                            </div>
                            <!-- // 휴대전화 번호, 인증번호 입력 -->
                            <!-- tg-display=>{"보호자 모바일 인증": [], "오류 메시지": []} -->
                            <div class="join_minor tab" id="pmobDiv" style="display:none">
                                <ul class="tab_m" role="tablist">
                                    <li class="m1" role="presentation">
                                        <a href="#" onclick="return false;" class="on" role="tab" aria-selected="true" aria-controls="wa_tab_phone">휴대전화인증</a>
                                    </li>
                                    <li class="m2" role="presentation">
                                        <a href="#" id="tabPrtsIpin" role="tab" aria-selected="false" aria-controls="wa_tab_ipin">아이핀 인증</a>
                                    </li>
                                </ul>
                                <div id="wa_tab_phone" role="tabpanel">
                                    <div class="agree_check_wrap">
                                        <div class="terms_chk_all">
                                            <span class="input_chk">
                                                <input type="checkbox" id="pagree_all" class="chk_all">
                                                <label for="pagree_all">
                                                    <span class="chk_all_txt">아래 약관에 모두 동의합니다.</span>
                                                </label>
                                            </span>
                                        </div>
                                        <div class="small_check_box">
                                            <span class="input_chk">
                                                <input type="checkbox" id="pagree_01" class="chk">
                                                <label for="pagree_01">
                                                    <a href="https://nid.naver.com/user2/common/terms/terms.nhn?m=viewPersonalInfoTerms" target="_blank">
                                                        <span>개인정보 이용</span>
                                                    </a>
                                                </label>
                                            </span>
                                            <span class="input_chk">
                                                <input type="checkbox" id="pagree_02" class="chk">
                                                <label for="pagree_02">
                                                    <a href="https://nid.naver.com/user2/common/terms/terms.nhn?m=viewUniqInfoTerms" target="_blank">
                                                        <span>고유식별정보 처리</span>
                                                    </a>
                                                </label>
                                            </span>
                                            <span class="input_chk">
                                                <input type="checkbox" id="pagree_03" class="chk">
                                                <label for="pagree_03">
                                                    <a href="https://nid.naver.com/user2/common/terms/terms.nhn?m=viewCellPhoneCarriersTerms" target="_blank">
                                                        <span>통신사 이용약관</span>
                                                    </a>
                                                </label>
                                            </span>
                                            <span class="input_chk">
                                                <input type="checkbox" id="pagree_04" class="chk">
                                                <label for="pagree_04">
                                                    <a href="https://nid.naver.com/user2/common/terms/terms.nhn?m=viewServiceTerms" target="_blank">
                                                        <span>인증사 이용약관</span>
                                                    </a>
                                                </label>
                                            </span>
                                            <span class="input_chk">
                                                <input type="checkbox" id="pagree_05" class="chk">
                                                <label for="pagree_05">
                                                    <a href="https://nid.naver.com/user2/common/terms/terms.nhn?m=viewNaverTerms" target="_blank">
                                                        <span>네이버 개인정보 수집</span>
                                                    </a>
                                                </label>
                                            </span>
                                        </div>
                                        <span class="error_next_box" id="pagreeMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                                    </div>
                                    <div class="row_group">
                                        <div class="join_row">
                                            <h3 class="join_title">
                                                <label for="pname">보호자 이름</label>
                                            </h3>
                                            <span class="ps_box box_right_space">
                                                <input type="text" id="pname" name="pname" title="보호자 이름" class="int" maxlength="40">
                                            </span>
                                            <span class="error_next_box" id="pnameMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                                        </div>
                                        <div class="join_row join_birthday">
                                            <h3 class="join_title">
                                                <label for="pyy">보호자 생년월일</label>
                                            </h3>
                                            <div class="bir_wrap">
                                                <div class="bir_yy">
                                                    <span class="ps_box">
                                                        <input type="text" id="pyy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
                                                    </span>
                                                </div>
                                                <div class="bir_mm">
                                                    <span class="ps_box">
                                                        <select id="pmm" name="pmm" class="sel" aria-label="월">
                                                            <option>월</option>
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                            <option>6</option>
                                                            <option>7</option>
                                                            <option>8</option>
                                                            <option>9</option>
                                                            <option>10</option>
                                                            <option>11</option>
                                                            <option>12</option>
                                                        </select>
                                                    </span>
                                                </div>
                                                <div class="bir_dd">
                                                    <span class="ps_box">
                                                        <input type="text" id="pdd" placeholder="일" aria-label="일" class="int" maxlength="2">
                                                        <label for="pdd" class="lbl"></label>
                                                    </span>
                                                </div>
                                            </div>
                                            <span class="error_next_box" id="pbirthdayMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                                        </div>
                                        <div class="join_row">
                                            <h3 class="join_title">
                                                <label for="pgender">보호자 성별/국적</label>
                                            </h3>
                                            <div class="join_guardian">
                                                <div class="gender_nationality">
                                                    <div class="ps_box gender_code">
                                                        <select id="pgender" name="pgender" class="sel" aria-label="성별">
                                                            <option value="" selected="">성별</option>
                                                            <option value="0">남자</option>
                                                            <option value="1">여자</option>
                                                        </select>
                                                    </div>
                                                </div>
                                               
                                            </div>
                                            
                                        </div>
                                    </div>
                                    
                                    <div class="join_row join_mobile">
                                        <h3 class="join_title">
                                            <label for="pphoneNo">휴대전화</label>
                                        </h3>
                                        <div class="int_mobile_area">
                                            <span class="ps_box int_mobile">
                                                <input type="tel" id="pphoneNo" name="phone" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                                            </span>
                                            <a href="#" class="btn_verify btn_primary" id="btnPrtsSend" role="button">
                                                <span class="">인증번호 받기</span>
                                            </a>
                                        </div>
                                        <div class="ps_box_disable box_right_space" id="pauthNoBox">
                                            <input type="tel" id="pauthNo" name="pauthNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="pwa_verify" class="int" disabled maxlength="6">
                                            <label id="pwa_verify" for="pauthNo" class="lbl">
                                                <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                                                <span class="input_code" id="pauthNoCode" style="display:none;"></span>
                                            </label>
                                        </div>
                                        <span class="error_next_box" id="pphoneNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                                        <span class="error_next_box" id="pauthNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                                        <span class="error_next_box" id="pjoinMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="btn_area">
                                <button type="button" id="btnJoin" class="btn_type btn_primary">
                                    <span>가입하기</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- // container -->
            </form>
            <!--가상주민번호-아이핀 팝업페이지 호출시 필요한 form-->
           <!--  <form name="form_ipin" method="post" action="">
                <input type="hidden" name="m" value="pubmain">
                <input type="hidden" name="enc_data" value="AgEEQTczOMrqDF+P8KBuz2JR5zOuzAkYj99MSMUZUwBAZsYWGMlSV4gNgOkHAvJL6XCz0kT1E+bZB7Rp496q6mHNUHy7rqaYexGjXqdm6h7v2C4Ai/oJBPQ3Y7MsBi57fC1zTO6zM5WqsHp920yrKHUqTNdVnLSwRrroFKAtWtt17Ctc9sV6yvs3XrGjmpd556aNMaEHBoAw/rlkSLjB5bA8XAefJ815dWYrU9Y1APT05brSeEbEo6/CsVgQkkaJ1MdyKYWlJ8lIMrRvuZrNwzqQbycABpljioUCUj40Y7e+AYp9Me0Gwd2EPB5RFITL5qdTtJCvgw==">
            </form> -->
           

               
            <!-- footer -->
            <div id="footer" role="contentinfo">
                <ul>
                    <li>
                        <a href="">이용약관</a>
                    </li>
                    <li>
                        <strong>
                            <a href="">개인정보처리방침</a>
                        </strong>
                    </li>
                    <li>
                        <a href="">책임의 한계와 법적고지</a>
                    </li>
                    <li>
                        <a href="" target="_blank">회원정보 고객센터 </a>
                    </li>
                </ul>
                <address>
                    
                </address>
            </div>
            <!-- //footer -->
        </div>
    </body>
</html>