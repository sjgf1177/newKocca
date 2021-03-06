/**
 * Created by ceo on 2017-10-24.
 */




var concertList = {

    calendar : null
    
    ,listType : 1 //  1 : dately ,  2 : monthly
    ,menuNo : ''
    ,pageIndex : ''
	,siteId : 'testbed'
	,selectedYear : -1
    ,selectedMonth : -1
    ,selectedDate : -1
	,isCardListMode : true


    ,defaultSetting : function( menuNo, pageIndex, siteId, listType, selectedYear, selectedMonth, selectedDate ){
    	
    	this.menuNo = isNaN( parseInt( menuNo ) ) || !parseInt( menuNo ) ? '' : parseInt( menuNo );
    	
    	this.pageIndex = isNaN( parseInt( pageIndex ) ) || !parseInt( pageIndex ) ? 1 : parseInt( pageIndex );
    	this.listType = isNaN( parseInt( listType ) ) || !parseInt( listType ) ? 1 : parseInt( listType );
    	this.siteId = siteId == 'undefined' || !siteId ? 'testbed' : siteId; 
    	
    	this.selectedYear = isNaN( parseInt( selectedYear ) ) || !parseInt( selectedYear ) ? null : parseInt( selectedYear );
    	this.selectedMonth = isNaN( parseInt( selectedMonth ) ) || !parseInt( selectedMonth ) ? 0 : parseInt( selectedMonth );
    	this.selectedDate = isNaN( parseInt( selectedDate ) ) || !parseInt( selectedDate ) ? -1 : parseInt( selectedDate );
    	
        this.registEvent();
        this.init();
    }



    ,registEvent : function(){
        var _this = this;

        $("[data-concertlist-month]").on("click", function(){
            _this.calendar.selectedMonth = $( this).attr( "data-concertlist-month" );
            _this.setDate();
        })
        $("[data-concertlist-month]").on("keydown", function(key){
        	if(key.keyCode == 13){
	            _this.calendar.selectedMonth = $( this).attr( "data-concertlist-month" );
	            _this.setDate();
        	}
        })

        $("[data-concertlist-type]").on("click", function(){
            _this.listType = $(this).attr( "data-concertlist-type" );

            if( _this.listType == 2 && _this.calendar.selectedDate == 0 ){
                if( _this.isCardListMode == false ){
                    _this.isCardListMode = true;
                    _this.hideCardList();
                }


            }else{
                if( _this.isCardListMode == true ){
                    _this.isCardListMode = false;
                    _this.showCardList();
                }

            }

            _this.setDate();
        })
        $("[data-concertlist-type]").on("keydown", function(key){
        	if(key.keyCode == 13){
	            _this.listType = $(this).attr( "data-concertlist-type" );
	
	            if( _this.listType == 2 && _this.calendar.selectedDate == 0 ){
	                if( _this.isCardListMode == false ){
	                    _this.isCardListMode = true;
	                    _this.hideCardList();
	                }
	
	
	            }else{
	                if( _this.isCardListMode == true ){
	                    _this.isCardListMode = false;
	                    _this.showCardList();
	                }
	
	            }
	
	            _this.setDate();
        	}
        })


        // ?????? ????????? ?????? ?????????
        $("#filterMonthlyYearSelect").on("change", function(){
            _this.calendar.selectedYear = $(this).val();
            _this.setDate();
        })


        // ?????? ????????? ??? ?????????
        $("#filterDatelyMonthSelect").on("change", function(){
            _this.calendar.selectedMonth = $(this).val();
            _this.setDate();
        })

        // ?????? ????????? ?????? ?????????
        $("#filterDatelyYearSelect").on("change", function(){
            _this.calendar.selectedYear = $(this).val();
            _this.setDate();
        })
    }


    ,showCardList : function(){
        $("#cardListView").show();
        $("#monthlyListView").hide();
    }

    ,hideCardList : function(){
        $("#cardListView").hide();
        $("#monthlyListView").show();
    }


    ,init : function(){

        var _this = this;


        if( !this.calendar ){

            this.calendar = new Calendar();

            this.calendar.container = $(".movie_plan_calendar_view_con")[0];

            this.calendar.setRenderSelector(
                ".cal_row" // weekTrTemplateSelector
                , ".calendar_date" // search in week : dateNumSelector
                , "tbody" //parentSelector
                , "active" //todayClass
            );


            // ????????? ??????????????? ???
            this.calendar.onSelect( function( year , month, date, target ){
                _this.setDate();
            })


            // defaultSetting
            var year = this.calendar.selectedYear;
            var month = this.calendar.selectedMonth;
            var date = this.calendar.selectedDate;
            
            if( this.selectedYear != -1 ) year = this.selectedYear;
            if( this.selectedMonth != -1 ) month = this.selectedMonth;
            if( this.selectedDate != -1 ) date = this.selectedDate;
            
            this.calendar.selecteDate( date, month, year );
        }


        this.setDate( true );
    }



    ,setDate : function( isInit ){

        if( this.listType == 1 ){
            if( this.calendar.selectedMonth == 0 ){
                this.calendar.selectedMonth = 1;
            }

            // ?????? ????????? ??????
            $("#filterDatelyYearSelect option[value='"+this.calendar.selectedYear+"']").prop("selected", "true");
            $("#filterDatelyMonthSelect option[value='"+this.calendar.selectedMonth+"']").prop("selected", "true");

            // ?????? - ?????????
            $(".movie_plan_calendar_wrap").removeClass("active");
            $(".movie_calendar_year").text( this.calendar.selectedYear + "??? " + this.calendar.selectedMonth + "??? "  + this.calendar.selectedDate + "???" );
            $(".movie_calendar_date_color").text( this.calendar.selectedDate );
            $(".movie_calendar_date_text").text( "???" );

            this.calendar.selecteDate( this.calendar.selectedDate, this.calendar.selectedMonth, this.calendar.selectedYear );
            this.calendar.render();

        }else{

            // ?????? ??????????????? ??????
            $("#filterMonthlyYearSelect option[value='"+this.calendar.selectedYear+"']").prop("selected", "true");
            $("[data-concertlist-month='"+this.calendar.selectedMonth+"']").addClass( "active" );

            // ?????? - ????????????
            $("[data-concertlist-month]").removeClass("active");
            $("[data-concertlist-month='"+this.calendar.selectedMonth+"']").addClass( "active" );

            $(".movie_plan_calendar_wrap").addClass("active");
            if( this.calendar.selectedMonth == 0 ){
                $(".movie_calendar_year").text( this.calendar.selectedYear + "??? ");
                $(".movie_calendar_date_color").text( "??????" );
                $(".movie_calendar_date_text").text( "" );
            }else{
                $(".movie_calendar_year").text( this.calendar.selectedYear + "??? " + this.calendar.selectedMonth + "???");
                $(".movie_calendar_date_color").text( this.calendar.selectedMonth );
                $(".movie_calendar_date_text").text( "???" );
            }
        }


        if( this.listType == 2 && this.calendar.selectedMonth == 0 ){
            var mm = "";
            var rowSpan = 1;
            var startCell = null;
            var prevMonth=0, prevDate= 0, prevRow;
            $("[data-concert-month]").each(function(){
                var currentMonth = $(this).attr( "data-concert-month" );
                var currentDate = $(this).attr( "data-concert-date" );

                // ????????????
                if( prevMonth == currentMonth && prevDate == currentDate && prevRow ){
                    $(prevRow).find(".monthly_desc").append(", ");
                    $(prevRow).find(".monthly_desc").append( $(this).find(".quick_btn") )
                    $(this).remove();
                    return;
                }else{
                    prevRow = this;
                    prevMonth = currentMonth;
                    prevDate = currentDate;
                }
            })

            $("[data-concert-month]").each(function(){
                var currentMonth = $(this).attr( "data-concert-month" );

                // ?????? ??????.
                if( currentMonth != mm ){
                    if( startCell ){
                        $(startCell).attr( "rowSpan", rowSpan );
                    }

                    mm = currentMonth;
                    startCell = $(this).find(".monthly_title");
                    rowSpan = 1;
                }else{
                    rowSpan++;
                    $(this).find(".monthly_title").remove();
                }
            })
            
            if( startCell ){
                $(startCell).attr( "rowSpan", rowSpan );
            }
        }

        
        if( !isInit ){ // ???????????? ???????????? ????????? ????????? ?????????.
        	
        	var year, month, date;
        	year = this.calendar.selectedYear;
        	month = this.calendar.selectedMonth;
        	date = this.calendar.selectedDate;
        	
        	// ?????? ????????? ?????? ????????? ???????????? ??????.
        	if( this.listType == 2 ){
        		date = "";
        	}
        	
        	// ?????? ?????? ???????????? ?????? ?????? ?????? ???????????? ??????.
        	if( this.calendar.selectedMonth == 0 ){
        		month = "";
        	}
        	
        	location.href = "/"+this.siteId+"/concert/info/rentList.do?menuNo="+ this.menuNo + "&pageIndex="+ 1 + "&siteId="+ this.siteId + "&listType=" + this.listType + "&selectedYear=" + year + "&selectedMonth=" + month + "&selectedDate=" + date;
        }
        
    }




    ,removeEvent : function(){

    }

    ,destroy : function(){
        this.removeEvent();


    }
}




// view_by_date_calendar_icon ?????? ??? calendar_style_1_wrap ??? active??????, ?????? ??? ??????????????? ?????? ????????? ?????? ?????? active ?????? ???????????? ??????
// view_by_date_calendar_text ??? calendar_style_1_wrap ?????? ?????? table????????? ?????? value??? ??????
// movie_plan_calendar_wrap ??? active??? ???????????? data-concertlist-month??? ?????? 0??? ?????? ????????? ??? movie_plan_monthly_list ??? ????????? movie_plan_orderby_list??? display:none;
// data-concertlist-month??? 0??? ?????? ?????? ?????? ????????? ?????? movie_plan_monthly_list??? ???????????? movie_plan_orderby_list??? display:block; ???????????? ??????