<cfif isDefined("url.userID")>     
   <cfquery name="getUser" datasource="cftest" >
       select * from users where id = <cfqueryparam value="#url.userID#" cfsqltype="cf_sql_numeric">
   </cfquery>    
<cfelse> 
  the user id doesn't exist. please fix your code 
  <cfexit>  
</cfif>
 
<cfif getUser.RecordCount LT 1>
   no data in database for the user id, please check db data
  <cfexit>  
</cfif>

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
  <h2 style="width:700px;">Edit User</h2>
  <a  href="index.cfm" class="btn btn-info" >Show all</a>   
</div>
 <cfform style="width:800px">
    <div class="form-group">
      <label for="firstname">First Name</label>
      <cfinput type="text" class="form-control" id="firstname" placeholder="Enter fisrt name" name="firstname" value="#trim(getUser.firstname)# "/> 
    </div>
    <div class="form-group">
      <label for="lastname">Last name:</label>
      <cfinput type="text" class="form-control" id="lastname" placeholder="Enter last name" name="lastname" value="#trim(getUser.lastname)# " />
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <cfinput type="text" class="form-control" id="address" placeholder="address" name="address" value="#trim(getUser.address)# " /> 
    </div> 
    <cfinput type="hidden" id="userId" name="userId" value="#getUser.id#"  >    
    <button type="submit" class="btn btn-primary">Submit</button>
  </cfform>  
</div>
<script>
$(document).ready(function(){
  $( "form" ).on( "submit", function(e) {
     e.preventDefault(); 
     var dataString = $(this).serialize();
     console.log(dataString);    

     $.post('component/userProcess.cfc?method=editUser&returnFormat=plain',dataString,function(data,status){
        console.log(data);
     });

     setTimeout(function(){ $(location).attr('href','index.cfm'); }, 500);     
     
     
  });
});
</script>
</body>
</html>