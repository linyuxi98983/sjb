<#macro footer isRight=true>
<footer class="footer">
    <div class="header-w">
        <div class="footer-line"></div>
        <div class="footer-links">
            <ul>
                <li class="frist-link">
                    <a href="" target="_blank">关于我们</a>
                </li>
                <li>
                    <a href="" target="_blank">售后服务</a>
                </li>
                <li>
                    <a href="" target="_blank">新手上路</a>
                </li>
            </ul>
        </div>
        <div class="footer-copyright">
            <@spring "global.project.copyright"/>
	        <a href="http://www.miibeian.gov.cn/" target="_blank">
            <@spring "global.project.icp"/>
	        </a>
        </div>
        <a href="">
            <img border="0" src="http://img.webscan.360.cn/status/pai/hash/21e7dcdf81353edef47d8376732d8fef/?size=74x27">
        </a>
    </div>
</footer>
<#if isRight>
<div class="vr-toolbar fixed" id="vr-toolbar" style="left: 1229.5px;">
            <div class="toolbar-panel">
                <ul>
                    <li class="user-center">
                        <a href="${url_memberhome!}">
                            <s></s>个人中心
                        </a>
                        <div class="mp-tooltip">
                                个人中心<s class="icon_arrow_right_black"></s>
                        </div>
                    </li>
                    <li class="my-order">
                        <a href="${url_orderlist!}"><s></s>我的订单</a>
                        <div class="mp-tooltip">
                                我的订单<s class="icon_arrow_right_black"></s>
                        </div>
                    </li>
                    <li class="my-cart">
                        <a href="${url_cartlist!}">
                            <s></s>购物车
                        </a>
                        <div class="mp-tooltip">
                                购物车<s class="icon_arrow_right_black"></s>
                        </div>
                        <i id="vtoobar_cart_count" class="new_msg">
                        </i>
                    </li>
                    <li class="gototop">
                        <a href="#">
                            <s></s>回到顶部
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        </#if>
</#macro>