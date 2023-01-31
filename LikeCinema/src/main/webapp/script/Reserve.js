/**
 * 
 */
 
 
 
 
 
// 사용자가 직접 클릭 
 $(document).ready(function(){
	
	$(".li").click(function(e){
		
		var PersonNum = 0;
		const baseCnt = 5;
		
		var person_sel = $('#nop_group_'+ this.type +' ul li');
		$.each (person_sel, function (index, li) {
			if($(li).hasClass('selected')){
				$(li).removeClass('selected');
			}
		});
			
		$(this).addClass("selected");
		
		if(!e.originalEvent) return;
			
		var PersonNum_count = document.querySelectorAll('.li.selected');
		
		PersonNum_count.forEach(function(PersonNum_count1){
 			PersonNum += Number(PersonNum_count1.dataset.count);
		});
			
		 if (PersonNum > baseCnt){
			
			alert('인원선택은 총 5명까지 가능합니다.');
			var person_sel1 = $('#nop_group_'+ this.type +' ul li');
			$.each (person_sel1, function (index, li) {
				if($(li).hasClass('selected')){
					$(li).removeClass('selected');
				}
			});
			$('#nop_group_'+ this.type +' #memberzero').addClass("selected");
			
			return false;
		}
		
		calcSum();
		return true;
		
	}); // li 이벤트 끝
	// 페이지 돌아왔을떄 값 유지되는곳
	var adult = $('#Reserve_Adult').val() 
	var adults = $('#nop_group_adult ul li');
	$.each (adults, function (index, li) {
		if(li.dataset.count == adult){
			$(li).click();
		}
	});
	var Teenager = $('#Reserve_Teenager').val()
	
	var youth = $('#nop_group_youth ul li');
	$.each (youth, function (index, li) {
		if(li.dataset.count == Teenager){
			$(li).click();
		}
	});
	
	var Preferential = $('#Reserve_Preferential').val()
	
	var special = $('#nop_group_special ul li');
	$.each (special, function (index, li) {
		if(li.dataset.count == Preferential){
			$(li).click();
			
		}
	});
	calcSum();
	
});


function calcSum(){
	var hidden2 = "";
	var ReserveAdult = 0;
	var ReserveTeenager = 0;
	var ReservePreferential = 0;
		
	var inner = document.querySelectorAll('.li.selected');
		
	for(var i =0; i < inner.length; i++){
		hidden2 += ', ' + inner[i].textContent.substring(1).trim();
	
		var ReserveAdult = Number(inner[0].dataset.count);
		var ReserveTeenager = Number(inner[1].dataset.count);
		var ReservePreferential = Number(inner[2].dataset.count);
		
		var hiddenElem = document.getElementById('hidden');
	 	hiddenElem.value = ReserveAdult + ReserveTeenager + ReservePreferential;
	
		// 일반 00명, 청소년 00명, 우대 00명 
		var hiddenElem2 = document.getElementById('hidden2');
		hiddenElem2.value = hidden2.substring(2); 
		
		// int 값
		var ReserveAdult_1 = document.getElementById('Reserve_Adult');
		ReserveAdult_1.value = ReserveAdult;
		
		var ReserveTeenager_1 = document.getElementById('Reserve_Teenager');
		ReserveTeenager_1.value = ReserveTeenager;
		
		var ReservePreferential_1 = document.getElementById('Reserve_Preferential');
		ReservePreferential_1.value = ReservePreferential;
		
		// 결제 금액 계산
		
		var PayPrice = 12000;	// 12000원
		
		var ReservePayPrice = (ReserveAdult * PayPrice) + (ReserveTeenager * (PayPrice*0.9)) + (ReservePreferential * (PayPrice*0.9)); 
		
		var ReservePayPrice_1 = document.getElementById('Reserve_Pay_Price');
		ReservePayPrice_1.value = ReservePayPrice;
		
		var Pay_Price_1 = document.getElementById('Pay_Price');
		Pay_Price_1.value = ReservePayPrice;
	
	};
}

function checkSubmit(){
	
	var selecMovie = document.getElementById('selectedMovie').value;
	if(selecMovie == null){
		alert('예매하실 영화를 선택해주세요.');
		return false;
	}
	
	var selecLocation = document.getElementById('selectedLocation').value;
	if(selecLocation == null){
		alert('예매하실 지역을 선택해주세요.');
		return false;
	}
	
	var selecDate = document.getElementById('selectedDate').value;
	if(selecDate == null){
		alert('예매하실 날짜를 선택해주세요.');
		return false;
	}
	
	var selecTime = document.getElementById('selectedTime').value;
	if(selecTime == null){
		alert('예매하실 시간을 선택해주세요.');
		return false;
	}
	
	var human = 0;
	var human_count = document.querySelectorAll('.li.selected');	
			
	human_count.forEach(function(human_count1){
		
		human += Number(human_count1.dataset.count);
		
	});

	if(human == 0){
		alert('인원을 선택해 주세요.');
		return false;
	}
	
	var id = document.getElementById('id').value;
	console.log(id);
	if(id == 'null'){
		alert('로그인 후 예매해주시기 바랍니다.');
		location.href = "./MemberLoginForm.me";
		return false;
	}
}

