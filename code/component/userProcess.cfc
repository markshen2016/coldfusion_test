<cfcomponent>

<cffunction name="addUser" access="remote" output="false" returnType="string">
	<cfargument name="firstname" type="string" required="true">
	<cfargument name="lastname" type="string" required="true">
	<cfargument name="address" type="string" required="true">
	
	<cfquery name="userList" datasource="cftest" >
	  insert into users (firstname,lastname,address)
		values(
            <cfqueryparam value="#trim(arguments.firstname)#" cfsqltype="cf_sql_varchar">,
		    <cfqueryparam value="#trim(arguments.lastname)#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#trim(arguments.address)#" cfsqltype="cf_sql_varchar">
            )
	</cfquery>
	
	<cfreturn "success">	
</cffunction>


<cffunction name="editUser" access="remote" output="false" returnType="string">
	<cfargument name="firstname" type="string" required="true">
	<cfargument name="lastname" type="string" required="true">
	<cfargument name="address" type="string" required="true">
	<cfargument name="userId" type="numeric" required="true">
	
	<cfquery name="userList" datasource="cftest" >
	
	   update users
       set firstname = <cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">, 
		   lastname = <cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
		   address = <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">
       where id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_numeric"> ; 
	  
	</cfquery>
	
	<cfreturn "success">	
</cffunction>
	
</cfcomponent>