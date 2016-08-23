

(function($) {
	$.fn.extend({
		lSelect: function(options) {
			var settings = {
				choose: "请选择...",
				emptyValue: "",
				cssStyle: {"margin-right": "4px","width":"100px"},
				url: null,
				type: "GET"
			};
			$.extend(settings, options);
			
			var cache = {};
			return this.each(function() {
				
				var $input = $(this);
				var id = $input.val();
				var treePath = $input.attr("treePath");
				var selectName = $input.attr("id") + "_select";// syx:修改为取ID
				if (treePath != null && treePath != "") {
					var ids = (treePath + id + ",").split(",");
					var $position = $input;
					for (var i = 1; i < ids.length; i ++) {
						$position = addSelect($position, ids[i - 1], ids[i]);
					}
				} else {
					addSelect($input, null, null);
				}
				
				function addSelect($position, parentId, currentId) {
					if(!$position.nextAll) $position = $($position.nextAll);
					$position.nextAll("select[name=" + selectName + "]").remove();
					if ($position.is("select") && (parentId == null || parentId == "")) {
						return false;
					}
					var level = $position.attr('level') ? parseInt($position.attr('level')) + 1 : 0;
					var cacheKey = level + '_' + parentId;
					if (cache[cacheKey] == null) {
						
						$.ajax({
							url: settings.url,
							type: settings.type,
							data: parentId != null ? {parentId: parentId,level:level} : null,
							dataType: "json",
							cache: false,
							async: false,
							success: function(data) {
								cache[cacheKey] = data.json;
							}
						});
					}
					var data = cache[cacheKey];
					if ($.isEmptyObject(data)) {
						return false;
					}
					var length = $("select[name="+selectName+"]").length;
					var select = '<select name="' + selectName + '" level="'+ length + '">';
					if (settings.emptyValue != null && settings.choose != null) {
						select += '<option value="' + settings.emptyValue + '">' + settings.choose + '</option>';
					}
					$.each(data, function(value, name) {
						if(value == currentId) {
							select += '<option value="' + value + '" selected="selected">' + name + '</option>';
						} else {
							select += '<option value="' + value + '">' + name + '</option>';
						}
					});
					select += '</select>';
					return $(select).css(settings.cssStyle).insertAfter($position).bind("change", function() {
						var $this = $(this);
						if ($this.val() == "") {
							var $prev = $this.prev("select[name=" + selectName + "]");
							if ($prev.size() > 0) {
								$input.val($prev.val());
							} else {
								$input.val(settings.emptyValue);
							}
						} else {
							$input.val($this.val());
						}
						// added by syx 下拉列表切换事件
						if(settings.change){
							if(typeof settings.change == 'function'){
								settings.change(this);
							}else{
								eval(settings.change+"(this)");
							}
						}
						addSelect($this, $this.val(), null);
					});
				}
			});
			
		}
	});
})(jQuery);