var server_host = '/';
var rankhelp_doc = '/help/rankhelp.html';
var isIE = navigator.userAgent.indexOf("compatible") > -1 && navigator.userAgent.indexOf("MSIE") > -1 && (navigator.appName !== "Oprea");
var isIE7 = (isIE && window.XMLHttpRequest) ? true: false;
var isIE6 = (isIE && !window.XMLHttpRequest && window.ActiveXObject) ? true: false;
var isFirefox = navigator.userAgent.indexOf('Firefox') == -1 ? false: true;
var userAgent = navigator.userAgent.toLowerCase();
var is_opera = userAgent.indexOf('opera') != -1 && opera.version();
var is_moz = (navigator.product == 'Gecko') && userAgent.substr(userAgent.indexOf('firefox') + 8, 3);
var is_ie = (userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5, 3);
var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows");
var to8to_uid = getCookie('uid', 1);
var to8to_ind = getCookie('ind', 1);
var divTop,divLeft,divWidth,divHeight,docHeight,docWidth,objTimer,secI;
var setEvent = new Array;
var minHeight = new Array;
var k = 1;
var FlickerTime = 0;
var default_title = document.getElementsByTagName('title')[0].innerHTML;  //页面最开始的默认标题，用于在停止闪烁后恢复原来标题 
var is_Close_Colorbox = 0;
if ((window.location.href.indexOf(".shejiben.com") != -1)) {
    server_host = "http://www.shejiben.com/"
};
if (!Array.prototype.push) {
    Array.prototype.push = function() {
        var startLength = this.length;
        for (var i = 0; i < arguments.length; i++) {
            this[startLength + i] = arguments[i]
        };
        return this.length
    }
};
if (!Array.prototype.contains){//相对于php中的in_array方法
    Array.prototype.contains = function(arr){
        for(var i=0;i< this.length; i++){
            if(this[i] == arr)return true;
        }
        return false;
    }
};
function $() {
    var obj = new Array();
    for (var i = 0, j = arguments.length; i < j; i++) {
        ele = arguments[i];
        if (typeof ele == 'object') {
            return ele
        };
        if (typeof ele == 'string') {
            ele = document.getElementById(ele) ? document.getElementById(ele) : document.getElementsByTagName(ele).length > 0 ? document.getElementsByTagName(ele) : false
        };
        if (j == 1) {
            return ele
        };
        obj.push(ele)
    };
    return obj
};
function doane(event) {
    e = event ? event: window.event;
    if (is_ie) {
        e.returnValue = false;
        e.cancelBubble = true
    } else if (e) {
        e.stopPropagation();
        e.preventDefault()
    }
};
function doane_but_a(event) {
    e = event ? event: window.event;
    if (is_ie) {
        e.cancelBubble = true
    } else if (e) {
        e.stopPropagation()
    }
};
function addNodes(o, O, d) {
    if (!O) {
        return
    }
    d = parseInt(d);
    if (d < 0) {
        o.appendChild(O)
    } else if (d == 0) {
        if (o.childNodes.length != 0) {
            o.insertBefore(O, o.firstChild)
        } else {
            o.appendChild(O)
        }
    } else {
        if (o.childNodes.length - 1 < d) {
            o.appendChild(O)
        } else {
            o.insertBefore(O, o.childNodes[d])
        }
    }
};
Object.extend = function(oFrom, oTo) {
    for (property in oFrom) {
        oTo[property] = oFrom[property]
    };
    return oTo
};
var Events = new Object();
Events.addEvent = function(oTarget, sEventType, fnLister) {
    if (oTarget.addEventListener) {
        oTarget.addEventListener(sEventType, fnLister, false)
    } else if (oTarget.attachEvent) {
        oTarget.attachEvent("on" + sEventType, fnLister)
    } else {
        oTarget["on" + sEventType] = fnLister
    }
};
Events.removeEvent = function(oTarget, sEventType, fnLister) {
    if (oTarget.removeEventListener) {
        oTarget.removeEventListener(sEventType, fnLister, false)
    } else if (oTarget.detachEvent) {
        oTarget.detachEvent("on" + sEventType, fnLister)
    } else {
        oTarget["on" + sEventType] = null
    }
};
Events.formatEvent = function(oEvent) {
    if (isIE && isWin) {
        oEvent.charCode = (oEvent.type == "keypress") ? oEvent.keyCode: 0;
        oEvent.eventPhase = 2;
        oEvent.isChar = (oEvent.charCode > 0);
        oEvent.pageX = oEvent.cleintX + (document.body.scrollLeft || document.documentElement.scrollLeft);
        oEvent.pageY = oEvent.cleintY + (document.body.scrollTop || document.documentElement.scrollTop);
        oEvent.preventDefalt = function() {
            this.returnValue = false
        };
        if (this.type == "mouseout") {
            oEvent.relatedTarget = oEvent.toElement
        } else if (this.type == "mouseover") {
            oEvent.relatedTarget = oEvent.fromElement
        }
        oEvent.target = oEvent.srcElement;
        oEvent.time = (new Date()).getTime()
    }
    return oEvent
};
Events.getEvent = function() {
    if (window.event) {
        return this.formatEvent(window.event)
    } else {
        return Event.getEvent.caller.arguments[0]
    }
};

function autoSize(obj, w, h) {
    var oIMG = new Image();
    oIMG.onload = function() {
        var oW = this.width;
        var oH = this.height;
        var tax = 1;
        if (oW > w || oH > h) tax = (oW / oH) > (w / h) ? (w / oW) : (h / oH);
        obj.style.marginLeft = (w - Math.floor(oW * tax)) / 2 + "px";
        obj.style.marginTop = (h - Math.floor(oH * tax)) / 2 + "px";
        obj.width = oW * tax;
        obj.height = oH * tax
    };
    oIMG.src = obj.src
};

function autoSize_H(obj, h) {
    var oIMG = new Image();
    oIMG.onload = function() {
        var oh = this.height;
        if (oh > h) {
            obj.height = h;
            obj.style.marginTop = '0px';
            obj.parentNode.style.background = '#fff';
        } else {
            obj.height = this.height;
            obj.style.marginTop = (h - Math.floor(oh)) / 2 + 'px';
            obj.parentNode.style.background = '#FAFAF6';
        }
    };
    oIMG.src = obj.src
};

function autoSize_w(obj, w) {
    var oIMG = new Image();
    oIMG.onload = function() {
        var oW = this.width;
        if (oW > w) {
            obj.width = w;
            obj.height = Math.floor((this.height) * (w / this.width))
        }
    };
    oIMG.src = obj.src
};
function makeCode() {
    var color = Array("#069", "#966", "#639", "#F00", "#303", "#F00", "#B4FF00", "#369");
    var code = "";
    var out = "";
    for (var i = 0; i < 4; i++) {
        var str = Math.floor(Math.random() * 10);
        code += str;
        out += "<b style='color:" + color[Math.floor(Math.random() * 8 + 1)] + ";font-size:18px;'>" + str + "</b>&nbsp;"
    }
    $("checkcode").innerHTML = out;
    $("checkcode").style.backgroundColor = '#FFF';
    if (!document.all) {
        $("checkcode").style.padding = "1px"
    };
    $("checkcodevalue").value = code
};
function newverifypic() {
    var A = new Date().getTime();
    if ($('passport')) {
        $('passport').src = 'http://www.shejiben.com/passport.php?t=' + A
    }
};
function newverifypicAndy() {
    var A = new Date().getTime();
    if ($('passport')) {
        $('passport').src = 'http://www.shejiben.com/passport_sem.php?t=' + A
    }
};
String.prototype.trim = function() {
    var res = /^\s*/;
    var value = this;
    value = value.replace(res, '');
    res = /\s*$/;
    return value.replace(res, '')
};
function drag(o, m) {
    var x;
    var y;
    o.onmousedown = MouseDown;
    if (o.firstChild) {
        o.firstChild.onmousedown = function() {
            return false
        }
    };
    var oP = o.parentNode;
    var r = new Array();
    function MouseDown(evt) {
        var evt = evt ? evt: window.event;
        if (o.setCapture) {
            o.setCapture()
        } else if (!isFirefox && window.captureEvents) {
            window.captureEvents(evt.mousemove | evt.mouseup)
        }
        if (m) {
            r[0] = oP.layerLeft ? oP.layerLeft: oP.offsetLeft;
            r[1] = r[0] + oP.offsetWidth ? oP.offsetWidth: oP.layerWidth;
            r[2] = oP.layerTop ? oP.layerTop: oP.offsetTop;
            r[3] = r[2] + oP.offsetHeight ? oP.offsetHeight: oP.layerHeight
        };
        x = evt.layerX ? evt.layerX: evt.offsetX;
        y = evt.layerY ? evt.layerY: evt.offsetY;
        document.onmousemove = MouseMove;
        document.onmouseup = MouseUp;
        stopEvent(evt);
        return false;
        function MouseMove(evt) {
            var evt = evt ? evt: window.event;
            var Tx = evt.pageX ? evt.pageX: evt.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft);
            var Ty = evt.pageY ? evt.pageY: evt.clientY + (document.documentElement.scrollTop || document.body.scrollTop);
            if (m) {
                Tx = Tx - r[0];
                Ty = Ty - r[2]
            };
            o.style.left = parseInt(Tx - x);
            o.style.top = parseInt(Ty - y);
            document.body.style.cursor = "move";
            stopEvent(evt);
            return false
        };
        function MouseUp(evt) {
            evt = evt || window.event;
            if (o.releaseCapture) {
                o.releaseCapture()
            } else if (!isFirefox && window.releaseEvents) {
                window.releaseEvents(evt.mousemove | evt.mouseup)
            }
            document.onmousemove = null;
            document.onmouseup = null;
            document.body.style.cursor = "";
            stopEvent(evt);
            return false
        };
        function stopEvent(evt) {
            if (evt.preventDefault) {
                evt.stopPropagation();
                evt.preventDefault()
            } else {
                evt.returnValue = false;
                evt.cancelBubble = true
            }
        }
    }
};

function scroll2top(o) {
    var top = 0;
    if (typeof o == 'string') {
        var node = $(o)
    } else if (typeof o == 'object') {
        var node = o
    } else if (typeof o == 'number') {
        top = o;
        if(top === 0) {
            backToTop();
            return false;
        }
    }
    if (node) {
        top += node.offsetTop
    };
    window.scrollTo(0,top);
};

function backToTop() {
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    var cus = 500;
    if(isIE) {
      cus = 5;
    }
    minHeight[k] = Math.ceil(scrollTop/cus);
    var speed = minHeight[1];
    var minus = scrollTop - speed;
    if(minus < 0) {
        minus = 0;
    }
    window.scrollTo(0,minus);
    setEvent[k] = setInterval("backToTop()", 20);
    k++;
    if(scrollTop <= 0) {
        for (var j=1; j<=setEvent.length; j++) {
            clearInterval(setEvent[j]);
        }
    }
    //window.scrollTo(0,0);
}

function get_content(oEle, nMax) {
    var nNum = string_bytes(oEle.value);
    if (nNum > nMax) {
        var maxwords = getbybytes(oEle.value, nMax);
        oEle.value = oEle.value.substring(0, maxwords)
    }
};
function string_bytes(sStr) {
    if (typeof(sStr) != 'string') {
        sStr = sStr.value
    };
    var nLen = 0;
    for (var i = 0; i < sStr.length; i++) {
        if (sStr.charCodeAt(i) > 127) {
            nLen++
        };
        nLen++
    };
    return nLen
};
function is_cat_same(sInputId, sSelectId) {
    var sStr = $(sInputId).value.trim();
    var oObj = $(sSelectId);
    for (i = 0; i < oObj.options.length; i++) {
        sNewStr = oObj.options[i].text;
        if (sNewStr == sStr.toLowerCase()) {
            return false
        }
    };
    return true
};
function getbybytes(sStr, nNum) {
    var sWords = 0;
    var nBytes = 0;
    for (var i = 0; i < sStr.length; i++) {
        if (nBytes < nNum - 1) {
            if (sStr.charCodeAt(i) > 127) {
                sWords++;
                nBytes = nBytes + 2
            } else {
                sWords++;
                nBytes++
            }
        } else if (nBytes == nNum - 1) {
            if (sStr.charCodeAt(i) > 127) {
                return sWords
            } else {
                sWords++;
                nBytes++
            }
        } else {
            return sWords
        }
    }
};
function pic_type(sUrl) {
    var sType = sUrl.substr(sUrl.lastIndexOf('.') + 1);
    var j = 0;
    var arr = new Array('jpg', 'gif', 'bmp', 'png', 'jpeg', 'pjpeg');
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] != sType.toLowerCase()) {
            j++
        }
    };
    if (j == arr.length) {
        return false
    } else {
        return true
    }
};
function attach_type(sUrl) {
    var ext = sUrl.substr(sUrl.length - 3, 3).toLowerCase();
    if ((ext != "rar") && (ext != "zip")) {
        return false
    } else {
        return true
    }
};
function setCookie(name, value, expire, pre, domain) {
    if (!expire) {
        expire = 5000
    };
    if (pre) {
        name = 'to8to_' + name
    };
    var expiry = new Date();
    expiry.setTime(expiry.getTime() + expire);
    var domain_url = '';
    if (domain) domain_url = 'domain=' + domain + ';';
    document.cookie = name + '=' + value + ';expires=' + expiry.toGMTString() + ';path=/;' + domain_url
};
function getCookie(name, pre) {
    if (pre) {
        name = 'to8to_' + name
    };
    var r = new RegExp("(\\b)" + name + "=([^;]*)(;|$)");
    var m = document.cookie.match(r);
    return (!m ? "": decodeURIComponent(m[2]))
};
function check_point(sValue) {
    var re = /^[\s0-9a-zA-Z\u0391-\uFFE5]+$/gi;
    if (!re.test(sValue)) {
        return false
    } else {
        return true
    }
};
function show_error(sIdName) {
    if (sIdName) {
        var oObj = $(sIdName)
    }
    oObj.style.display = "block"
};
function hide_error(sIdName) {
    if (sIdName) {
        var oObj = $(sIdName)
    };
    oObj.style.display = "none"
};
function show_cat_err(sStr, sIdName) {
    var oObj = $(sIdName);
    show_error(sIdName);
    oObj.innerHTML = sStr
};
jsPage = function(iNums, iPrePage, iCurpage, fnCallBack, sInnerId) {
    _this = this;
    this.iNums = Math.ceil(iNums);
    this.iPrePage = Math.ceil(iPrePage);
    this.iCurPage = Math.ceil(iCurpage);
    this.fnCallBack = fnCallBack;
    this.sInnerId = sInnerId;
    this.sPageDivClass = 'pages';
    this.sPrevClass = 'prev';
    this.sNextClass = 'next';
    this.sFirstClass = 'first';
    this.sLastClass = 'last';
    if (this.iNums <= this.iPrePage) {
        return false
    };
    this.setPageDivClass = function(css) {
        this.sPageDivClass = css
    };
    this.setPrevClass = function(css) {
        this.sPrevClass = css
    };
    this.setNextClass = function(css) {
        this.sNextClass = css
    };
    this.multi = function(i) {
        if (i) {
            this.iCurPage = Math.ceil(i)
        };
        var sHtmlPage = '';
        if (this.iNums < this.iPrePage) {
            sHtmlPage = ''
        } else {
            var iPages = Math.ceil(this.iNums / this.iPrePage);
            if (!this.iCurPage || this.iCurPage < 1) {
                this.iCurPage = 1
            }
            if (this.iCurPage > iPages) {
                this.iCurPage = iPages
            }
            var iFrom = 1;
            var iTo = 1;
            if (iPages < 10) {
                iFrom = 1;
                iTo = iPages
            } else {
                iFrom = this.iCurPage - 4;
                iTo = iFrom + 10 - 1;
                if (iFrom < 1) {
                    iTo = this.iCurPage - iFrom + 1;
                    iFrom = 1;
                    if (iTo - iFrom < 10) iTo = 10
                } else if (iTo > iPages) {
                    iFrom = iPages - 10 + 1;
                    iTo = iPages
                }
            }
            sHtmlPage = this.iCurPage - 4 > 1 && iPages > 10 ? '<a href="#" class="' + this.sFirstClass + '" onclick="_this.fnCallBack(1);_this.multi(1);return false;">1 ...</a>': '';
            sHtmlPage += this.iCurPage > 1 ? '<a href="void(0)" class="' + this.sPrevClass + '" onclick="_this.fnCallBack(' + (this.iCurPage - 1) + ');_this.multi(' + (this.iCurPage - 1) + ');return false;">&lsaquo;&lsaquo;</a>': '';
            for (var i = iFrom; i <= iTo; i++) {
                sHtmlPage += i == this.iCurPage ? '<strong>' + i + '</strong>': '<a href="#" onclick="_this.fnCallBack(' + i + ');_this.multi(' + i + ');return false;">' + i + '</a>'
            };
            sHtmlPage += this.iCurPage < iPages ? '<a href="#" class="' + this.sNextClass + '" onclick="_this.fnCallBack(' + (this.iCurPage + 1) + ');_this.multi(' + (this.iCurPage + 1) + ');return false;">&rsaquo;&rsaquo;</a>': '';
            sHtmlPage += iTo < iPages ? '<a href="#" class="' + this.sLastClass + '" onclick="_this.fnCallBack(' + iPages + ');_this.multi(' + iPages + ');return false;">... ' + iPages + '</a>': '';
            sHtmlPage = sHtmlPage ? '<div class="' + this.sPageDivClass + '"><em>&nbsp;' + this.iNums + '&nbsp;</em>' + sHtmlPage + '</div>': ''
        }
        if (this.sInnerId && document.getElementById(sInnerId)) {
            document.getElementById(sInnerId).innerHTML = sHtmlPage
        } else {
            return sHtmlPage
        }
    }
};
function jsSelectItem(arr, itemValue, mod, selectName, attribute, echo, defaultValue) {
    if (!attribute) {
        attribute = ''
    };
    var js = '<select id="' + selectName + '" name="' + selectName + '" ' + attribute + '>';
    if (defaultValue) {
        js += '<option>' + defaultValue + '</option>'
    };
    if (arr) {
        if ('K-V' == mod) {
            for (var i in arr) {
                if (typeof arr[i] == 'function') continue;
                js += '<option  value="' + (parseInt(i)) + '"';
                if (parseInt(i) == itemValue) {
                    js += 'selected="selected"'
                };
                js += '>' + arr[i] + '</option>'
            }
        } else if ('V-V' == mod) {
            for (var i = 0, j = arr.length; i < j; i++) {
                js += '<option  value="' + arr[i] + '"';
                if (arr[i] == itemValue) {
                    js += 'selected="selected"'
                };
                if (selectName == "User_Shen") {
                    js += '>' + GP_EN[i] + '</option>'
                } else {
                    js += '>' + arr[i] + '</option>'
                }
            }
        }
    };
    js += '</select>';
    if (echo) {
        document.write(js)
    } else {
        return js
    }
};
function in_array(value, arr) {
    if (!arr || arr.length == 0) return false;
    var flag = false;
    for (var i = 0, j = arr.length; i < j; i++) {
        if (arr[i] == value) {
            flag = true
        }
    };
    return flag
};
function middle(o) {
    if (!o) {
        return false
    };
    o = $(o);
    o.style.position = 'absolute';
    if (o.offsetWidth == 0) {
        o.offsetWidth = parseInt(o.style.width)
    };
    if (o.offsetHeight == 0) {
        o.offsetHeight = parseInt(o.style.height)
    };
    var sClientWidth = document.body.clientWidth || document.documentElement.clientWidth;
    var sClientHeight = window.screen.height;
    var iLeft = (document.body.clientWidth / 2) - (o.offsetWidth / 2);
    var sScrollTop = document.body.scrollTop || document.documentElement.scrollTop;
    var iTop = -80 + (sClientHeight / 2 + sScrollTop) - (o.offsetHeight / 2);
    iTop = iTop > 0 ? iTop: (sClientHeight / 2 + sScrollTop) - (oDialog.offsetHeight / 2);
    o.style.left = iLeft + 'px';
    o.style.top = iTop + 'px'
};
function insertScript(id, url) {
    var oScript = $(id);
    if (oScript) {
        oScript.parentNode.removeChild(oScript)
    };
    oScript = document.createElement('script');
    oScript.setAttribute('id', id);
    oScript.setAttribute('src', url);
    oScript.setAttribute('type', 'text/javascript');
    oScript.setAttribute('language', 'javascript');
    var header = $('head').item(0);
    header.appendChild(oScript)
};
function jsLoader(id) {
    this.load = function(f) {
        var oTags = document.getElementsByTagName('script');
        for (i = oTags.length - 1; i >= 0; i--) {
            var src = oTags[i].src;
            if (src && src.indexOf(f) > -1) {
                this.onsuccess();
                return
            }
        }
        var s = document.createElement('script');
        if (id) var header = $(id);
        else var header = document.getElementsByTagName('head').item(0);
        s.setAttribute('src', f);
        s.setAttribute('type', 'text/javascript');
        s.setAttribute('language', 'javascript');
        header.appendChild(s);
        var _self = this;
        s.onload = s.onreadystatechange = function() {
            if (this.readyState && this.readyState == "loading") {
                return
            };
            _self.onsuccess()
        };
        s.onerror = function() {
            header.removeChild(s);
            _self.onfailure()
        }
    };
    this.onfailure = function() {};
    this.onsuccess = function() {}
};
function addKeepData(k, s) {
    if (!getCookie('id', 1)) {
        editPhotoCat('/popup_login.php', '登陆', 400, 260);
        return false
    }
    var href = window.location.href;
    href = encodeURIComponent(href);
    var url = '/add_keep.php?';
    url = url.concat('url=').concat(href).concat('&ktype=').concat(k).concat('&subject=').concat(s).concat('&s=').concat(Math.random(2));
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        editPhotoCat(url, s, 620, 500)
    };
    oJsLoader.load('/gb_js/popup.js')
};
function zoompic(obj, zimg) {
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        zoom(obj, zimg)
    };
    oJsLoader.load('http://www.shejiben.com/gb_js/zoom.js')
};
function zoompic2(obj, zimg) {
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        zoom(obj, zimg)
    };
    oJsLoader.load('http://www.shejiben.com/gb_js/zoom2.js')
};
function to8to_zoom() {
    if ($('bigimgobject').rel) {
        window.open($('bigimgobject').rel)
    } else {
        zoompic($('bigimgobject'), $('bigimgobject').src)
    }
};
function addFriends(u, f, t, w, h) {
    var oJsLoader = new jsLoader();
    var uid = getCookie('uid', 1);
    if (!uid) {

         showSingleLogin(1,2);
        return false
    }
    u = uid;
    var url = '/friend_modify.php?uid=' + u + '&type=' + encodeURIComponent(t);
    if (f) {
        url = url.concat('&fid=').concat(f)
    };
    oJsLoader.onsuccess = function() {
        editPhotoCat(url, t, w, h)
    };
    oJsLoader.load('/gb_js/popup.js')
};
function SendMsg(act, toid) {
    var sToid = "";
    if (toid) sToid = "&toid=" + toid;
    var sAct = "";
    sAct = act + sToid;
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        editPhotoCat('http://www.shejiben.com/pms.php?act=' + sAct + '&add=9', '短信中心', 750, 480)
    };
    oJsLoader.load('http://www.shejiben.com/gb_js/popup.js');
    return false
};
function showSingleLogin(id,n,referrer) {
	
	//alert("------" +n);
	 if(jq("#memberId").val() != undefined &&　jq("#memberId").val()!='' && jq("#memberId").val() > 0){
		 if(n == 1){
			 layer.open({
				    type: 2,
				    //skin: 'layui-layer-lan',
				    title: '预约咨询',
				    fix: false,
				    shadeClose: true,
				    maxmin: true,
				    area: ['380px', '400px'],
				   	content:path+'/resources/html/common/appointment.html'
				  });
		 }
		 
		 if(n == 3){
			 
		 }
		 
	 }else{
		 layer.open({
			    type: 2,
			    //skin: 'layui-layer-lan',
			    title: '登陆',
			    fix: false,
			    shadeClose: true,
			    maxmin: true,
			    area: ['380px', '400px'],
			   	content:path+'/resources/html/common/pop_login.html'
			  });
	 }
	 
    /*jQuery.colorbox({
        width: 380,
        height: 400,
        transition:"none",
        title:"登录",
        opacity: "0.5",
        iframe: true,
        href: path+'/html/pc/user/pop_login.html?id=' + parseInt(id) + '&new=' + parseInt(n) + '&referrer=' + referrer,
        onComplete: function() {
            initColorboxCss();
        },
        onClosed: function() {
            revertCss();
            if (ActionCollection.default_domain.length > 0) {
                document.domain = ActionCollection.default_domain;
            }
        }
    })*/
	
};

function noLogin_button() {
    var uid = getCookie('uid', true);
    if (!uid) {
        return showSingleLogin()
    };
    return true
};
function isDigit(num) {
    var regs = /^\d+$/;
    if (regs.test(num)) {
        return true
    } else {
        return false
    }
};
function getRadioValue(name) {
    var radioes = document.getElementsByName(name);
    for (var i = 0; i < radioes.length; i++) {
        if (radioes[i].checked) {
            return radioes[i].value
        }
    };
    return false
};
function toDesktop() {
    sUrl = window.location.href;
    var title = document.title;
    var iframe = document.createElement("IFRAME");
    iframe.width = 0;
    iframe.height = 0;
    var id = arguments.length ? 'header': 'to8to_top';
    document.getElementById(id).appendChild(iframe);
    iframe.contentWindow.document.write("[InternetShortcut]\r\n   url=" + sUrl);
    iframe.contentWindow.document.execCommand("saveAs", true, "C:\\Documents and Settings\\All Users\\桌面\\" + title + ".url")
};
function Upload_clear(id, i) {
    var up = (typeof id == "string") ? document.getElementById(id) : id;
    if (typeof up != "object") return null; {
        var tt = document.createElement("span")
    };
    tt.id = "__tt__";
    up.parentNode.insertBefore(tt, up);
    var tf = document.createElement("form");
    tf.appendChild(up);
    document.getElementsByTagName("body")[0].appendChild(tf);
    tf.reset();
    tt.parentNode.insertBefore(up, tt);
    tt.parentNode.removeChild(tt);
    tt = null;
    tf.parentNode.removeChild(tf);
    if ($("view_del_" + i)) {
        $("view_del_" + i).style.display = 'none'
    };
    if ($("view_text_" + i)) {
        $("view_text_" + i).style.display = 'none'
    };
    if ($("view_textarea_" + i)) {
        $("view_textarea_" + i).style.display = 'none'
    };
    if ($("view_message_" + i)) {
        $("view_message_" + i).innerHTML = ''
    };
    if ($("pic" + i)) {
        $('pic' + i).style.display = 'none'
    };
    if ($("view_img_" + i)) {
        $("view_img_" + i).style.display = 'none'
    };
    if (isIE6 || isIE7) {
        if ($("p_view_img_" + i)) {
            $("p_view_img_" + i).style.display = 'block';
            $("p_view_img_" + i).src = '/img/css/view.gif'
        }
    } else {
        if ($("p_view_img_" + i)) {
            $("p_view_img_" + i).style.display = 'none'
        }
    }
};
function checkImageFileNone(i) {
    if ($("view_img_" + i)) {
        $("view_img_" + i).style.display = 'none'
    };
    if ($("p_view_img_" + i)) {
        $("p_view_img_" + i).style.display = 'block';
        $("p_view_img_" + i).src = '/img/css/view.gif'
    };
    $("pic" + i).style.display = 'none'
}
function checkImageFile(i, obj, w, h, z) {
    $("view_message_" + i).innerHTML = '';
    $("view_del_" + i).style.display = 'block';
    checkImageFileNone(i);
    var dFile = $(obj.id);
    if ($('view_img_' + i)) {
        $('view_img_' + i).style.display = 'block';
        var dImg = $('view_img_' + i)
    };
    if ($('p_view_img_' + i)) {
        var dImg = $('p_view_img_' + i)
    };
    if (!dFile.value.match(/.jpg|.gif|.png|.bmp/i)) {
        $("view_message_" + i).innerHTML = '抱歉图片格式错误,请阅读上传说明';
        checkImageFileNone(i);
        return false
    };
    if (dFile.files) {
        dImg.src = dFile.files[0].getAsDataURL()
    } else {
        if (isIE6) {
            var img = new Image();
            img.onload = function() {
                var size = Math.round(this.fileSize / 1024);
                if (size > (z * 1024)) {
                    $("view_message_" + i).innerHTML = '图片<span style="color:#00F">' + size + 'KB</span>,超过最大允许限制';
                    checkImageFileNone(i);
                    return false
                };
                if (img.height < h && img.width < w) {
                    $("view_message_" + i).innerHTML = '图片宽高不能小于<span style="color:#00F;float:none;">' + w + '*' + h + '</span>,请重新上传！';
                    checkImageFileNone(i)
                };
                if ($('view_img_' + i)) {
                    $('view_img_' + i).style.display = 'block';
                    $('view_img_' + i).firstChild.src = obj.value
                };
                if ($('p_view_img_' + i)) {
                    $('p_view_img_' + i).src = obj.value
                };
                $("pic" + i).style.display = 'none';
                dImg.style.display = 'block'
            };
            img.src = dFile.value
        };
        if (isIE7 || (img.height == 30 && img.width == 28) || (img.height == 0 && img.width == 0)) {
            var newPreview = $('pic' + i);
            newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dFile.value;
            $("pic" + i).style.display = 'block';
            dImg.style.display = 'none'
        };
        if (isIE7) {
            $('img_hidden' + i).filters.item("DXImageTransform.Microsoft.AlphaImageLoader").sizingMethod = 'image';
            $('img_hidden' + i).style.minHeight = h + 'px';
            $('img_hidden' + i).style.minWidth = w + 'px';
            try {
                $('img_hidden' + i).filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dFile.value;
                imgwidth = $('img_hidden' + i).offsetWidth;
                imgheight = $('img_hidden' + i).offsetHeight;
                if (imgheight < h && imgwidth < w) {
                    $("view_message_" + i).innerHTML = '图片宽高不能小于<span style="color:#00F;float:none;">' + w + '*' + h + '</span>,请重新上传！';
                    checkImageFileNone(i);
                    return false
                }
            } catch(e) {
                alert('无效的图片文件。');
                w = 0;
                h = 0;
                return
            }
        }
    };
    if ($('view_text_' + i)) {
        $('view_text_' + i).style.display = 'block'
    };
    if ($('view_textarea_' + i)) {
        $('view_textarea_' + i).style.display = 'block';
        if ($('view_textarea_' + i).getElementsByTagName('textarea')[0]) {
            $('view_textarea_' + i).getElementsByTagName('textarea')[0].focus();
            $('view_textarea_' + i).getElementsByTagName('textarea')[0].onblur = function() {
                if (!$('view_textarea_' + i).getElementsByTagName('textarea')[0].value) {
                    $('view_textarea_' + i).style.display = 'none'
                }
            }
        }
    }
};
function DelHtml(str) {
    str = str.trim();
    str = str.replace(/<\/?[^>]*>/g, '');
    str = str.replace(/<iframe/g, '');
    return (str)
};
function changeStyle() {
    var to8to_ind = getCookie('ind', 1);
    var page = Math.floor(cssstyleid / 9) + 1;
    if (typeof(ind) == 'undefined') {
        alert("没有登录！");
        return false
    };
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        editPhotoCat("/css/html/" + to8to_ind + "-" + page + ".html", '切换网咖风格', 360, 345)
    };
    oJsLoader.load('/gb_js/popup.js')
};
function greet_text() {
    var text = "";
    var dt = new Date();
    var hours = dt.getHours();
    var username = getCookie('username', 1);
    if (typeof(username) == 'undefined' || username == "") {
        username = '您还未登陆，'
    } else {
        username = '欢迎来到百爪鱼，' + username
    }
    var uid = getCookie('uid', 1);
    if (uid) {
        $("xb_greet").innerHTML = username
    } else {
        $("xb_greet").innerHTML = username
    }
};
function to8toyx() {
   var url = window.location.href;
    if (null == url || url.indexOf("?") == -1) {
        return null
    };
    var argsUrl = url.split("?")[1];
    if (argsUrl.indexOf("=") == -1) {
        return null
    };
    if (argsUrl.indexOf("welcome=") != -1) {
        href = "http://www.shejiben.com/getuserdata.php?pos=to8toyx&" + argsUrl;
        href += '&s=' + Math.random(5);
        insertScript('sInsertScript', href)
    } else {
        return null
    }
};
function uicheck() {
    var fullpath = "";
    username = getCookie('username', 1);
    if ((window.location.href.indexOf(".shejiben.com") != -1)) {
        fullpath = "http://www.shejiben.com"
    }
    if (typeof(username) != 'undefined' && username != "" && username != "deleted") {
        to8to_ind = getCookie('ind', 1);
        uid = getCookie('uid', 1);
        msg = getCookie('msg', 1);
        mysite = fullpath + '/my/';
        if ($('loginchg')) {
            $('loginchg').innerHTML = '您好，<a href="' + mysite + '" target="_blank">' + username + '</a> <b>|</b> <a href="' + mysite + '" target="_blank" class="f60">我的管理中心</a> <b>|</b> <a href="' + fullpath + '/logout.php?uid=' + uid + '" target="_self">安全退出</a>'
        };
        if ($('index_login')) {
            if (typeof jq != 'undefined') {
                if (to8to_ind != 'sjs') {
                    to8to_ind = 'yz'
                };
                var src = 'http://www.shejiben.com/pic/user/' + (Number(uid) % 100) + '/headphoto_' + uid + '.jpg?' + Math.floor(Math.random() * 10);
                $('index_login').innerHTML = '<p class="sjb_login"><span class="touxiang"><b class="b1"></b><b class="b2"></b><a href="' + mysite + '"><img src="' + src + '" width="60" height="60" alt="' + username + '的设计头像" onerror="this.src=\'http://www.shejiben.com/img/headphoto/' + to8to_ind + '.jpg\';$(\'t\').innerHTML=\'你还没有头像，<a href=' + mysite + 'my_avater.php>传个头像</a>吧\'"/></a><b class="b3"></b><b class="b4"></b></span><span class="other_dl"><b class="b1"></b><span><a href="' + mysite + '" class="n">' + username + '</a><a href="#" onclick="SendMsg(8);return false;" class="dx">短信(' + msg + ')</a><em id="t">欢迎回来百爪鱼，<a href="http://www.shejiben.com/works/">看看作品</a></em></span><b class="b2"></b></span></p>'
            }
        }
    };
    if (document.referrer != "" && document.referrer.indexOf("shejiben.com") == -1) {
        if (window.location.href.indexOf("shejiben.com") != -1) {
            smallwindow();
            getMsg()
        }
    };
    to8toyx()
};
function tyb_uicheck() {
    username = getCookie('username', 1);
    if (typeof(username) != 'undefined' && username != "" && username != "deleted") {
        to8to_ind = getCookie('ind', 1);
        uid = getCookie('uid', 1);
        mysite = '/my/';
        if ($('loginchg')) {
            $('loginchg').innerHTML = '您好,<a href="' + mysite + '" target="_blank">' + username + '</a>|<a href="' + mysite + '" target="_blank" class="f30">我的管理中心</a>|<a href="/logout.php?uid=' + uid + '" target="_self">安全退出</a>'
        }
    }
};
function blogcheck() {
    username = getCookie('username', 1);
    
    if (typeof(username) != 'undefined' && username != "" && username != "deleted") {
        to8to_ind = getCookie('ind', 1);
        nick = cutstr(getCookie('to8to_nick'),10);
        mysite = "http://www.shejiben.com/" + to8to_ind + "/" + to8to_uid + '/';
        var In_jiaoyi_center = false;
        if (typeof(jiaoyi_center) != 'undefined' && jiaoyi_center == 1) {
            In_jiaoyi_center = true
        };
            //"http://pic.shejiben.com/user/"+(to8to_uid%100)+"/headphoto_"+to8to_uid+"_e.jpg";
        HeadPhoto = getCookie('headPhoto', 1);
        HeadPhoto = typeof HeadPhoto != 'undefined' ? HeadPhoto : "http://pic.shejiben.com/user/"+(to8to_uid%100)+"/headphoto_"+to8to_uid+"_e.jpg";
        if($('add_qq_lo')) $('add_qq_lo').style.display='none';
        if($('add_wb_lo')) $('add_wb_lo').style.display='none';
        if($('add_tishi_mes')) $('add_tishi_mes').style.display = 'block';
        /*
        if(to8to_ind=='sjs')
            var uPdata='<a href="http://www.shejiben.com/my/detail_edit.php?uid='+to8to_uid+'" class="bj">编辑资料</a><a href="http://www.shejiben.com/my/classic_photos_add.php" class="up">上传图片</a><a href="/my/hetong_1.php?obj=2" class="jy">设计交易平台</a>';
        else
            var uPdata='<a href="http://www.shejiben.com/my/info.php?uid='+to8to_uid+'" class="bj">编辑资料</a><a href="http://www.shejiben.com/my/classic_photos_add.php&obj=1" class="up">上传图片</a><a href="/my/hetong_1.php?obj=1" class="jy">设计交易平台</a>';
        */
        if(to8to_ind=='sjs'){
            var uPdata  =  '<li><a href="http://www.shejiben.com/my/order_list.php" class="up">我的派单</a></li>';
                uPdata +=  '<li><a href="http://www.shejiben.com/my/my_project.php?obj=2" class="jy">我的交易</a></li>';
                uPdata +=  '<li><a href="http://www.shejiben.com/my/photos.php" class="bj">我的作品</a></li>';
                uPdata +=  '<li><a href="http://www.shejiben.com/my/gold_list.php" class="up">我的金币</a></li>';
                uPdata +=  '<li><a href="http://www.shejiben.com/my/pay.php" class="up">我的余额</a></li>';
                uPdata +=  '<li><a href="http://www.shejiben.com/my/manage_account.php" class="up">账号设置</a></li>';
        }else{
            var uPdata  = '<li><a href="http://www.shejiben.com/my/ideabooks.php" class="bj">我的收藏</a></li>';
                uPdata += '<li><a href="http://www.shejiben.com/my/ask.php" class="bj">我的问答</a></li>';
                uPdata += '<li><a href="http://www.shejiben.com/my/my_project.php?obj=1" class="jy">我的交易</a></li>';
                uPdata += '<li><a href="http://www.shejiben.com/my/gold_list.php" class="up">我的金币</a></li>';
                uPdata += '<li><a href="http://www.shejiben.com/my/pay.php" class="up">我的余额</a></li>';
                uPdata += '<li><a href="http://www.shejiben.com/my/manage_account.php" class="up">账号设置</a></li>';
        }   

        var loginhtml = '';
        /*
        if($("destopimg"))
        {
            if($("destopimgDiv"))
                $("destopimgDiv").style.display='none';
            $("content").className='content_width';
            if(isIE)    $("content").style.padding="88px auto 0";
            else    $("content").style.margin="20px auto 0";
        }
        */
   
        if ($('nav_login')) {
            to8to_ind = getCookie('ind', 1);
            var my_index_a = '';
            if( typeof jq != 'undefined'){
                jq.ajax({
                  url: 'http://www.shejiben.com/getuserdata.php?s=1&pos=getLoginUserInfo',
                  dataType:'jsonp',
                  success:function(data) {
                        if(to8to_ind == 'sjs'){
                           my_index_a = '<li><a href='+data.blog_url+' class="my_index_ad">我的主页</a></li>';
                        }           
                        
                        var _html = '<span id="userName" class="name" ><a href="http://www.shejiben.com/my/" class="bg1" id="bg" onblur="if(this.rel==1) {this.className=\'bg1\'; $(\'caozuo\').style.display=\'none\'}" rel="1" hidefocus><span class="nick">'+nick+'</span><em class="downAdrrow"></em></a><div class="caozuo" id="caozuo" style="display:none;" onMouseOver="$(\'bg\').rel=2;" onMouseOut="$(\'bg\').rel=1;" ><div class="redArrow"></div><ul class="cz " id="cz"><li><a href="http://www.shejiben.com/my/" class="my">个人中心</a></li>'+my_index_a+uPdata+'<li><a href="http://www.shejiben.com/logout.php?uid='+to8to_uid+'" class="tc">退出</a></li></ul></div></span>';  
                        jQuery('#nav_login').html(_html);

                        jQuery('#userName').mouseover(function(e) {
                            jQuery('#nav_login').addClass('hovercss');
                            jQuery('#userName .cz').addClass('li-hovercss');
                            if (isMouseLeaveOrEnter(e, this)) {
                                jQuery('#bg').addClass('bg1 bg2');
                                jQuery('#caozuo').show();
                                if (jQuery("#messageItem") && jQuery("#messageItem").html() != '') jQuery("#newMessage").hide();
                            }
                            });
                            jQuery('#userName').mouseout(function(e) {
                            jQuery('#nav_login').removeClass('hovercss');
                            jQuery('#userName .cz').removeClass('li-hovercss');
                            if (isMouseLeaveOrEnter(e, this)) {
                                jQuery('#bg').addClass('bg1');
                                jQuery('#caozuo').hide();
                                if (jQuery("#messageItem") && jQuery("#messageItem").html() != '') jQuery("#newMessage").show();
                            }
                            });

                       
                    }
                    
                });
            } 
        }
    }
    $('more_nav').onmouseover = function(e) {
        if(isMouseLeaveOrEnter(e, this)) {
            $('m').className='m m_on';
            $('moreing').style.display='block';
        }
    }
    $('more_nav').onmouseout = function(e) {
        if(isMouseLeaveOrEnter(e, this)) {
          $('m').className='m'; 
          $('moreing').style.display='none';
       }
    }
    $('more_nav_pic').onmouseover = function(e) {
        if(isMouseLeaveOrEnter(e, this)) {
            $('m_pic').className='m m_on';
            $('moreing_pic').style.display='block';
        }
    }
    $('more_nav_pic').onmouseout = function(e) {
        if(isMouseLeaveOrEnter(e, this)) {
          $('m_pic').className='m'; 
          $('moreing_pic').style.display='none';
       }
    }
};
var t = document.documentElement.scrollTop; 
if( t >= 20 ) {
    if($("sjbNewTop")) $("sjbNewTop").className = 'sjbNewTop sjbNewTopHide';
    //if($("head_menubar")) $("head_menubar").className = 'head_menubar head_menubar_new';
    if($("head_menubar")) $("head_menubar").className = 'head_menubar head_menubar_scrolling';
    if($("head_content")) $("head_content").className = "content_width head_content head_rolling"; 
    //if($("destopimg")) $("destopimg").className = "";
    if($("backTop")) $("backTop").style.display = "block"; 
}
window.onscroll = function(){ 
    t = document.documentElement.scrollTop || document.body.scrollTop;
    var v = '';
    var v1 ='';
    if($("search_val")) v = $("search_val").value;
    if( t >= 20 ) {
        if($("head_content")) $("head_content").className = "content_width head_content head_rolling";
        if($("search_val")) {
            v1 = $("search_val").value;
            if(v1 == '搜索图片的关键词，如：儿童房')
                v1 = $("search_val").value = '搜索图片的关键词';
        }
        //if($("destopimg")) $("destopimg").className = "";
        if($("followus")) $("followus").style.display = 'none';
        if($("backTop")) $("backTop").style.display = "block";
    } else {
        if($("head_content")) $("head_content").className = "content_width head_content ";
        if($("search_val")) {
            v1 = $("search_val").value;
            if(v1 == '搜索图片的关键词')
                v1 = $("search_val").value = '搜索图片的关键词';
        }
        //if($("destopimg")) $("destopimg").className = "destopimg_scroll";
        if($("followus")) $("followus").style.display = 'block';
        if($("backTop")) $("backTop").style.display = "none";
    }
    if(t > 0){
        // if($("sjbNewTop")) $("sjbNewTop").className = 'sjbNewTop sjbNewTopHide';
        //if($("head_menubar")) $("head_menubar").className = 'head_menubar head_menubar_new';
        if($("head_menubar")) $("head_menubar").className = 'head_menubar head_menubar_scrolling';
//        if(!getCookie('top_add',1)  && $("top_add")){
//            if($("top_add")) $("top_add").style.top = '-100px';
//            if ( $("head_menubar")) $("head_menubar").style.top = 0;
//            if($("content")) $("content").style.paddingTop = '80px';
//        }
    }else{
        if($("sjbNewTop")) $("sjbNewTop").className = 'sjbNewTop';
        if($("head_menubar")) $("head_menubar").className = 'head_menubar';
//        if(!getCookie('top_add',1)  && $("top_add")){
//            if($("sjbNewTop")) $("sjbNewTop").style.marginTop = '60px';
//            if($("head_menubar")) $("head_menubar").style.top = '186px';
//            if($("top_add")) $("top_add").style.top = 0;
//        }
    }
  
    if (v){
    	
        if (v1) v = v1;
        $("search_val").onblur =function(){
            if($(this).value == '')
                $(this).value = v;
        }
    }
} 
function cutstr(str,len)
{
    var str_length = 0;
    var str_len = 0;
    str_cut = new String();
    str_len = str.length;
    for(var i = 0;i<str_len;i++)
    {
        a = str.charAt(i);
        str_length++;
        if(escape(a).length > 4)
        {
            //中文字符的长度经编码之后大于4
            str_length++;
        }
            str_cut = str_cut.concat(a);
        if(str_length>=len)
        {
            str_cut = str_cut.concat("...");
            return str_cut;
        }
    }
    //如果给定字符串小于指定长度，则返回源字符串；
    if(str_length<len){
        return str;
    }
}
function getMsg() {
    try {
        secI = 0;
        divTop = parseInt(document.getElementById("eMeng").style.top, 10);
        divLeft = parseInt(document.getElementById("eMeng").style.left, 10);
        divHeight = parseInt(document.getElementById("eMeng").offsetHeight, 10);
        divWidth = parseInt(document.getElementById("eMeng").offsetWidth, 10);
        docWidth = document.documentElement.clientWidth;
        docHeight = document.documentElement.clientHeight;
        document.getElementById("eMeng").style.display = "block";
        document.getElementById("eMeng").style.top = parseInt(document.documentElement.scrollTop, 10) + docHeight + 10;
        document.getElementById("eMeng").style.left = parseInt(document.documentElement.scrollLeft, 10) + docWidth - divWidth;
        document.getElementById("eMeng").style.visibility = "visible";
        objTimer = window.setInterval("moveDiv()", 10)
    } catch(e) {}
};
function resizeDiv() {
    if (typeof(noclose) == 'undefined') {
        secI += 1;
        if (secI > 2500) closeDiv()
    };
    try {
        divHeight = parseInt(document.getElementById("eMeng").offsetHeight, 10);
        divWidth = parseInt(document.getElementById("eMeng").offsetWidth, 10);
        docWidth = document.documentElement.clientWidth;
        docHeight = document.documentElement.clientHeight;
        document.getElementById("eMeng").style.display = "block";
        document.getElementById("eMeng").style.top = docHeight - divHeight + parseInt(document.documentElement.scrollTop, 10);
        document.getElementById("eMeng").style.left = docWidth - divWidth + parseInt(document.documentElement.scrollLeft, 10)
    } catch(e) {}
}
function moveDiv() {
    try {
        if (parseInt(document.getElementById("eMeng").style.top, 10) <= (docHeight - divHeight + parseInt(document.documentElement.scrollTop, 10))) {
            window.clearInterval(objTimer);
            objTimer = window.setInterval("resizeDiv()", 1)
        };
        divTop = parseInt(document.getElementById("eMeng").style.top, 10);
        document.getElementById("eMeng").style.top = divTop - 1
    } catch(e) {}
};
function closeDiv() {
    document.getElementById('eMeng').style.visibility = 'hidden';
    if (objTimer) {
        window.clearInterval(objTimer)
    }
};
function UpdateStaticInfo() {
    $('light').innerHTML  = visitorinfo.vnum;
    $('myrank').innerHTML = '等级：<a href=' + rankhelp_doc + ' title="目前等级' + creditsinfo.rank + '级,离下一次升级还差' + creditsinfo.nextrankdiff + '分" target="_blank" >' + creditsinfo.rankicon + '</a>';
    //$('tj_info').innerHTML = '<li>日访问：<em>' + visitorinfo.d_vnum + '</em></li><li>周访问：<em>' + visitorinfo.w_vnum + '</em></li><li>总访问：<em>' + visitorinfo.vnum + '</em></li>';
    $('tj_info').innerHTML = '<li>总访问：<em>' + visitorinfo.vnum + '</em></li>';
    var l = visitmember.length;
    var fk_html = "";
    for (i = 0; i < l; i++) {
        if (visitmember[i].ind == 'sjs') {
            homepage = "/" + visitmember[i].ind + "/" + visitmember[i].vid + "/"
        } else {
            homepage = "javascript:"
        }
        if (who_ind == 0) {
            fk_html += '<li><a href="' + homepage + '" class="center_img"';
            if (visitmember[i].ind == 'sjs') {
                fk_html += 'target="_blank"'
            };
            fk_html += '><img src="' + visitmember[i].photo + '" onload="autoSize(this,36,36)" width:"0" height:"0" /></a><span class="visit_man"><a href="' + homepage + '"';
            if (visitmember[i].ind == 'sjs') {
                fk_html += 'target="_blank"'
            };
            fk_html += '>' + visitmember[i].nick + '</a><span class="visit_shijian">' + visitmember[i].time + '</span></span></li>'
        } else {
            fk_html += '<li><p><a href="' + homepage + '"';
            if (visitmember[i].ind == 'sjs') {
                fk_html += 'target="_blank"'
            };
            fk_html += ' class="img"><b class="b1"></b><b class="b2"></b><img src="' + visitmember[i].photo + '" alt="' + visitmember[i].nick + '于' + visitmember[i].time + '到访" width="60" height="60"/><b class="b3"></b><b class="b4"></b></a></p><span class="z_des_name"><a href="' + homepage + '"';
            if (visitmember[i].ind == 'sjs') {
                fk_html += 'target="_blank"'
            };
            fk_html += '>' + visitmember[i].nick + '</a></span>' + visitmember[i].time + '</li>'
        }
    };
    $('fk_info').innerHTML = fk_html;
    if (issingle == 0 && to8to_uid == whoid && (comm_messagenum > 0 || sys_messagenum > 0)) {
        $('mycds').innerHTML = comm_messagenum;
        pms = "";
        var total_num=comm_messagenum+sys_messagenum;
//        if (sys_messagenum > 0) {
//            pms = "<br>" + "<a href='#' onclick='closeDiv();SendMsg(8);return false;'>" + sys_messagenum + "条系统通知，点击查看" + "</a>"
//        };
//        if (comm_messagenum > 0) {
//            pms += "<br>" + "<a href='#' onclick='closeDiv();SendMsg(1);return false;'>" + comm_messagenum + "条站内消息，点击查看" + "</a>"
//        };
        if( total_num > 0){
            pms += "<br>" + "<a href='#' onclick='closeDiv();SendMsg(1);return false;'>" + total_num + "条短消息，点击查看" + "</a>"
        };
        
        if (pmsound == 1) {
            soundhtml = '<a href="#"  onclick="opensound(0);return false;">关闭声音提醒</a>'
        } else {
            soundhtml = '<a href="#"    onclick="opensound(1);return false;">打开声音提醒</a>'
        }
        /*
        $('messagebox').innerHTML = '<DIV id=eMeng style="width:222px;overflow:hidden;font-size:12px;z-index:999999;position:absolute;bottom:0;right:0;height:148px;background:url(/img/front_end/bg/index_bg.gif);text-align:center;display:none;"><p style="font-weight:bold;color:#30577e;padding:8px 0 0 8px;text-align:left;"> 消息提示：<span title=关闭 style="cursor:pointer;color:red;margin:0px 0px 0 0;float:right;position:absolute;right:5px;" onclick=closeDiv() >&#215;</span></p><div style="padding:38px 13px 13px;_width:100%;color:#1f336b;"><b style="background:url(/img/front_end/icon/icn_shortMessage.gif) no-repeat left;padding-left:22px;font-weight:normal">您有&nbsp;</b><font color=#FF0000><span id="new_message_num">' + pms + '</span><BR></div><span id="sound">' + soundhtml + '</span></DIV> ';
        */
        if (pmsound == 1) {
            $('bgmusic').src = "../../xinxitishi.wma"
        };
        getMsg()
    }
};
function view_gxcredits() {
    $('view_gxcredits').innerHTML = "<p class='z_rank' style=\"text-align:center;padding:10px 0 5px;\">热心指数：<b style=\"font-size:14px;\">" + gxcredits + "</b></p>"
}
function ViewEveryday_tj() {
    $('everyday_tj').innerHTML = '<a href="' + everyday_tj[0].url + '" target="_blank"><img src="' + everyday_tj[0].picpath + '" width="150" /></a>'
};
function ViewUpdateUser() {
    var l = updatemember.length;
    var updatehtml = "";
    for (i = 0; i < l; i++) {
        if (parseInt(updatemember[i].uid)) {
            if (updatemember[i].ind == 'sjs') homepage = "/" + updatemember[i].ind + "/" + updatemember[i].uid + "/";
            else homepage = "javascript:";
            updatehtml += '<li><p><a href="' + homepage + '"';
            if (updatemember[i].ind == 'sjs') {
                updatehtml += 'target="_blank"'
            };
            updatehtml += ' class="img"><b class="b1"></b><b class="b2"></b><img src="' + updatemember[i].photo + '" alt="' + updatemember[i].nick + '" width="60" height="60"/><b class="b3"></b><b class="b4"></b></a></p><span class="z_des_name"><a href="' + homepage + '" title="' + updatemember[i].nick + '"';
            if (updatemember[i].ind == 'sjs') {
                updatehtml += 'target="_blank"'
            };
            updatehtml += '>' + updatemember[i].nick + '</a></span>' + updatemember[i].indCN + '</li>'
        }
    };
    $('update_user').innerHTML = updatehtml
};
function UpdateVisitorInfo() {
    if ($('visitnum')) {
        $('visitnum').innerHTML = '<li>今日访问人数<span class="yellow">(' + visitorinfo.d_vnum + ')</span></li><li>历史访问人数<span class="yellow">(' + visitorinfo.vnum + ')</span></li>'
    };
    var l = visitmember.length;
    var visitmember_html = "";
    for (i = 0; i < l; i++) {
        homepage = "/" + visitmember[i].ind + "/" + visitmember[i].vid + "/";
        if (i % 2 == 0) {
            visitmember_html += '<div class="friend_list friend_list_bg">'
        } else {
            visitmember_html += '<div class="friend_list">'
        }
        visitmember_html += '<dl><dt><a href="' + homepage + '" target="_blank"><img src="' + visitmember[i].photo + '" alt="' + visitmember[i].nick + '" onload="autoSize(this,100,114)"  width="0" height="0"/></a></dt><dd>昵　　称：<a href="' + homepage + '" target="_blank">' + visitmember[i].nick + '</a></dd><dd>等　　级：<a href="' + rankhelp_doc + '" title="目前等级' + visitmember[i].rank + '级" target="_blank">' + visitmember[i].rankicon + '</a></dd></dl><ul><li class="fangwen"><a href="' + homepage + '" target="_blank">访问' + visitmember[i].nick + '</a></li><li class="zhitiao"><a href="#" onclick="SendMsg(4,\'' + visitmember[i].username + '\');return false;">发纸条</a></li>';
        if (to8to_uid == whoid) {
            visitmember_html += '<li class="add_friend"><a href="#" onClick="addFriends(\'' + whoid + '\',\'' + visitmember[i].vid + '\',\'添加好友\',600,360);return false;">加为好友</a></li></ul></div>'
        } else {
            visitmember_html += '<li class="add_friend"><a href="#" onClick="addFriends(\'' + to8to_uid + '\',\'' + visitmember[i].vid + '\',\'添加好友\',600,360);return false;">加为好友</a></li></ul></div>'
        }
    };
    if ($('visit')) {
        $('visit').innerHTML = visitmember_html
    }
};
function opensound(have) {
    href = server_host + 'getuserdata.php?pos=pmsound&uid=' + whoid + '&act=' + have + '&s=' + Math.random(5);
    insertScript('sInsertScript_userdata', href)
};
function objoper(ind, obj) {
    var uid = getCookie('uid', true);
    if (!uid) {
        showSingleLogin();
        return false
    } else {
        var to8to_ind = getCookie('ind', true);
        if (to8to_ind != ind) {
            var str_ind;
            switch (ind) {
            case 'sjs':
                str_ind = '设计师';
                break;
            case 'yz':
                str_ind = '业主';
                break;
            case 'zs':
                str_ind = '装饰公司';
                break;
            case 'sj':
                str_ind = '商家';
                break
            };
            alert('对不起只有' + str_ind + '才能进行此项操作！');
            return false
        } else {
            var href = obj.href;
            var temStr = 'uid=' + uid;
            if (href.indexOf('uid') > -1 && href.indexOf(temStr) == -1) {
                obj.href = href.replace('uid=', temStr)
            }
        }
    }
};
function copyToClipboard(txt, str) {
    if (window.clipboardData) {
        window.clipboardData.clearData();
        window.clipboardData.setData("Text", txt)
    } else if (navigator.userAgent.indexOf("Opera") != -1) {
        window.location = txt
    } else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")
        } catch(e) {
            alert("你使用的FF浏览器,复制功能被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'")
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip) {
            return
        };
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans) {
            return
        };
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt;
        str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip) {
            return false
        };
        clip.setData(trans, null, clipid.kGlobalClipboard)
    }
    str = str ? str: '招聘地址';
    alert(str + "已经复制到粘贴板，您可以直接点粘贴发给您的好友！")
}
function SetHome(obj, url) {
    try {
        obj.style.behavior = 'url(#default#homepage)';
        obj.setHomePage(url)
    } catch(e) {
        if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")
            } catch(e) {
                alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'")
            }
        } else {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将'" + url + "'设置为首页。")
        }
    }
};
function addfavorite(url, title) {
    try {
        window.external.addFavorite(url, title)
    } catch(e) {
        try {
            window.sidebar.addPanel(title, url, "")
        } catch(e) {
            alert("加入收藏失败，请使用Ctrl+D进行添加")
        }
    }
};
function pageKeyDown(e) {
    if (document.all) e = window.event;
    if (e.keyCode == 39) {
        if ($('nextpageid')) {
            window.location = $('nextpageid').href
        } else {
            alert('已达到最后一页');
            return false
        }
    } else if (e.keyCode == 37) {
        if ($('prepageid')) {
            window.location = $('prepageid').href
        } else {
            alert('已达到第一页');
            return false
        }
    }
};
Object.extend(Array.prototype, {
    shift: function() {
        var result = this[0];
        for (var i = 0; i < this.length - 1; i++) {
            this[i] = this[i + 1]
        };
        this.length--;
        return result
    }
});
function mb_strlen(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        len += str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255 ? (charset == 'utf-8' ? 3: 2) : 1
    };
    return len
};
function showMiss(id) {
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        editPhotoCat('/miss.html?id=' + id, '错误', 300, 100, 0)
    };
    oJsLoader.load('/gb_js/popup_pak.js');
    return false

};
function goods_tg(placeid, oid) {
    var uid = getCookie('uid', 1);
    var ind = getCookie('ind', 1);
    if (uid) {
        if (ind == 'sj') {
            if (oid) {
                var oJsLoader = new jsLoader();
                oJsLoader.onsuccess = function() {
                    editPhotoCat('/goods_tg_win.php?placeid=' + placeid + '&oid=' + oid, '商品推广', 300, 100)
                };
                oJsLoader.load('/gb_js/popup.js')
            } else {
                var href = server_host + 'getuserdata.php?pos=sj_tg&placeid=' + placeid + '&s=' + Math.random(5);
                insertScript('sInsertScript_sj_tg', href)
            }
        } else {
            alert('对不起，只有商家才能进行此项操作！')
        }
    } else {
        showSingleLogin()
    }
    return false
};
function slideLine(ul, delay, speed, lh, stepvalue) {
    var slideBox = (typeof ul == 'string') ? document.getElementById(ul) : ul;
    var slideBox2 = (typeof ul == 'string') ? document.getElementById(ul) : ul;
    for (var i = 0; i < slideBox2.childNodes.length; i++) {
        if (slideBox2.childNodes[i].nodeType == 1) {
            if (slideBox2.childNodes[i].tagName == "UL") {
                slideBox2 = slideBox2.childNodes[i]
            };
            break
        }
    };
    var delay = delay || 1000,
    speed = speed || 0,
    lh = lh || 1,
    stepvalue = stepvalue || 2;
    var tid = null,
    pause = false;
    var start = function() {
        tid = setInterval(slide, speed)
    };
    function slide() {
        if (pause) return; {
            slideBox.scrollTop += stepvalue
        };
        if (slideBox.scrollTop % lh == 0) {
            clearInterval(tid);
            slideBox2.appendChild(slideBox2.getElementsByTagName('li')[0]);
            slideBox.scrollTop = 0;
            setTimeout(start, delay)
        }
    };
    slideBox.onmouseover = function() {
        pause = true
    };
    slideBox.onmouseout = function() {
        pause = false
    };
    setTimeout(start, delay)
};
function getCookieVal(offset) {
    var endstr = document.cookie.indexOf(";", offset);
    if (endstr == -1) {
        endstr = document.cookie.length
    };
    return unescape(document.cookie.substring(offset, endstr))
};
function get_historyCookie(name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
        var j = i + alen;
        if (document.cookie.substring(i, j) == arg) return getCookieVal(j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0) break
    }
    return null
};
function set_historyCookie(name, value, _T) {
    var exp = new Date();
    exp.setTime(exp.getTime() + 3600000000);
    var path = "/";
    var domain = ".shejiben.com";
    if (_T) exp.setTime(exp.getTime() - 3600000000); {
        var curCookie = name + "=" + value + "; expires=" + exp.toGMTString() + "; path=" + path + "; domain=" + domain + ";";
        document.cookie = curCookie
    }
};
function glog(evt) {
    try {
        while (evt) {
            wlink = evt + ",";
            old_info = get_historyCookie("history_info");
            var insert = true;
            if (old_info == null) {
                insert = true
            } else {
                var old_link = old_info.split(",");
                for (var j = 0; j <= 10; j++) {
                    if (old_link[j] == "null") {
                        break
                    }
                }
            }
            if (insert) {
                wlink += get_historyCookie("history_info");
                var wlink = wlink.split(",");
                for (var i = 0; i < wlink.length; i++) {
                    for (var j = wlink.length - 1; j > i; j--) {
                        if (wlink[j] == wlink[i]) {
                            wlink.splice(j, 1)
                        }
                    }
                }
                var wlinks = '';
                for (var k = 0; k < wlink.length; k++) {
                    if (k < 10) {
                        if (wlink[k] != 'null') {
                            if (wlinks == '') {
                                wlinks = wlink[k] + ','
                            } else {
                                wlinks = wlinks + wlink[k] + ','
                            }
                        }
                    }
                };
                if (wlinks != '') {
                    wlink = wlinks + 'null'
                };
                set_historyCookie("history_info", wlink);
               // history_show().reload();
                break
            }
            evt = evt.parentNode
        }
    } catch(e) {}
    return true
};
function clearHistoty() {
    wlink = null;
    set_historyCookie("history_info", wlink, 1);
    $("history").innerHTML = "暂无浏览纪录！";
    $("history").className = "now_none";
    $("clshistoty").style.display = "none"
};
function loadPng(o) {
    if (isIE6) {
        try {
            var img = o;
            var imgName = o.src.toUpperCase();
            if (imgName.substring(imgName.length - 3, imgName.length) == "PNG") {
                var imgID = (img.id) ? "id='" + img.id + "' ": "";
                var imgClass = (img.className) ? "class='" + img.className + "' ": "";
                var imgTitle = (img.title) ? "title='" + img.title + "' ": "title='" + img.alt + "' ";
                var imgStyle = "display:inline-block;" + img.style.cssText;
                if (img.align == "left") {
                    imgStyle = "float:left;" + imgStyle
                };
                if (img.align == "right") {
                    imgStyle = "float:right;" + imgStyle
                };
                if (img.parentElement.href) {
                    imgStyle = "cursor:hand;" + imgStyle
                };
                var strNewHTML = "<span " + imgID + imgClass + imgTitle + " style=\"" + imgStyle + ";" + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader" + "(src=\'" + img.src + "\', sizingMethod='image');width:1px;\"></span>";
                img.outerHTML = strNewHTML
            }
        } catch(e) {}
    }
};
function yuyue_apply(id) {
    id = id ? id: 0;
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        editPhotoCat("/yuyue_apply.html?id=" + id, '免费量房/免费做预算/免费出平面图/立即申请', 620, 520)
    };
    oJsLoader.load('/gb_js/popup.js');
    return false
};
function Integral2money(num) {
    return num
};
function newshowSingleLogin(id, n) {
    var oJsLoader = new jsLoader('bd_statistics');
    var h = 268;
    if (isIE6) h = 290;
    if (typeof(jq) != 'undefined') {
        if (typeof(jq.fancybox) != 'undefined') {
            jq(document).ready(function($) {
                jq.fancybox('<iframe src="http://www.shejiben.com/new_pop_login.html?id=' + parseInt(id) + '&new=' + parseInt(n) + '" width="487" frameborder="0" height="' + h + '" name="new"></iframe>', {
                    centerOnScroll: true,
                    'hideOnOverlayClick': false,
                    'editcssid': 'fancybox-wraps',
                    onClosed: function() {}
                })
            })
        } else {
            oJsLoader.onsuccess = function() {
                jq(document).ready(function($) {
                    jq.fancybox('<iframe src="http://www.shejiben.com/new_pop_login.html?id=' + parseInt(id) + '&new=' + parseInt(n) + '" width="487" frameborder="0" height="' + h + '" name="new"></iframe>', {
                        centerOnScroll: true,
                        'hideOnOverlayClick': false,
                        'editcssid': 'fancybox-wraps',
                        onClosed: function() {}
                    })
                })
            };
            oJsLoader.load("http://www.shejiben.com/gb_js/jquery.fancybox.js")
        }
    } else showSingleLogin(id);
    return false
};

/***
 * 鼠标悬浮在用户头像或者名称上面时显示用户信息
 * 悬浮框，正常情况下是在下面显示
 * 1.当下面显示的高度超出浏览器的可视区域的高度，那么在上面显示
 */
function showUserInfo(){
    if(typeof(jq) != 'undefined' && jq(".showUserInfo").size() > 0){
        var handle = null;
        var handle1 = null;
        jq(".showUserInfoDiv").live('mouseover',function(){
            clearTimeout(handle1);
            jq(this).show();
        }).live('mouseout',function(){
                jq(this).hide();
        });

        jq(".showUserInfo").live('mouseover',function(){
            //页面可视区域的高度
            var wH = jq(window).height();
            //this的坐标
            var tTop = jq(this).offset().top;
            var tLeft = jq(this).offset().left;
            //this的宽高
            var tW = jq(this).width();
            var tH = jq(this).height();
            var cH =tTop - jq(window).scrollTop();
            var aimTop = 0;
            var flag = 0;

            if(cH + 200 + tH > wH){
                aimTop = tTop - 193 + 'px';
                flag = 1;
            }else{
                aimTop = tTop + tH + 'px';
            }
            var aimLeft = tLeft - 48 + parseInt(tW/2);
            //content的宽度，当在悬浮框在右边，超过content的宽度时，调用第三种样式
            if(jq("#content").size() > 0){
                var conLeft = jq("#content").offset().left;
                if(aimLeft + 310 > conLeft+ 990){
                    aimLeft = tLeft - 325 + parseInt(tW/2);
                    flag =  (flag == 1) ? 3 : 2;
                }
            }
            aimLeft = aimLeft + 'px';
            //获取信息
            var uid = jq(this).attr("itemData");
            if(uid){
                handle = setTimeout("getUserInfo("+uid+",'"+aimLeft+"','"+aimTop+"',"+flag+");",200);
            }
        }).live('mouseout',function(){
            clearTimeout(handle);
            if(jq(".showUserInfoDiv").size() > 0){
                handle1 = setTimeout('jq(".showUserInfoDiv").hide();',300);
            }
        });
    }
}

function getUserInfo(uid,aimLeft,aimTop,flag){
    var url = "http://www.shejiben.com/getuserdata.php?s=1&pos=showUserInfo";
    jq.post(url,{'uid':uid},function(msg){
        if (msg == 0) return false;
        var d_class = '';
        var dl_class = '';
        var app_class = msg.app.status ? 'app-login' : 'app-nologin',
            app_title = msg.app.status ? '手机客户端在线' : '手机客户端离线';
        d_class = (flag == 1) ? 'showUserInfoDiv2' : d_class;
        d_class = (flag == 2) ? 'showUserInfoDiv4' : d_class;
        d_class = (flag == 3) ? 'showUserInfoDiv3' : d_class;
        dl_class = (flag == 1 || flag == 3) ? 'dl2' : dl_class;

        var str = '<div class="showUserInfoDiv '+d_class+'" style="left:'+aimLeft+';top:'+aimTop+'"><div class="mouseDiv"><dl class="'+dl_class+'">';

//        if (flag == 1)
//            str += ' showUserInfoDiv2" style="left:'+aimLeft+';top:'+aimTop+'"><div class="mouseDiv"><dl class="dl2">';
//        else
//            str += '" style="left:'+aimLeft+';top:'+aimTop+'"><div class="mouseDiv"><dl>';

        str += '<dt><img width="60" height="60" src="'+msg.headphoto+'" alt="'+msg.truename+'" title="'+msg.truename+'" /></dt>';
        str += '<dd class="dd1"><a href="'+msg.homepage+'"  class="username">'+msg.truename+'</a> <span class="sjuser ';
        if(msg.goodlevel == 5)
            str += 'utypezm';
        else if(msg.goodlevel == 4)
            str += 'utypejy';
        else if(msg.goodlevel == 3)
            str += 'utypexr';
        else if(msg.goodlevel == 2)
            str += 'utypevip';
        str += '"></span>';
        if(msg.vip)
            str += ' <span class="sjuser uvip" title="个人身份认证"></span>';
        if (!msg.app.hide) {
            str += '<span class="'+app_class+'" title="'+app_title+'"></span>';
        }
        str += '</dd><dd>'+msg.type;
        if(msg.shen != '' || msg.city != ''){
            str += '('+msg.shen;
            if(msg.city != ''){
                str += ','+msg.city;
            }
            str += ')';
        }
        str += '</dd><dd>作品数 <span class="fontgreen">'+msg.pic_num+'张</span></dd>';
        str += '</dl>';
        str += '<div class="introduce"><p class="p1">介绍:</p><p class="p2" title="'+msg.introduce+'">'+msg.introduce_html+'</p></div>';
        str += '<div class="oper">';
        str += '<span class="lianxi"><a href="'+msg.homepage+'" target="_blank">联系方式</a></span>';
        if(msg.follow==1)
            str += '<span class="isgz"><a href="javascript:;">已关注</a>　<a href="javascript:;" onclick="followUser(this)" rev="'+msg.id+'" class="cancel"><label>取消</label><input type="hidden" name="url" value="'+msg.homepage+'" /><input type="hidden" name="name" value="'+msg.truename+'" /></a></span>';
        else
            str += '<span class="nogz"><a href="javascript:;" onclick="followUser(this)" rev="'+msg.id+'"><label>加关注</label><input type="hidden" name="url" value="'+msg.homepage+'" /><input type="hidden" name="name" value="'+msg.truename+'" /></a></span>';

        str += '</div></div></div>';
        //如果存在一个悬浮框，先清除
        if(jq(".showUserInfoDiv").size() > 0){
            jq(".showUserInfoDiv").remove();
        }
        jq("body").append(str);
    },'json');
}
//悬浮框中的关注方法，不要把这个方法与上面两个方法分开
function followUser (obj){
    var rev = obj.rev;
    var url = 'http://www.shejiben.com/sjs/index.php';
    if(!to8to_uid){
        showSingleLogin(0,2);
        return false;
    }
    if(to8to_uid == rev)
        alert('不能关注自己');
    else {
        var name = jq(obj).children("input[name=name]").val();
        var uurl = jq(obj).children("input[name=url]").val();
        if(jq(obj).children('label').html()=='加关注') // 点击关注
        {
            jq.post(url,{'uid':to8to_uid, 'tag': 1,'gzvid': rev, 'gztype': "1", 'rel': 0, 'url':uurl, 'name':name },function(data) {
                var thisParent = jq(obj).parent(".nogz");
                thisParent.html('<a href="javascript:;">已关注</a>　<a href="javascript:;" rev="'+rev+'" onclick="followUser(this)" class="cancel"><label>取消</label><input type="hidden" name="url" value="'+uurl+'" /><input type="hidden" name="name" value="'+name+'" /></a>');
                thisParent.removeClass("nogz");
                thisParent.addClass("isgz");
            });
        }
        else
        {
            jq.post(url,{ 'gzvid': rev, 'gztype': "2", 'rel': 0 },function(data) {  // 点击取消关注
                var thisParent = jq(obj).parent(".isgz");
                thisParent.html('<a href="javascript:;" onclick="followUser(this)" rev="'+rev+'"><label>加关注</label><input type="hidden" name="url" value="'+uurl+'" /><input type="hidden" name="name" value="'+name+'" /></a>');
                thisParent.removeClass("isgz");
                thisParent.addClass("nogz");
            });
        }
    }
}
//城市选择（如专业人士频道）
function showSinglezsjs(spec,workyears,goodlevel,city,sNcity,pageid) {
    var oJsLoader = new jsLoader();
    oJsLoader.onsuccess = function() {
        if (pageid == 'zb')
            editPhotoCat('http://www.shejiben.com/zb/zsjshowsingle.php?type='+spec+'&status='+workyears+'&city='+city+'&pro='+sNcity+'', '设计需求', 463, 216 );
        else
            editPhotoCat('http://www.shejiben.com/zsj/zsjshowsingle.php?spec='+spec+'&workyears='+workyears+'&goodlevel='+goodlevel+'&city='+city+'&sNcity='+sNcity+'', '找设计', 463, 216 );
    };
    oJsLoader.load('http://www.shejiben.com/gb_js/popup.js');
    return false
};
//预约
var free_yuyue ={
    click:true,
    init:function(toid,byid){
       
        var _this = this;
        _this.closeColorBox(); 
        _this.insetErrorMsg(); 
        // 防止重复点击造成重复请求  
        if(!_this.click){
            return false;
        }
        _this.click = false;
        //未登录        
        to8to_uid = (typeof byid === "undefined") ? to8to_uid : byid;
        if ( !to8to_uid ) {
            showSingleLogin( 1, 1);
            _this.click = true;
            return false;
        }  
        if(to8to_uid == toid){

            _this.showErrorBox('#msg_reservation_myself');
            _this.click = true;
            return false;
        }
        jQuery.ajax({
            type: "post",
            url: 'http://www.shejiben.com/add_contact.php?toid='+toid,
            data: {ajax_type: 'reserve_page', userId: to8to_uid, sjsId: toid},
            dataType:'json',
            success:function(records) {
                _this.click = true;
                if(records == 1){
                    _this.showErrorBox('#msg_reservation_post');
                    return false;
                }
                if(records == 2){
                    _this.showErrorBox('#msg_reservation_ten');
                    return false;
                }
                if(records == 3){
                    _this.showErrorBox('#msg_reservation_sjs');
                    return false;
                }
                jQuery.colorbox({
                    width: 540,
                    height: 450,
                    transition:"none",
                    title:false,
                    opacity: "0.5",
                    iframe: true,
                    overlayClose : false, //点击其他区域不关闭弹窗
                    href: 'http://www.shejiben.com/add_contact.php?toid='+toid,
                    onComplete: function() {
                        jQuery('#cboxClose').hide();
                        jQuery('#cboxContent').css({'margin-top':'0'});
                        jQuery('#cboxLoadedContent').css({'height':'450px'});
                    }
                });
            },
            error:function(){
                alert('请求失败');
            }
        });
    },
    insetErrorMsg:function(){
        var html='<div class="clolorbox_msg" style="display:none;">\
                    <div class="clolorbox_msg_error" id="msg_reservation_myself">\
                        <em class="ico_error_close"></em><em class="ico_warn_b"></em><span class="msg_b">对不起，不能向自己发起预约！</span>\
                    </div>\
                    <div class="clolorbox_msg_error" id="msg_reservation_post">\
                        <em class="ico_error_close"></em><em class="ico_warn_b"></em><span class="msg_b">对不起，您今天已经预约过该设计师了！</span>\
                    </div>\
                    <div class="clolorbox_msg_error" id="msg_reservation_ten">\
                        <em class="ico_error_close"></em><em class="ico_warn_b"></em><span class="msg_b">对不起，一天只能预约10个设计师！</span>\
                    </div>\
                    <div class="clolorbox_msg_error" id="msg_reservation_sjs">\
                        <em class="ico_error_close"></em><em class="ico_warn_b"></em><span class="msg_b">您不是业主，不能发起预约!</span>\
                    </div>\
                </div>';
        jQuery('body').append(html);  
    },
    showErrorBox:function(content){
        jQuery.colorbox({
            width: 540,
            height: 200,
            opacity: "0.5",
            inline: true,
            href:content,
            overlayClose : false, //点击其他区域不关闭弹窗
            onComplete: function() {
                jQuery('#cboxClose').hide();
                jQuery('#cboxContent').css({'margin-top':'-8px'});
                jQuery('#cboxLoadedContent').css({'height':'450px'});
            }
        });
    },
    closeColorBox:function(){
        jQuery('.clolorbox_msg_error .ico_error_close').live('click',function(){
            jQuery('.clolorbox_msg').remove();
            parent.jQuery.colorbox.close();
        });
    }
}
//关注的异步提交 2013.09.24添加参数i，商城内页传递i=2
function AddFollowNew (i){
    i = typeof i != 'undefined' ? i : 0;
    jQuery('.guanzhuA').click(function(){
        var obj = this;
        var url = 'http://www.shejiben.com/sjs/index.php';
        if(!to8to_uid)
            showSingleLogin(i,2);
        if(to8to_uid == this.rev)
            alert('不能关注自己');
        else{
            if(jQuery(this).children('span').html()=='+ 加关注'||jQuery(this).children('span').html()=='加关注')  // 点击关注
            {
                jQuery(obj).children('span').html('已关注');
                if(jQuery(obj).attr('data')==2){//找设计师界面
                    jQuery(obj).addClass('hasguanzhuA');
                }
                jQuery.post(url,{tag:i, uid : to8to_uid, 'gzvid': this.rev, 'gztype': "1", 'rel': 0, 'url':jQuery(this).children("input[name=url]").val(), 'name':jQuery(this).children("input[name=name]").val() },function(data) {

                });
            }
            else
            {
                jQuery.post(url,{tag:i, uid : to8to_uid, 'gzvid': this.rev, 'gztype': "2", 'rel': 0 },function(data) {  // 点击取消关注
                    // $('guanzhuA').className='follow';
                    if(jQuery(obj).attr('data')==1)
                        jQuery(obj).children('span').html('加关注');
                    else if(jQuery(obj).attr('data')==2){//找设计师界面
                        jQuery(obj).children('span').html('加关注');
                        jQuery(obj).removeClass('hasguanzhuA');
                    }else
                        jQuery(obj).children('span').html('+ 加关注');
                });
            }
        }
    });
}

//验证搜索表单
function checkSearchForm() {
    var search_q = $('search_val').value;

    if(search_q == '请输入搜索关键词')
    {
        $('search_val').focus();
        return false;
    }
}

//搜索表单获取焦点时
function searchFormOnFocus(obj)
{
    
    var search_q = obj.value;
    if(search_q == '请输入搜索关键词')
    {
        obj.value = '';
    }
    /*** 搜索无内容时不跳转(kiki添加于20160328) ***/
    document.onkeydown = function(e){   
        e = e || window.event;
        search_q = obj.value;
        if(e.keyCode == 13){
            if(search_q == '请输入搜索关键词' || search_q ==''){   //无输入内容时禁用回车事件
                e.preventDefault();         
            }  
            else{
                document.onkeydown = null;    //有内容时进行搜索
            }           
        }
    }   
}

//搜索表单离开焦点是
function searchFormOnBlur(obj)
{
    if(obj.value == '' || obj.value == '请输入搜索关键词')
    {
        obj.value='请输入搜索关键词'
    }
}

//头部的搜索方法
function searchFun(obj){
    obj = parseInt(obj) > 0 ? obj : 1;
    document.getElementById('s_zsj').innerHTML='';
    //$('s_zsj').innerHTML='';

    for(var i=0;i<arr.length;i++)
    {
        if(arr[i]!=obj)
            //$('s_zsj').innerHTML=$('s_zsj').innerHTML+'<a class="search_tags" href="javascript:;" onClick="return searchFun(\''+arr[i]+'\');">'+urlArr[0][arr[i]][0][3]+'</a>';
    	document.getElementById('s_zsj').innerHTML=document.getElementById('s_zsj').innerHTML+'<a class="search_tags" href="javascript:;" onClick="return searchFun(\''+arr[i]+'\');">'+urlArr[0][arr[i]][0][3]+'</a>';
    }
    if(obj == 4 || obj == 5 || obj == 6){
        obj = 3;
    }
    if(obj == 8 ){
        obj = 1;
    }
    $('searchType').value=obj;
    $('search_title').innerHTML=urlArr[0][obj][0][3];
   // $('quicksearch').action=urlArr[0][obj][0][0];
 
    $('search_val').name=urlArr[0][obj][0][1];
   // $('search_val').value=urlArr[0][obj][0][2];
    //$('s_zsj').style.display='none';
    document.getElementById('s_zsj').style.display='none';
    var searchW = $('search_span').offsetWidth;
    //$('s_zsj').style.width = (searchW - 2) + 'px';
	document.getElementById('s_zsj').style.width = (searchW - 2) + 'px';
}

//通过js处理关注
function processFollow(t){
    //如果页面有收藏，显示图集
    if(typeof myAllCollections != 'undefined' && jq("#myAllCollections").size() > 0)
    {
        jq('#myAllCollections').html(myAllCollections[0]);
    }
    //关注处理
    if (typeof myFriend != 'undefined' && myFriend.length > 0 && typeof(jq) != 'undefined' && jq('.guanzhuA').size() > 0) {
        jq('.guanzhuA').each(function(){
            if(myFriend.contains(jq(this).attr('rev'))){
                if (t == 2){//专业人士界面
                    jq(this).children('span').eq(0).html('已关注');
                    jq(this).addClass('hasguanzhuA');
                }else if(t==3){//博客页面
                    jq("#guanzhuA").removeClass('follow');
                    jq("#guanzhuA").addClass('following');
                    jq("#guanzhuA").html('已关注');
                }
            }
        });
    }
    //顶部的未读消息显示处理
    if (typeof myMessage != 'undefined' && myMessage.length > 0 && myMessage[0] != ''){
        var newMessage = $('newMessage');
        if(newMessage){
            newMessage.style.display = 'block';
            $('messageItem').innerHTML = '<ul>'+myMessage[0]+'<p class="clear"></p></ul><p class="clear"></p>';
        }
        //有未读消息标题闪烁显示
        if($('messageItem') && $('messageItem').getElementsByTagName('li').length > 0) {
            var title_v = document.getElementsByTagName('title')[0].innerHTML;
            var Flicker_title = '【新消息】-'+title_v;
            FlickerTime = window.setTimeout(function(){
                ToggleFlickerMessage(title_v,Flicker_title);
            },500);
        }
    }
}

function ToggleFlickerMessage(title,newtitle) {
    var newtitle = document.getElementsByTagName('title');
    if(typeof newtitle == 'undefined' ) {return false;}
    newtitle = newtitle[0].innerHTML;
    //document.getElementsByTagName('title')[0].innerHTML = newtitle;
    FlickerTime = window.setTimeout(function() {
        ToggleFlickerMessage(newtitle,title);
    },500); 
}

var li_length = 1;
function changeAd(){
    if(li_length < jq('.topAdLi').size()){
        jq("#topAdUl").css('marginTop',-60*li_length+'px');
        li_length = li_length + 1;
    }else{
        jq("#topAdUl").css('marginTop','0');
        li_length = 1;
    }
}
//滚动function,参数i表示页面可能存在滚动的元素的个数
function scrollTTDIV (i){
    var obj = jQuery('#scrolldiv'+i);
    var obj1 = obj.children('DIV').get(0);
    var obj2 = obj.children('DIV').get(1);
    obj = obj.get(0);
    if(obj2.innerHTML == '')
        obj2.innerHTML = obj1.innerHTML;

    if(obj2.offsetTop - obj.scrollTop <= 0){
        obj.scrollTop = 0;
    }else{
        obj.scrollTop++;
    }
}

//滚动function
function scrollTT (){
    var obj = jq('#new_get_order');
    var obj1 = obj.children('UL').get(0);
    var obj2 = obj.children('UL').get(1);
    obj = obj.get(0);
    if(obj2.innerHTML == '')
        obj2.innerHTML = obj1.innerHTML;

    if(obj2.offsetTop - obj.scrollTop <= 0){
        obj.scrollTop -= obj1.offsetHeight;
    }else{
        obj.scrollTop++;
    }
}

//新手指引弹窗
    function join_tb_s()
        {
            
            if(!to8to_uid){
                showSingleLogin(2,2);
                return false;
            }
            var oJsLoader = new jsLoader(); 
            oJsLoader.onsuccess=function(){editPhotoCat('http://www.shejiben.com/my/user_guide.php?s=1','小提示',750,450);}
            oJsLoader.load('http://www.shejiben.com/gb_js/popup.js');
        }

var mxRank = '';
//modify by shejiben 2013.04.13下载页面增加同步到qq空间功能
window.onload = function(){
    // $('app_close').onclick = function(event){//页面右边二维码关闭js
    //     $('app_d_link').style.display = 'none';
    //     return false;
    // }

    if (typeof jq != 'undefined' && jq('.itemModuleChild_r').length > 0) {
        //首页   设计师排行榜
        jq.ajax({
            url:'http://www.shejiben.com/index.php?ajax=1',
            type:'POST',
            dataType:'json',
            data:{rank:'sjs'},
            success:function(data){
                mxRank = data ;
                if(data.caseRank){//多产
                    var casehtml = '<ul class="rankUl caseRankUl">',
                        caseobj = data.caseRank;
                    jq.each(caseobj,function(i,n){
                        if(i < 7){
                        if(n.rank != 1 && n.rank%6 == 1 && n.rank != data.caseRankLen){
                            casehtml += '</ul><ul class="rankUl caseRankUl rankUl_hide">';
                        }
                        casehtml += '<li>';
                        if(n.rank <= 3){
                            casehtml += '<span class="ro ro3">'+n.rank+'</span>';
                        }else{
                            casehtml += '<span class="ro">'+n.rank+'</span>';
                        }
                        casehtml += '<span><a href="/sjs/'+n.uid+'/">'+n.nick+'</a></span>';
                        if(n.goodlevel == 5){
                            casehtml += '<span class="sjuser utypezm" title="行业知名设计师"></span>';
                        }else if(n.goodlevel == 4){
                            casehtml += '<span class="sjuser utypejy" title="百爪鱼精英设计师"></span>';
                        }else if(n.goodlevel == 3){
                            casehtml += '<span class="sjuser utypexr"></span>';
                        }
                        if(n.vip){
                            casehtml += '<span class="sjuser uvip" title="已上传身份证等资料实名认证"></span>';
                        }
                            casehtml += '<span class="picNum">作品'+n.pic_num+'张</span>';
                            casehtml += '<dl class="sjsDetail ';
                        if(n.rank%6!=1){
                            casehtml += 'sjsDetail_Hide';
                        }
                            casehtml += '"><dt><img src="'+n.headphoto+'" width="56" height="56" /></dt><dd>';
                        if(n.introduce){
                            casehtml += n.introduce;
                        }
                            casehtml += '</dd></dl></li>';
                    }    
                    });
                    casehtml += '</ul>';
                    jq('.loading').remove();
                    jq('.rankContain').eq(0).append(casehtml);
                    if(data.caseRankLen>6){
                        jq('.rankDiv').eq(0).append('<div class="rankPage"><a href="javascript:;" class="rankPre noClick" onclick="prev_page(this,\'caseRank\',0)" rev="0">« 上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="rankNext" onclick="next_page(this,\'caseRank\',0)" rev="1">下一页 »</a></div>');
                    }
                }else{
                    jq('.loading').remove();
                    jq('.rankContain').eq(0).append('<ul><li>今日还没有多产的设计师出现，你赶紧上传吧！上传后出现在这里噢！</li></ul>');
                }

                    if(data.ardourRank){//热心
                        var ardourhtml = '',
                            ardobj = data.ardourRank;
                            ardourhtml = '<ul class="rankUl ardourRank">';
                            jq.each(ardobj,function(i,n){
                                if(i < 7){
                                if(n.rank != 1 && n.rank%6 == 1 && n.rank != data.ardourRankLen){
                                    ardourhtml += '</ul><ul class="rankUl ardourRank rankUl_hide">';
                                }
                                    ardourhtml += '<li>';
                                if(n.rank <= 3){
                                    ardourhtml += '<span class="ro ro3">'+n.rank+'</span><span><a href="/sjs/'+n.uid+'/">'+n.nick+'</a></span>';
                                }else{
                                    ardourhtml += '<span class="ro">'+n.rank+'</span><span><a href="/sjs/'+n.uid+'/">'+n.nick+'</a></span>'
                                }
                                if(n.goodlevel == 5){
                                    ardourhtml += '<span class="sjuser utypezm" title="行业知名设计师"></span>';
                                }else if(n.goodlevel == 4){
                                    ardourhtml += '<span class="sjuser utypejy" title="百爪鱼精英设计师"></span>';                                
                                }else if(n.goodlevel == 3){
                                    ardourhtml += '<span class="sjuser utypexr"></span>';
                                }
                                if(n.vip){
                                    ardourhtml += '<span class="sjuser uvip" title="已上传身份证等资料实名认证"></span>';
                                }
                                    ardourhtml += '<span class="picNum">回答'+n.answer_num+'条</span>';
                                    ardourhtml += '<dl class="sjsDetail ';
                                if(n.rank%6!=1){
                                    ardourhtml += 'sjsDetail_Hide';
                                }
                                    ardourhtml += '"><dt><img src="'+n.headphoto+'" width="56" height="56" /></dt><dd>';
                                if(n.introduce){
                                    ardourhtml += n.introduce;
                                }
                                    ardourhtml += '</dd></dl></li>';
                                }    
                                    
                            });
                                    ardourhtml += '</ul>';
                                jq('.rankContain').eq(1).append(ardourhtml);
                                if(data.ardourRankLen>6){
                                    jq('.rankDiv').eq(1).append('<div class="rankPage"><a href="javascript:;" class="rankPre noClick" onclick="prev_page(this,\'ardourRank\',1)" rev="0">« 上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="rankNext" onclick="next_page(this,\'ardourRank\',1)" rev="1">下一页 »</a></div>');
                                }
                    }else{
                        jq('.rankContain').eq(1).html('<ul><li>暂无数据</li></ul>');
                    }

                    if(data.popularRank){//人气
                        var popuhtml = '<ul class="rankUl popularRank">',
                            popuobj = data.popularRank;
                        jq.each(popuobj,function(i,n){
                            if(i < 7){
                            if(n.rank != 1 && n.rank%6==1 && n.rank!=data.popularRankLen){
                                popuhtml += '</ul><ul class="rankUl popularRank rankUl_hide">';
                            }
                                popuhtml += '<li>';
                            if(n.rank <= 3){
                                    popuhtml += '<span class="ro ro3">'+n.rank+'</span><span><a href="/sjs/'+n.uid+'/">'+n.nick+'</a></span>';
                            }else{
                                    popuhtml += '<span class="ro">'+n.rank+'</span><span><a href="/sjs/'+n.uid+'/">'+n.nick+'</a></span>';
                            }
                            if(n.goodlevel == 5){
                                    popuhtml += '<span class="sjuser utypezm" title="行业知名设计师"></span>';
                            }else if(n.goodlevel == 4){
                                    popuhtml += '<span class="sjuser utypejy" title="百爪鱼精英设计师"></span>';                                
                            }else if(n.goodlevel == 3){
                                    popuhtml += '<span class="sjuser utypexr"></span>';
                            } 
                            if(n.vip){
                                    popuhtml += '<span class="sjuser uvip" title="已上传身份证等资料实名认证"></span>';
                            }
                                    popuhtml += '<span class="picNum">粉丝'+n.num+'个</span>';
                                    popuhtml += '<dl class="sjsDetail ';
                            if(n.rank%6!=1){
                                    popuhtml += 'sjsDetail_Hide';
                            }
                                    popuhtml += '"><dt><img src="'+n.headphoto+'" width="56" height="56" /></dt><dd>';
                            if(n.introduce){
                                    popuhtml += n.introduce;
                            }
                                    popuhtml += '</dd></dl></li>';
                        }
                        });
                              popuhtml += '</ul>';
                            jq('.rankContain').eq(2).append(popuhtml);
                            if(data.popularRankLen>6){
                                jq('.rankDiv').eq(2).append('<div class="rankPage"><a href="javascript:;" class="rankPre noClick" onclick="prev_page(this,\'popularRank\',2)" rev="0">« 上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="rankNext" onclick="next_page(this,\'popularRank\',2)" rev="1">下一页 »</a></div>');
                            }   
                    }else{
                        jq('.rankContain').eq(2).append('<ul><li>暂无数据11</li></ul>');
                    }

                    if(data.goodRank){//实干
                        var goodhtml = '<ul class="rankUl goodRank">',
                            goodobj = data.goodRank;
                        jq.each(goodobj,function(i,n){
                            if(i < 7){
                            if(n.rank != 1 && n.rank%6==1 && n.rank!=data.goodRankLen){
                                goodhtml += '</ul><ul class="rankUl goodRank rankUl_hide">';
                            }
                                goodhtml += '<li>';
                            if(n.rank <= 3){
                                    goodhtml += '<span class="ro ro3">'+n.rank+'</span><span><a href="/sjs/'+n.uid+'/">'+n.nick+'</a></span>';
                            }else{
                                    goodhtml += '<span class="ro">'+n.rank+'</span><span><a href="/sjs/'+n.uid+'/">'+n.nick+'</a></span>';
                            }
                            if(n.goodlevel == 5){
                                    goodhtml += '<span class="sjuser utypezm" title="行业知名设计师"></span>';
                            }else if(n.goodlevel == 4){
                                    goodhtml += '<span class="sjuser utypejy" title="百爪鱼精英设计师"></span>';                                
                            }else if(n.goodlevel == 3){
                                    goodhtml += '<span class="sjuser utypexr"></span>';
                            } 
                            if(n.vip){
                                    goodhtml += '<span class="sjuser uvip" title="已上传身份证等资料实名认证"></span>';
                            }
                                    goodhtml += '<dl class="sjsDetail ';
                            if(n.rank%6!=1){
                                    goodhtml += 'sjsDetail_Hide';
                            }
                                    goodhtml += '"><dt><img src="'+n.headphoto+'" width="56" height="56" /></dt><dd>';
                            if(n.introduce){
                                    goodhtml += n.introduce;
                            }
                                    goodhtml += '</dd></dl></li>';
                            }

                        });
                                    goodhtml += '</ul>';
                            jq(".rankContain").eq(3).append(goodhtml);
                            if(data.goodRankLen>6){
                                jq('.rankDiv').eq(3).append('<div class="rankPage"><a href="javascript:;" class="rankPre noClick" onclick="prev_page(this,\'goodRank\',3)" rev="0">« 上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="rankNext" onclick="next_page(this,\'goodRank\',3)" rev="1">下一页 »</a></div>');
                            }
                    }else{
                        jq('.rankContain').eq(3).append('<ul><li>暂无数据11</li></ul>');

                    }

            }
        });
    }

    //顶部广告关闭
    if($('top_add_close')){
        $('top_add_close').onclick=function(){
            if($("top_add")) $("top_add").style.display = 'none';
            //新图集编辑页的顶部menu需要根据页面高度来自适应，所以关闭广告后需要重新设置其css属性
            if ($('save_pic')) {
                $('save_pic').style.top = '160px';
            }
            document.cookie = 'to8to_top_add=1;path=/;domain=shejiben.com';
        }
    }
    if (document.getElementById('navi_designer_guide') && document.getElementById('navi_yezhu_guide')) {
        document.getElementById('navi_designer_guide').onmouseover = function(e) {
            if(isMouseLeaveOrEnter(e, this)){
                document.getElementById('designer_guide').style.display = '';
            }
        }

        document.getElementById('navi_designer_guide').onmouseout = function(e) {
            if(isMouseLeaveOrEnter(e, this)){
                document.getElementById('designer_guide').style.display = 'none';
            }
        }

        document.getElementById('navi_yezhu_guide').onmouseover = function(e) {
            if(isMouseLeaveOrEnter(e, this)){
                document.getElementById('yezhu_guide').style.display = '';
            }
        }

        document.getElementById('navi_yezhu_guide').onmouseout = function(e) {
            if(isMouseLeaveOrEnter(e, this)){
                document.getElementById('yezhu_guide').style.display = 'none';
            }
        }
    }
    if(document.getElementById('search_span')) {
        document.getElementById('search_span').onmouseover = function(e) {
            if (isMouseLeaveOrEnter(e,this)) {
            	document.getElementById('s_zsj').style.display='block';
                //$('s_zsj').style.display='block';
            }
        }
        document.getElementById('search_span').onmouseout = function(e) {
            if (isMouseLeaveOrEnter(e,this)) {
                //$('s_zsj').style.display='none';
                document.getElementById('s_zsj').style.display='none';
            }
        }
    }

//    if(!getCookie('top_add',1) && $("top_add")){
//        //alert("ddd");
//        if($("top_add")) {$("top_add").style.display = 'none';}
//        //if($("sjbNewTop")) $("sjbNewTop").style.marginTop = '60px';
//        if($("head_menubar")) $("head_menubar").style.top = '186px';
//    }

    //顶部广告滚动
    if(typeof(jq) != 'undefined' && jq('.topAdLi').size() > 1){
        var stop_in = setInterval("changeAd()",2000);
        jq('#top_add').mouseover(function(){
            clearInterval(stop_in);
        })
        jq('#top_add').mouseout(function(){
           stop_in =  setInterval("changeAd()",2000);
        })
    }
    
    if(to8to_uid){
        $("followSinaQQ").innerHTML = '<span><iframe rel="nofollow" width="62" height="22"  frameborder="0" scrolling="no" src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&width=62&height=22&uid=2705801141&style=1&btn=light&dpc=1" style="width:62px;height:22px;border:none;overflow:hidden;  float:left;"></iframe></span><span class="spanqq"><iframe rel="nofollow" src="http://open.qzone.qq.com/like?url=http%3A%2F%2Fuser.qzone.qq.com%2F49672282&type=button&width=400&height=22&style=2" allowtransparency="true" scrolling="no" border="0" frameborder="0" style="width:62px;height:22px;border:none;overflow:hidden;"></iframe></span>';
    }
    if($("add_qq_share")){
        if (typeof token != 'undefined' && token && appid && openid){//qq用户登录
            $("add_qq_share").onclick = function (){
                var isShare = document.getElementById("isShare").value;
                if(isShare == 1){
                    $(this).className = "add_qq_share onshare";
                    $(this).className = "add_qq_share outshare";
                    $("isShare").value = 0;
                    $(this).title = '未同步到QQ空间';
                }else {
                    $(this).className = "add_qq_share outshare";
                    $(this).className = "add_qq_share onshare";
                    $("isShare").value = 1;
                    $(this).title = '取消同步到QQ空间';
                }
            }
        }
    }
    if($("add_weibo_share")){
        if (typeof token_weibo != 'undefined' && token_weibo){//新浪微博登陆
            $("add_weibo_share").onclick = function (){
                var isShareWeibo = document.getElementById("isShareWeibo").value;
                if(isShareWeibo == 1){
                    $(this).className = "add_qq_share onshareweibo";
                    $(this).className = "add_qq_share outshareweibo";
                    $("isShareWeibo").value = 0;
                    $(this).title = '未同步到新浪微博';
                }else {
                    $(this).className = "add_qq_share outshareweibo";
                    $(this).className = "add_qq_share onshareweibo";
                    $("isShareWeibo").value = 1;
                    $(this).title = '取消同步到新浪微博';
                }
            }
        }
    }
    if(to8to_uid){
        var f = typeof followTag != 'undefined' ? 1  : 0;
        var c = typeof getMyCollections != 'undefined' ? 1 : 0;
        href=server_host+'/api/getRelativeInfo.php?uid='+to8to_uid+'&f='+f+'&c='+c+'&t=2&s='+Math.random(5);
        insertScript('sInsertScript_myfriend',href);
    }
    $("followus").onmouseover = function(){$("attentionitem").style.display = 'block';if($("messageItem") && $("messageItem").innerHTML != '') $("newMessage").style.display = 'none';}
    $("followus").onmouseout = function(){$("attentionitem").style.display = 'none';if($("messageItem") && $("messageItem").innerHTML != '') $("newMessage").style.display = 'block';}

    if($('closeNewMessage')){

        $('closeNewMessage').onclick = function(){
            var xmlhttp;
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp=new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    //
                    //
                }
            }
            var url ='http://www.shejiben.com/api/getRelativeInfo.php?closeMess=1';
            if ((window.location.href.indexOf("www.shejiben.com") == -1))
                url = 'index.php?closeMess=1';
            xmlhttp.open("GET",url,true);
            xmlhttp.send();
            $('newMessage').parentNode.removeChild($('newMessage'));
            clearTimeout(FlickerTime);
            document.getElementsByTagName('title')[0].innerHTML = default_title;
        }
    }

    if($('res_ts')){
        $('res_ts').onmouseover=function(){
            window.document.getElementById('res_ts').style.display='none';  
        }
        document.getElementById('sjbNewTop').onmouseout=function(evt){
            evt = evt || window.event;
            var dom = evt.srcElement || evt.target;
            if ( dom != document.getElementById('res_ts')) {
                document.getElementById('res_ts').style.display='block';
            } else {
                document.getElementById('res_ts').style.display='none';
            }
        }
        
        document.getElementById('header_upad').onmouseover=function(){
            document.getElementById('res_ts').style.display='none';
            document.getElementById('header_upad').onmouseout=function(){
                document.getElementById('res_ts').style.display='block';
            };
        }
        document.getElementById('res_close').onclick=function(){
            document.getElementById('res_ts').style.display='none';
            document.getElementById('res').style.display='none';
            document.getElementById('sjbNewTop').onmouseout=function(){};
            document.getElementById('header_upad').onmouseout=function(){};
            document.getElementById('header_upad').onmouseover=function(){};

        }
    }

}

/**
 * 解决ie下 onmouseover和onmouseout冒泡的函数
 * 思路为判断当前执行mouse事件的元素是否为子元素，是则不执行事件
 */

function isMouseLeaveOrEnter(e, handler) {
    if (!e) e = window.event;
    if (e.type != 'mouseout' && e.type != 'mouseover') return false;
    var reltg = e.relatedTarget ? e.relatedTarget : e.type == 'mouseout' ? e.toElement : e.fromElement;
    while (reltg && reltg != handler) 
        reltg = reltg.parentNode;
    return (reltg != handler);
}

function ShowSuccessMsg() {
        jQuery.colorbox.close();
    str = '<div class="collection_success" id="collection_success">'+
        '<div class="content"><em class="icon icon_right_b"></em>收藏成功!</div>'+
        '</div>';
    jQuery('body').append(str); 
    jQuery('#collection_success').fadeOut(2500); 
    setTimeout(function(){
        jQuery('#collection_success').remove(); 
    },3000);  
}

function d_colorbox() {
    jQuery.colorbox.close();
    jQuery('#cboxTitle').removeClass('cboxTitle2');
    jQuery('#colorbox').removeClass('colorbox2');
    jQuery('#cboxClose').show();
}

function init_colorbox_css() {
    jQuery('#cboxTitle').removeClass('cboxTitle2');
    jQuery('#colorbox').removeClass('colorbox2');
    jQuery('#cboxClose').show();
    clearTimeout(is_Close_Colorbox);
}

function letMeFly() {
    jQuery.colorbox.close();
    var start_locaton = jQuery('#n_success').offset();
    var end_location   = jQuery('#my_collection').offset();
    var position_location_W = end_location.left - start_locaton.left;
    var position_location_H = end_location.top - start_locaton.top + 56;
    end_w  = (end_location.left - 225);
    end_h  = (end_location.top);
    if (position_location_H > 0 && position_location_W > 0) {
        jQuery('#n_success').animate({
            'left': end_w,
            'top' : end_h - jQuery(window).scrollTop()},
            200, function() {
                jQuery('#n_success').animate({
                    'left': end_location.left + 'px',
                    'width': '0px',
                    'height':'0px'},
                    300, function() {
                        jQuery('#n_success').css({'left':(jQuery(window).width() - 255) / 2 + 'px', 'top':(jQuery(window).height() - 82) / 2 + 'px', 'display':'none', 'width':'225px', 'height':'82px'});
                });
        });
    }
}

function showInviteBox(type,objectid) {
    clearEvent();
    if (!to8to_uid) {
        showSingleLogin(2,2);
        return false;
    }
    if (type == 4)
        title = '邀请大家来看图';
    if (type == 5)
        title = '邀请设计专家投标';
    if (type == 6)
        title = '邀请大家来抽奖';
    if (type == 7)
        title = '邀请大家来签到';
    if (type == 10) 
        title = '邀请大家来投票';
    jq.colorbox({
        inline: true,
        title:title,
        href:'#invite_content',
        opacity:"0.5",
        height:"465",
        width:"440",
        onComplete: function(){
            jq('#cboxTitle').css({
                'position': 'absolute',
                'top': '-33px',
                'left': '0',
                'font-weight': '100',
                'font-size': '12px',
                'width': '440px',
                'height': '30px',
                'border-bottom': '1px solid #ccc',
                'line-height': '30px',
                'background': '#f3f3f3',
                'color': '#585833'
            });
            jq('#invite_all_designer_ul').html('设计师数据加载中...');
            jq.ajax({
            url:'http://www.shejiben.com/api/getRelativeInfo.php',
            type:'POST',
            data:'getdesigner=1&sendtype='+type+'&objectid='+objectid,
            dataType:'json',
            success:function(data) {
                if (typeof data != 'undefined' && data.code == '1') {
                    jq('#invite_all_designer_ul').html(data.html);
                    jq('#invite_choose_designer_ul').html(data.choose_html);
                    jq('.submit_but').removeAttr('disabled');
                    jq('#zj_number').html(jq('#invite_choose_designer_ul').children('li').length);
                    jq('#invite_all_designer_ul li').bind('click',function() {
                        var data_id = jq(this).find('a').eq(0).attr('data-id');
                        if (CheckRepeatId(data_id)) {
                            var img_src = jq(this).find('img').attr('src') ? jq(this).find('img').attr('src') : '';
                            var nick    = jq(this).find('a').eq(1).html();
                            var clone = '<li><span class="remove_designer"></span><a target="_blank" href="http://www.shejiben.com/sjs/'+data_id+'/" data-id="'+data_id+'"><img src="'+img_src+'" width="25" height="25" /></a><a target="_blank" href="http://www.shejiben.com/sjs/'+data_id+'/" data-id="'+data_id+'">'+nick+'</a><p class="clear"></p></li>';
                            jq('#invite_choose_designer_ul').prepend(clone);
                            jq('#zj_number').html(jq('#invite_choose_designer_ul').children('li').length);
                            init_event();
                        }

                    });

                    init_event();
                    jq('.submit_but').bind('click', function() {
                        var invite_uid = new Array();
                        if (jq('#invite_choose_designer_ul li') && jq('#invite_choose_designer_ul li').length > 0) {
                            jq('#invite_choose_designer_ul li').each(function(i,n) {
                                invite_uid.push(jq(this).children('a').eq(0).attr('data-id'));
                            })
                        }
                        if (invite_uid.length > 0) {
                            jq(this).attr('disabled','disabled');
                            jq.ajax({
                                url:'http://www.shejiben.com/api/getRelativeInfo.php',
                                type:'POST',
                                dataType:'json',
                                data:'sendtype='+type+'&type=8&data='+invite_uid+'&objectid='+objectid,
                                success:function(res) {
                                    jq('#cboxTitle').css({'height':'0px','border':'0px'});
                                    jq.colorbox({
                                        iframe:true,
                                        href:"http://www.shejiben.com/my/message.php?act=success&msg=恭喜，发送成功啦！",
                                        opacity:"0.5",
                                        height:"100",
                                        width:"230"
                                    });
                                    setTimeout(Close_ColorBox,2000);
                                    jq(this).removeAttr('disabled');
                                    return false;
                                }
                            });
                        }
                        return false;
                    });

                    jq('#invite_designer').bind('keyup change' ,function(event) {
                        var nick = jq('#invite_designer').val() ? jq('#invite_designer').val() : '';
                        if (nick != '') {
                            jq.ajax({
                                url:'http://www.shejiben.com/api/getRelativeInfo.php',
                                type:'POST',
                                dataType:'json',
                                data:'sendtype='+type+'&type=8&do=search_designer&nick='+nick,
                                success:function(data) {
                                    if (typeof data != 'undefined' && data.code == '1') {
                                        jq('#search_value ul').html(data.resHtml);
                                        jq('#search_value').show();
                                        jq('#search_value ul li').bind('click',function() {
                                            var data_id = jq(this).find('a').eq(0).attr('data-id');
                                            if (CheckRepeatId(data_id)) {
                                                var img_src = jq(this).find('img').attr('src') ? jq(this).find('img').attr('src') : '';
                                                var nick    = jq(this).find('a').eq(1).html();
                                                var clone = '<li><span class="remove_designer"></span><a target="_blank" href="http://www.shejiben.com/sjs/'+data_id+'/" data-id="'+data_id+'"><img src="'+img_src+'" width="25" height="25" /></a><a target="_blank" href="http://www.shejiben.com/sjs/'+data_id+'/" data-id="'+data_id+'">'+nick+'</a><p class="clear"></p></li>';
                                                jq('#invite_choose_designer_ul').prepend(clone);
                                                jq('#zj_number').html(jq('#invite_choose_designer_ul').children('li').length);

                                                init_event();
                                            } else {
                                                jq('#search_value ul').html('');
                                                jq('#search_value').hide();
                                            }
                                        })
                                        return false;
                                    }
                                }
                            })
                        } else {
                            jq('#search_value').hide();
                        }
                    });
                } else if (data.code == '0') {
                    jq('#invite_all_designer_ul').html(data.msg);
                    init_event();
                    jq('#invite_designer').bind('keyup change' ,function(event) {
                        var nick = jq('#invite_designer').val() ? jq('#invite_designer').val() : '';
                        if (nick != '') {
                            jq.ajax({
                                url:'http://ask.shejiben.com/createDiscussion.php',
                                type:'POST',
                                dataType:'json',
                                data:'sendtype='+type+'&type=8&do=search_designer&nick='+nick,
                                success:function(data) {
                                    if (typeof data != 'undefined' && data.code && data.code == '1') {
                                        jq('#search_value ul').html(data.resHtml);
                                        jq('#search_value').show();
                                        jq('#search_value ul li').bind('click',function() {
                                            var data_id = jq(this).find('a').eq(0).attr('data-id');
                                            if (CheckRepeatId(data_id)) {
                                                var img_src = jq(this).find('img').attr('src') ? jq(this).find('img').attr('src') : '';
                                                var nick    = jq(this).find('a').eq(1).html();
                                                var clone = '<li><span class="remove_designer"></span><a href="javascript:;" data-id="'+data_id+'"><img src="'+img_src+'" width="25" height="25" /></a><a href="javascript:;" data-id="'+data_id+'">'+nick+'</a><p class="clear"></p></li>';
                                                jq('#invite_choose_designer_ul').prepend(clone);
                                                jq('#zj_number').html(jq('#invite_choose_designer_ul').children('li').length);

                                                init_event();
                                            }
                                        })
                                        return false;
                                    }
                                }
                            })
                        } else {
                            jq('#search_value').hide();
                        }
                    });
                    jq('.submit_but').bind('click', function() {
                        var invite_uid = new Array();
                        if (jq('#invite_choose_designer_ul li') && jq('#invite_choose_designer_ul li').length > 0) {
                            jq('#invite_choose_designer_ul li').each(function(i,n) {
                                invite_uid.push(jq(this).children('a').eq(0).attr('data-id'));
                            })
                        }
                        if (invite_uid.length > 0) {
                            jq(this).attr('disabled','disabled');
                            jq.ajax({
                                url:'http://www.shejiben.com/api/getRelativeInfo.php',
                                type:'POST',
                                dataType:'json',
                                data:'type=8&data='+invite_uid+'&objectid='+objectid+'&senddesigner=1',
                                success:function(res) {
                                    jq('#cboxTitle').css({'height':'0px','border':'0px'});
                                    jq.colorbox({
                                        iframe:true,
                                        href:"http://www.shejiben.com/my/message.php?act=success&msg=恭喜，发送成功啦！",
                                        opacity:"0.5",
                                        height:"100",
                                        width:"230"
                                    });
                                    jq(this).removeAttr('disabled');
                                    setTimeout(Close_ColorBox,2000);
                                    return false;
                                }
                            });
                        }
                        return false;
                    });
                    jq('#zj_number').html('0');
                    return false;
                } else {
                    jq('#invite_all_designer_ul').html('设计师数据加载失败！');
                }
            }
        })
        }
    });
}

function Close_ColorBox() {
    jq.colorbox.close();
}

//初始化事件
function init_event() {
    jq('.remove_designer').bind('click',function() {
        jq(this).parent('li').remove();
        jq('#zj_number').html(jq('#invite_choose_designer_ul').children('li').length); 
        return false;
    }); 

    jq('#invite_choose_designer li').mouseover(function() {
        jq(this).children('span').show();
    }).mouseout(function() {
        jq(this).children('span').hide();
    });

    jq('#clear_designer').bind('click',function() {
        jq('#invite_choose_designer_ul li').remove();
        jq('#zj_number').html('0');
    });

    jq('.reset_but').bind('click',function() { 
        clearEvent();
        jq.colorbox.close();
    });
    // jq('#cboxTitle').css({
    //     'position': 'absolute',
    //     'top': '-33px',
    //     'left': '0',
    //     'font-weight': '100',
    //     'font-size': '12px',
    //     'width': '440px',
    //     'height': '30px',
    //     'border-bottom': '1px solid #ccc',
    //     'line-height': '30px',
    //     'background': '#f3f3f3',
    //     'color': '#585833'
    // });
}

//关闭colorbox后清除事件,重置表单元素
function clearEvent() {
    jq('.submit_but').unbind('click');
    jq('#invite_designer').unbind('keyup change');
    jq('.reset_but').unbind('click');
    jq('#invite_all_designer_ul li').unbind('click');
    jq('#invite_all_designer_ul').html('');
    jq('#invite_choose_designer_ul').html('');
    jq('#clear_designer').unbind('click');
    jq('#search_value').html('<ul></ul>');
    jq('#search_value').hide();
    jq('#search_value ul li').unbind('click');
    jq('#invite_designer').val('搜索你想邀请的人');
    jq('#cboxTitle').css({'height':'30px','border-bottom':'1px solid #ccc'});
    jq('#submit_but').removeAttr('disabled');
}

function CheckRepeatId(id) {
    var choose_list = jq('#invite_choose_designer li');
    if (!choose_list) {
        return true;
    } else {
        var num = 0;
        choose_list.each(function(index, el) {
            var data_id = jq(this).children('a').eq(0).attr('data-id');
            if (data_id != id)
                num++;
        });
        if (num == choose_list.length)
            return true;
        else 
            return false;
    }
}

function showSuccessMessage() {
    jq.colorbox({
        iframe:true,
        href:"http://www.shejiben.com/my/message.php?act=success&msg=恭喜，发送成功啦！",
        opacity:"0.5",
        height:"100",
        width:"230"
    });
}

//记录招标来源2013.11.07 update 2015.08.06
function checkCookie() {
    var valsource = getCookie( 'sourcepage', 1 );
    var valland = getCookie( 'landpage', 1 );
    var sourcepage = document.referrer;
    var landpage = location.href;
    if( sourcepage!='' ) {
        var domain = sourcepage.split('/');
        if( domain[2] ) {
            domain = domain[2];
        } else {
            domain = sourcepage;
        }
    } else {
        var domain = '';
    }
    //新规则，每次进来如果来源不同，则更新
    if ( !valsource || ( domain.indexOf('shejiben.com') == -1 && valsource != sourcepage ) ) {
        //保存30天，js时间以毫秒为单位需*1000
        setCookie( 'sourcepage', encodeURI(sourcepage), 30*3600000*24, 1, 'shejiben.com' );
    }
    
    if ( !valland || domain.indexOf('shejiben.com') == -1 ) {
        setCookie( 'landpage', encodeURI(landpage), 30*3600000*24, 1, 'shejiben.com' );
    }
}

//图片(案例)收藏
var ActionCollection = {
    image_id: 0,
    image_src: '',
    alt: '',
    default_domain: '',
    init: function(obj) {
        var sthis = this;
        sthis.default_domain = document.domain;
        obj.live('click', function() {
            
            if (!to8to_uid) {
                showSingleLogin(2, 2);
                return false;
            }
            sthis.image_id = jQuery(this).attr('data-id');
            sthis.image_src = jQuery(this).attr('data-src');
            if (sthis.image_id && sthis.image_src.length > 0) {
                ActionCollection.colorbox();
            }
        });
    },
    colorbox: function() {
        var sthis = this;
        jQuery.colorbox({
            iframe: true,
            title: '收藏图片到图集',
            href: "http://www.shejiben.com/works/add_collections.php?act=add_collection&src=" + sthis.image_src + '&image_id=' + sthis.image_id + '&alt=' + sthis.alt + '&_='+Math.random(),
            opacity: "0.5",
            height: "330",
            width: "530",
            onComplete:function(){
                initColorboxCss();
            }
        });
    }
}
//对案例(图集)提问
var ActionAsk = {
    /**
    *   $blockName = array(
            1 => '图片列表页',
            2 => '图片幻灯片',
            3 => '图片单页面',
            4 => '灵感图集列表页',
            5 => '博客页面',
            6 => '灵感图集幻灯片页面'
        );
    */
    recodeid: 0, //提问所在版块名
    login: true,
    image_id: 0,
    onSubmit: false,
    default_domain: '',
    placeholder_title: '例如：多大的面积能装修成这样.预算多少',
    placeholder_description: '对装修设计有疑惑，预算、网咖风格、风水、选材、施工，将你的问题提出来，让业内专家帮你解答，提问最好附上图片哦',
    init: function(obj, Recodeid) {
        var sthis = this;
        sthis.recodeid = Recodeid;
        sthis.default_domain = document.domain;
        obj.live('click', function() {
            
            if (!to8to_uid) {
                showSingleLogin(2, 2);
                return false;
            }
            //sthis.login = to8to_uid ? true : false;
            sthis.image_id = jQuery(this).attr('data-id');
            sthis.stepFirst();
            sthis.closeBox();
        });
    },
    stepFirst: function() {
        //第一步显示正在获取问题
        jQuery.colorbox({
            inline: true,
            title: false,
            href: "#getImageQuestion",
            opacity: "0.5",
            height: "300",
            width: "474",
            speed: 0
        });
        this.questionList();
        this.submit();
    },
    questionList: function() {
        var sthis = this;
        jQuery.post(
            '/discussions/createDiscussion.php', {
                image_id: sthis.image_id,
                type: 4,
                recordObjectId: sthis.recodeid
            },
            function(data) {
                if (data == '图片id错误') {
                    alert("参数错误，提问的图片不存在");
                    return false;
                }
                jQuery.colorbox({
                    inline: true,
                    title: '',
                    href: "#addQuestionDialog",
                    opacity: "0.5",
                    height: "500",
                    width: "500",
                    onComplete: function() {
                        initCss();
                        if (data) {
                            var str = '';
                            jQuery.each(data, function(i, n) {
                                str += '<li><a href="http://ask.shejiben.com/discussions/' + n.id + '.html">' + n.title + '</a>';
                                if (n.comment_nums > 0)
                                    str += '（' + n.comment_nums + '条回答）';
                                str += '</li>';
                            });
                            jQuery(".existQuestions ul").html(str);
                            jQuery("#addToQuestion").val("提交");
                            jQuery("#questionTitle").css("color", "#999");
                            jQuery("#questionContent").css("color", "#999");
                            // jQuery("#questionTitle").val(sthis.placeholder_title);
                            // jQuery("#questionContent").val(sthis.placeholder_description);
                            jQuery("#addQuestionDialog_0").hide();
                            jQuery("#addQuestionDialog_1").show();
                            jQuery('.dialogCaption').show();
                        } else {
                            jQuery('.dialogCaption').hide();
                            jQuery('.existQuestions').hide();
                            jQuery("#addToQuestion").val("提交");
                            jQuery("#questionTitle").css("color", "#999");
                            jQuery("#questionContent").css("color", "#999");
                            // jQuery("#questionTitle").val(sthis.placeholder_title);
                            // jQuery("#questionContent").val(sthis.placeholder_description);
                            jQuery("#addQuestionDialog_0").hide();
                            jQuery("#addQuestionDialog_1").show();
                            jQuery('.dialogCaption').hide();
                        }
                    },
                    onClosed: function() {
                        revertCss();
                        if (ActionCollection.default_domain.length > 0) {
                            document.domain = ActionCollection.default_domain;
                        }
                    }
                });
            }, 'json');
    },
    submit: function() {
        var sthis = this;
        jQuery("#addToQuestion").live("click", function() {
            if (jQuery(this).val() == '提问') {
                jQuery("#addQuestionDialog_0").hide();
                jQuery("#addQuestionDialog_1").show();
                jQuery(this).val("提交");
                jQuery("#questionTitle").css("color", "#999");
                jQuery("#questionContent").css("color", "#999");
                // jQuery("#questionTitle").val(sthis.placeholder_title);
                // jQuery("#questionContent").val(sthis.placeholder_description);
            } else { //问题提交
                var ques_length = jQuery('#questionTitle').val().length;
                if (jQuery("#questionTitle").val() == "" || jQuery("#questionTitle").val() == sthis.placeholder_title || ques_length < 5) {
                    alert("您的提问过短，请将问题说明清楚，网友才能为您解答！");
                    return false;
                }
                if (jQuery('#questionContent').val() == sthis.placeholder_description) {
                    jQuery('#questionContent').val('');
                }
                jQuery(this).val('正在提交...');
                if (sthis.onSubmit)
                    return false;
                sthis.onSubmit = true;
                //发送异步提交
                jQuery.ajax({
                    type: 'POST',
                    url: '/discussions/createDiscussion.php',
                    data: {
                        'image_id': sthis.image_id,
                        'title': jQuery("#questionTitle").val(),
                        'content': jQuery("#questionContent").val(),
                        'type': 5,
                        'recordObjectId': sthis.recodeid
                    },
                    success: function(msg) {
                        sthis.onSubmit = false;
                        if (msg == -100) {
                            jQuery.colorbox({
                                inline: true,
                                title: '警告',
                                href: "#submitQuestionOk2",
                                opacity: "0.5",
                                height: "108",
                                width: "474"
                            });
                        }
                        else if(msg == -200){
                            alert('提问太频繁');
                            jq('#addToQuestion').val('提交');
                        } 
                        else {
                            if (msg) {
                                revertCss();
                                jQuery("#questionTitle").val('');
                                jQuery('#questionContent').val('');
                                jQuery("em[iiid=" + sthis.image_id + "]").html(parseInt(jQuery("em[iiid=" + sthis.image_id + "]").html()) + 1);
                                jQuery("a[askid=" + sthis.image_id + "]").html(parseInt(jQuery("a[askid=" + sthis.image_id + "]").html()) + 1);
                                jQuery("em[iiid=" + sthis.image_id + "]").css("display", "");
                                jQuery("a[askid=" + sthis.image_id + "]").css("display", "");
                                jQuery(".succ_qu").attr('href', 'http://www.shejiben.com/my/ask.php');
                                jQuery.colorbox({
                                    inline: true,
                                    title: '提问成功',
                                    href: "#submitQuestionOk",
                                    opacity: "0.5",
                                    height: "160",
                                    width: "474"
                                });
                            }
                        }
                    }
                });
            }
        });
    },
    closeBox:function(){
        jQuery('#closeQuestionBox').live('click', function() {
            jQuery("#questionTitle").val('');
            jQuery('#questionContent').val('');
            jQuery.colorbox.close();
        });
    }
}

function initCss() {
    jQuery('#cboxContent').css({'margin-top':'0'});
    jQuery('#colorbox').css('border', 'none');
    jQuery('#colorbox p').css('padding', '0 40px');
    jQuery('#colorbox p.pmsg').css('padding', '0');
    jq('#cboxTitle').hide();
    jQuery('#colorbox').css('padding-bottom', '0px');
}

function revertCss() {
    jQuery('#cboxContent').css({'margin-top':'32px'});
    jQuery('#cboxTitle').css({'*top':'-20px'});
    jQuery('#colorbox').css({'padding-bottom':'50px'});
    jQuery('#cboxWrapper').css({'padding-bottom':'20px'});
    
}

// 公用弹窗样式重置
function initColorboxCss(){
    jQuery('#cboxTitle').css({'width':'100%','height':'40px','background':'#333','top':'-32px','*top':'-34px','_top':'-34px','left':'0','color':'#999','line-height':'42px','text-indent':'20px','font-size':'16px'});
    jQuery('#colorbox,#cboxOverlay').css({'border':'none'});
    jQuery('#cboxClose').css({'background':'url(http://img.shejiben.com/global.png) no-repeat -61px -128px','top':'-16px','right':'20px'});
}


var commonBottomZb = {
    windowW : 0,
    isJsonp : 0, 
    init: function(isJsonp){
        var _this = this;
        _this.isJsonp = isJsonp || 0;
        _this.showBox();

        _this.closeBox();
        _this.resizeBox();
        _this.submitForm();
        _this.scrollBody();
        _this.windowW = jQuery(window).width();   
        var top = jQuery(document).scrollTop();
        if(top > 200){
            jQuery('.bottom_zb_box ,.bottom_show_left').show();    
        }
        var bottom_zb = getCookie('bottom_zb', 1);
        if(bottom_zb){
            jQuery('.bottom_zb_box').css({'left':-_this.windowW+'px'});
            if(_this.windowW < 1480){
                jQuery('.bottom_show_left').css({'left':'-105px'});   
            }
            else{
                jQuery('.bottom_show_left').css({'left':'0'});   
            }
        }
    },
    showBox: function(){
        var _this = this;
        var timer = 500;
        var str = '<div class="bottom_zb_box">\
                    <div class="overlay"></div>\
                    <div class="bottom_zb_container">\
                        <div class="zb_left"></div>\
                        <div class="zb_center">\
                            <form action="#" id="common_bottom_zb" name="common_bottom_zb" method="post">\
                                <input class="input_name" name="chenghu" class="user_name" type="text" autocomplete="off"  placeholder="您的称呼A" />\
                                <input class="input_phone" name="phone" class="user_phone" type="text" autocomplete="off"  placeholder="手机号码B" />\
                                <div class="clear"></div>\
                                <select class="select_shen" name="User_Shen_bottom" id="User_Shen_bottom" onChange="changeProvince(\'User_Shen_bottom\',\'User_City_bottom\',\'User_Town_bottom\');"></select>\
                                <select class="select_city" name="User_City_bottom" id="User_City_bottom"></select>\
                                <input type="hidden"class="select_town"  id="User_Town_bottom" name="User_Town_bottom" value=""/>\
                                <input type="button" class="smbmit_btn" id="btn_bottom_zb" name="subs" value="立即提交" />\
                                <div class="msg"><em class="icon icon_error"></em><span></span></div>\
                            </form>\
                        </div>\
                        <div class="zb_right">\
                            <div class="zb_txt">扫一扫关注有礼</div>\
                            <em class="code"></em>\
                            <em class="icon_close"></em>\
                        </div>\
                    </div>\
                </div>\
                <a class="bottom_show_left" href="javascript:void(0)"></a>';
        jQuery('body').append(str);  
        if(_this.windowW < 1480){
            timer = 300;
        } 
        jQuery('.bottom_show_left').live('click',function(){
            jQuery(this).animate({
                left:'-135px'
            },timer,function(){
                jQuery('.bottom_zb_box').animate({
                    left:'0'
                },500);
            });
        });     
    },
    closeBox: function(){
        var _this = this,
            vLeft = 0,
            timer = 500;
        jQuery('.bottom_zb_box .icon_close').live('click',function(){
            var to8to_bottom_zb = getCookie('bottom_zb', 1);
            if(!to8to_bottom_zb){
                setCookie('bottom_zb',1, 3600*24*1000,'bottom_zb','shejiben.com');
            }
            jQuery('.bottom_zb_box').animate({
                left : -_this.windowW +'px'
            },timer,function(){
                if(_this.windowW < 1480){
                    vLeft = -105;
                    timer = 300;
                }
                jQuery('.bottom_show_left').animate({
                    left:vLeft+'px'
                },timer);
            });
        });
    },
    submitForm: function(){
    	alert(6546544);
        var _this = this;

            nameObj = jQuery('#common_bottom_zb input[name="chenghu"]'),
            phoneObj = jQuery('#common_bottom_zb input[name="phone"]'),
            shenObj = jQuery('#common_bottom_zb select[name="User_Shen_bottom"]'),
            cityObj = jQuery('#common_bottom_zb select[name="User_City_bottom"]'),
            btnObj = jQuery('#common_bottom_zb #btn_bottom_zb'),
            msgObj = jQuery('#common_bottom_zb .msg');

        btnObj.live('click',function(){
            var value = jQuery.trim(nameObj.val()).replace (/[^\x00-\xff]/g,"rr"); 
            if(jQuery.trim(nameObj.val()) == ''){
                msgObj.show().find('span').html('昵称不能为空');
                return false;
            }
            else if(value.length > 20){  
                msgObj.show().find('span').html('称呼不能多于20个字符'); 
                return false;
            }
            else if(jQuery.trim(phoneObj.val()) == ''){
                msgObj.show().find('span').html('请填写您的手机号码');
                return false;
            }
            else if(!/^1[34578]\d{9}$/.test(jQuery.trim(phoneObj.val()))){
                msgObj.show().find('span').html('请填写正确的11位手机号码');
                return false;
            }
            else if(shenObj.val().replace('省/市', '') == ''){
                msgObj.show().find('span').html('请输入您所在的省/市');
                return false;
            }
            else if(cityObj.val().replace('市/地区', '') == ''){
                msgObj.show().find('span').html('请输入您所在的市/地区');
                return false;
            }
            else{
                msgObj.hide();
                //发送请求
                var sendData = {
                    "nickname"     : jQuery.trim(nameObj.val()),
                    "phoneNo"       : jQuery.trim(phoneObj.val()),
                    "User_Shen"   : shenObj.val(),
                    "User_City"   : cityObj.val(),
                    "sourceid"    : 113, //底部模块
                    "needSenSms"  : 1, //需要验证短信
                    "isJsonp"     : _this.isJsonp
                };
                btnObj.attr('disabled','disabled').val('提交中..');
                var dataType = _this.isJsonp > 0 ? 'jsonp' : 'json';
                var type = _this.isJsonp > 0 ? 'GET' : 'POST';
                jQuery.ajax({
                    url: 'http://www.shejiben.com/send_sms_zb.php?sendzb=1',
                    type: type,
                    dataType: dataType,
                    async: true,  
                    data: sendData,
                    success: function (resData) {
                        if( resData.status==1)
                        {
                            zbSuccessMsg(); //发标成功
                            common_bottom_zb.reset();
                        }
                        else if( resData.status==99)
                        {
                            _this.showCodeBox(); //提示输入短信框
                        }
                        else
                        {
                            alert(resData.msg); //发送失败
                        }
                        btnObj.removeAttr('disabled').val('立即提交');
                    }
                });
            
            }
        });
    },
    showCodeBox: function(){
        document.domain = "shejiben.com";
        jQuery.colorbox({
            width: 500,
            height: 240,
            transition:"none",
            title:"获取手机验证码立即发布",
            opacity: "0.5",
            iframe: true,
            overlayClose : false, //点击其他区域不关闭弹窗
            href: 'http://www.shejiben.com/send_sms_zb.php?view=1&viewType=mobile&safeModel=zhaobiao&username='+ jQuery.trim(nameObj.val())+'&mobile='+jQuery.trim(phoneObj.val()),
            onComplete: function() {
                initColorboxCss();
            },
            onClosed: function() {
                common_bottom_zb.reset();
            }
        });
    },
    resizeBox: function(){
        var _this = this;
        var vleft = 0 ;
        jQuery(window).bind('resize',function(){
            _this.windowW = jQuery(window).width();
            vleft = jQuery('.bottom_zb_box').css('left').replace(/px/,'');   

            if(vleft != 0){
                jQuery('.bottom_zb_box').css({'left':-_this.windowW+'px'});
            }  
            if(_this.windowW < 1480 && vleft != 0){
                jQuery('.bottom_show_left').css({'left':'-105px'});       
            }  
            else if(_this.windowW > 1480 && vleft!= 0){
                jQuery('.bottom_show_left').css({'left':'0'}); 
            }
        });
    },
    scrollBody: function(){
        var _this = this;
        jQuery(window).bind('scroll',function(){

            var top = jQuery(document).scrollTop();
            if(top > 200){

                jQuery('.bottom_zb_box,.bottom_show_left').show();    
            }
            else{
                jQuery('.bottom_zb_box,.bottom_show_left').hide();  
            }
        });  
    }
}


function zbSuccessMsg(){
    var str = '<div class="pop_overlay"></div>\
                <div class="common_zb_success_msg" id="common_zb_success_msg">\
                    <div class="column_name"><p class="name">提交成功</p><span class="btn_close"></span></div>\
                    <div class="popup_content submit_status">\
                        <span class="icon icon_sucess"></span>\
                        <span class="show_msg">\
                            <p class="title">提交成功</p>\
                            <p class="msg">为了详细了解您的装修需求及房屋情况，百爪鱼客服会在24小时内与您电话联系。</p>\
                        </span>\
                        <div class="clear"></div>\
                        <a href="javascript:void(0)" class="btn_ok">好的</a>\
                    </div>\
                </div>';
    jQuery('body').append(str); 
    jQuery('.common_zb_success_msg .btn_close ,.common_zb_success_msg .btn_ok').live('click',function(){
        jQuery('.common_zb_success_msg ,.pop_overlay').remove();
    });        
}
//设计师改版提示弹窗
function designerRevision(){
    var desComment='<div class="popup_mask" style="display:block"></div>\
                    <div class="designer_revision">\
                      <a href="javascript:void(0)" class="designer_revision_close"></a>\
                      <a href="http://www.shejiben.com/sjs" class="designer_revision_txt">去看看</a>\
                    </div>'
    jQuery('body').append(desComment);
    jQuery('.designer_revision_close').live('click',function(){
        jQuery('.popup_mask,.designer_revision').hide();
    })
}


/**** 发招标入口统一 ****/
/*** kiki添加于20160215 ***/
function postFrom(btn,sourceid,isJsonp){
    isJsonp = isJsonp || 0;         //需要跨域则传1，不需要则不传
    var dataType = isJsonp ? 'jsonp' : 'json';
    var form = btn.parents('form');
    var formId = form.attr('id');   
    var result = checkForm(formId); 
    if(result){
        var chenghu= jQuery('#sChenghu').val();
        var phone  = jQuery('#sPhone').val();
        var shen   = jQuery('#User_Shen').val();
        var city   = jQuery('#User_City').val();
        btn.val('提交中...').attr('disabled',true);
        jQuery.ajax({
            url: 'http://www.shejiben.com/send_sms_zb.php',
            type: 'POST',
            dataType: dataType,
            async:true,
            data: {'sendzb':1,'phone':phone, 'chenghu':chenghu,  'User_Shen':shen, 'User_City':city, 'sourceid':sourceid,'isJsonp':isJsonp},
            success:function(res){
               if(res.status==1 || res.status==99){
                    zbSuccessMsg();
                    form[0].reset();
                    form.find('.default_value').show();
                }else{
                    alert(res.msg);
                }
                btn.val('立即提交').removeAttr('disabled');
            }
        })
    }
}

/** 
 * 图片下载弹窗
 * created by hyolee.wang, on 03.01 2016
 */

var downloadPic = {
    download_status:0,
    isLogin:0,
    pid:0,
    init:function (obj) {
        var _this = this;
        jQuery('body').delegate(obj,"click",function(){
            if(_this.download_status == 1){
                return false;
            }
            _this.download_status = 1;
            _this.pid = jQuery(obj).attr('data-id');
            if (!to8to_uid) {
                
                showSingleLogin(2, 2);
                _this.download_status = 0;
                return false;
            }
            _this.downLoad();
        });
        jQuery('#download_pic_content .btn_ok').live('click',function(){
            _this.isLogin = 1;
            _this.downLoad();
        });
        jQuery('#download_pic_content .btn_close').live('click', function() {
            _this.closeBox();
        });
    },
    showBox:function () {
        var _this = this;
        var str = '<div class="download_pic_content" id="download_pic_content">\
                    <div class="btn_close"></div>\
                    <div class="tishi">下载百爪鱼APP并登录免费下载高清大图</div>\
                    <div class="app_code"></div>\
                    <div class="msg_error">你还未在APP登录过哦！</div>\
                    <a href="javascript:void(0);" class="btn_ok">我已登录</a>\
                </div>';
        jQuery('body').append(str);   
        jQuery.colorbox({
            width: 400,
            height: 390,
            opacity: "0.5",
            inline: true,
            overlayClose:false,
            href: '#download_pic_content',
            onComplete: function() {
                jQuery('#cboxTitle').hide();
                jQuery('#cboxClose').hide();  
                jQuery('#cboxContent').css('margin-top','0');  
                jQuery('#cboxContent,#cboxLoadedContent').css('height','auto');             
            }
        });    
    },
    closeBox:function(){
        var _this = this;
        _this.download_status = 0;
        jQuery.colorbox.close();
        _this.isLogin = 0;
        jQuery('#download_pic_content .btn_close').unbind('click');
        jQuery('#download_pic_content').remove();
        revertCss();

    },
    downLoad:function(){
        var _this = this;
        jQuery.ajax({
            url: 'http://www.shejiben.com/piwigo/works.php',
            type: 'POST',
            dataType: 'json',
            data: {'img_id': _this.pid},
            success:function(data) {
                if (data.errCode == 0) {                     
                    _this.closeBox();
                    window.location.href="http://www.shejiben.com/piwigo/works.php?img_id="+_this.pid+"&plus=1";
                }
                else if (data.errCode == 103) {
                    if(_this.isLogin == 1){
                        jQuery('#download_pic_content .msg_error').show();
                    }
                    else{
                        _this.showBox();
                    }
                    _this.download_status =0;
                }
                else if(data.errCode == 200){
                    
                    showSingleLogin(2, 2);
                    _this.download_status = 0;
                    return false;
                }
                else if(data.errCode == 100){
                    _this.download_status = 0;
                    alert('下载失败，请重试');
                }
                else if(data.errCode > 0) {
                    _this.download_status = 0;
                    alert(data.errMsg);
                }
            }
        });
    }
}


