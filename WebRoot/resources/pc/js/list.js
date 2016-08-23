define(function() {
	
   $().ready( function() {
		// 分页
		var $pagination = $('.pagination');
		if($pagination)
			$pagination.append('<div class="pn" pageNumber="'+$pagination.attr('pageNumber')+'"></div>'
				+'<input type="hidden" id="pageSize" name="pageSize" value="'+$pagination.attr('pageSize')+'">'
				+'<input type="hidden" id="searchProperty" name="searchProperty" value="">'
				+'<input type="hidden" id="orderProperty" name="orderProperty" value="'+$pagination.attr('orderProperty')+'"/>'
				+'<input type="hidden" id="orderDirection" name="orderDirection" value="'+$pagination.attr('orderDirection')+'"/>');
		
		// 每页显示
		var $pageSizeMenu = $(".pageSizeMenu");
		if($pageSizeMenu && $pagination){
			var selectObj = '<a href="javascript:;" id="pageSizeSelect" class="button">每页显示<span class="arrow">&nbsp;</span></a>'
				+ '<div class="popupMenu" style="left: 217px; top: 59px; display: none;">'
				+ '<ul id="pageSizeOption">';
			
			var arr = [10,20,50,100];
			var pageSize = $pagination.attr('pageSize');
			for(var i=0;i<arr.length;i++){
				var ps = arr[i];
				var current = "";
				if(parseInt(pageSize) == arr[i]) current = 'class="current"';
				selectObj += '<li><a href="javascript:;" val="'+ps+'" '+current+'>'+ps+'</a></li>';
			}
			selectObj += '</ul></div>';
			$pageSizeMenu.append(selectObj);
		}
		
		var $listForm = $("#listForm");
		var $pageTotal = $("#pageTotal");
		var $deleteButton = $("#deleteButton");
		var $refreshButton = $("#refreshButton");
		var $pageSizeSelect = $("#pageSizeSelect");
		var $pageSizeOption = $("#pageSizeOption a");
		var $moreOperation = $("#moreOperation");
		var $searchPropertySelect = $("#searchPropertySelect");
		var $searchPropertyOption = $("#searchPropertyOption a");
		var $searchValue = $("#searchValue");
		var $listTable = $("#listTable");
		var $selectAll = $("#selectAll");
		var $ids = $("#listTable input[name='ids']");
		var $contentRow = $("#listTable tr:gt(0)");
		var $sort = $("#listTable a.sort");
		var $pageSize = $("#pageSize");
		var $searchProperty = $("#searchProperty");
		var $orderProperty = $("#orderProperty");
		var $orderDirection = $("#orderDirection");
		var $pageNumber = $("#pageNumber");
		
		// 每页记录数选项
		$pageSizeSelect.mouseover( function() {
			var $this = $(this);
			var offset = $this.offset();
			var $menuWrap = $this.closest("div.menuWrap");
			var $popupMenu = $menuWrap.children("div.popupMenu");
			$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
			$menuWrap.mouseleave(function() {
				$popupMenu.hide();
			});
		});
		
		// 每页记录数
		$pageSizeOption.click( function() {
			var $this = $(this);
			$pageSize.val($this.attr("val"));
			$pageNumber.val("1");
			$listForm.submit();
			return false;
		});
		
		
		// 全选
		$selectAll.click( function() {
			var $this = $(this);
			var $enabledIds = $("#listTable input[name='ids']:enabled");
			if ($this.prop("checked")) {
				$enabledIds.prop("checked", true);
				if ($enabledIds.filter(":checked").size() > 0) {
					$deleteButton.removeClass("disabled");
					$contentRow.addClass("selected");
				} else {
					$deleteButton.addClass("disabled");
				}
			} else {
				$enabledIds.prop("checked", false);
				$deleteButton.addClass("disabled");
				$contentRow.removeClass("selected");
			}
		});
		
		// 排序
		$sort.click( function() {
			var orderProperty = $(this).attr("name");
			if ($orderProperty.val() == orderProperty) {
				if ($orderDirection.val() == "asc") {
					$orderDirection.val("desc")
				} else {
					$orderDirection.val("asc");
				}
			} else {
				$orderProperty.val(orderProperty);
				$orderDirection.val("asc");
			}
			$pageNumber.val("1");
			$listForm.submit();
			return false;
		});
		
		// 排序图标
		if ($orderProperty.val() != "") {
			$sort = $("#listTable a[name='" + $orderProperty.val() + "']");
			if ($orderDirection.val() == "asc") {
				$sort.removeClass("desc").addClass("asc");
			} else {
				$sort.removeClass("asc").addClass("desc");
			}
		}
		
		// 页码输入
		$pageNumber.keypress(function(event) {
			var key = event.keyCode ? event.keyCode : event.which;
			if ((key == 13 && $(this).val().length > 0) || (key >= 48 && key <= 57)) {
				return true;
			} else {
				return false;
			}
		});
		
		// 表单提交
		$listForm.submit(function() {
			if (!/^\d*[1-9]\d*$/.test($pageNumber.val())) {
				$pageNumber.val("1");
			}
			if ($searchValue.size() > 0 && $searchValue.val() != "" && $searchProperty.val() == "") {
				$searchProperty.val($searchPropertyOption.eq(0).attr("val"));
			}
		});
		
		// 页码跳转
		$.pageSkip = function(pageNumber) {
			
			$pageNumber.val(pageNumber);
			$listForm.submit();
			return false;
		}
		
		$.createPager = function(){
			var pageNumber = parseInt($('.pn').attr('pageNumber'));
			var pageCount = Math.ceil(parseInt($('#pageTotal').text()) / parseInt($('#pageSize').val()));
			var $pagination = $(".pagination");
			if(pageNumber <= 1){
				$pagination.append('<span class="firstPage">&nbsp;</span><span class="previousPage">&nbsp;</span>');
			}else{
				$pagination.append('<a href="javascript: $.pageSkip(1);" class="firstPage">&nbsp;</a><a href="javascript: $.pageSkip('+(pageNumber - 1)+');" class="previousPage">&nbsp;</a>');
			}
			
			var start = pageNumber - 2;
			if(start < 1) start = 1;
			var end = pageNumber + 2;
			if(end > pageCount) end = pageCount;
			
			if(start > 2){
				$pagination.append('<span class="pageBreak">...</span>');
			}
			
			for(var i=start;i<=end;i++){
				if(i==pageNumber)
					$pagination.append('<span class="currentPage">'+i+'</span>');
				else
					$pagination.append('<a href="javascript: $.pageSkip('+i+');">'+i+'</a>');
			}
			
			if(pageCount - end > 4){
				$pagination.append('<span class="pageBreak">...</span>');
			}
			
			if(pageNumber >= pageCount){
				$pagination.append('<span class="nextPage">&nbsp;</span><span class="lastPage">&nbsp;</span>');
			}else{
				$pagination.append('<a href="javascript: $.pageSkip('+(pageNumber+1)+');" class="nextPage">&nbsp;</a><a href="javascript: $.pageSkip('+pageCount+');" class="lastPage">&nbsp;</a>');
			}
			
			$pagination.append('<span class="pageSkip">共'+pageCount+'页<input id="pageNumber" name="pageNumber" value="'+pageNumber+'" maxlength="9" onpaste="return false;"><button type="submit">&nbsp;</button></span>');
			$pageNumber=$("#pageNumber");
		}
		$.createPager();
		
		$('#listTable tr').hover(function(){
			var item = $(this).find('.edit-item');
			if(item) item.show();
		},function(){
			var item = $(this).find('.edit-item');
			if(item) item.hide();
		});
		
		$('.edit-item').click(function(){
			var $this = $(this);
			var content = '';
			var editdata = eval($this.attr('editdata'));
			for(var i=0;i<editdata.length;i++){
				var name = editdata[i].name;
				var desc = editdata[i].desc;
				var value = editdata[i].value;
				var type = editdata[i].type;
				content += "<br/>";
				content += '<span style="width:100px">'+desc+'</span>';
				if(type == 'text' || type == 'password'){
					content += '<input type="'+type+'" name="'+name+'" value="'+value+'" style="width:300px"/>';
				}else if(type == 'textarea'){
					content += '<textarea style="width:420px;height:80px;" name="'+name+'">'+value+'</textarea>'
				}
			}
			
			var url;
			var callback = function(editDialog){
				var params = {};
				for(var i=0;i<editdata.length;i++){
					var name = editdata[i].name;
					var type = editdata[i].type;
					var id_name = name.substring(0,name.indexOf('.')+1) + 'id';// goods.id
					if(!params[id_name]){
						params[id_name] = editdata[i].id;
					}
					if(!url) url = editdata[i].url;
					var value = '';
					if(type == 'text' || type == 'password'){
						value = editDialog.find('input[name="'+name+'"]').val();
					}else if(type == 'textarea'){
						value = editDialog.find('textarea[name="'+name+'"]').val()
					}
					params[name] = value;
				}
				
				$.ajax({
					url:url,
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					success: function(message) {
						if(message.success == true || message.success == 'true'){
							editDialog.jqmHide();
							$('#listForm').submit();
						}else{
							alert('更新失败!'+message.errorMsg);
						}
					}
				});
			}
			
			var editDialog = $('.editDialog');
			if(editDialog.length == 0){
				var editDialog = createDialog({title:$(this).attr('title'),callback:callback});
			}
			editDialog.find('.dialog_cent').html(content);
			editDialog.jqmShow();
		});
	}); 
});
