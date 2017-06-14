<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>Music Website|用户首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/font-awesome.css" rel="stylesheet">
<script src="js/jquery-2.2.3.min.js"></script>
<link href="fonts/fontawesome-webfont.eot" rel="stylesheet">
<link href="fonts/fontawesome-webfont.svg" rel="stylesheet">
<link href="fonts/fontawesome-webfont.ttf" rel="stylesheet">
<link href="fonts/fontawesome-webfont.woff" rel="stylesheet">
<link href="fonts/FontAwesome.otf" rel="stylesheet">
<link href="fonts/glyphicons-halflings-regular.woff" rel="stylesheet">
<link href="fonts/glyphicons-halflings-regular.woff2" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Aladin" rel="stylesheet">
<link href="fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
function load(){
	$.ajax({
		type:"GET",
		url:"<%=basePath%>song/findSortSong",
		success:function(data){
			var temp='';
			for(var i=0;i<data.length;i++){
				for(var attr in data[i]){
					if(attr === "id"){
						temp+="<tr>"+
						"<td>"+"<a href="+"'"+"<%=basePath%>song/selectOneSong?id="+data[i][attr]+"'"+">";
					}
					if(attr === "songname"){
						temp+=data[i][attr]+"</a>&nbsp;&nbsp; "+
							"</td>";
					}
				}
			}
			$("#songList").after(temp);
		}
	});
	
	$.ajax({
		type:"GET",
		url:"<%=basePath%>singer/findSortSinger",
		success:function(data){
			var singer='';
			for(var i=0;i<data.length;i++){
				for(var attrs in data[i]){
					if(attrs === "singerid"){
						singer+="<tr>"+ 
						   "<td>"+
							   "<a href="+"'"+"<%=basePath%>singer/selectOneSinger?singerid="+data[i][attrs]+"'"+">";
					}
					if(attrs === "singername"){
						singer+=data[i][attrs]+"</a>&nbsp;&nbsp; "+
							"</td>"+
					       "</tr>";
					}
				}
			}
			$("#singerList").after(singer);
		}
	});
	
	$.ajax({
		type:"GET",
		url:"<%=basePath%>lists/findSortLists",
		success:function(data){
			var temp='';
			for(var i=0;i<data.length;i++){
				for(var attr in data[i]){
					if(attr === "id"){
						temp+="<tr>"+ 
						   "<td>"+
							   "<a href="+"'"+"<%=basePath%>songlist/getSongList?listid="+data[i][attr]+"'"+">";
					}
					if(attr === "listname"){
						temp+=data[i][attr]+"</a>&nbsp;&nbsp;"+
							"</td>"+
					       "</tr>";
					}
				}
			}
			//alert(temp);
			$("#lists").after(temp);
		}
	});
}
</script>
</head>
<body onload="load()">
	<div class="agileinfo-main about-top">
		<div class="banner"></div>
		<div class="agileinfo-header">
			<div class="container">
				<div class="agile-logo">
					<h1>
						<a href="jsp/user/index.jsp">
						<i class="fa fa-music bounce bounceIn animated" aria-hidden="true"></i>
							Music</a></h1>
				</div>
				<div>
					<div class="agileits-w3layouts-icons">
					 <div class="btn-group" style="margin-right: 10px">
						<button type="button" class="btn btn-default dropdown-toggle" 
								data-toggle="dropdown">
							<i class="glyphicon glyphicon-user"></i><span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="jsp/user/loginUser.jsp">登录</a></li>
							<li><a href="<%=basePath%>user/logout">注销</a></li>
							<li class="divider"></li>
							<li><a href="jsp/admin/adminLogin.jsp">管理员登录</a></li>
						</ul>
						</div>
					</div>
				</div>
				<input type="hidden"  value="${userid }">
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="top-nav">
			<span class="menu">菜单</span>
			<ul class="w3l">
				<li><a class="active" href="jsp/user/index.jsp"><i
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
		</div>
	</div>
	<!-- about -->
	<div class="about agileits">
		<div class="container" style="margin-top: -90px;">
		<div class="about-info">
				<div style="float: left; margin-left: auto; margin-right: auto;"
					class="col-md-4" >
					<table class="table table-hover table-striped">
						<tbody>&nbsp;&nbsp;榜单</tbody>
						<tbody id="songList">
							<tr>
								<td><a href="<%=basePath%>song/getAllSong">
								<i class="glyphicon glyphicon-arrow-right"></i>查看更多</a></td>
							</tr>
						</tbody>
					</table>
				</div> 
				<div style="float: left; margin-left: auto; margin-right: auto;"
					class="col-md-4">
					<table class="table table-hover table-striped">
						<tbody>&nbsp;&nbsp;歌手</tbody>
						<tbody id="singerList">
						<tr>
							<td><a href="<%=basePath%>singer/getAllSinger">
							<i class="glyphicon glyphicon-arrow-right"></i>查看更多</a></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-4 about-grids">
				<table class="table table-hover table-striped">
					<tbody>&nbsp;&nbsp;流行歌单</tbody>
					<tbody id="lists">
						<tr>
							<td><a href="<%=basePath%>lists/getAllLists">
								<i class="glyphicon glyphicon-arrow-right"></i>查看更多</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
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
							<h5>
								<i class="fa fa-twitter" aria-hidden="true"></i> Lorem ipsum
							</h5>
						</div>
						<p>Aenean vitae metus sit dolor eu urna viverra semper. Mauris
							est odio, laoreet laoreet sapien non, sollicitudin bibendum
							nulla.</p>
					</div>
					<div class="col-md-4 col-sm-4 footer-wthree-grid">
						<h3>Keep In Touch</h3>
						<div class="ftr-icons">
							<div class="ftr-iblock">
								<span class="glyphicon glyphicon-earphone"> </span>
							</div>
							<div class="ftr-text">
								<p>+333 222 23456</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="ftr-icons">
							<div class="ftr-iblock">
								<span class="glyphicon glyphicon-envelope"> </span>
							</div>
							<div class="ftr-text">
								<p>
									<a href="mailto:info@example.com">mail@example.com</a>
								</p>
							</div>
							<div class="clearfix"></div>
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
			<p>© 2017 Rock.</p>
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