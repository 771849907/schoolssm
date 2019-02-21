<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Home</title>
<!-- for-mobile-apps -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${APP_PATH}/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- gallery -->
<link rel="stylesheet" href="${APP_PATH}/static/css/lightGallery.css" type="text/css" media="all" />
<!-- //gallery -->
<link rel="stylesheet" href="${APP_PATH}/static/css/flexslider.css" type="text/css" media="screen" />
<!-- font-awesome icons -->
<link rel="stylesheet" href="${APP_PATH}/static/css/font-awesome.min.css" type="text/css" media="all"/>
<!-- //font-awesome icons -->
<link href="http://fonts.googleapis.com/css?family=Cabin+Condensed:400,500,600,700" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- js -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<!-- //js -->
<!-- banner -->
	<div class="banner">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav class="link-effect-3" id="link-effect-3">
						<ul class="nav navbar-nav w3-agileits_home_nav">
							<li class="active">
								<a class="link link--yaku scroll" href="#Headline">
									<span>校</span><span>园</span><span>头</span><span>条</span>					
								</a>
							</li>
							<li>
								<a class="link link--yaku scroll" href="#Department">
									<span>校</span><span>园</span><span>院</span><span>系</span>				
								</a>
							</li>
							<li>
								<a class="link link--yaku scroll" href="#Building">
									<span>校</span><span>园</span><span>教</span><span>学</span><span>地</span><span>点</span>				
								</a>
							</li>
							<li>
								<a class="link link--yaku scroll" href="#Landscape">
									<span>校</span><span>园</span><span>风</span><span>光</span>				
								</a>
							</li>
							<li>
								<a class="link link--yaku scroll" href="#Teacher">
									<span>校</span><span>园</span><span>师</span><span>资</span>					
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</nav>
			<div class="w3layouts_banner_info">
				<section class="wrapper agileits-w3layouts_wrapper_home">
					<h2>校园社交平台</h2>
					<div class="sentence">
						<div class="popEffect">
							<span>精勤</span>
							<span>博学</span>
							<span>学以</span>
							<span>致用</span>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
<!-- //banner -->
<!-- Headline -->
	<div id="Headline" class="Headline">
		<div class="container">
			<div class="col-md-7 w3_agileits_Headline_left">
				<img src="${APP_PATH }/static/img/1.jpg" alt=" " class="img-responsive" />
			</div>
			<div class="col-md-3 w3_agileits_Headline_right">
				<div class="w3_agileits_Headline_right_pos">
					<h3>校园头条</h3>
					<h4>我校学科竞赛荣获一等奖</h4>
					<p>2014年以来，在各类大学生学科竞赛中，获得国家级1、2、3等奖38项，省级一等奖35项。而今年高等数学再次荣获佳绩。</p>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //Headline -->
<!-- banner-text -->
	<div class="banner-text w3-agile-banner-text">
		<div class="container">
			<h3>知识改变命运</h3>
		</div>
	</div>
<!-- //banner-text -->
<!-- Department -->
	<div class="Department" id="Department">
		<div class="container">
			<h3 class="wthree_head"><i class="fa fa-book" aria-hidden="true"></i><span>校园</span>院系</h3>
			<div class="agileinfo_Department_grids">
				<div class="col-md-4 agileinfo_Department_grid">
					<div class="agileinfo_Department_grid_left">
						<h4>计算机科学与技术系</h4>
					</div>
					<div class="agileinfo_Department_grid_right">
						<h4>01.</h4>
					</div>
					<div class="clearfix"> </div>
					<p>软件技术、计算机网络技术、计算机网络与安全管理、嵌入式技术与应用、数据库管理与开发等八个专业</p>
				</div>
				<div class="col-md-4 agileinfo_Department_grid">
					<div class="agileinfo_Department_grid_left">
						<h4>商务管理系</h4>
					</div>
					<div class="agileinfo_Department_grid_right">
						<h4>02.</h4>
					</div>
					<div class="clearfix"> </div>
					<p>财务管理、工商管理（含台湾班）、市场营销（含台湾班）三个本科专业</p>
				</div>
				<div class="col-md-4 agileinfo_Department_grid">
					<div class="agileinfo_Department_grid_left">
						<h4>信息管理与工程系</h4>
					</div>
					<div class="agileinfo_Department_grid_right">
						<h4>03.</h4>
					</div>
					<div class="clearfix"> </div>
					<p>电子商务和物流管理两个本科专业，电子商务、物流管理、企业资源计划与管理三个专科专业</p>
				</div>
				<div class="col-md-4 agileinfo_Department_grid">
					<div class="agileinfo_Department_grid_left">
						<h4>数字艺术系</h4>
					</div>
					<div class="agileinfo_Department_grid_right">
						<h4>04.</h4>
					</div>
					<div class="clearfix"> </div>
					<p>视觉传达设计、计算机多媒体技术、产品外观设计、动漫设计与制作、游戏制作、室内设计、建筑景观设计七个专业</p>
				</div>
				<div class="col-md-4 agileinfo_Department_grid">
					<div class="agileinfo_Department_grid_left">
						<h4>国际教育学院</h4>
					</div>
					<div class="agileinfo_Department_grid_right">
						<h4>05.</h4>
					</div>
					<div class="clearfix"> </div>
					<p>为学校二级学院，下设英语系、日语系两个教学系部和一个综合办公室，集成教学管理、学生管理、行政与就业等工作职能</p>
				</div>
				<div class="col-md-4 agileinfo_Department_grid">
					<div class="agileinfo_Department_grid_left">
						<h4>国际合作部</h4>
					</div>
					<div class="agileinfo_Department_grid_right">
						<h4>06.</h4>
					</div>
					<div class="clearfix"> </div>
					<p>负责国际合作与交流工作、联合培养、留学生项目的拓展实施，负责港澳台事务、留学生、联合培养学生的教学与管理及教学部门对外国教师的聘任和工作安排</p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //Department -->
<!-- Building -->
	<div id="Building" class="Building">
		<div class="container">
			<h3 class="wthree_head wthree_head1"><i class="fa fa-users" aria-hidden="true"></i><span>校园</span>教学地点</h3>
			<div class="agileits_Building_grids">
				<div class="col-md-4 agileits_Building_grid">
					<div class="agileits_Building_grid_figure">
						<img src="${APP_PATH }/static/img/1.png" alt=" " class="img-responsive" />
					</div>
					<div class="clearfix"> </div>
					<h4><span>AB栋教学楼</span></h4>
					<p>A栋和B栋教学楼虽然独立但又互相连接，位于星光大道尽头</p>
				</div>
				<div class="col-md-4 agileits_Building_grid">
					<div class="agileits_Building_grid_figure">
						<img src="${APP_PATH }/static/img/14.jpg" alt=" " class="img-responsive" />
					</div>
					<div class="clearfix"> </div>
					<h4><span>C栋教学楼</span></h4>
					<p>位于体育馆附近</p>
				</div>
				<div class="col-md-4 agileits_Building_grid">
					<div class="agileits_Building_grid_figure">
						<img src="${APP_PATH }/static/img/3.png" alt=" " class="img-responsive" />
					</div>
					<div class="clearfix"> </div>
					<h4><span>EF栋教学楼</span></h4>
					<p>E栋和F栋教学楼虽然独立但又互相连接，是最新的教学楼，离新生宿舍比较近</p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //Building -->
<!-- Landscape -->
	<div id="Landscape" class="Landscape_main">
		<div class="container">
			<h3 class="wthree_head"><i class="fa fa-picture-o" aria-hidden="true"></i><span>校园</span>风光</h3>
			<div class="w3l_Landscape_grids">
				<ul class="w3l_Landscape_grid gallery" id="lightGallery">
					<li data-title="图书馆" data-desc="这是在广东东软学院的图书馆" data-src="${APP_PATH }/static/img/9.jpg" data-responsive-src="${APP_PATH }/static/img/9.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/9.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>图书馆</h3>
								 	<p>这  是  在  广  东  东  软  学  院  的  一  个  图  书  馆， 平  常  师  生  可  以  里  面  学  习。 点  击  图  片  可  以  查  看  大  图。  </p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="AB栋" data-desc="这是在广东东软学院的AB栋" data-src="${APP_PATH }/static/img/5.jpg" data-responsive-src="${APP_PATH }/static/img/5.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/5.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>AB栋</h3>
									<p>这  是  在  广  东  东  软  学  院  的  两  座  相  连  的  教  学  楼。 平  常  师  生  可  以  在  里  面  上  课。 点  击  图  片  可  以  查  看  大  图。</p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="C栋" data-desc="这是在广东东软学院的C栋" data-src="${APP_PATH }/static/img/7.jpg" data-responsive-src="${APP_PATH }/static/img/7.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/7.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>C栋</h3>
									<p>这  是  在  广  东  东  软  学  院  的  一  座  教  学  楼。 平  常  师  生  可  以  在  里  面  上  课。 点  击  图  片  可  以  查  看  大  图。</p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="D栋" data-desc="这是在广东东软学院的D栋" data-src="${APP_PATH }/static/img/17.jpg" data-responsive-src="${APP_PATH }/static/img/17.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/17.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>D栋</h3>
									<p>这  是  在  广  东  东  软  学  院  的  一  座  教  学  楼。 平  常  社  团  组  织  可  以  在  里  面  办  公  值  班。 点  击  图  片  可  以  查  看  大  图。</p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="EF栋" data-desc="这是在广东东软学院的EF栋" data-src="${APP_PATH }/static/img/16.jpg" data-responsive-src="${APP_PATH }/static/img/16.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/16.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>EF栋</h3>
									<p>这  是  在  广  东  东  软  学  院  的  两  座  相  连  的  教  学  楼。 平  常  师  生  可  以  在  里  面  上  课。 点  击  图  片  可  以  查  看  大  图。</p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="宿舍" data-desc="这是在广东东软学院的宿舍" data-src="${APP_PATH }/static/img/10.jpg" data-responsive-src="${APP_PATH }/static/img/10.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/10.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>宿舍</h3>
									<p>这  是  在  广  东  东  软  学  院  的  宿  舍。 宿  舍  分  为  新  生  宿  舍  和  老  生  宿  舍  平  常  学  生  没  课  的  时  候  在  里  面  学  习  休  息。 点  击  图  片  可  以  查  看  大  图。</p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="行政楼" data-desc="这是在广东东软学院的行政楼" data-src="${APP_PATH }/static/img/15.jpg" data-responsive-src="${APP_PATH }/static/img/15.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/15.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>行政楼</h3>
									<p>这  是  在  广  东  东  软  学  院  的  行  政  楼。 平  常  老  师  可  以  在  里  面  办  公。 点  击  图  片  可  以  查  看  大  图。</p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="操场" data-desc="这是在广东东软学院的操场" data-src="${APP_PATH }/static/img/6.jpg" data-responsive-src="${APP_PATH }/static/img/6.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/6.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>操场</h3>
									<p>这  是  在  广  东  东  软  学  院  的  操  场。 平  常  师  生  可  以  在  里  面  进  行  运  动。 点  击  图  片  可  以  查  看  大  图。</p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="风景湖" data-desc="这是在广东东软学院的风景湖" data-src="${APP_PATH }/static/img/18.jpg" data-responsive-src="${APP_PATH }/static/img/18.jpg"> 
						<div class="w3_w3l_Landscape_grid box">
							<a href="#">
								<img src="${APP_PATH }/static/img/18.jpg" alt=" " class="img-responsive" /> 
								<div class="caption scale-caption">
									<h3>风景湖</h3>
									<p>这  是  在  广  东  东  软  学  院  的  旁  边  的  水  库  风  景  非  常  漂  亮。 平  常  还  有  一  些  鸟  类  在  这  里。 点  击  图  片  可  以  查  看  大  图</p>
								</div>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${APP_PATH}/static/js/lightGallery.js"></script>
	<script>
    	 $(document).ready(function() {
			$("#lightGallery").lightGallery({
				mode:"fade",
				speed:800,
				caption:true,
				desc:true,
				mobileSrc:true
			});
		});
    </script>
<!-- //Landscape -->
<!-- Teacher -->
	<div id="Teacher" class="Teacher">
		<div class="container">
			<h3 class="wthree_head wthree_head1"><i class="fa fa-quote-right" aria-hidden="true"></i>师资力量</h3>
			<div class="w3_Teacher_grids">
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="col-md-7 w3_Teacher_grid_left">
									<p>杨利，广东东软学院创校和现任院长、党委副书记，国防科技大学计算机博士，东北大学博士后，教授，硕士生导师 。师从中国著名的计算机科学家、中国科学院院士、"银河-II" 巨型计算机总设计师周兴铭院士和东北大学副校长、东软集团董事长兼CEO刘积仁博士;2014年经国务院批准享受政府特殊津贴。</p>
								</div>
								<div class="col-md-5 w3_Teacher_grid_right">
									<img src="${APP_PATH}/static/img/11.jpg" alt=" " class="img-responsive" />
								</div>
								<div class="clearfix"> </div>
							</li>
							<li>
								<div class="col-md-7 w3_Teacher_grid_left">
									<p>刘积仁，是中国计算机行业发展的缔造者与见证者之一，是中国培养的第一位计算机应用专业博士，也是中国第一家软件上市公司东软的创办者。作为东软集团董事长，他领导着2万名员工，2007年营收达到33.5亿元，其国际业务已经占公司整体业务的30%，其离岸外包业务收入占中国离岸外包总收入的6.7%。</p>
								</div>
								<div class="col-md-5 w3_Teacher_grid_right">
									<img src="${APP_PATH}/static/img/12.png" alt=" " class="img-responsive" />
								</div>
								<div class="clearfix"> </div>
							</li>
						</ul>
					</div>
				</section>
				<!-- flexSlider -->
					<script defer src="${APP_PATH}/static/js/jquery.flexslider.js"></script>
					<script type="text/javascript">
					$(window).on('load',function(){
					  $('.flexslider').flexslider({
						animation: "slide",
						start: function(slider){
						  $('body').removeClass('loading');
						}
					  });
					});
				  </script>
				<!-- //flexSlider -->
			</div>
		</div>
	</div>
<!-- //Teacher -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="agileits_w3layouts_footer_grids">
				<div class="col-md-4 agileits_w3layouts_footer_grid">
					<h3>如有问题</h3>
					<ul>
						<li><span>我的手机 ： 13286879448</span></li>
					</ul>
				</div>
				<div class="col-md-4 agileits_w3layouts_footer_grid">
					<h3>请使用以下方式</h3>
					<p><i>我的QQ ： 771849907</i></p>
				</div>
				<div class="col-md-4 agileits_w3layouts_footer_grid">
					<h3>联系我们</h3>
					<ul>
						<li><span>我的Email :</span>771849907@qq.com</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="w3_agileits_footer_grids">
				<div class="col-md-4 w3_agileits_footer_grid">
					<p>如果有想加入我们一起开发项目请在右边发送你的邮箱给我们，我们会回复邮件告诉你如何加入</p>
				</div>
				<div class="col-md-4 w3_agileits_footer_grid">
					<h3>我们的工作时间</h3>
					<h4>北京时间</h4>
					<ul>
						<li><span>工作日: </span> 9:00 AM to 5:00PM</li>
						<li><span>休息日: </span> 不上班</li>
					</ul>
				</div>
				<div class="col-md-4 w3_agileits_footer_grid">
					<h3>发送你的邮箱加入我们</h3>
					<form action="#" method="post">
						<input type="email" name="Email" placeholder="Email" required="">
						<input type="submit" value=" ">
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //footer -->
<!-- for bootstrap working -->
	<script src="${APP_PATH}/static/bootstrap/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="${APP_PATH}/static/js/move-top.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>