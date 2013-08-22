<!doctype html>

<html>
<head>
  <meta charset="utf-8">
  <title>Mosaic Generator</title>

  <link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
  <link href="http://twitter.github.com/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">

  <style type="text/css">
    .instructions {
      display: none;
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
<p>Generating mosaic for ${param.img}</p>
<img src="mosaic?img=${param.img}">



<%--TODO option to disable printing dimensions --%>

<form class="form-horizontal">
        <fieldset>
          <legend>Controls Bootstrap supports</legend>
          <div class="control-group">
            <label class="control-label" for="imgInput">Image URL</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="imgInput">
              <p class="help-block">Enter the URL of the image to turn into a mosaic.</p>
            </div>
          </div>
          
		  <div class="control-group" data-toggle="buttons-checkbox">
            <label class="control-label" for="optionsRadios">Choose dimension to use</label>
            <div class="controls">
              <label class="radio">
				  <input type="radio" class="btn" value="width">Width
				  <input type="radio" class="btn" value="height">Height
			  </label>
			</div>
		  </div>
		  
		  <label class="radio">
	        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
		    Option one is this and that - be sure to include why it's great
		  </label>
		  <label class="radio">
		    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
		    Option two can be something else and selecting it will deselect option one
		  </label>
		  
		  <div class="btn-group" data-toggle-name="is_private" data-toggle="buttons-radio" >
		    <button type="button" value="0" class="btn" data-toggle="button">Public</button>
		    <button type="button" value="1" class="btn" data-toggle="button">Private</button>
		  </div>
		  <input type="hidden" name="is_private" value="0" />
          
          <div class="control-group">
            <label class="control-label" for="optionsCheckbox">Specify</label>
            <div class="controls">
              <label class="checkbox">
                <input type="checkbox" id="optionsCheckbox" value="option1">
                Are the dimensions you're specifying the desired length or width?
              </label>
            </div>
          </div>
          
          <div class="control-group">
            <label class="control-label" for="select01">Select list</label>
            <div class="controls">
              <select id="select01">
                <option>something</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
              </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="multiSelect">Multicon-select</label>
            <div class="controls">
              <select multiple="multiple" id="multiSelect">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
              </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="fileInput">File input</label>
            <div class="controls">
              <input class="input-file" id="fileInput" type="file">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="textarea">Textarea</label>
            <div class="controls">
              <textarea class="input-xlarge" id="textarea" rows="3"></textarea>
            </div>
          </div>
          <div class="form-actions">
            <button type="submit" class="btn btn-primary">Save changes</button>
            <button class="btn">Cancel</button>
          </div>
        </fieldset>
</form>
            







<script src="http://twitter.github.com/bootstrap/assets/js/jquery.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tab.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-modal.js"></script>
</body>
</html>
