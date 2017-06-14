<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <title>Music Website |admin 歌单列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Rock Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
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
		$.get("<%=basePath%>lists/delLists?id=" + id,function(data){
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
				<div class="agileits-w3layouts-icons">
					<div class="social-icon">
					</div> 
				</div>
				<div class="clearfix"> </div>
			</div>	    
		</div>
		<div class="top-nav">
			<span class="menu">Menu</span>	
			<ul class="w3l">
				<li><a href="jsp/admin/adminindex.jsp"><i aria-hidden="true" class="glyphicon glyphicon-home"></i><span>曲库管理</span></a></li>
				<li><a  class="active" href="<%=basePath%>lists/findLists"><i class="glyphicon glyphicon-user"></i><span>歌单管理</span></a></li>
				<li><a href="<%=basePath%>singer/findSinger"><i class="glyphicon glyphicon-list-alt"></i><span>歌手管理</span></a></li>
				<li><a href="<%=basePath%>songview/getAllSongview"><i class="glyphicon glyphicon-picture"></i><span>评论管理</span></a></li>
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
	<!--- albums -->
	<div class="albums agile-blog">
		<div class="container">
			<table class="table table-striped table-hover" style="width: 780px; margin-left: auto;margin-right: auto;" >
					<tbody>
						<td>歌单标题</td>
						<td><i class="fa fa-plus-square" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addModal">增加</i><br /></td>
					</tbody>
					<c:if test="${!empty findLists }">
				<c:forEach items="${findLists}" var="lists">
					<tr>
						<td><a href="<%=basePath%>songlist/getAdminSongList?listid=${lists.listid}">${lists. listname}</a>&nbsp;&nbsp;&nbsp;<i class="fa fa-play"><a></a></i></td>
						<td>
							<i class="glyphicon glyphicon-trash"><a href="javascript:del('${lists.id}')">删除</a><a></a></i>
							<i class="fa fa-pencil" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#editModal">修改</i>
						</td>
					</tr>				
				</c:forEach>
			</c:if>
				</table>
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
									<form action="<%=basePath%>lists/AddLists">
									<div class="modal-body">
										歌单名：<input type="text" name="listname" id="listname"/>
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
						<!-- 模态框（Modal） -->
						<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" 
												aria-hidden="true">×
										</button>
										<h4 class="modal-title" id="myModalLabel">
											修改歌单
										</h4>
									</div>
									<form action="<%=basePath%>lists/UpdateLists">
									<div class="modal-body">
										歌单名：<input type="text" name="listname" id="listname"/>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" >
											 修改
										</button>
										<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
									</div>
								</form>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div> 
		</div>
	</div>
	<!--- //albums -->  
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
			<p>© 2017 Rock. </p>
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
