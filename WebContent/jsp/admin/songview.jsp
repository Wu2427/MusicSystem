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
<title>Music Website | 评论管理 </title>
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
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<script type="text/javascript">
	function del(id){
		$.get("<%=basePath%>songview/delSongview?id=" + id,function(data){
			if("success" == data.result){
				alert("删除成功");
				window.location.reload();
			}else{
				alert("删除失败");
			}
		});
	}
</script>
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
				<div class="clearfix"> </div>
			</div>	    
		</div>
		<div class="top-nav">
			<span class="menu">Menu</span>	
			<ul class="w3l">
				<li><a href="jsp/admin/adminindex.jsp"><i aria-hidden="true" class="glyphicon glyphicon-home"></i><span>曲库管理</span></a></li>
				<li><a href="<%=basePath%>lists/findLists"><i class="glyphicon glyphicon-user"></i><span>歌单管理</span></a></li>
				<li><a href="<%=basePath%>singer/findSinger"><i class="glyphicon glyphicon-list-alt"></i><span>歌手管理</span></a></li>
				<li><a class="active" href="<%=basePath%>songview/getAllSongview"><i class="glyphicon glyphicon-picture"></i><span>评论管理</span></a></li>
				<li><a href="<%=basePath%>admin/getAdmin?id=${adminid}"><i class="glyphicon glyphicon-envelope"></i><span>个人中心</span></a></li>
			</ul>
			<script>
			   $( "span.menu" ).click(function() {
				 $( "ul.w3l" ).slideToggle( 300, function() {
				  });
				 });
			</script>
		</div>	
	</div>
	<!-- about -->
	<div class="about agileits">
		<div class="container" style="margin-top: -70px;">
			<div class="about-info">
					<div class="col-md-10 about-grids" style="margin-left: auto;margin-right: auto">
					<div>
						<table class="table table-hover table-striped" style="width: 780px; margin-left: auto;margin-right: auto;">
							<tbody><tr>评论列表</tr></tbody>
							<tr>
								<td style="width: 120px">歌曲名</td>
								<td>发表用户</td>
								<td>评论内容</td>
								<td style="width: 120px">操作</td>
							</tr>
							<c:if test="${!empty findAllList}">
								<c:forEach items="${findAllList}" var="findAllList">
								<tr>
									<td>${findAllList.songname}</td>
									<td>${findAllList.username }</td>
									<td>${findAllList.content}</td>
									<td><i class="glyphicon glyphicon-trash"><a href="javascript:del('${findAllList.id}')">删除</a></i></td>
								</tr>
								</c:forEach>
							</c:if>
						</table>
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
						<h3>导航</h3>
						<ul>
							<li><a href="index.html">主页</a></li>
							<li><a href="about.html">About</a></li> 
							<li><a href="blog.html">Blog</a></li>
							<li><a href="codes.html">Short Codes</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
					<div class="col-md-5 col-sm-5 footer-wthree-grid">
						<h3>Latest Tweet</h3>
						<div class="agileits-w3layouts-tweets">  
							<h5><i class="fa fa-twitter" aria-hidden="true"></i> Lorem ipsum</h5> 
						</div>
						<p>Aenean vitae metus sit amet purus sodales blandit. Nullam ut dolor eu urna viverra semper. Mauris est odio, laoreet laoreet sapien non, sollicitudin bibendum nulla.</p>
					</div>
					<div class="col-md-4 col-sm-4 footer-wthree-grid">
						<h3>Keep In Touch</h3>
						<div class="ftr-icons">
							<div class="ftr-iblock">
								<span class="glyphicon glyphicon-map-marker">  </span>
							</div>
							<div class="ftr-text">
								<p>Proin vel enim nec ipsum finibus. Duis euismod massa ut sem fringilla blandit.</p>
							</div>
							<div class="clearfix"> </div>
					   </div>
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