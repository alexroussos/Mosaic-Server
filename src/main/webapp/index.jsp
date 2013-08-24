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

  <%-- TODO better way to forward params - put in request context? - or just pass entire query string --%>
  <c:if test="${requestScope.showImg == true}">
  	<img src="generate?imgUrl=${param.imgUrl}&dims=${param.dims}&colors=${param.colors}" id="mosaic" alt="Composite image of mosaics based on color/resolution variations">
  </c:if>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <jsp:include page="jsp/footer.jsp" /> 
</body>
</html>

