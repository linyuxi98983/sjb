 <li><div class="opus_head"><a href="" target="_blank" class="opus_tlt">${case.title!}</a>
                    <div class="opus_label"><span class="opus_p">
                        <em>${case.sqm}�O</em> |</span><span class="opus_p"> <em>${case.picList?size}</em>
                        	ͼ</span><b class="opus_line">|</b>
                      <span class="opus_p"><em>${case.browseCount!}</em>���</span><p class="clear"></p></div><p class="clear"></p></div>
                  <p class="opus_content">
                   <!-- ��ƹ�˾����������װ����ƹ������޹�˾ �������ʦ����Ч�� ��Ŀ���ƣ�����ӡ�� ��Ŀ��ַ�����ڱ������ ��Ŀ�����800�O ��Ŀ�����ʽ
                    	��Ҫ�òģ�ʵľ������ʯ������ש���ʻ桢����ʯ��-->
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