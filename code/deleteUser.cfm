<cfif isDefined("url.userID")>     
   <cfquery name="deleteUser" datasource="cftest" >
       delete from users where id = <cfqueryparam value="#url.userID#" cfsqltype="cf_sql_numeric">
   </cfquery> 
   <cflocation url="index.cfm"  >
<cfelse> 
  the user id doesn't exist. please fix your code   
</cfif>


 