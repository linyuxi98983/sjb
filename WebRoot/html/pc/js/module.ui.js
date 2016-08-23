/**
 * JS UI���
 * ����ҳ���һЩ��Ч�Լ�һЩajax����ģ��
 *
 * @version 1.0
 * @author shejiben Team
 */

define(function(require, exports, module) {

    /**
     * �������
     * Ĭ����ʽ
     * .cld_grid{width:300px;margin:auto;}
        .cld_week_box{background-color:#3883a3;width:100%;}
        .header-day{float: left;padding: 10px 0px;width: 14.2857%;text-align: center;color: white;font-family:'΢���ź�'}
        .clearfix:after{content: ".";display: block;clear: both;visibility: hidden;line-height: 0;height: 0;}
        .day{float: left;
            width: 14.2857%;
            height: 13px;
            padding: 10px 0;
            text-align: center;
            color: #4f4f4f;
            background-color: #ebebeb;
            border-bottom: 2px solid white;
            background-image: url('http://img.shejiben.com/front_new/bg/triangle.svg');
            background-size: cover;
            background-position: center;
            cursor: pointer;
        }
        .days .last-month, .days .next-month {
            opacity: 0.3;
        }
        .days .today{
            background:#fff;
        }
        .cld_year_month{   
            padding: 10px;
            background-color: #71bbd2;
            text-align: center;
            color: white;
            letter-spacing: 1px;
            font-size:14px;
        }
        .cld_year_month div{cursor:pointer;}
     */
    function calendar( options ) {
        
        var _this        = this,
            d_date       = new Date();

        this.defaults    = $.extend( true, {
            trigger: null,
            eventName: 'click', //�Զ��崥������
            onSelectDate: null, //ѡ�����ں�Ļص�����
            autoClose: false  //�����Զ��ر��������
        }, options );
        
        this.template    = '';

        this.element     = null;
        
        this.layer       = null;

        this.nameSpace   = makeGuid();
        
        this.rangeObject = null;
                
        this.d_data      = new Date();

        this._date       = {
            year: d_date.getFullYear(),
            month: d_date.getMonth() + 1,
            day: d_date.getDate(),
            week: d_date.getDay()
        };
        
        this.getTemplate = function() {
            var calendarDiv = '<div id="calendar" class="cld_grid" style="display:none;z-index:100;">';
            calendarDiv += '<div id="calendar_year_month" class="cld_year_month" style="position:relative;">';
            calendarDiv += '<div id="last-year" style="position:absolute;left:30px;"><</div>';
            calendarDiv += '<div id="last-month" style="position:absolute;left:60px;"><<</div>';
            calendarDiv += '<div id="next-year" style="position:absolute;right:30px;">></div>';
            calendarDiv += '<div id="next-month" style="position:absolute;right:60px;">>></div>';
            calendarDiv += '<input style="width:40px;text-align:center;" type="text" id="calendar_year" value="' + this._date.year + '">-<input style="width:25px;text-align:center;" type="text" id="calendar_month" value="' + this._date.month + '"></div>'
            calendarDiv += '<div id="calendar_week_box" class="cld_week_box clearfix">';
            calendarDiv += '<div class="header-day" data-index = "0">��</div>';
            calendarDiv += '<div class="header-day" data-index = "1">һ</div>';
            calendarDiv += '<div class="header-day" data-index = "2">��</div>';
            calendarDiv += '<div class="header-day" data-index = "3">��</div>';
            calendarDiv += '<div class="header-day" data-index = "4">��</div>';
            calendarDiv += '<div class="header-day" data-index = "5">��</div>';
            calendarDiv += '<div class="header-day" data-index = "6">��</div>';
            calendarDiv += '</div>';
            calendarDiv += '<div class="days clearfix">';
            for (var k = 0; k < 35; k++) {
                calendarDiv += '<div class="day"><span class="day-number">' + '' + '</span></div>';
            }
            calendarDiv += '</div></div>';
            return calendarDiv;
        }
        
        this.initAction = function() {
            this.thisClick();
            this.inputChange();
            this.buttonChange();
            this.chooseDate();
        };
        
        //click to display
        this.thisClick = function() {
            this.defaults.trigger.bind(this.defaults.eventName, function(e) {
                _this.showCalendar();
            });
        };
        
        this.init_day_numbers = function(year, month) {
            var maxday          = getmaxDay(year, month),
                firstWeek,beforeNumber,
                startIndex      = beforeNumber = firstWeek = getFirstWeek(year, month),
                afterNumber     = 35 - maxday - beforeNumber,
                lastMonthMaxDay = getMaxDayByLastMonth(year, month),
                nextMonthMaxDay = getMaxDayByNextMonth(year, month),
                Edge            = getLastAndNextDate(year, month);
            var default_html = '';
            for (var k = 0; k < 35; k++) {
                default_html += '<div class="day"><span class="day-number">' + '' + '</span></div>';
            };
            $('.days').html(default_html);
            for (var s = 1; s <= maxday; s++) {
                $('.day-number').eq(startIndex).text(s);
                $('.day').eq(startIndex).attr('data-date', year + '-' + month + '-' + s);
                if (s == this._date.day && year == this._date.year && month == this._date.month) {
                    $('.day').eq(startIndex).addClass('today');
                }
                startIndex++;
            };
            for (var k = 0; k < beforeNumber; k++) {
                var realDay = lastMonthMaxDay - beforeNumber + k + 1;
                $('.day-number').eq(k).text(realDay);
                $('.day-number').eq(k).addClass('last-month');
                $('.day').eq(k).attr('data-date', Edge.lastY + '-' + Edge.lastM + '-' + realDay);
            };
            for (var l = 1; l <= afterNumber; l++) {
                var _index = beforeNumber + maxday + (l - 1);
                $('.day-number').eq(_index).text(l);
                $('.day-number').eq(_index).addClass('next-month');
                $('.day').eq(_index).attr('data-date', Edge.nextY + '-' + Edge.nextM + '-' + l);
            }
        }
        
        //when year and month in the input box changes
        this.inputChange = function() {
            $('#calendar_year, #calendar_month').bind('change', function() {
                var year = $('#calendar_year').val(),
                    month = $('#calendar_month').val();
                if (!/^\d{4}$/.test(year)) {
                    alert('������Ϸ�����λ���');
                    return false;
                }
                if (!/^\d{1,2}$/.test(month) || (month > 12 || month <= 0)) {
                    alert('������Ϸ����·�');
                    return false;
                }
                //Initialize after year and month changes
                _this.init_day_numbers(year, month);
            });
        };
        
        //click to change year and month
        this.buttonChange = function() {
            $('#last-year').bind('click', function() {
                var lastYear = parseInt($('#calendar_year').val()) - 1 > 0 ? parseInt($('#calendar_year').val()) - 1 : 1;
                $('#calendar_year').val(lastYear);
                _this.init_day_numbers(lastYear, $('#calendar_month').val());
            });

            $('#last-month').bind('click', function() {
                var lastMonth = parseInt($('#calendar_month').val()) - 1 > 0 ? parseInt($('#calendar_month').val()) - 1 : 12,
                    thisYear = lastMonth == 12 ? parseInt($('#calendar_year').val()) - 1 : $('#calendar_year').val();
                $('#calendar_month').val(lastMonth);
                $('#calendar_year').val(thisYear);
                _this.init_day_numbers(thisYear, lastMonth);
            });

            $('#next-year').bind('click', function() {
                var nextYear = parseInt($('#calendar_year').val()) + 1;
                $('#calendar_year').val(nextYear);
                _this.init_day_numbers(nextYear, $('#calendar_month').val());
            });

            $('#next-month').bind('click', function() {
                var nextMonth = parseInt($('#calendar_month').val()) + 1 <= 12 ? parseInt($('#calendar_month').val()) + 1 : 1,
                    thisYear = nextMonth == 1 ? parseInt($('#calendar_year').val()) + 1 : $('#calendar_year').val();
                $('#calendar_month').val(nextMonth);
                $('#calendar_year').val(thisYear);
                _this.init_day_numbers(thisYear, nextMonth);
            });
        };

        //set the relative offset between control and webpage, then display
        this.showCalendar = function() {
            var o_x = this.defaults.trigger.offset().left,
                o_y = this.defaults.trigger.offset().top + this.defaults.trigger[0].offsetHeight;
            $('#calendar').css({
                'position': 'absolute',
                'left': o_x,
                'top': o_y,
                'display': 'block'
            });

            var elementRange = [
                this.element.offset().left,
                this.element.offset().top,
                this.element[0].offsetWidth,
                this.element[0].offsetHeight,
            ];

            // �󶨵�����������������ر��������
            if ( this.rangeObject !== null ) {
                this.rangeObject.unbind();
            }

            this.rangeObject = new OutOfRange( elementRange, function( obj, eventTarget ) {
                var id = $( eventTarget ).attr('data-guid'),
                    eid = _this.defaults.trigger.attr('data-guid');

                if ( _this.element.css('display') !== 'none' && id !== eid ) {
                    _this.closeCalendar();
                }
            });
        };

        //close plugin
        this.closeCalendar = function() {
            $('#calendar').hide();
            try {
                this.rangeObject.unbind();
            } catch (e) {}
        };

        //select date
        this.chooseDate = function() {
            $('.day').live('click', function() {
                var _date = $(this).attr('data-date');
                //trigger callback function
                if ($.isFunction(_this.defaults.onSelectDate)) {
                    _this.defaults.onSelectDate.call(this, _date);
                }
                if (_this.defaults.autoClose) {
                    _this.closeCalendar();
                }
            });
        };
        
        this.template = this.getTemplate();

        //write calendar template in webpage
        $('body').append(this.template);

        this.element = $( '#calendar' );

        this.defaults.trigger.attr( 'data-guid', this.nameSpace );
        
        //initialize the year, month, day of calendar list
        this.init_day_numbers(this._date.year, this._date.month);

        //initialize plugin action
        this.initAction();

        function getLastAndNextDate(year, month) {
            var lastM = month - 1 > 0 ? month - 1 : 12,
                lastY = lastM == 12 ? year - 1 : year,
                nextM = month + 1 > 12 ? 1 : month + 1,
                nextY = nextM == 1 ? year + 1 : year;
            return {
                lastM: lastM,
                lastY: lastY,
                nextM: nextM,
                nextY: nextY
            };
        }

        //obtain what the first day of one month is in a week
        function getFirstWeek(year, month) {
            var date = new Date(year, month - 1, 1);
            return date.getDay();
        }

        //obtain the year, month, day of today
        function getToday() {
            var date = new Date();
            return today = [date.getFullYear(), date.getMonth() + 1, date.getDate(), date.getDay()];
        }

        //obtain the number of days for a month
        function getmaxDay(year, month) {
            var date = new Date(year, month, 0);
            return date.getDate();
        }

        //obtain the number of days for last month
        function getMaxDayByLastMonth(year, month) {
            month = month - 1 <= 0 ? 12 : month - 1;
            year = month == 12 ? year - 1 : year;
            return getmaxDay(year, month);
        }

        //obtain the number of days for next month
        function getMaxDayByNextMonth(year, month) {
            month = month + 1 > 12 ? 1 : month + 1;
            year = month == 1 ? year + 1 : year;
            return getmaxDay(year, month);
        }

        //obtain the days list of a certain year and month, return array
        function getDayList(year, month) {
            var _list = [],
                maxday = getmaxDay(year, month),
                month = month - 1;
            for (var i = 1; i <= maxday; i++) {
                var d = new Date(year, month, i);
                _list[i - 1] = d.getDay();
            }
            return _list;
        }
        
        //to do

    }

    /**
     * ѡ��л�,���ڶ��ѡ�֮����ʾ�����ص��л�����
     * @param  postger triggerObject ���ڴ��������Ķ���
     * @param  postger showLayer    ��ʾ��
     */ 
    function switchTab( parameter ) {
        //�������б�, ֧��ֱ�Ӵ���ѡ������Ҳ�����ǰ���Ԫ��id�����顣
        this.trigger      = {};  
        
        //����б�֧��ֱ�Ӵ���ѡ������Ҳ������Ԫ��id�����顣
        this.layer        = {};
        
        //�������ͣ�Ĭ��click
        this.event        = 'click';
        
        //��ѡ��������
        this.allowEvent   = ['click', 'mouseover'];
        
        //��ǰѡ�е������ţ�Ĭ��Ϊ0
        this.selectItem   = 0;
        
        //��������ѡ��ʱ��class,Ĭ��Ϊ��
        this.selectClass  = '';
        
        //Ĭ��Ϊ100�� �������ӳ�ʱ�䣬��λΪ���롣
        this.delayed      = 100;
        
        //������ִ�еĻص�����
        this.onTrigger    = null;
        
        //��ʼ����ʱ��Ĭ��ѡ����
        this.defaultIndex = 0;
        
        this.timer        = 0;
        
        this.maxItem      = 0;

        /**
         * ���ڳ�ʼ���������ʾ��
         */
        this.init = function()
        {

            this.event        = typeof parameter.event !== 'undefined' ? parameter.event : this.event;
            this.selectClass  = typeof parameter.className !== 'undefined' ? parameter.className : this.selectClass;
            this.delayed      = typeof parameter.delayed !== 'undefined' ? parseInt( parameter.delayed ) : this.delayed;
            this.defaultIndex = typeof parameter.defaultIndex !== 'undefined' ? parseInt( parameter.defaultIndex ) : this.defaultIndex;

            //��֤�¼������Ƿ�Ϸ�
            if ( !in_array( this.event, this.allowEvent ) )
            {
                throw new Error('not allow event type');
            }

            //��֤����������ʾ�����������Լ�����ͬ�Ĵ���
            var triggerType = typeof parameter.triggerObject,
                layerType = typeof parameter.showLayer;


            if ( Object.prototype.toString.apply(parameter.triggerObject) === '[object Array]' || Object.prototype.toString.apply(parameter.showLayer) === '[object Array]' )
            {
                //�������triggerObject��һ�����飬��ôĬ�ϴ���������DOM�����id
                if ( Object.prototype.toString.apply(parameter.triggerObject) === '[object Array]' )
                {
                    this.trigger = jQuery( _join( parameter.triggerObject ) );
                }

                if ( Object.prototype.toString.apply(parameter.showLayer) === '[object Array]' )
                {
                    this.layer = jQuery( _join( parameter.showLayer ) );
                }
            }

            if ( triggerType === 'string' || layerType === 'string' )
            {
                //jqueryѡ������class����
                if ( triggerType === 'string' )
                {
                    this.trigger = jQuery( parameter.triggerObject ).length ? jQuery( parameter.triggerObject ) : jQuery( '.' + parameter.triggerObject );
                }

                if ( layerType === 'string' )
                {
                    this.layer   = jQuery( parameter.showLayer ).length ? jQuery( parameter.showLayer ) : jQuery( '.' + parameter.showLayer );
                }

            }

            if ( Object.prototype.toString.apply(parameter.triggerObject) === '[object Object]' || Object.prototype.toString.apply(parameter.showLayer) === '[object Object]' )
            {
                //���󼯺�
                if ( Object.prototype.toString.apply(parameter.triggerObject) === '[object Object]' )
                {
                    this.trigger = parameter.triggerObject;
                }

                if ( Object.prototype.toString.apply(parameter.showLayer) === '[object Object]' )
                {
                    this.layer = parameter.showLayer;
                }
            }

            //��ʼ�����ֵ
            this.maxItem = this.trigger.length ? this.trigger.length - 1 : 0;

            //��ʾĬ�����
            this.switchTo( this.defaultIndex );

            //���¼�
            this.bind();
        };

        //��ʼ�����¼�
        this.bind = function()
        {
            var _this = this;
            this.trigger.bind( this.event, function() {

                _this.selectItem = _this.trigger.index( jQuery( this ) );
                _this.switchTo( _this.selectItem );

                //ִ�д�����Ļص�����
                if ( typeof parameter.onTrigger === 'function' )
                {
                    //���ظ��ص������Ĳ������������ֱ�Ϊ�����¼���Ԫ�ض��󼯺ϣ���ʾ����󼯺��Լ���ǰѡ�е�������
                    parameter.onTrigger( _this.trigger, _this.layer, _this.selectItem );
                }
            });
        };

        this.switchTo = function( selectItem )
        {   
            selectItem = parseInt ( selectItem );

            //�������Ϸ�
            if ( selectItem > this.maxItem || selectItem < 0 )
            {
                return false;
            }

            this.selectItem = selectItem;

            //�Ƿ����Զ���className
            if ( this.selectClass )
            {
                this.trigger.removeClass( this.selectClass );
                this.trigger.eq( selectItem ).addClass( this.selectClass );
            }

            this.clear().delayedShow();
        }

        /**
         * �ӳ���ʾ���
         */
        this.delayedShow = function()
        {
            var _this    = this;
            this.delayed = parseInt( this.delayed );
            this.timer   = setTimeout( function() {
                _this.layer.hide();
                _this.layer.eq( _this.selectItem ).show();
            }, this.delayed );
        }

        this.clear = function()
        {
            clearTimeout( this.timer );
            return this;
        }

        this.init();
    }

    /**
     * ��ֱ�޷����JS����
     * @param {[type]} fdiv     [description]
     * @param {[type]} sdiv     [description]
     * @param {[type]} speed    ÿ���ƶ�������ֵ
     * @param {[type]} Interval �ƶ���ʱ����
     */
    function SeamlessScroll( fdiv, sdiv , speed, Interval) {

        this.fc         = fdiv;
        
        this.sc         = sdiv;
        
        this.speed      = speed;
        
        this.interval   = Interval;
        
        this.clone      = null;
        
        this.timestatus = 0;

        this.timer = function()
        {
            var sthis = this;
            this.timestatus = setInterval(function() {
                if ( sthis.clone[0].offsetTop - sthis.sc[0].scrollTop <= 0 )
                {
                    sthis.fc[0].scrollTop -= sthis.clone[0].offsetHeight;
                }
                else
                {
                    sthis.fc[0].scrollTop++;
                }
            }, sthis.interval );
        };

        this.touchEvent = function()
        {
            var sthis = this;
            this.fc.bind( 'mouseover', function() {
                clearInterval( sthis.timestatus );
            }).bind( 'mouseout', function() {
               sthis.timer(); 
            });
        };

        if (this.fc.length && this.sc.length)
        {

            //�ȸ���һ��dom�ڵ�
            var nodeName  = this.sc[0].nodeName,
                cloneNode = document.createElement( nodeName );

            //�����Ľڵ�׷�ӵ�����������
            this.sc.after( cloneNode );
            this.clone = jQuery( cloneNode );

            //�����������е�����
            this.clone.html( this.sc.html() );

            //�����¼���ʼ
            this.timer();
            this.touchEvent();
        }
    }

    /**
     * ˮƽ����
     */
    function HorizontalScroll() {

    }

    function Slider(options) {

        this.timer = 0;

        this.options = $.extend({
            index: 0,
            pointClass: 'on',
            pointNav: null,
            pointTag: 'li',
            pointList: null,
            navigate: null,
            navList: null,
            childTag: 'li',
            duration: 2000,
            step: 500,
            event: 'click',
            moveWidth: 0,
            auto: true,
            aniType: 'slide',
            childLen: 0,
            container: null,
            seamless: false, // �0�8�0�5���0�9�0�2�0�7�����0�1�0�2�0�9�0�4
            curLeft: 0
        }, options, true);

        this.init = function () {
            if (!this.options.navigate.length) {
                return false;
            }

            this.options.navList   = this.options.navigate.children(this.options.childTag);
            if (!this.options.navList.length) {
                return false;
            }

            this.options.moveWidth = this.options.moveWidth || this.options.navList.width();
            this.options.childLen  = this.options.navList.length;
            if (this.options.pointNav && this.options.pointNav.length) {
                this.options.pointList = this.options.pointNav.children(this.options.pointTag);
                this.options.pointList.eq(this.options.index).addClass(this.options.pointClass);
            }

            this.options.navigate.css({
                width: (this.options.childLen * this.options.moveWidth) + 'px'
            });

            if (this.options.aniType == 'slide' && this.options.seamless === true) {
                this.options.navigate.after(this.options.navigate.clone().removeAttr('id'));
                this.options.navigate.parent().css({
                    width: (this.options.childLen * this.options.moveWidth) * 2 + 'px'
                });
            }

            this.bindEvents();

            if (this.options.auto) {
                this.animate();
            }
        };

        this.bindEvents = function() {
            var _this =  this, _index;
            if (this.options.pointNav && this.options.pointNav.length) {
                this.options.pointList.on(this.options.event, function() {
                    _index = _this.options.pointList.index($(this));
                    _this.moveTo(_index);
                });    
            }
            
            this.options.navigate.on('mouseover', function() {
                _this.stop();
            }).on('mouseout', function() {
                _this.animate();
            });
        };

        this.moveTo = function (index) {
            this.stop();
            this.animate(this.getNextIndex(index));
        };

        this.setIndex = function (index) {
            this.options.index = index;
        };

        this.next = function () {
            this.moveTo(this.getNextIndex(this.options.index + 1));
        };

        this.prev = function () {
            this.moveTo(this.getNextIndex(this.options.index - 1));
        };

        this.move = function(index) {
            var _this  = this, _margin, _index, nextIndex, _scrollLeft, curLeft, _width = _this.options.moveWidth;
            _index = _this.options.index;
            nextIndex = typeof index !== 'undefined' ? index : _this.getNextIndex(_index + 1);
            if (_this.options.aniType == 'slide') {
                // ���0�5�0�2�0�7�����0�1�0�2�0�9�0�4�0�7���0�0�0�5
                if (_this.options.seamless === false) {
                    _margin = -(nextIndex * _width);
                    _this.options.navigate.stop(true, true).animate({
                        'margin-left': _margin + 'px'
                    }, _this.options.step);
                    _this.setIndex(nextIndex);
                    _this.movePoint();
                }
                // �0�2�0�7�����0�1�0�2�0�9�0�4
                else {
                    _scrollLeft = _this.getScrollLeft(nextIndex);
                    _this.options.container.stop(true, true).animate({
                        'scrollLeft': _scrollLeft + 'px'
                    }, _this.options.step, function() {
                        if (_scrollLeft >= (_width * _this.options.childLen)) {
                            _this.options.container.scrollLeft(0);
                        } else if (_index == 3 && nextIndex == (_this.options.childLen - 1)) {
                            _this.options.container.scrollLeft(_width * _this.options.childLen);
                        }
                    });
                    _this.setIndex(nextIndex);
                    _this.movePoint();
                }

            } else {
                _this.options.navList.hide();
                _this.options.navList.eq(nextIndex).show();
                _this.setIndex(nextIndex);
                _this.movePoint();
            }
        };

        this.getScrollLeft = function(nextIndex) {
            var curLeft = (this.options.index * this.options.moveWidth ), flag,
                _index = this.options.index,
                _scrollLeft = 0,
                _width = this.options.moveWidth;
            if (_index > nextIndex) {
                if (_index == (this.options.childLen - 1) && nextIndex == 0) {
                    _scrollLeft = curLeft + _width;
                    flag = '+';
                } else {
                    _scrollLeft = curLeft - _width;
                    flag = '-';
                }
            }
            else {
                if (nextIndex == (this.options.childLen - 1) && _index == 0) {
                    this.options.container.scrollLeft(_width * this.options.childLen);
                    _scrollLeft = curLeft - _width;
                    flag = '-';
                } else {
                    _scrollLeft = curLeft + _width;
                    flag = '+';
                }
            }

            // curLeft = this.options.container.scrollLeft();
            // _scrollLeft = parseInt(eval(curLeft + flag + _width));
            return _scrollLeft;
        };

        this.animate = function (index) {
            var _this  = this;
            if (typeof index !== 'undefined') {
                this.move(index);
            }
            this.timer = setInterval(function () {
                _this.move();
            }, this.options.duration);

        };

        this.stop = function () {
            clearInterval(this.timer);
        };

        this.movePoint = function () {
            var pointList = this.options.pointList;
            if (pointList !== null && pointList.length) {
                pointList.removeClass(this.options.pointClass);
                pointList.eq(this.options.index).addClass(this.options.pointClass);
            }
        };

        this.getNextIndex = function (index) {
            var _index = 0;
            if (index >= (this.options.childLen - 1)) {
                _index = index % this.options.childLen;
            } else if (index < 0) {
                _index = this.options.childLen - 1;
            } else {
                _index = index;
            }

            return _index;
        };

        this.init();
    }
    
    /**
     * Ϊ��ҳ��һ������¼�������겻��ĳ��Ԫ�ط�Χ��ʱ�򣬴����ص�����
     * @param {string} elementid  Ԫ��id���Ի���һ������left,top��������Եķ�Χֵ����
     * �����ʽ����[
     *     100, //����ҳ�����ľ���
     *     100, //������ҳ��ߵľ���
     *     100, //��
     *     100, //��
     * ] 
     * @param {function} callback  �ص�����
     */
    function OutOfRange( elementid, callback)
    {
        var _this         = this;
        this.element      = typeof elementid === 'string' ? $( '#' + elementid ) : elementid;
        this.guid         = '';
        this.suffix       = 'click.range_';
        this.nameSpace    = '';

        if ( this.element instanceof Array ) {
            //elementidΪ����ʱ
            this.elementRange = {
                min_x: this.element[0],
                min_y: this.element[1],
                max_x: this.element[0] + this.element[2],
                max_y: this.element[1] + this.element[3]
            }
        } else {
            this.elementRange = {
                min_x: this.element.offset().left,
                min_y: this.element.offset().top,
                max_x: this.element.offset().left + this.element[0].offsetWidth,
                max_y: this.element.offset().top + this.element[0].offsetHeight
            };  
        }

        //����Ψһ��GUID
        this.makeGuid = function() {
            var guid = "";
            for (var i = 1; i <= 32; i++) {
                var n = Math.floor(Math.random() * 16.0).toString(16);
                guid += n;
                if ((i == 8) || (i == 12) || (i == 16) || (i == 20)) {
                    guid += "-";
                }
            }
            return this.guid = guid;
        }

        this.unbind = function() {
            $('body').undelegate('', this.nameSpace);
        }

        this.bind = function() {

            //����Ψһ��ʶ�����ռ�
            this.nameSpace = this.suffix + this.makeGuid();

            $( 'body' ).delegate( '', this.nameSpace, function(event) {
                var m = mousePosition( event );
                if ( 
                    m.x < _this.elementRange.min_x || 
                    m.y < _this.elementRange.min_y || 
                    m.x > _this.elementRange.max_x || 
                    m.y > _this.elementRange.max_y 
                ) {
                    return typeof callback === 'function' ? callback(_this.element , event.target, _this) : false;
                }
            });
        }

        //����Ψһ��ʾ�������ռ�
        this.nameSpace += this.makeGuid();

        this.bind();
    }

    function lazyLoad( lazyObj, options )
    {
        //����lazyload.jsģ��
        require('http://www.shejiben.com/gb_js/lazyload.js?20160307');
        var default_options = {
            effect : "fadeIn",
            failurelimit : 200 ,
            threshold : 100
        };

        $.extend( true, default_options, options );
        return lazyObj.lazyload( default_options);  
        
    }

    /**
     * ��ĳ����������첽���أ� 
     * @param  {[type]} obj     htmlԪ�ض���
     * @param  {[type]} options ��������
     */
    function ajaxLoad( obj, options )
    {
        var _this = this;
        if ( typeof obj !== 'object' )
        {
            $.error( 'function ajaxLoad Error : obj is not an object��' );
            return false;
        }
        else
        {
            this._object =  obj ;
        }
        //��ʼ������
        this.settings = {
            url: '', //ajax����url
            type: 'POST', //Ĭ��post����
            data: {}, //�������
            dataType: 'json', //������������
            beforeSend: null, //����֮ǰ�Ļص�����
            success: null, //����ɹ���Ļص�����
            scroll: false, //Ϊfalse��ʾdom������ɺ�����Ϊtrue��ʾ����������Ԫ��λ�ú�ʼ���أ�����ͼƬ�ӳټ���
            offsetTop: 50
        }
        this.status = 0;  //1��ʾ������,0��ʾδ���,2��ʾ�������

        /**
         * ����ajax����
         */
        this.ajaxRequest = function()
        {
            var _this = this;
            if ( this.status != 0 )
            {
                //�����л��Ѽ������
                return false;
            }

            this.status = 1;
            $.ajax({
                url: _this.settings.url,
                type: _this.settings.type,
                dataType: _this.settings.dataType,
                data: _this.settings.data,
                beforeSend : function() {
                    if ( typeof _this.settings.beforeSend === 'function' ) {
                        if ( !_this.settings.beforeSend() ) {
                            //���ü���״̬����ֹ
                            _this.status = 0;
                            return false;
                        }
                    }
                },
                success : function( data ) {
                    if ( typeof _this.settings.success === 'function' ) {
                        _this.settings.success( data );
                        //���ü������״̬
                        _this.status = 2;
                    }
                }
            })          
        }
        $.extend( true, options, this.settings );

        $(document).ready(function() {
            
            if ( typeof _this.settings.scroll !== 'undefined' && _this.settings.scroll === true ) {
                //ҳ����ɺ��������
                var _top = _this._object.offset().top(),
                    _scrollTop = 0;
                $(window).scroll(function() {
                    if ( _this.stauts == 1 )
                    {
                        //�Ѿ��������
                        return false;
                    }

                    _scrollTop = getScrollTop();

                    if ( _top - _scrollTop >= _this.settings.offsetTop )
                    {
                        _this.ajaxRequest();
                    }
                });
            } else {
                //ҳ����ɺ����
                _this.ajaxRequest();
            }
        });
    }

    /**
     * ͼƬ�л�
     * @param  {[object]} param �Զ����������
     */
    function switchImage( param ) {

        this.settings = {
            selectItem: 0,   //��ǰѡ�����
            imageSource: [], //�洢ͼƬ·��������
            defauleItem: 0,  //Ĭ����ʾͼƬ���
            trigger: {},  //������
            triggerType: 'click',  //�����¼�����
            beforeSelect: null,
            onSelect: null,
            defineEvent: null,
            imgContainer: null,  //�����л�ͼƬ������
            selectTrigger: {}
        };

        /**
         * ��ʾָ����ŵ�ͼƬ
         * @param  {[string or int]} index ͼƬ���
         */
        this.showItem = function( index ) {
            index = parseInt( index );
            if ( index && index >= 0 && index <= this.selectItem ) {
                this.settings.selectItem = index;
            }

            this.settings.selectTrigger = this.settings.trigger[this.settings.selectItem];

            if ( typeof this.settings.imgContainer === 'object' ) {
                try {

                    //ִ��ͼƬ�л�ǰ��callback����
                    if ( typeof this.settings.beforeSelect === 'function' ) {
                        this.settings.beforeSelect();
                    }
                    
                    //�滻ͼƬ�����е�src����Ϊ�µ�ͼƬ·��
                    this.settings.imgContainer.attr( 'src', this.settings.imageSource[this.settings.selectItem] );

                    //ִ��ͼƬ�л����callback����
                    if ( typeof this.settings.onSelect === 'function' ) {
                        this.settings.onSelect( this.settings.selectTrigger , this.settings.trigger );
                    }

                } catch (e) {
                    $.error( ' imgContainer is not an object or imageSource was empty ' );
                }
            }
        };

        /**
         * ��һ��
         */
        this.next = function() {
            if ( ++this.settings.selectItem > this.maxItem ) {
                --this.settings.selectItem;
                return false;
            }
            this.showItem();
        };

        /**
         * ��һ��
         */
        this.prev = function() {
            if ( --this.settings.selectItem < 0 ) {
                ++this.settings.selectItem;
                return false;
            }
            this.showItem();
        };

        var _this = this;

        $.extend( true, this.settings, param );

        try {
            //��¼��ǰ�������������ڸ��ص���������
            this.settings.selectTrigger = this.settings.trigger[this.settings.defauleItem];
        } catch (e) {}
        
        this.maxItem = this.settings.imageSource.length ? this.settings.imageSource.length - 1 : 0;
        this.showItem( this.settings.defauleItem );

        if ( this.settings.trigger.length && this.settings.trigger.length == this.settings.imageSource.length ) {
            this.settings.trigger.bind( this.settings.triggerType, function() {

                _this.settings.selectTrigger = this;
                _this.settings.selectItem = _this.settings.trigger.index( $(this) );
                _this.showItem();

            } );
        }
    }

    function getScrollTop() {
        return document.documentElement.scrollTop || window.pageYoffset || document.body.scrollTop;
    }

    function _join( obj )
    {
        var _jquerySelect = '';
        $.each(obj, function(i, n) {
            _jquerySelect += ('#' + n) + ',';
        });
        _jquerySelect = _jquerySelect.substr(0, _jquerySelect.length - 1);
        return _jquerySelect;
    }

    function in_array( value, arr )
    {
        if (!arr || arr.length == 0) return false;
        var flag = false;
        for (var i = 0, j = arr.length; i < j; i++) {
            if (arr[i] == value) {
                flag = true
            }
        };
        return flag
    };

    function mousePosition( event )
    {
        var e = event || window.event;
        return {
            x: e.pageX,
            y: e.pageY
        };
    }

    function makeGuid () {
        var guid = "";
        for (var i = 1; i <= 32; i++) {
            var n = Math.floor(Math.random() * 16.0).toString(16);
            guid += n;
            if ((i == 8) || (i == 12) || (i == 16) || (i == 20)) {
                guid += "-";
            }
        }
        return guid;
    }

    module.exports = {
        switchTab: switchTab,
        SeamlessScroll: SeamlessScroll,
        HorizontalScroll : HorizontalScroll,
        OutOfRange : OutOfRange,
        lazyLoad : lazyLoad,
        ajaxLoad : ajaxLoad,
        switchImage: switchImage,
        calendar: calendar,
        Slider: Slider
    }

});