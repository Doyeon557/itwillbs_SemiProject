/**
 * 
 */
 

		function seltSeat(){
			
			var result = "";
			var seats = document.querySelectorAll('.row__seat--selected');
			if(seats.length == 0){
				alert('좌석을 선택해 주세요.')
				return false;
			}
			
			seats.forEach(function(seat){
				result += "," + seat.dataset.tooltip;
		    });
			
			var hiddenElem = document.getElementById('Reserve_Seat');
			
			hiddenElem.value = result.substring(1); 
			return true; 
			
		}
		
		
		
		
		