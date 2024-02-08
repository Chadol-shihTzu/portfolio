<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ include file="../include/miniheader.jsp" %>
<div class="container my-5">
   <div class="row">
   	<div class="col-3"></div>
      <div class="col-xl-6 p-5 border">
	      <div class="d-flex justify-content-between">
	      	<h5 class="md-5">회원가입</h5>
		      	<div class="btn-group">
						<a class="btn btn-outline-warning" href="${path}" style="height:38px">Home</a>
				</div>
				
				
			</div>
			<div class="d-flex justify-content-end mt-3">
				<p style="font-size:13px;"><span class="text-danger">*</span> 필수항목</p>
			</div>
			
      	<form id="joinForm" method="post" class="mt-2" autocomplete="off" >
      	
      		<div class="input-group mb-3">
      			<label class="joinLabel input-group-text">아이디<span class="text-danger">*</span></label>
      			<input type="text" class="form-control form-control-sm" placeholder="아이디 입력" id="userId" name="userId" />
      			<input type="button" class="idCheck btn btn-outline-secondary form-control-sm btn-sm" value="중복검사" />
      		</div>
      		<p class="result" style="font-size:13px;">
      			<span class="msg" ></span>
      		</p>
      		<!-- 아이디 확인 메세지 (DB연동) / if절 써서 6자이상 영문 혹은 영문과 숫자조합 아니면 빨간색 -->
      		<!-- 비밀번호 등 유효성 검사 -->
      		<div class="input-group mb-3">
			    <label class="joinLabel input-group-text">비밀번호<span class="text-danger" >*</span></label>
			    <input type="password" class="password-form form-control form-control-sm" placeholder="비밀번호 입력" id="userPassword" name="userPassword" required/>
			    <!-- 눈알 누르면 비밀번호 보이게/숨기게 -->
			    <i id="togglePassword" class="eyes fa-regular fa-eye-slash" onclick="togglePasswordVisibility()"></i>
			</div>
			
			
			<div class="input-group mb-3">
			    <label class="joinLabel input-group-text">비밀번호 확인<span class="text-danger" >*</span></label>
			    <input type="password" class="password-form form-control form-control-sm" placeholder="비밀번호 확인" id="userRePassword" name="userRePassword" required/>
			    <i id="toggleRePassword" class="eyes fa-regular fa-eye-slash" onclick="toggleRePasswordVisibility()"></i>
			</div>

      		<div class="input-group mb-3">
      			<label class="joinLabel input-group-text">이름<span class="text-danger" >*</span></label>
      			<input type="text" class="form-control form-control-sm" placeholder="이름 입력" id="userName" name="userName" required />
      		</div>
      		
      		<div class="input-group mb-3">
      			<label class="joinLabel input-group-text">생년월일<span class="text-danger" >*</span></label>
      			<input type="text" class="form-control form-control-sm" placeholder="예)19951215" id="userBirth" name="userBirth" required />
      		</div>
      		
      		<div class="input-group mb-3">
      			<label class="joinLabel input-group-text">연락처<span class="text-danger" >*</span></label>
      			<input type="text" class="form-control form-control-sm" placeholder="예)01012345678" id="userPhone" name="userPhone" required />
      		</div>
      		
      		<!-- 성별선택을 해야 넘어가게 성별선택으로 냅두면 못 넘어가게 수정 -->
      		<div class="input-group mb-3">
      				<label class="joinLabel input-group-text">성별<span class="text-danger" >*</span></label>
      				<select id="userGender" name="userGender" class="form-select joinLabel" required>
      					<option disabled selected>성별 선택</option>
      					<option value="남자">남자</option>
      					<option value="여자">여자</option>
      					<option value="LGBT">LGBT</option>
      					<option value="선택안함">선택안함</option>
      				</select>
      		</div>
      		
      		<div class="input-group mb-3">
      			<label class="joinLabel input-group-text">우편번호<span class="text-danger" >*</span></label>
      			<input type="text" class="form-control form-control-sm address_input_1" placeholder="우편번호" id="userAddr1" name="userAddr1" readonly="readonly" />
      			<a class="btn btn-outline-secondary addr_Check_Btn joinLabel" onclick="go_daum_address()">주소 검색</a>
      		</div>
      		<div class="input-group mb-3">
      			<input type="text" class="form-control form-control-sm address_input_2" placeholder="도로명주소" id="userAddr2" name="userAddr2" readonly="readonly" />
      		</div>
      		<div class="input-group mb-3">
      			<input type="text" class="form-control form-control-sm address_input_3" placeholder="상세주소" id="userAddr3" name="userAddr3" readonly="readonly" />
      		</div>
      		<!-- 인증번호 요청버튼 누르면 인증번호 입력란 활성화 /  -->
      		<div class="input-group mb-3">
      			<label class="joinLabel input-group-text">이메일<span class="text-danger" >*</span></label>
      			<input type="email" class="form-control form-control-sm" placeholder="이메일 입력" id="userEmail" name="userEmail" required />
      			<a class="joinLabel btn btn-outline-secondary phone_Check_Btn" id="userPhone">인증요청</a>
      		</div>
      		<div class="input-group mb-3">
      			<input type="text" class="form-control form-control-sm" placeholder="인증번호" id="" name="" disabled>
      			<a class="joinLabel btn btn-outline-secondary email_Check_Btn" id="userEmail">확인</a>
      		</div>
      		

    <!-- submit btn -->
    <div class="d-flex btn-group">
        <a class="btn btn-outline-danger" href="${path}/member/joinAgree">이전</a>
        <button class="btn btn-outline-primary" id="submit"  onclick="joinSubmit(); return false;" disabled >회원가입</button>
    </div>
</form>
      </div>
      <div class="col-3"></div>
   </div>
</div>

<!-- 아이디 유효성검사/중복검사 -->
<script>
function validateUserId() {
    var userId = $("#userId").val();
    var regex = /^[a-zA-Z0-9_]{4,16}$/; // 영문자, 숫자, 밑줄(_)로 이루어진 4에서 16자 사이의 아이디

    if (!regex.test(userId)) {
        $(".result .msg").text("아이디는 영문자, 숫자, 밑줄(_)로 4에서 16자 사이여야 합니다.");
        $(".result .msg").attr("style", "color:#f00");
        $("#submit").attr("disabled","disabled");
        return false;
    } else {
        $(".result .msg").text("아이디를 확인해주십시오.");
        $(".result .msg").attr("style", "color:#000");
        return true;
    }
}

function checkDuplicate() {
    var userId = $("#userId").val();
    var query = { userId: userId };

    $.ajax({
        url: "/jdh/member/idCheck",
        type: "post",
        data: query,
        success: function (data) {
            if (data == 1) {
                $(".result .msg").text("이미 등록된 아이디입니다.");
                $(".result .msg").attr("style", "color:#f00");
                $("#submit").attr("disabled", "disabled");
            } else {
                $(".result .msg").text("사용 가능한 아이디입니다.");
                $(".result .msg").attr("style", "color:#00f");
                $("#submit").removeAttr("disabled");
            }
        }
    });
}

$(document).ready(function () {
    // 아이디 입력란에서 포커스를 잃을 때 유효성 검사 실행
    $("#userId").blur(function () {
        if (validateUserId()) {
            checkDuplicate();
        }
    });

    $(".idCheck").click(function () {
        if (validateUserId()) {
            checkDuplicate();
        }
    });

    $("#userId").keyup(function () {
        validateUserId();
    });
});


function joinSubmit() {
	 
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;
	var birth_rule = /^\d{8}$/;
	var password_rule = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	
	if ($("#userPassword").val() == null || $("#userPassword").val() == "") {
	alert("비밀번호를 입력해주세요.");
	$("#userPassword").focus();
	 
	return false;
	}
	 
	if ($("#userRePassword").val() == null || $("#userRePassword").val() == "") {
	alert("비밀번호 확인을 입력해주세요.");
	$("#userRePassword").focus();
	 
	return false;
	}
	
	if (!password_rule.test($("#userPassword").val())) {
	alert("비밀번호는 최소 8자 이상이며, 영문 대문자, 영문 소문자, 숫자, 특수문자 중 최소 1개 이상을 포함해야 합니다.");
	$("#userPassword").focus();
	 
	return false;
	}
	 
	if ($("#userPassword").val() != $("#userRePassword").val()) {
	alert("비밀번호가 일치하지 않습니다.");
	$("#userRePassword").focus();
	 
	return false;
	}
	
	if ($("#userName").val() == null || $("#userName").val() == "") {
	alert("이름을 입력해주세요.");
	$("#userName").focus();
	 
	return false;
	}
	
	if ($("#userBirth").val() == null || $("#userBirth").val() == "") {
	alert("생년월일을 입력해주세요.");
	$("#userBirth").focus();
	 
	return false;
	}
	
	if (!birth_rule.test($("#userBirth").val())) {
	alert("생년월일을 형식에 맞게 입력해주세요. 예) 19951230");
	$("#userBirth").focus();
	 
	return false;
	}
	
	if ($("#userPhone").val() == null || $("#userPhone").val() == "") {
	alert("연락처를 입력해주세요.");
	$("#userPhone").focus();
	 
	return false;
	}
	if(!tel_rule.test($("#userPhone").val())){
	alert("연락처를 형식에 맞게 입력해주세요. 예) 01012345678");
	$("#userPhone").focus();
	return false;
	} 
	 
	/* 성별을 선택해주세요. */ 
	if ($("#userGender")[0].selectedIndex === 0) { 
	    alert("성별을 선택해주세요.");
	    $("#userGender").focus();
	    return false;
	}

	if ($("#userAddr1").val() == null || $("#userAddr1").val() == "") {
	alert("우편번호를 입력해주세요.");
	$("#userAddr1").focus();
	 
	return false;
	}
	
	if ($("#userAddr2").val() == null || $("#userAddr2").val() == "") {
		alert("도로명주소를 입력해주세요.");
		$("#userAddr2").focus();
		 
		return false;
		}
	
	if ($("#userAddr3").val() == null || $("#userAddr3").val() == "") {
		alert("상세주소를 입력해주세요.");
		$("#userAddr3").focus();
		 
		return false;
		}
	
	if ($("#userEmail").val() == null || $("#userEmail").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#userEmail").focus();
		 
		return false;
		}
		 
	if(!email_rule.test($("#userEmail").val())){
	alert("이메일을 형식에 맞게 입력해주세요. 예) 1234@naver.com");
	$("#userEmail").focus();
	return false;
	} 
	var joinForm = document.getElementById("joinForm");
	joinForm.submit();
	 
}	


	
</script>

</body>
</html>

<%@ include file="../include/minifooter.jsp" %>