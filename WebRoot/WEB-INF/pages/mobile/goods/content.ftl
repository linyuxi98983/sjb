<!DOCTYPE html>
<html class="">
    <head>
       <#include "/WEB-INF/ftl/mobile/header.ftl"/>
       <@header "商品图文详情"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/common.css"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/product.css"/>
    </head>
    <body class="defwidth">
        <@footer "图文详情"/>
        
        <section class="detail">
          	${entity.details!}
        </section>
        
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/underscore.min.js"></script>
        <script src="${base}/resources/mobile/js/iscroll5.min.js"></script>
        <script src="${base}/resources/mobile/js/fastclick.min.js"></script>
        <script src="${base}/resources/mobile/js/common.min.js"></script>
        <script src="${base}/resources/mobile/js/product.min.js"></script>
    </body>
</html>