<script type="text/javascript" src="${base}/resources/web/js/jquery.validate.js"></script>
<div class="m-user-center">
    <div class="m-user-title">
        <ul>
            <li class="f-font-18b-w f-padd-l10">个人信息</li>
        </ul>
    </div>
    <div class="m-user-body">
        <div class="m-user-info">
            <div class="lyct m-form m-form-2">
		        <form id="memberform" action="${base}/shop/member/member!save.action" method="post" enctype="multipart/form-data">
		            <input type="hidden" name="entity.id" value="${entity.id!}"/>
		            <input type="hidden" name="result" value="json"/>
		            <fieldset>
		                <div class="formitm">
		                    <label class="lab">头像：</label>
		                    <div class="ipt">
		                        <input type="hidden" name="entity.otSpPictureId" value="${entity.otSpPictureId!}"/>
								<img id="picture" style="width:102px;height:102px" src="${entity.imagePath!}"/>
								<br/>
								<input type="file" name="entity.image">
		                    </div>
		                </div>
		                <div class="formitm">
		                    <label class="lab">手机号码：</label>
		                    <div class="ipt">
		                       ${entity.phoneNo!}
		                    </div>
		                </div>
		                <div class="formitm">
		                    <label class="lab">密码：</label>
		                    <div class="ipt">
		                        <input type="password" class="u-ipt" name="entity.password" value="${entity.password!}" placeholder="请输入您的密码">
		                    </div>
		                </div>                                    
		                <div class="formitm">
		                    <label class="lab">昵称：</label>
		                    <div class="ipt">
		                    	<input type="text" class="u-ipt" name="entity.nickname" value="${entity.nickname!}" placeholder="请输入您的昵称">
		                    </div>
		                </div>
			         	<div class="formitm">
		                    <label class="lab">邮箱：</label>
		                    <div class="ipt">
		                    	<input type="text" class="u-ipt" name="entity.email" value="${entity.email!}" placeholder="请输入您的邮箱">
		                    </div>
		                </div>
		                <div class="formitm">
		                    <label class="lab">当前积分：</label>
		                    <div class="ipt">
								${entity.point!}		                        
		                    </div>
		                </div>
		                <div class="formitm lybtns">
		                    <button type="submit" class="btn btn-primary" >确定</button>
		                </div>
		            </fieldset>
		        </form>
		    </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	function refresh(){
		$("#right").html('');
		getRightContent();
	}
	
	var validator;
	$().ready(function(){
		validator = $("#memberform").validate({
			rules: {
				'entity.password': {required:true,maxlength:40},
				'entity.email': {maxlength:60,email:true},
				'entity.nickname': {maxlength:60},
			},messages: {
				'entity.password': '请输入密码',
				'entity.email': '请输入正确的邮箱'
			}
		});
	});
</script>