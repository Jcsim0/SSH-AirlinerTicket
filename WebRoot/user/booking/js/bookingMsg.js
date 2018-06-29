/**
 * 
 */

$(function() {
	$("input[type='number']").InputSpinner({groupClass: "input-group-sm"});

	console.debug("hhh哈哈哈哈");
	 var f =  document.getElementById("firstClassNum");
	 var b =  document.getElementById("businessClassNum");
	 var t =  document.getElementById("touristClassNum");
     var total =  document.getElementById("totalNum");
     
     var fm =  document.getElementById("firstClassP");
	 var bm =  document.getElementById("businessClassP");
	 var tm =  document.getElementById("touristClassP");
     var money =  document.getElementById("moneyNum");
	
     var fr = $("#firstClassR");
     var br = $("#businessClassR");
     var tr = $("#touristClassR");
     
     f.addEventListener("change", function (event) { 	 
    	 if(parseInt(f.value)>parseInt(fr.val())){
    		 f.setValue(fr.val());
    		 $.Huimodalalert("预订张数不能大于剩余张数",2000);
    	 }   	 
    	 /*订购总数量*/
         total.innerHTML = parseInt(f.value)+parseInt(b.value)+parseInt(t.value);
         /*加钱总计*/
         money.innerHTML = parseInt(f.value)*parseInt(fm.value)+parseInt(b.value)*parseInt(bm.value)+parseInt(t.value)*parseInt(tm.value);
     });
     
     b.addEventListener("change", function (event) {   
    	 if(parseInt(b.value)>parseInt(br.val())){
    		 b.setValue(br.val());
    		 $.Huimodalalert("预订张数不能大于剩余张数",2000);
    	 }
    	 /*订购总数量*/
         total.innerHTML = parseInt(f.value)+parseInt(b.value)+parseInt(t.value);
         /*加钱总计*/
         money.innerHTML = parseInt(f.value)*parseInt(fm.value)+parseInt(b.value)*parseInt(bm.value)+parseInt(t.value)*parseInt(tm.value);
     });
     
     t.addEventListener("change", function (event) {
    	 
    	 if(parseInt(t.value)>parseInt(tr.val())){
    		 t.setValue(tr.val());
    		 $.Huimodalalert("预订张数不能大于剩余张数",2000);
    	 }
    	 /*订购总数量*/
         total.innerHTML = parseInt(f.value)+parseInt(b.value)+parseInt(t.value);
         /*加钱总计*/
         money.innerHTML = parseInt(f.value)*parseInt(fm.value)+parseInt(b.value)*parseInt(bm.value)+parseInt(t.value)*parseInt(tm.value);
     });
});

/**
 * 弹出层  使用H-ui,div背景颜色，自己修改
 * @param $
 * @returns
 */

!function($) {
	$.Huimodalalert = function(info, speed) {
		if ($(".modal-alert").length > 0) {
			$(".modal-alert").remove();
		}
		if (speed == 0 || typeof(speed) == "undefined") {
			$(document.body).append('<div id="modal-alert" class="modal modal-alert radius">' + '<div class="modal-alert-info">' + info + '</div>' + '<div class="modal-footer"> <button class="btn btn-primary radius" onClick="$.Huimodal_alert.hide()">确定</button></div>' + '</div>');
			$("#modal-alert").fadeIn();
		} else {
			$(document.body).append('<div id="modal-alert" style="margin:20% 30%;" class="modal modal-alert radius">' + '<div style="color:red;" class="modal-alert-info">' + info + '</div>' + '</div>');
			$("#modal-alert").fadeIn();
			setTimeout($.Huimodalalert.hide, speed);
		}
	}
	$.Huimodalalert.hide = function() {
		$("#modal-alert").fadeOut("normal",
		function() {
			$("#modal-alert").remove();
		});
	}
} (window.jQuery);


