<!doctype html>

<html>
<head>
  <meta charset="utf-8">
  <title>Mosaic Generator</title>

  <%--TODO proper includes - per http://getbootstrap.com/getting-started/#template--%>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link href="twitter-bootstrap-v2/docs/assets/css/bootstrap.css" rel="stylesheet">


<%-- TODO try this http://www.w3resource.com/twitter-bootstrap/example-horizontal-form-with-twitter-bootstrap.html --%>
<%-- TODO fix encoding in headers http://stackoverflow.com/questions/10158743/how-do-i-change-the-actual-encoding-of-my-html-document --%>
 
 
 
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
<form class="form-horizontal" method="post" action="getMosaic" id="options">
          <div class="control-group">
            <label class="control-label" for="imgInput">Image URL</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="imgUrl" name="imgUrl">
              <p class="help-block">Enter the URL of the image to turn into a mosaic</p>
            </div>
          </div>
          
          <div class="control-group">
            <label class="control-label" for="fileInput">Or upload an image</label>
            <div class="controls">
              <input class="input-file" id="fileInput" type="file" name="imgFile">
            </div>
          </div>
		  <!-- 
          <label class="control-label" for="dimTypes">Choose dimension to use</label> -->
          <div id="dimTypes">
		    <label class="radio">
	          <input type="radio" name="dimType" id="dimTypeW" value="width" checked>
		      Width
		    </label>
		    <label class="radio">
		      <input type="radio" name="dimType" id="dimTypeH" value="height">
              Height		  
            </label>
          </div>
          
          <div class="input-append">
          	<label class="control-label" for="dimensions">Enter the number of units wide or tall to use in each variation</label>
		    <input class="span2" id="dimensions" type="text" placeholder="50,100,200" name="dims">
	      </div>
	      
          <div class="input-append">
          	<label class="control-label" for="colors">Enter the number of colors to use in each variation</label>
		    <input class="span2" id="colors" type="text" placeholder="4,8,16" name="colors">
	      </div>    
          
          <div class="control-group">
            <label class="control-label" for="showDimensions"></label>
            <div class="controls">
              <label class="checkbox">
                <input type="checkbox" id="showDimensions" value="true" name="showDims">
				Show dimensions on mosaic
              </label>
            </div>
          </div>
          
          <div class="form-actions">
            <input class="btn btn-primary" type="submit" >
            <input class="btn" type="reset">
          </div>
</form>
            

<form action="html_form_action.asp" method="get">
  <label>Image URL:</label>
  <input type="text" id="imgUrl2" name="imgUrl" placeholder="http://www.website.com/myImage.png" required>
  
  <label>Or upload a file:</label>
  <input id="imgFile" type="file" name="imgFile">
  
  <label for="dimensions">Enter the number of units wide or tall to use in each variation</label>
  <input id="dimensions2" type="text" placeholder="50,100,200" name="dims">
  
  <label>Dimension to use:</label>
  <input type="radio" id="dimTypeW2" name="dimType" >Width
  <input type="radio" id="dimTypeH2" name="dimType" >Height
  
  <label>Show dimensions on result:</label>
  <input type="checkbox" id="showDim2" name="showDim">
  
  <label for="colors">Enter the number of colors to use in each variation</label>
  <input id="colors2" type="text" placeholder="4,8,16" name="colors">
  
  <input type="submit" value="Submit" /> 
</form>

<!-- <form oninput="total.value = (nights.valueAsNumber * 99) + ((guests.valueAsNumber - 1) * 10)">

  <label>Full name:</label>
  <input type="text" id="full_name" name="full_name" placeholder="Jane Doe" required>

  <label>Email address:</label>
  <input type="email" id="email_addr" name="email_addr" required>

  <label>Repeat email address:</label>
  <input type="email" id="email_addr_repeat" name="email_addr_repeat" required oninput="check(this)">

  <label>Promo code:</label>
  <input type="text" id="promo" name="promo" pattern="[A-Za-z0-9]{6}" title="Promo codes consist of 6 alphanumeric characters.">

  <input type="submit" value="Request Reservation" /> 
</form>

<script>
function check(input) {
  if (input.value != document.getElementById('email_addr').value) {
    input.setCustomValidity('The two email addresses must match.');
  } else {
    // input is valid - reset the error message
    input.setCustomValidity('');
  }
}
</script>
 -->

<img src="mosaic?img=${param.img}" alt="Composite image of mosaics based on color/resolution variations">


<!-- 
<script src="http://twitter.github.com/bootstrap/assets/js/jquery.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tab.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-modal.js"></script> -->
</body>
</html>
