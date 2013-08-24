<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>

<html>
<head>
  <jsp:include page="jsp/head.jsp" /> <%-- has author, keywords, charset, title, css --%>
</head>
<body>
  <jsp:include page="jsp/header.jsp" />

<%-- TODO put everything in proper container --%>
<%-- TODO try this http://www.w3resource.com/twitter-bootstrap/example-horizontal-form-with-twitter-bootstrap.html --%>
<%-- TODO fix encoding in headers http://stackoverflow.com/questions/10158743/how-do-i-change-the-actual-encoding-of-my-html-document --%>
 
<%-- TODO support choosing palette generator, loading palette from file --%>
<%--TODO option to disable printing dimensions --%>
<%--TODO need somewhere to upload imput file to --%>
<%--TODO go side-by-side options, original image, and result --%>

<div class="container">
  <div id="overview" class="col-md-12">
    <h2>Mosaic Generator</h2>
    <p>Mosaic Generator can take an image and show you what it would look like at various resolutions and with different sets of colors. This is
    great for designing mosaics, and also for making knitting patterns, icons for websites, t-shirt designs and anything else where you have a limited
    number of colors available or need to scale an image down in size.</p>
  </div>
  <div id="options" class="col-md-4">
    <h2>Options</h2>
    <form method="post" action="mosaic" id="options">
      <!--  TODO bootstrap form inputs -->
      <div class="control-group">
        <label class="control-label" for="imgUrl">Image URL</label>
        <div class="controls">
          <input type="text" class="input-xlarge" id="imgUrl" name="imgUrl" value="${param.imgUrl}">
        </div>
      </div>
            
      <div class="control-group">
        <label class="control-label" for="fileInput">Or upload an image [not supported yet]</label>
        <div class="controls">
          <input class="input-file" id="fileInput" type="file" name="imgFile" src="${param.imgFile}" accept="image/*">
        </div>
      </div>
      
      <div class="control-group">
        <label class="control-label">Specify dimensions of result in units wide or high</label>
          <div class="controls">
            <input type="radio" name="dimType" id="dimTypeW" value="width" ${empty param.dimType ? 'checked' : (param.dimType == 'width' ? 'checked' : '')}>
            Width
            <input type="radio" name="dimType" id="dimTypeH" value="height" ${param.dimType == 'height' ? 'checked' : ''}>
            Height  
          </div>
      </div>
      
      <div class="control-group">
        <label class="control-label" for="dimensions">Number of units wide or tall to use in each variation</label>
        <div class="controls">
          <input id="dimensions" type="text" placeholder="50,100,200" name="dims"  value="${param.dims}">
        </div>
      </div>
    
      <div class="control-group">
     	  <label class="control-label" for="colors">Number of colors to use in each variation</label>
        <div class="controls">
          <input id="colors" type="text" placeholder="4,8,16" name="colors" value="${param.colors}">
        </div>
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
      
      <div class="control-group">
        <input class="btn btn-primary" type="submit" >
        <input class="btn" type="reset"> <!--  TODO sets back to what it was WHEN PAGE LOADED -->
      </div>
    </form>
  </div> <!-- options -->
  <div id="results" class="col-md-8">
    <%-- TODO better way to forward params - put in request context? - or just pass entire query string --%>
    <c:if test="${requestScope.showImg == true}">
      <h2>Here's your result</h2>
      <p>Your result may have been been stretched or squeezed to make it easier to view on this page; to view it at it's true resolution, right-click it and open it in a new tab.</p>
      <img src="generate?imgUrl=${param.imgUrl}&dims=${param.dims}&colors=${param.colors}" id="mosaic" alt="Composite image of mosaics based on color/resolution variations">
    </c:if>
  </div>
  
</div> <!-- container -->

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <jsp:include page="jsp/footer.jsp" /> 
</body>
</html>

