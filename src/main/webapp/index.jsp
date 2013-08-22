<!doctype html>

<html>
<head>
  <meta charset="utf-8">
  <title>Mosaic Generator</title>

  <link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
  <link href="http://twitter.github.com/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
  <%--TODO proper includes - per http://getbootstrap.com/getting-started/#template--%>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

  <style type="text/css">
  <%-- TODO container --%>
    .form-horizontal {
      margin-left: 50px;
    }
  </style>
  
  <script type="text/javascript">
    function appname() {
      return location.hostname.substring(0, location.hostname.indexOf("."));
    }
  </script>
</head>

<body>
<h1>Mosaic Generator</h1>



<%--TODO option to disable printing dimensions --%>
<%-- TODO probably submit to self but as post --%>
<form class="form-horizontal" method="post" action="getMosaic">
        <fieldset>
          <legend>Mosaic Generator Options</legend>
          <div class="control-group">
            <label class="control-label" for="imgInput">Image URL</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="imgInput">
              <p class="help-block">Enter the URL of the image to turn into a mosaic</p>
            </div>
          </div>
          
<!--           <div class="control-group">
            <label class="control-label" for="fileInput">Or upload an image</label>
            <div class="controls">
              <input class="input-file" id="fileInput" type="file">
            </div>
          </div> -->
		  
          <label class="control-label" for="dimensionType">Choose dimension to use</label>
		  <label class="radio">
	        <input type="radio" name="dimensionType" id="dimensionTypeWidth" value="width" checked>
		    Width
		  </label>
		  <label class="radio">
		    <input type="radio" name="dimensionType" id="dimensionTypeHeight" value="height">
            Height		  
          </label>
          
          <div class="input-append">
          	<label class="control-label" for="dimensions">Enter the number of units wide or tall to use in each variation</label>
		    <input class="span2" id="dimensions" type="text" placeholder="50,100,200">
	      </div>
	      
          <div class="input-append">
          	<label class="control-label" for="colors">Enter the number of colors to use in each variation</label>
		    <input class="span2" id="colors" type="text" placeholder="4,8,16">
	      </div>    
          
          <div class="control-group">
            <label class="control-label" for="showDimensions"></label>
            <div class="controls">
              <label class="checkbox">
                <input type="checkbox" id="showDimensions" value="true">
				Show dimensions on mosaic
              </label>
            </div>
          </div>
          
          <div class="form-actions">
            <input class="btn btn-primary" type="submit">	
            <input class="btn" type="reset">
          </div>
        </fieldset>
</form>
            


<img src="mosaic?img=${param.img}">



<script src="http://twitter.github.com/bootstrap/assets/js/jquery.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tab.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-modal.js"></script>
</body>
</html>
