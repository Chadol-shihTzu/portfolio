function checkId(){
	
}

/*비밀번호 유효성검사 정규식 넣어야함
function isValidPassword(){
	var userPassword = document.getElementById('userPassword').value;
	var message = document.getElementById('passwordConfirmMessage');
	
	if(userPassword.length < 8 || userPassword.length > 16){
		message.textContent = '비밀번호는 8~16자 / 영문 대소문자, 숫자, 특수문자 중 최소 하나 이상 포함해주세요.';
		message.style.color = '#dc3545';
		message.style.fontSize = '13px';
	}else{
		message.textContent = '';
	}
}
*/
/*비밀번호와 비밀번호 확인 같은지?
function checkPassword() {
        var userPassword = document.getElementById('userPassword').value;
        var userRePassword = document.getElementById('userRePassword').value;
		var message = document.getElementById('passwordConfirmMessage');
        var message2 = document.getElementById('passwordConfirmMessage2');

        if (userPassword != userRePassword) {
			message2.textContent = '비밀번호가 일치하지 않습니다.';
            message2.style.color = '#dc3545'; 
		}else if(userPassword == "" || userRePassword == ""){
			message2.textContent = '비밀번호를 입력해주세요. 유효성검사';
            message2.style.color = '#dc3545'; 
		} else {
            message2.textContent = '비밀번호가 일치합니다.';
            message2.style.color = 'green';
 			message.style.display = 'none';  // message를 숨김
 
        }
        message2.style.fontSize = '13px';
    }
    }
*/

/* 회원가입 동의 모두체크하기 */
function checkAll(checkbox) {
        var checkboxes = document.querySelectorAll('input[type="checkbox"][name$="_Agr"]');
        checkboxes.forEach(function (box) {
            box.checked = checkbox.checked;
        });
    }

    function checkAll(checkbox) {
        var checkboxes = document.querySelectorAll('input[type="checkbox"][name$="_Agr"]');
        checkboxes.forEach(function (box) {
            box.checked = checkbox.checked;
        });
    }

    function onAgreeButtonClick() {
        var requiredCheckboxes = document.querySelectorAll('input[type="checkbox"].required_Agr');
        var allChecked = Array.from(requiredCheckboxes).every(function (box) {
            return box.checked;
        });

        if (!allChecked) {
            alert("필수 항목을 모두 체크해주세요.");
        } else {
            window.location.href = "/jdh/member/join";
        }
    }
    
/* 회원정보 동의 팝업창! */
function openPopup1() {
    var path = 'http://localhost:8080';
    var width = 500;
    var height = 600;

    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    left = left < 0 ? 0 : left;
    top = top < 0 ? 0 : top;

    window.open(path + '/jdh/member/agreeBlank/blank1', '언어의예술 약관', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
}
function openPopup2() {
    var path = 'http://localhost:8080';
    var width = 500;
    var height = 600;

    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    left = left < 0 ? 0 : left;
    top = top < 0 ? 0 : top;

    window.open(path + '/jdh/member/agreeBlank/blank2', '개인정보 수집 및 이용 동의', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
}

/* 비밀번호 보이기/숨기기 토글 */
function togglePasswordVisibility() {
        var passwordInput = document.getElementById("userPassword");
        var eyeIcon = document.getElementById("togglePassword");

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            eyeIcon.classList.remove("fa-eye-slash");
            eyeIcon.classList.add("fa-eye");
        } else {
            passwordInput.type = "password";
            eyeIcon.classList.remove("fa-eye");
            eyeIcon.classList.add("fa-eye-slash");
        }
    }

    function toggleRePasswordVisibility() {
        var rePasswordInput = document.getElementById("userRePassword");
        var eyeIcon = document.getElementById("toggleRePassword");

        if (rePasswordInput.type === "password") {
            rePasswordInput.type = "text";
            eyeIcon.classList.remove("fa-eye-slash");
            eyeIcon.classList.add("fa-eye");
        } else {
            rePasswordInput.type = "password";
            eyeIcon.classList.remove("fa-eye");
            eyeIcon.classList.add("fa-eye-slash");
        }
    }

