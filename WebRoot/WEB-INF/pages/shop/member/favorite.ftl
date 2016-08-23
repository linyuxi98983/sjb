<link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/memberorder.css"/>
<div class="m-user-center">
<div class="m-user-title">
    <ul>
        <li class="f-font-18b-w f-padd-l10 ">我的收藏</li>
    </ul>
</div>
<div id="favoriteListHtml">
    <div class="m-user-body">
       <table class="m-table-order-flow">
            <tbody><tr class="m-head-table">
                <th width="220px">收藏商品</th>
                <th width="150px">商品名称</th>
                <th width="150px">单价</th>
                <th width="220px" class="nobg">操作</th>
            </tr>
            <#if (list?? && list?size>0)>
            <#list list as fav>	
            <tr class="order-detail">
                <td class="order-detail-pic">
                    <a target="_blank" href="${url_goodsdetail!}?id=${fav.objectId!}">
						<#if fav.imgPath??>					
                        	<img class="p-img" src="${fav.imgPath!}" alt="${fav.name!}"/>
			            <#else>
			            	<img class="p-img" src="${base}/resources/mobile/images/bg_pic.png" alt="${fav.name!}"/>
			             </#if>
					</a>
                </td>
                <td>${fav.name!}</td>
                <td>
                    <p>&yen;${fav.showPrice}</p>
                </td>
                <td class="nobg">
                    <p><a href="javascript:;" onclick="delFavorite(${fav.id!})">删除</a></p>
                </td>
            </tr>
            </#list>
            <#else>
            <tr>
            	<td colspan="4">
            	暂无数据
            	</td>
            </tr>
            </#if>
        </tbody></table>
    </div>
</div>
<script type="text/javascript">
	function delFavorite(id){
		if(confirm('是否删除？')){
			$.ajax({
				url: Global.base + "/shop/member/favorite!delete.action",
				type: "POST",
				data: {'entity.id':id},
				dataType: "json",
				cache: false,
				success: function(message) {
					if(message.success == true || message.success == 'true'){
						$("#right").html('');
						getRightContent();
					}else{
						alert("该地址被使用过，不能删除！");
					}
				}
			});
		}
	}
</script>