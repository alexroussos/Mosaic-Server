<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<html>
<head>
  <meta name="description" content="Pixelate images and reduce color palette. For making mosaics, knitting patterns, graphic arts, etc.">
  <meta name="keywords" content="pixelate, mosaic, knitting pattern, digitize, reduce colors, 8-bit art">
  <meta name="author" content="Alex Roussos">
  <meta charset="utf-8">
  <title>Mosaic Generator</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
  <link href="css/mosaic.css" rel="stylesheet" media="screen">
</head>

<body>
  <h1>Mosaic Generator</h1>

<%-- TODO put everything in proper container --%>
<%-- TODO try this http://www.w3resource.com/twitter-bootstrap/example-horizontal-form-with-twitter-bootstrap.html --%>
<%-- TODO fix encoding in headers http://stackoverflow.com/questions/10158743/how-do-i-change-the-actual-encoding-of-my-html-document --%>
 
<%-- TODO add project to github and track TODOs there --%>
<%-- TODO support choosing palette generator, loading palette from file --%>
<%--TODO option to disable printing dimensions --%>
<%-- TODO probably submit to self but as post --%>
<%--TODO need somewhere to upload imput file to --%>

  <form class="form-horizontal" method="post" action="" id="options">
    <div class="control-group">
      <label class="control-label" for="imgInput">Image URL</label>
      <div class="controls">
        <input type="text" class="input-xlarge" id="imgUrl" name="imgUrl" value="${param.imgUrl}">
      </div>
    </div>
          
    <div class="control-group">
      <label class="control-label" for="fileInput">Or upload an image [not supported yet]</label>
      <div class="controls">
        <input class="input-file" id="fileInput" type="file" name="imgFile" value="${param.imgFile}" accept="image/*">
      </div>
    </div>
    
    <div id="dimTypes">
      <label class="radio">
        <input type="radio" name="dimType" id="dimTypeW" value="width" ${empty param.dimType ? 'checked' : (param.dimType == 'width' ? 'checked' : '')}>
        Width
      </label>
      <label class="radio">
        <input type="radio" name="dimType" id="dimTypeH" value="height" ${param.dimType == 'height' ? 'checked' : ''}>
        Height		  
      </label>
    </div>
    
    <div class="input-append">
      <label class="control-label" for="dimensions">Number of units wide or tall to use in each variation</label>
      <input class="span2" id="dimensions" type="text" placeholder="50,100,200" name="dims"  value="${param.dims}">
    </div>
  
    <div class="input-append">
   	  <label class="control-label" for="colors">Number of colors to use in each variation</label>
      <input class="span2" id="colors" type="text" placeholder="4,8,16" name="colors" value="${param.colors}">
    </div>    
    
    <div class="control-group">
      <label class="control-label" for="showDimensions"></label>
      <div class="controls">
        <label class="checkbox">
          <input type="checkbox" id="showDimensions" value="true" name="showDims" ${empty param.showDims ? '' : 'checked'}>
	      No dimension labels on mosaic
        </label>
      </div>
    </div>
    
    <div class="form-actions">
      <input class="btn btn-primary" type="submit" >
      <input class="btn" type="reset">
    </div>
  </form>

  <%-- TODO better way to forward params - put in request context? --%>
  <c:if test="${requestScope.showImg == true}">
  	<img src="mosaic?imgUrl=${param.imgUrl}&dims=${param.dims}&colors=${param.colors}" id="mosaic" alt="Composite image of mosaics based on color/resolution variations">
  </c:if>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

</body>
</html>
