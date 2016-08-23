<#--商品详情链接-->
<#assign url_goodsdetail="${base}/shop/goods/goods!detail.action"/>
<#--商品列表链接-->
<#assign url_goodslist="${base}/shop/goods/goods!list.action"/>
<#--商品分类链接-->
<#assign url_goodstype="${base}/shop/goodstype/goodstype!list.action"/>
<#--主页链接-->
<#assign url_index="${base}/shop/index.action"/>
<#--社区链接-->
<#assign url_surround="${base}/shop/goods/goods!list.action?result=surround"/>
<#--附近链接-->
<#assign url_nearby="${base}/shop/shop/shop.action"/>
<#--商铺列表链接-->
<#assign url_shoplist="${base}/shop/shop/shop!list.action"/>
<#--商铺详情链接-->
<#assign url_shopdetail="${base}/shop/shop/shop!detail.action"/>
<#--购物车链接-->
<#assign url_cartlist="${base}/shop/order/cart!list.action"/>
<#--我的链接-->
<#assign url_memberhome="${base}/shop/member/home.action"/>
<#--登陆链接-->
<#assign url_login="${base}/shop/login/login.action"/>
<#--注册链接-->
<#assign url_register="${base}/shop/register/register!add.action"/>
<#--我的收藏-->
<#assign url_myfavorite=url_memberhome + "?type=favorite"/>
<#--订单列表-->
<#assign url_orderlist=url_memberhome + "?type=myorder"/>
<#-- 登陆人 -->
<#assign loginer=shop_loginer!/>