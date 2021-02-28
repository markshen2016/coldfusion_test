<cfquery name="userList" datasource="cftest" >
  select *  from users
</cfquery>

  
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
</head>
<body>

<div class="container" style="margin-top: 100px;">
<div style="display: flex;width:800px;">
  <h2 style="width:700px;">User List</h2>
  <a  href="addUser.cfm" class="btn btn-success" >New User</a>   
</div> 
  <table class="table"  style="width:800px;">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Address</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <cfoutput query="userList">
      <tr>
        <td>#firstname#</td>
        <td>#lastname#</td>
        <td>#address#</td>
        <td><a href="editUser.cfm?userID=#id#" class="btn btn-primary" >edit</a> 
        <button class="btn btn-danger" onclick="deleteUser(#id#)">delete</button> </td>
      </tr>         
      </cfoutput>
    </tbody>
  </table>
</div>
<script>
  function deleteUser(id) {
    $.confirm({
    title: 'Confirmation!',
    content: 'Are you sure to delete the user?',
    buttons: {
        confirm: function () {
            $.get('deleteUser.cfm?userID=' + id,function(data){
                 location.reload(); 
            });     
        },
        cancel: function () {
            console.log("cancel");
        }
        
    }
  });
  
  }
</script>
</body>
</html>
