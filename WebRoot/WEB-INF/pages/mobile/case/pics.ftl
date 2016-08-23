<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no, email=no">
    <title>装修效果图大全2015图片</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" href="${base}/resources/mobile/css/reset.css"/>
    <link rel="stylesheet" href="${base}/resources/mobile/css/decorate-pics.css"/>
    <link rel="stylesheet" href="${base}/resources/mobile/css/dsn.css"/>
    <script type="text/javascript" src="${base}/resources/mobile/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${base}/resources/mobile/js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="${base}/resources/mobile/js/dsn.js"></script>
    <script type="text/javascript" src="${base}/resources/mobile/js/scrollLoad.js"></script>
    <script type="text/javascript">
      $(function() {
        var imgload = $(".lazy");
        imgload.lazyload({
          effect: "fadeIn",
        });
      })
      function logout(){
  	  	alert("logout");
  	  }
    </script>
  </head>
  
  <body class=" hIphone" style="zoom: 1; padding-bottom: 0px;">
    <div class="decorate_index">
      <div class="top">
        <div class="top_left">
          <a href="${base}/mobile/index.action">
            <span class="logo"></span>
          </a>
          <div class="se">
            <div class="touch">
              <span class="type">网咖</span>
              <span class="select_sj"></span>
            </div>
            <div class="select_dec_type">
              <div class="sj">
              </div>
              <div class="family cur">
                <a href="">
                  网咖
                </a>
              </div>
              <div class="work">
                <a href="">
                  电竞
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="search_more">
          <a href="">
            <em class="search">
              <img src="http://img.shejiben.com/wap/new_wap/search.png?20150319" alt=""
              width="20">
            </em>
          </a>
          <em class="nav">
            <img src="http://img.shejiben.com/wap/new_wap/nav.png?20150319" alt=""
            width="20">
          </em>
        </div>
      </div>
      <div class="pop-menus">
      	<a href="" class="login-info">设计师</a>
      	<a href="javascript:void(0)" class="login-exit" onclick="logout()">[退出]</a>
        <h1>
          <a href="#" class="dsn-icon" id="hide-pop-menus"></a>
        </h1>
        <ul class="clearfix"> 
		    <li><a href="../index.html" class="dsn-icon"></a><span>首页</span></li> 
		    <li><a href="decorate-pics.html" class="dsn-icon"></a><span>装修图库</span></li> 
		    <li><a href="../case/case.html" class="dsn-icon"></a><span>设计案例</span></li> 
		    <li><a href="../designer/designer.html" class="dsn-icon"></a><span>找设计师</span></li> 
		    <li><a href="" class="dsn-icon"></a><span>有问必答</span></li> 
		    <li><a href="" class="dsn-icon"></a><span>设计资讯</span></li> 
		    <li><a href="" class="dsn-icon"></a><span>设计师专访</span></li> 
		    <li><a href="" class="dsn-icon"></a><span>提交需求</span></li> 
		    <li><a href="" class="dsn-icon"></a><span>逛商城</span></li> 
		    <li><a href="" class="dsn-icon"></a><span>模型下载</span></li> 
		</ul> 
      </div>
      <div class="choice_type">
        <div class="space">
          <span>
            全部空间
          </span>
        </div>
        <div class="type">
          <span>
            全部网咖风格
          </span>
        </div>
      </div>
      <div class="choice">
        <div class="now choice_space">
          <a href="" class="cur">
            全部空间
          </a>
          <a href="">
            客厅
          </a>
          <a href="">
            卧室
          </a>
          <a href="">
            餐厅
          </a>
          <a href="">
            厨房
          </a>
          <a href="">
            卫生间
          </a>
          <a href="">
            阳台
          </a>
          <a href="">
            书房
          </a>
          <a href="">
            玄关
          </a>
          <a href="">
            过道
          </a>
          <a href="">
            儿童房
          </a>
          <a href="">
            衣帽间
          </a>
          <a href="">
            花园
          </a>
          <a href="">
            休闲区
          </a>
          <a href="">
            地台
          </a>
          <a href="">
            窗台
          </a>
          <a href="">
            楼梯
          </a>
          <a href="">
            吧台
          </a>
          <a href="">
            酒窖
          </a>
          <a href="">
            壁炉
          </a>
          <a href="">
            地下室
          </a>
          <a href="">
            视听室
          </a>
          <a href="">
            阁楼
          </a>
        </div>
        <div class="now select_type">
          <a href="" class="cur">
            全部网咖风格
          </a>
          <a href="">
            混搭网咖风格
          </a>
          <a href="">
            欧式网咖风格
          </a>
          <a href="">
            中式网咖风格
          </a>
          <a href="">
            新古典网咖风格
          </a>
          <a href="">
            东南亚网咖风格
          </a>
          <a href="">
            美式网咖风格
          </a>
          <a href="">
            田园网咖风格
          </a>
          <a href="">
            地中海网咖风格
          </a>
          <a href="">
            现代网咖风格
          </a>
        </div>
      </div>
      <div class="picture" id="imgList">
         <#if data.designWorks??>
          
          	<#list data.designWorks as ds>
          	
        <a href="${base}/mobile/case/case!pic_detail.action?id=${ds.id}">
          <div class="pic">
            <img class="lazy" src="${ds.imagePath!}"
            data-original="${ds.imagePath!}"
            alt="${ds.title!}" style="display: inline;">
            <div class="pic_pens">
            <#if ds.mb ??>
              <img src="${ds.mb.imagePath!}"
					    </#if>
              alt="洪文諒空間設計">
              <span>
                设计师: ${ds.member!}
              </span>
            </div>
          </div>
        </a>
          	</#list>
         </#if>
       
      </div>
      <section>
        <ul class="pageCounts" style="display:block">
          <li>
            <a href="javascript:void(0)" class="active">上一页</a>
          </li>
          <li>
            <a href="javascript:void(0)">${pager.pageNumber}/${(pager.pageCount)}</a>
          </li>
          <li>
            <a href="" class="links">下一页</a>
          </li>
        </ul>
      </section>
      <div class="hot_words">
        <div class="hot">
          热门搜索
        </div>
        <div class="words">
          <div>
            <a href="">
              阳台卧室
            </a>
          </div>
          <div>
            <a href="">
              客厅房顶
            </a>
          </div>
          <div>
            <a href="">
              暗客厅
            </a>
          </div>
          <div>
            <a href="">
              别墅窗帘
            </a>
          </div>
          <div>
            <a href="">
              中式书房
            </a>
          </div>
          <div>
            <a href="">
              家庭书房
            </a>
          </div>
          <div>
            <a href="">
              书房飘窗
            </a>
          </div>
          <div>
            <a href="">
              网咖书房
            </a>
          </div>
          <div>
            <a href="">
              古典书房
            </a>
          </div>
          <div>
            <a href="">
              现代书房
            </a>
          </div>
        </div>
      </div>
    </div>
    
    <div class="bottombar"></div>
    <div class="pg-ft">
      <ul class="terminal-nav">
        <li>
          <a class="active" href="javascript:void(0)">触屏版</a>
        </li>
        <li>
          <span class="i-sep"></span>
          <a href="../../pc/index.action">电脑版</a>
          <span class="i-sep"></span>
        </li>
        <li>
          <a href="" rel="nofollow">
            关于我们
          </a>
        </li>
      </ul>
      <div class="company-info">
        @2014 百爪鱼 粤ICP备08125558号-2
      </div>
    </div>
    <div id="scrollButton" class="scrollButton" style="bottom: 70px; display: block;"></div>
  </body>
</html>