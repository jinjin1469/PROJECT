<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
	<style>
        .id_ok{color:#fff; display: none;}
        .id_already{color:#6A82FB; display: none;}
    </style>

<body>
<input type="text" id = "id" name="id" placeholder="your id" autocomplete="username" required oninput = "checkId()" /> 
<span class="id_ok">사용 가능한 아이디입니다.</span>
<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
    

<script type="text/javascript">
        function checkId(){
            var id = $('#id').val();
        $.ajax({
            url:'/user/idCheck',
            type:'post',
            dataType:"json",
            data:{'id':id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };
    </script>

</body>
</html>