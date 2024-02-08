<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" data-bs-interval="3000" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background-image: url(${path}/resources/assets/img/slide/slide-1.jpg)">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">서시(序詩)</h2>
                <p class="animate__animated animate__fadeInUp">
                	죽는 날까지 하늘을 우러러 
					한 점 부끄럼이 없기를,<br>
					잎새에 이는 바람에도
					나는 괴로워했다.<br>
					별을 노래하는 마음으로
					모든 죽어가는 것을 사랑해야지<br>
					그리고 나한테 주어진 길을 
					걸어가야겠다.<br>
					오늘 밤에도 별이 바람에 스치운다.<br><br>
					윤동주,<cite title="Source Title">하늘과 바람과 별과 시</cite>
				</p>
					
					
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url(${path}/resources/assets/img/slide/slide-2.jpg)">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">절정</h2>
                <p class="animate__animated animate__fadeInUp">담장 위에서 저렇게<br>
					   자신을 확연히 드러내 보이는 붉은 장미는<br>
					   얼마나 몸 밝은지<br>
					   제 모습에 덧칠된 빛깔에 취하지 않으려<br>
					   몸 속에 들이대는 가시는<br>
					   얼마나 차가운지<br>
					<br>
					   가시와 꽃잎이 서로를<br>
					   절반쯤 죽여주는<br>
					   죽은 가시와 죽은 빛깔이 만들어내는<br>
					   세상의 담장 위를<br><br>
					엄재국,<cite title="Source Title">정비공장 장미꽃</cite>
					</p>
              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item" style="background-image: url(${path}/resources/assets/img/slide/slide-3.jpg)">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">조그마한 그리움의 노래</h2>
                <p class="animate__animated animate__fadeInUp">봄이 오면 고향에 가겠네<br>
				   밭고랑마다 노오란 유채꽃이 첫사랑을 앓아대던<br>
				   그 나비떼들의 고향으로 가슴 부벼 가겠네<br>
				   흰 무명적삼 할머니의 구부러진 등에 업혀<br>
				   발가락 꼼지락거리며 왠지 모르게 울기를 자주 했던<br>
				   아, 그 찔레꽃 내음새도 파르라이 온몸을 휘감아오던<br>
				   산 넘어 강 건너 먼 고향으로 가겠네<br>
				   할머니의 무덤 위에 반짝거리는 그런 풀잎사귀로<br><br>
				   김준태&nbsp;<cite title="Source Title">꽃이, 이제 地上과 하늘을</cite>
				   </p>
              </div>
            </div>
          </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>

      </div>
    </div>
  </section><!-- End Hero -->

<!--  
<div class="container-fluid border-top border-bottom">
   <div class="row">

      <div class="col-12">
      	<div id="carouselExampleIndicators" class="carousel slide my-5" data-bs-ride="carousel">
		 
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		    <img src="${path}/resources/img/3.jpg"/>
		      <figure class="text-center carousel-caption p-0 pt-5" style="height:380px;">
				  <blockquote class="blockquote">
				    <p class="fw-bold">서시(序詩)</p>
				    <p class="fs-6">
				    죽는 날까지 하늘을 우러러<br>
					한 점 부끄럼이 없기를,<br>
					잎새에 이는 바람에도 <br>
					나는 괴로워했다.<br>
					별을 노래하는 마음으로 <br>
					모든 죽어가는 것을 사랑해야지<br>
					그리고 나한테 주어진 길을 <br>
					걸어가야겠다.<br>
					<br>
					오늘 밤에도 별이 바람에 스치운다.<br>
				    </p>
				  </blockquote>
				  <figcaption class="blockquote-footer">
				    윤동주,<cite title="Source Title">하늘과 바람과 별과 시</cite>
				  </figcaption>
				</figure>
		    </div>
		    
		    <div class="carousel-item">
		    <img src="${path}/resources/img/3.jpg"/>
		     <figure class="text-center carousel-caption p-0 pt-5" style="height:380px;">
				  <blockquote class="blockquote">
				    <p class="fw-bold">절정​</p>
				    <p class="fs-6">
				    	담장 위에서 저렇게<br>
					   자신을 확연히 드러내 보이는 붉은 장미는<br>
					   얼마나 몸 밝은지<br>
					   제 모습에 덧칠된 빛깔에 취하지 않으려<br>
					   몸 속에 들이대는 가시는<br>
					   얼마나 차가운지<br>
					<br>
					   가시와 꽃잎이 서로를<br>
					   절반쯤 죽여주는<br>
					   죽은 가시와 죽은 빛깔이 만들어내는<br>
					   세상의 담장 위를<br>
					
					</p>
				    
				  </blockquote>
				  <figcaption class="blockquote-footer">
				    엄재국,<cite title="Source Title">정비공장 장미꽃</cite>
				  </figcaption>
				</figure>
		    </div>
		    
		    <div class="carousel-item">
		    <img src="${path}/resources/img/3.jpg"/>
		      <figure class="text-center carousel-caption p-0 pt-5" style="height:380px;">
				  <blockquote class="blockquote">
				    <p class="fw-bold">조그마한 그리움의 노래</p>
				    <p class="fs-6">
				    봄이 오면 고향에 가겠네<br>
				   밭고랑마다 노오란 유채꽃이 첫사랑을 앓아대던<br>
				   그 나비떼들의 고향으로 가슴 부벼 가겠네<br>
				   흰 무명적삼 할머니의 구부러진 등에 업혀<br>
				   발가락 꼼지락거리며 왠지 모르게 울기를 자주 했던<br>
				   아, 그 찔레꽃 내음새도 파르라이 온몸을 휘감아오던<br>
				   산 넘어 강 건너 먼 고향으로 가겠네<br>
				   할머니의 무덤 위에 반짝거리는 그런 풀잎사귀로<br>
					</p>
				  </blockquote>
				  <figcaption class="blockquote-footer">
				    김준태<cite title="Source Title">꽃이, 이제 地上과 하늘을</cite>
				  </figcaption>
				</figure>
		    </div>

		  
                   <div class="carousel-controls">
                       <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                           <span class="visually-hidden">Previous</span>
                       </button>
                       <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                           <span class="carousel-control-next-icon" aria-hidden="true"></span>
                           <span class="visually-hidden">Next</span>
                       </button>
                   </div>

			
		</div>
      </div>

   </div>
</div>
</div>
-->