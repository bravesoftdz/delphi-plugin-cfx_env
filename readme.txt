
 CFX ENV
 Website : http://---/download
 Support : http://---/about/

 This tag allows getting/setting environment variables from CF.

 It was written in particular for users on shared hosts who wish to get/set their system path.

 Since some of these users do not have access to the windows directory (C:\Windows\System32),
 these users must find other directories in which to place library DLL's. CFX_ENV will allow
 them to see what other directories are on the system path. One way to change the system
 path is to change the environment variable "PATH". That is the method this tag allows.

 The CFX_ENV tag should give the above-mentioned users some options for placing library DLL's,
 or allow them to modify their system path to include some directory they have access to.

 The tag also returns the current working directory as "env.currentdir"

 --- library DLL's, not to be confused with CFX DLL's, should load
 from all locations listed in "env.path" and at "env.currentdir".
 
   Attributes >>
  
     Get environment variables by specifying their name as an attribute.
     Set environment variables by specifying both attribute and a value.

   Return Values >>

     Variables are returned with the "env." prefix.
     The tag also returns "current working directory" in "env.currentdir".

   Examples >>
  
     <cfx_env path> <!-- get -->
     <cfx_env path="#env.path#;D:\Bin\"> <!-- set -->

     <cfx_env os path> <!-- get os and path vars -->

     <cfx_env xyz>

   Tips >>
     
     Environment variables are set for this process only; longer requires registry.
     
     If you set the PATH environment variable, do so in a "Cached Global Section", documented here :
     http://---/docs/---/
