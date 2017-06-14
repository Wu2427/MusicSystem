<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>Music Website|我的音乐 </title>
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
		$.get("<%=basePath%>userlists/delUserLists?id=" + id,function(data){
			if("success" == data.result){
				alert("删除成功");
				window.location.reload();
			}else{
				alert("删除失败");
			}
		});
	}
</script>
<script type="text/javascript">
function load(event){
	var ele=$(event.target).next().val();
	$.ajax({
		type:"POST",
		url:"<%=basePath%>usersong/findAllL",
		data:{
			"userlistid":ele,
		},
		success:function(data){
			var temp='';
			for(var i=0;i<data.length;i++){
				for(var attr in data[i]){
					if(attr === "songname"){
						temp+="<tr>"+ 
						   "<td>"+
							  data[i][attr]+"</td>";
					}
					if(attr === "singername"){
						temp+="<td>"+data[i][attr]+"</td>";
					}
				}
			}
			$("#usersong").siblings().html("");
			$("#usersong").after(temp);
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
				<li><a class="active" href="<%=basePath%>userlists/getAllUserLists"><i
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
	<!-- about -->
	<div class="about agileits"  style="margin-top: -70px;">
		<div class="container">
			<div class="about-info">
					<div class="col-md-4 about-grids" id="leftcon">
					<h5 style="font-family: '宋体';font-size: 18px;">我的歌单
						<i class="fa fa-plus-square" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addModal"></i></h5><br />
						<!-- 模态框（Modal） -->
						<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" 
												aria-hidden="true">×
										</button>
										
										<h4 class="modal-title" id="myModalLabel">
											添加歌单
										</h4>
									</div>
									<form action="<%=basePath%>/userlists/AddUserLists">
									<div class="modal-body">
										歌单名：<input type="text" name="userlistsname" id="userlistsname"/>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" >
											 增加
										</button>
										<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
									</div>
								</form>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
					<div class="clearfix"> </div>
			<table class="table table-hover">
				<c:if test="${!empty userlists }">
				<c:forEach items="${userlists}" var="userlists">
					<tbody>					
						<td>
						   <span onclick="load(event)" style="cursor: pointer;">${userlists.userlistsname }</span>
						   <input type="hidden" value="${userlists.id}" />
						   <i class="fa fa-play"></i>
						<i class="glyphicon glyphicon-trash" style="margin-left: 10px;">
						<a href="javascript:del('${userlists.id }')">删除</a></i>
						</td>
					</tbody>
				</c:forEach>
				</c:if>
			</table>
				</div>
				<div class="col-md-8 about-grids" id="rightcon">
					<table class="table table-hover" style="width: 680px;text-align: center;">
					<tbody><h4 style="margin-left: 330px;">歌曲列表 </h4></tbody>
						<tbody id="usersong">
							<td style="text-align: center;">歌曲标题</td>
							<td style="text-align: center;">歌手</td>
						</tbody>
					</table>
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
						<h3>index</h3>
						<ul>
							<li><a href="index.html">主页</a></li>
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