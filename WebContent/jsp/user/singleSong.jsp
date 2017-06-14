<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<title>Music Website |单个歌曲添加评论页面</title>
<script type="text/javascript">
	function addSongview(){
		var form = document.forms[0];
		form.action = "<%=basePath%>songview/addSongview";
		form.method="post";
		form.submit();
	}
</script>
<script type="text/javascript">
    	function load(){
    		$.ajax({
    			type:"GET",
    			url:"<%=basePath%>songview/getSongview?songid=${songid}",
    			success:function(data){
    				var temp='';
    				for(var i=0;i<data.length;i++){
    					for(var attr in data[i]){
    						if(attr === "content"){
    							temp+="<tr>"+"<td><i class="+"'glyphicon glyphicon-hand-right'"+">&nbsp;&nbsp;"+data[i][attr]+"</i>"+"</td>"+"</tr>";
    						} 
    					}
    				}
    				$("#songview").after(temp);
    			}
    		});
    	}
    </script>

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
<body onload="load()">
	<!-- banner start here -->
	<div class="agileinfo-main about-top">  
		<div class="banner"> 
		</div> 
		<div class="agileinfo-header">
			<div class="container">
				<div class="agile-logo">
					<h1>
					<a href="jsp/user/index.jsp">
					<i class="fa fa-music bounce bounceIn animated" aria-hidden="true"></i> 
					Music</a></h1>
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
				<h2>${song.songname }  &nbsp;&nbsp;&nbsp;
				<span class="fa fa-user" aria-hidden="true"></span>
					<a href="<%=basePath%>singer/selectOneSinger?singerid=${song.singerid }">${song. singername}</a>
				</h2>
				<p><audio src="${song.music }" controls="controls" style="height:25px"></audio></p>
			</div>
			<div class="popular-posts">
				<table class="table table-striped table-hover" style="width: 780px; " >
					<tbody id="songview">
						<td><h4><i class="glyphicon glyphicon-comment">所有评论</i></h4></td>
					</tbody>
				</table>
				<br><br><br><br><br><br>
			</div>
			<div class="write-reply">
				<h4 class="w3ls-title">评论</h4>
				<form action="<%=basePath%>songview/addsongview" method="post" name="songviewForm"> 
					<input type="hidden" name="songid" placeholder="Name"  value=${song.id}>  
					<input type="hidden" name="songname" placeholder="Name"  value=${song.songname }>
					<input type="hidden" name="userid" value="${userid }">
					<input type="hidden" name="username" value="${username }">
					<textarea name="content" placeholder="Write a comment here..." ></textarea>
					<input type="submit" value="send" >
				</form>
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