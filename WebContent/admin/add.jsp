<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyBlog</title>


<!-- Bootstrap core CSS -->
<link	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./css/add.css" />

<link rel="stylesheet" href="./editormd/css/style.css" />
<link rel="stylesheet" href="./editormd/css/editormd.css" />
 
<script src="./editormd/js/zepto.min.js"></script>
<script src="./editormd/js/editormd.js"></script>  

<script src="./js/add.js"></script>
</head>
<body>
	<div class="head_line"></div>
	<div class="container" id="main">		
				<div id="title"><h2><a href="/Blog/index.jsp">MyBlog</a></h2>					
					</div>	
							
		   <form action="/Blog/NewArticleServlet" method="post">
		   		
		   		<div class="info" >
		   		<!-- title -->
		   		<span class="help">Tiêu đề</span>
		   		<input type="text" class="form-control" name="title" >
		   		<!-- time -->
		   		<span class="help">Thời gian</span>
		   		<input type="text"  class="form-control" name="time" value="${time}" >
		   		<!-- author-->
		   		<span class="help">Tác giả</span>
		   		<input type="text" class="form-control" name="author" >	
		   		<!-- sort --> 				
		   		<span class="help">Phân loại</span><br/>
 				<c:forEach var="s"  items="${sort_count}">
 				<input class="btn btn-default" type="button" value="${s.key}" onclick="sort_click(this)"> &nbsp;					
 				</c:forEach> 	 			
 				<input type="text" class="form-control"  id="sort" name="sort">		
 				
				<!-- tag -->		
		   		<span class="help">Tags</span><br/>
		   		<c:forEach var="tag" items="${all_tag}">
		   		<input class="btn btn-default" type="button" value="${tag.tag}" onclick="tags_click(this)">&nbsp;
		   		</c:forEach>
		   		<input type="text" class="form-control" id="tags"  name="tags">	
		   		</div>   		
		   		
		   		
		   		<div class="foot_line"></div>
		   		<!-- content -->   
                <div class="editormd" id="mdView">                
                    <textarea name="content"></textarea>
                </div>
                <br/>
                <input  class="btn btn-default"  type="submit"   value="Đăng bài" />
            </form>
		
		<div class="foot_line"></div>
			<!-- container -->
		</div><!-- container -->
	
		<div id="footer">
		<a href="#">&nbsp;&nbsp;Back to top</a>
		
	</div> <!-- footer -->		
		
	<script type="text/javascript">
			var testEditor;
			var jQuery = Zepto;
            $(function() {
					testEditor = editormd("mdView", {
						width  : "90%",
						height : 720,
						path   : './editormd/lib/',
                        codeFold : true,
                        searchReplace : true,
                        saveHTMLToTextarea : true,                  
                        htmlDecode : "style,script,iframe|on*", 
                        emoji : true,
                        taskList : true,
                        tocm: true,      
                        tex : true,  
                        flowChart : true,  
                        sequenceDiagram : true,   
                        imageUpload : true,
				        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],				        
				        imageUploadURL : "/Blog/UploadPic",
				    			      
						onload : function() {
							//console.log("onload =>", this, this.id, this.settings);
						}
					});				
					editor.setToolbarAutoFixed(false);              
            });
        </script>	
	
</body>
</html>