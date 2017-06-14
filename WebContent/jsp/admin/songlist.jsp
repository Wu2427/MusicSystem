<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title> Music Website |歌单管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">  
<link href="css/font-awesome.css" rel="stylesheet"> 
<script src="js/jquery-2.2.3.min.js"></script> 
<link href="//fonts.googleapis.com/css?family=Aladin" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
</head>
<body>
	<div class="agileinfo-main about-top">  
		<div class="banner"> 
		</div> 
		<div class="agileinfo-header">
			<div class="container">
				<div class="agile-logo">
					<h1><a href="jsp/admin/adminindex.jsp"><i class="fa fa-music bounce bounceIn animated" aria-hidden="true"></i> Music</a></h1>
				</div>
				<div class="agileits-w3layouts-icons">
					<div class="social-icon">
						<a href="jsp/admin/adminLogin.jsp"><i class="glyphicon glyphicon-user"></i></a>
					</div> 
				</div>
				<div class="clearfix"> </div>
			</div>	    
		</div>
		<div class="top-nav">
			<span class="menu">菜单</span>	
		<ul class="w3l">
				<li><a href="jsp/admin/adminindex.jsp"><i aria-hidden="true" class="glyphicon glyphicon-home"></i><span>曲库管理</span></a></li>
				<li><a href="<%=basePath%>lists/findLists"><i class="glyphicon glyphicon-user"></i><span>歌单管理</span></a></li>
				<li><a class="active" href="<%=basePath%>singer/findSinger"><i class="glyphicon glyphicon-list-alt"></i><span>歌手管理</span></a></li>
				<li><a href="<%=basePath%>songview/getAllSongview"><i class="glyphicon glyphicon-picture"></i><span>评论管理</span></a></li>
				<li><a href="<%=basePath%>admin/getAdmin?id=${adminid}"><i class="glyphicon glyphicon-envelope"></i><span>个人中心</span></a></li>
		</ul>
		</div>	
	</div>
	<!-- about -->
	<div class="about agileits">
		<div class="container" style="margin-top: -90px;">
			<div class="about-info">
				<div class="col-md-12 about-grids">
					<div>
						<table class="table table-hover">
							<tbody>
								<td>歌单列表</td>
								<td><a href="#" class="fa fa-arrow-circle-up">上传</a></td>
							</tbody>
							<tr>
								<td><a href="jsp/admin/singleLists.jsp">慢慢等</a></td>
								<td>
									<a href="#" class="glyphicon glyphicon-trash">删除</a><i></i>
									<a href="#" class="glyphicon glyphicon-pencil">修改</a>
								</td>
							</tr>
						</table>
						<nav>
				<ul class="pagination w3-agileits-paging" style="margin-left: 500px;">
					<li class="disabled" >
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">«</span>
						</a>
					</li>
					<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
						<a href="#" aria-label="Next">
							<span aria-hidden="true">»</span>
						</a>
					</li>
				</ul>
			</nav>
					</div>
				</div>
				<div class="clearfix"> </div> 
			</div>	
		</div>	
	</div>
	<!-- //about -->
	<!-- footer start here -->
	<div class="agilebg-footer">
		<div class="footer">
			<div class="container">
				<div class="footer-agileinfo">
					<div class="col-md-3 col-sm-3 footer-wthree-grid">
						<h3>MENU</h3>
						<ul>
							<li><a href="index.html">主页</a></li>
							<li><a href="about.html">About</a></li> 
							<li><a href="blog.html">Blog</a></li>
						</ul>
					</div>
					<div class="col-md-5 col-sm-5 footer-wthree-grid">
						<h3>Latest Tweet</h3>
						<div class="agileits-w3layouts-tweets">  
							<h5><i class="fa fa-twitter" aria-hidden="true"></i> Lorem ipsum</h5> 
						</div>
						<p>Aenean vitae metus sit dolor eu urna viverra semper. Mauris est odio, laoreet laoreet sapien non, sollicitudin bibendum nulla.</p>
					</div>
					<div class="col-md-4 col-sm-4 footer-wthree-grid">
						<h3>Keep In Touch</h3>
					   <div class="ftr-icons">
							<div class="ftr-iblock">
								<span class="glyphicon glyphicon-earphone">  </span>
							</div>
							<div class="ftr-text">
								<p>+333 222 23456</p>
							</div>
							<div class="clearfix"> </div>
					   </div>
					   <div class="ftr-icons">
							<div class="ftr-iblock">
							   <span class="glyphicon glyphicon-envelope">  </span>
							</div>
							<div class="ftr-text">
								<p><a href="mailto:info@example.com">mail@example.com</a></p>
							</div>
							<div class="clearfix"> </div>
					   </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //footer end here -->
	<!-- copy rights start here -->
	<div class="copy-right">
		<div class="container"> 
			<p>© 2017 Rock.   </p>
		</div>
	</div>
	<!-- //copy right end here -->  
	<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script> 
    <script src="js/bootstrap.js"></script>
</body>
</html>