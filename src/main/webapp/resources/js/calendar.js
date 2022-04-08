

function selectMonth(){// input태그를 통해 입력받는 날짜에 맞는 달력 생성
    let yearMonth = document.getElementById('selectMonth').value;
    let selectYearMonth = new Date(yearMonth);
	$('#monthSalesChart').remove();
    $('#chartDiv').append('<canvas id="monthSalesChart"></canvas>');
	//myChart1.destroy();
    // [선택된 년도 선택된 월 1일 0시 0분 0초]

    changeHead(selectYearMonth);
    buildCalendar(selectYearMonth);
}

function changeHead(selectDate){ // 현재 작성중이 캘린더의 년월을 화면에 표기
    let cc = selectDate.getFullYear()+'년 '+(selectDate.getMonth()+1)+'월';
    //                                           월표기 => 1월:0, 2월:1~~~12월:11
}



function lastDate(selectDate){// 해당 월의 마지막 날짜를 알려주는 함수 => 윤년 계산
    let year = selectDate.getFullYear();
    let month = selectDate.getMonth();

    let monthArr= [31,28,31,30,31,30,31,31,30,31,30,31];

    if(((year%4==0)&&(year%100!=0))||(year%400==0)){
        monthArr[1] = 29;
    }

    return monthArr[month];


}