
/*
document.addEventListener("DOMContentLoaded", function() {
  var scrollToTopBtn = document.getElementById("scrollToTopBtn");

  // 스크롤 이벤트를 감지
  window.onscroll = function() {
    scrollFunction();
  };

  function scrollFunction() {
    // 현재 스크롤 위치를 가져옴
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      scrollToTopBtn.style.display = "block";
    } else {
      scrollToTopBtn.style.display = "none";
    }
  }

  // 버튼을 누르면 맨 위로 스크롤
  scrollToTopBtn.addEventListener("click", function() {
    document.documentElement.scrollTop = 0;
  });
});
*/
 function showTab(tabId) {
        document.querySelectorAll('.tab-content').forEach(function (tabContent) {
            tabContent.style.display = 'none';
        });

        document.querySelectorAll('.tab').forEach(function (tab) {
            tab.classList.remove('active');
        });

        document.getElementById(tabId).style.display = 'block';
        document.querySelector('[onclick="showTab(\'' + tabId + '\')"]').classList.add('active');
    }



/* 메인 bottom 섹션에서 이벤트 페이지로 이동*/
function redirectToEvent1() {
    window.location.href = "/jdh/board/event/mainEvent";
  }

function redirectToEvent2() {
    window.location.href = "/jdh/board/event/mainEvent";
  }

function redirectToEvent3() {
    window.location.href = "/jdh/board/event/mainEvent";
  }



