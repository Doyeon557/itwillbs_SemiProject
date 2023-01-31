<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>star test</title>
<link href="./css/star.css" rel="stylesheet" type="text/css">

<style type="text/css">
.star_rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 3em;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em; 
  text-align: center;
  width: 5em;
}
 
.star_rating input {
  display: none;
}
 
.star_rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #ffd700;
  cursor: pointer;
}
 
.star_rating :checked ~ label {
  -webkit-text-fill-color: #ffd700;
}
 
.star_rating label:hover,
.star_rating label:hover ~ label {
  -webkit-text-fill-color: #ffec80;
}

</style>

</head>
<body>

<div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
	<label for="5-stars" class="star pr-4">★</label>
	<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
	<label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
	<label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
	<label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
	<label for="1-star" class="star">★</label>
</div>

<form action="./MovieReviewWritePro.in" class="write_review" method="get" name="write_review" onsubmit="return check()">
	<div class="star_rating">
		<input type="radio" name="Review_Score" id="Review_Score1" value="1"><label for="Review_Score1">★</label>
		<input type="radio" name="Review_Score" id="Review_Score2" value="2"><label for="Review_Score2">★</label>
		<input type="radio" name="Review_Score" id="Review_Score3" value="3"><label for="Review_Score3">★</label>
		<input type="radio" name="Review_Score" id="Review_Score4" value="4"><label for="Review_Score4">★</label>
		<input type="radio" name="Review_Score" id="Review_Score5" value="5"><label for="Review_Score5">★</label>
	</div>
</form>

</body>
</html>