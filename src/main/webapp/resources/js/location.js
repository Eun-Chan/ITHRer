$(function(){	
	$("#locationKeyWord").on("click",function(){
		if(!$(".location-hide").hasClass("on")){
			$(".location-hide").addClass("on");
		}
		else{
			$(".location-hide").removeClass("on");
		}
	});
	$("html").click(function(e){
	    if(!$(e.target).hasClass("locationKeyWord")){
	      if($(e.target).hasClass("loc")){
	         $(".location-hide").addClass("on");
	         return;
	      }
	      if($(e.target).hasClass("locationKeyWordSelected")){
	         $(".location-hide").addClass("on");
	         return;
	      }
	      if($(e.target).hasClass("location-view-detail")){
	    	  $(".location-hide").addClass("on");
	          return;
	      }
	      if($(e.target).hasClass("loc-detail")){
	    	  console.log("여기에요");
	    	  $(".location-hide").addClass("on");
	          return;
	      }
	      if($(e.target).hasClass("deleteLocation")){
	    	  $(".location-hide").addClass("on");
	          return;
	      }
	      if($(e.target).hasClass("reset")){
	    	  $(".location-hide").addClass("on");
	          return;
	      }
		console.log($(e.target));
	      $(".location-hide").removeClass("on");
	   } 

	});
	$(".location-hide button").on("click",function(){
		var location_name =  new Array();

	   $(".deleteLocation").css("display","block");
	   if($(this).val()=="101000"){
		   $(".detail").css("display","none");
		   $(".seoul").css("display","block");
		   if($(".seoul li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=101000]").prop("checked",true);
			   }
		   }
		   
	   }
	   if($(this).val()=="102000"){
		   $(".detail").css("display","none");
		   $(".gyeonggi").css("display","block");
		   if($(".gyeonggi li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=102000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="108000"){
		   $(".detail").css("display","none");
		   $(".incheon").css("display","block");
		   if($(".incheon li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=108000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="106000"){
		   $(".detail").css("display","none");
		   $(".busan").css("display","block");
		   if($(".busan li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=106000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="104000"){
		   $(".detail").css("display","none");
		   $(".daegu").css("display","block");
		   if($(".daegu li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=104000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="103000"){
		   $(".detail").css("display","none");
		   $(".gwangju").css("display","block");
		   if($(".gwangju li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=103000]").prop("checked",true);
			   }		   
		   }
	   }
	   
	   if($(this).val()=="105000"){
		   $(".detail").css("display","none");
		   $(".daejeon").css("display","block");
		   if($(".daejeon li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=105000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="107000"){
		   $(".detail").css("display","none");
		   $(".ulsan").css("display","block");
		   if($(".ulsan li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=107000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="118000"){
		   $(".detail").css("display","none");
		   $(".sejong").css("display","block");
		   if($(".sejong li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=118000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="109000"){
		   $(".detail").css("display","none");
		   $(".kangwon").css("display","block");
		   if($(".kangwon li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=109000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="110000"){
		   $(".detail").css("display","none");
		   $(".gyeongnam").css("display","block");
		   if($(".gyeongnam li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=110000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="111000"){
		   $(".detail").css("display","none");
		   $(".gyeongbuk").css("display","block");
		   if($(".gyeongbuk li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=111000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="112000"){
		   $(".detail").css("display","none");
		   $(".chonnam").css("display","block");
		   if($(".chonnam li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($("	.loc-detail:checked").length<5){
				   $("input[name=112000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="113000"){
		   $(".detail").css("display","none");
		   $(".chonbuk").css("display","block");
		   if($(".chonbuk li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=113000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="115000"){
		   $(".detail").css("display","none");
		   $(".chungnam").css("display","block");
		   if($(".chungnam li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=115000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="114000"){
		   $(".detail").css("display","none");
		   $(".chungbuk").css("display","block");
		   if($(".chungbuk li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=114000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="116000"){
		   $(".detail").css("display","none");
		   $(".jeju").css("display","block");
		   if($(".jeju li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=116000]").prop("checked",true);
			   }		   
		   }
	   }
	   if($(this).val()=="117000"){
		   $(".detail").css("display","none");
		   $(".jongok").css("display","block");
		   if($(".jongok li").find(".loc-detail:checked").siblings("label").text()==""){
			   if($(".loc-detail:checked").length<5){
				   $("input[name=117000]").prop("checked",true);
			   }		   
		   }
	   }
	   var location_code =  new Array();
	   var locationCode = "";
	   var text = "";
	   
		$('.loc-detail:checked').each(function() { 
			location_code.push($(this).attr("name"));
		 });
	   $('.loc-detail:checked').each(function() { 
		   location_name.push($(this).siblings("label").text());
	     });
		for(var i = 0 ; i<location_name.length ; i++){
			if(i==location_name.length-1){
				text+=location_name[i];
			}else{			
				text+=location_name[i]+",";
			}
		}
		for(var i = 0 ; i<location_code.length ; i++){
			locationCode += location_code[i]+",";
		}

		 $(".locationKeyWordSelected").show();
		 $(".hiddenLocationCode").val(locationCode);
		 $(".locationKeyWordSelected").text((location_name.length)+" "+text);
		 $(".placeholder").hide();


	});
	$(".open").hover(function(){
	   $(this).css("border","2px solid #ffb6c1");
		},function(){
	   		$(this).css("border","2px solid #d6d6d6");
		}
	);


	//지역 검색
	$(".loc-detail").on("click",function(){
		console.log($(".loc-detail:checked").attr("name"));
		var location_name =  new Array();
		var location_code =  new Array();
		var text = "";
		var locationCode = "";
		if(!$(this).hasClass("all")){
			$(this).parent("li").siblings("li").find(".all").prop("checked",false);
		}
		else if($(this).hasClass("all")){
			console.log("체크 트루");
			$(this).parent("li").siblings("li").find(".loc-detail").prop("checked",false);
			$(this).prop("checked");
		}
		
		$('.loc-detail:checked').each(function() { 
			location_name.push($(this).siblings("label").text());
		 });
		$('.loc-detail:checked').each(function() { 
			location_code.push($(this).attr("name"));
		 });
		for(var i = 0 ; i<location_name.length ; i++){
			if(location_name.length>5){
				alert("지역은 5개 까지만 선택 가능합니다.");
				$(this).prop("checked",false);
				return;
			}
			if(i==location_name.length-1){
				text+=location_name[i];
			}
			else{
				text+=location_name[i]+",";
			}
		}
		for(var i = 0 ; i<location_code.length ; i++){
			locationCode += location_code[i]+",";
		}
		console.log(location_code.length);
		if(location_code.length!=0){
			$(".locationKeyWordSelected").show();
			$(".hiddenLocationCode").val(locationCode);
			$(".locationKeyWordSelected").text((location_name.length)+" "+text);
			$(".placeholder").hide();			
		}else if(location_code.length==0){
			$(".locationKeyWordSelected").hide();
			$(".placeholder").show();
		}
		
	});
	//지역 초기화 버튼
	$(".reset").on("click",function(){
		var location_name =  new Array();
		var text="";
		$(this).parents().siblings("li").find(".loc-detail").prop("checked",false);

	  	$('.loc-detail:checked').each(function() { 
		   location_name.push($(this).siblings("label").text());
	    });
		for(var i = 0 ; i<location_name.length ; i++){
			if(i==location_name.length-1){
					text+=location_name[i];
			}else{			
				text+=location_name[i]+",";
			}
		}
		if(location_name.length!=0){
			$(".locationKeyWordSelected").show();
			$(".locationKeyWordSelected").text((location_name.length)+" "+text);			
		}else if(location_name.length==0){
			$(".locationKeyWordSelected").hide();
			$(".placeholder").show();
		}
	});

})
