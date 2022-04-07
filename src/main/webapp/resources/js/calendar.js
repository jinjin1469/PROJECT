window.onload = function(){// 화면이 로드된 후 자동으로 실행되는 영역 =>현재 시스템 날짜에 맞는 달력 생성
    let now = new Date(); // 2021년 12월 23일 오후 5시 25분~~~ => [2021년 12월 1일(1일에 해당하는 요일 )] 
    let nowMonth = new Date(now.getFullYear(),now.getMonth());
    // [2021년 12월 1일(1일에 해당하는 요일 )0시 0분 0초] 

    changeHead(nowMonth);
    buildCalendar(nowMonth);
}

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

function buildCalendar(selectDate){// 실제 달력을 작성하는 함수
	let Cnt = [];
    let monthLastDay = lastDate(selectDate);//해당 월의 마지막 날짜 정보
    let weekInfo = selectDate.getDay();  // 해당월의 1일의 요일 : 일(0),월(1)~~토(6)   수:3
    let dateCnt = selectDate.getDate()-weekInfo;     // 날짜를 찍어줄 번호  (1,2,3,4,~~~~31)
                // 1일이 있는 주에서 일요일에 해당하는 시작 번호
    while(true){
        let weekLine = document.createElement('tr');  // 각 주 정보(행)     <tr></tr>
            let weekDay = document.createElement('td');        // <td></td>
            if(0<dateCnt && dateCnt<=monthLastDay ){   //  1일부터 마지막날까지 출력하기 위한 조건
				Cnt.push(dateCnt);
            }
            dateCnt++;
        if(dateCnt>monthLastDay){   //날짜 카운트가 달의 마지막 날을 넘어선 경우
            break;
        }
    }
monthSalesChart(Cnt);
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