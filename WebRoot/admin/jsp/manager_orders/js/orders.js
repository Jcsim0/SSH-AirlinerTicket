/**
 * 
 */
$(function() {
	$('.table-sort').dataTable({
		"aaSorting" : [ [ 0, "desc" ] ],// 默认第几个排序
		"bStateSave" : true,// 状态保存
		"pading" : false,
		"aoColumnDefs" : [
		// {"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
			"orderable" : false,
			"aTargets" : [  ]
		} // 不参与排序的列
		]
	});	
});