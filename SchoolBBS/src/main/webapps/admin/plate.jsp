<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增板块</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<!-- <div class="container">
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#plate">按钮</button> -->

	<div class="modal fade" id="plate" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content col-md-10 col-md-offset-1">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title text-center" id="exampleModalLabel">新增板块</h3>
					<p class="text-center">有意思的板块名可以吸引更多的帖子</p>
				</div>
				<div class="modal-body">
					<form id="addPlate">
						<p class="text-muted">板块名：</p>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="取一个板块名吧"
								id="bname" name="bname" required>
						</div>
						<div class="text-success text-center" id="plateSuccess"
							style="position: relative; top: 0px; font-size: 10px;"></div>
						<div class="text-danger text-center" id="plateExit"
							style="position: relative; top: 0px; font-size: 10px;"></div>

						<div class="modal-footer">
							<button type="reset" class="btn btn-default">清空</button>
							<button type="submit" class="btn btn-primary">确定</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	//页面的跳转
	function go(){ 
		window.location.href="${APP_PATH}/admin/index.jsp";
	} 
	//登录验证
	$("#addPlate").submit(function(){
        //获取板块名
        var bname = $("#bname").val();//输入的用户名
        
        //调ajax
        $.ajax({            
            url:"${APP_PATH}/plateController/setPlate",
            data:{bname:bname},
            type:"POST",
            dataType:"text",
            success: function(data){
                    if(data.trim()=="OK")//要加上去空格，防止内容里面有空格引起错误。
                    {
                    	var str = "板块新增成功";
        				/* 显示提示信息 */
        				document.getElementById("plateSuccess").innerHTML = str;
                        setTimeout(go, 500);//0.5秒后页面跳转
                    }
                    else
                    {
                    	var str = "该板块名已存在！";
        				/* 显示提示信息 */
        				document.getElementById("plateExit").innerHTML = str;
                    }
                }
            });
        
       		document.getElementById("plateExit").innerHTML = "";
        	return false;
		});
	</script>
</body>
</html>