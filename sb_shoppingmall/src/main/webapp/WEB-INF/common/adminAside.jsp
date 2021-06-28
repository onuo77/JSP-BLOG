<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="col-2 bg-success h-100" id="aside" style="padding: 20px 10px 0px 30px;">

<!-- 기획전관리 -->
	<ul class="list-group list-group-flush">
		<li class="list-group-item-success mb-2"><span class="nav-title"><i class="fas fa-calendar-alt"></i><strong>&nbsp;기획전 관리</strong></span></li>
		<li class="list-group-item-success p-1">
			<a href="/sb/adminEvents" class="list-group-item-success ${menu eq 'EVENTLIST' ? 'nav-active' : '' } p-1">
				<span style="font-size:14px; padding:1rem;">기획전 조회
					<i class="fas fa-angle-right float-right mr-1" style="top:50%;transform: translateY(45%);"></i>
				</span>
			</a>
		</li>
		<li class="list-group-item-success p-1">
			<a href="/sb/adminEventForm" class="list-group-item-success ${menu eq 'EVENTFORM' ? 'nav-active' : '' } p-1">
				<span style="font-size:14px;padding:1rem;">기획전 등록
					<i class="fas fa-angle-right float-right mr-1" style="top:50%;transform: translateY(45%);"></i>
				</span>
			</a>
		</li>
	</ul>
	
	<hr>

<!-- 레시피관리 -->
	<ul class="list-group list-group-flush">
		<li class="list-group-item-success mb-2"><span class="nav-title"><i class="fas fa-utensils"></i><strong>&nbsp;레시피 관리</strong></span></li>
		<li class="list-group-item-success p-1">
			<a href="/sb/adminRecipes" class="list-group-item-success ${menu eq 'RECIPELIST' ? 'nav-active' : '' } p-1">
				<span style="font-size:14px; padding:1rem;">레시피 조회
					<i class="fas fa-angle-right float-right mr-1" style="top:50%;transform: translateY(45%);"></i>	  		
				</span>
			</a>
		</li>
		<li class="list-group-item-success p-1">
			<a href="/sb/adminRecipeForm" class="list-group-item-success ${menu eq 'RECIPEFORM' ? 'nav-active' : '' } p-1">
				<span style="font-size:14px; padding:1rem;">레시피 등록
		  			<i class="fas fa-angle-right float-right mr-1" style="top:50%;transform: translateY(45%);"></i>	  		
		  		</span>
		  	</a>
		</li>
	</ul>
	<ul class="list-group position-absolute" style="bottom:75px; right:37%; font-size:13px; opacity:0.5;">
		<li class="list-group-item-success">ⓒSAGOBOJA</li>
	</ul>
</div>