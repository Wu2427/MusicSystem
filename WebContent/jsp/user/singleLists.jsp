<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>Music Website |查看单个歌单的全部歌曲</title>
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
</head>
<body>
	<!-- banner start here -->
	<div class="agileinfo-main about-top">  
		<div class="banner"> 
		</div> 
		<div class="agileinfo-header">
			<div class="container">
				<div class="agile-logo">
					<h1><a href="jsp/user/index.jsp"><i class="fa fa-music bounce bounceIn animated" aria-hidden="true"></i> Music</a></h1>
				</div>
				<div class="clearfix"> </div>
			</div>	    
		</div>
		<div class="top-nav">
			<span class="menu">Menu</span>	
			<ul class="w3l">
				<li><a href="jsp/user/index.jsp"><i
						aria-hidden="true" class="glyphicon glyphicon-home"></i><span>发现音乐</span></a></li>
				<li><a href="<%=basePath%>userlists/getAllUserLists"><i
						class="glyphicon glyphicon-user"></i><span>我的音乐</span></a></li>
				<li><a href="<%=basePath%>singer/getAllSinger"><i
						class="glyphicon glyphicon-list-alt"></i><span>歌手</span></a></li>
				<li><a href="<%=basePath%>song/getAllSong"><i
						class="glyphicon glyphicon-picture"></i><span>所有音乐</span></a></li>
				<li><a href="<%=basePath%>user/getUser?id=${userid}"><i
						class="glyphicon glyphicon-envelope"></i><span>个人中心</span></a></li>
			</ul>
			<script>
			   $( "span.menu" ).click(function() {
				 $( "ul.w3l" ).slideToggle( 300, function() {
				  });
				 });
			</script>
		</div>	
	</div>
	<!-- //navigation end here --> 
	<!-- single -->
	<div class="single">
		<div class="container">
			<div class="wthree_single_grid">
				<h2> </h2>
				<ul>
					<%-- <li><span class="fa fa-user" aria-hidden="true"></span>${findLists.listname }</li> --%>
				</ul>
			</div>
			<div class="wthree_single_grid1" style="margin-left: auto;margin-right: auto; width: 780px;margin-bottom: 100px"><br />
				<table class="table table-striped table-hover" >
					<tbody>
						<td>歌曲标题</td>
						<td></td>
						<td>歌手名字</td>
					</tbody>
					<c:if test="${!empty findLists }">
				<c:forEach items="${findLists}" var="lists">
					<tr>
						<td><a href="<%=basePath%>song/selectOneSong?id=${lists.songid}">${lists.songname }</a></td>
						<td><audio src="${lists.music}" controls="controls"></audio></td>
						<td><a href="<%=basePath%>singer/selectOneSinger?singerid=${lists.singerid}">${lists.singername }</a></td> 
					</tr>
					</c:forEach>
				</c:if>
				</table>
			</div> 
		</div>
	</div>
	<!-- //single -->  
	<!-- footer start here -->
	<div class="agilebg-footer">
		<div class="footer">
			<div class="container">
				<div class="footer-agileinfo">
					<div class="col-md-3 col-sm-3 footer-wthree-grid">
						<h3>Navigation</h3>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="userSonglist.html">About</a></li> 
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
					<div class="clearfix"> </div>		
				</div>
			</div>
		</div>
	</div>
	<!-- //footer end here -->
	<!-- copy rights start here -->
	<div class="copy-right">
		<div class="container"> 
			<p>© 2017 Rock.  </p>
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