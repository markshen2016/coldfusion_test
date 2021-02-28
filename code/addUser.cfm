<!DOCTYPE html>
<html lang="en">
<head>
  <title>Coldfusion Test</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="margin-top: 100px;">
<div style="display: flex;width:800px;">
  <h2 style="width:700px;">Add New User</h2>
  <a  href="index.cfm" class="btn btn-info" >Show all</a> 
</div>
  <form style="width:800px">
    <div class="form-group">
      <label for="firstname">First Name</label>
      <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter fisrt name">
    </div>
    <div class="form-group">
      <label for="lastname">Last name:</label>
      <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter last name">
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="address">
    </div>     
    <button type="submit" id="submit" class="btn btn-primary">Submit</button>
  </form>  
</div>
</div>
<script>
$(document).ready(function(){
  $( "form" ).on( "submit", function(e) {
     e.preventDefault(); 
     var dataString = $(this).serialize();
     console.log(dataString);    

     $.post('component/userProcess.cfc?method=addUser&returnFormat=plain',dataString,function(data,status){
        console.log(data);
     });     
     
      setTimeout(function(){ $(location).attr('href','index.cfm'); }, 500);   
  });
});
</script>
</body>
</html>