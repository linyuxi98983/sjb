 <li><div class="opus_head"><a href="" target="_blank" class="opus_tlt">${case.title!}</a>
                    <div class="opus_label"><span class="opus_p">
                        <em>${case.sqm}㎡</em> |</span><span class="opus_p"> <em>${case.picList?size}</em>
                        	图</span><b class="opus_line">|</b>
                      <span class="opus_p"><em>${case.browseCount!}</em>浏览</span><p class="clear"></p></div><p class="clear"></p></div>
                  <p class="opus_content">
                   <!-- 设计公司：深圳曲高装饰设计工程有限公司 主创设计师：曲效辰 项目名称：莆田印象 项目地址：深圳宝安田寮 项目面积：800㎡ 项目风格：中式
                    	主要用材：实木、灰麻石、灰条砖、彩绘、名间石雕-->
                    	${case.caseDescription!}
                  </p>
                  <a href="" target="_blank" class="opus_img">
                    <span class="opus_span">
                     
                      <#if case.picList? exists>
						<#list case.picList! as image>		
							<#if (image_index?if_exists+1 <4)>			
							<img src="${image.imagePath!}" alt=""/>
							</#if>
                      	</#list>
                      </#if>
                    </span>
                  </a>
                </li>