<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile | ProjectProVision</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/userprofile.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
   crossorigin="anonymous" integrity="">
    <link href="https://cdn.jsdelivr.net/npm/hint.css@2.7.0/hint.min.css" integrity="" rel="stylesheet">
    <link rel="stylesheet" href="hint.css" />
  </head>

<body class="body" id="body">

    <!-- Loading container -->
	<div id="loading" style="display:none;">
		<div class="loader">
            <video class="loader2" autoplay muted >
                <source src="../assets/website images/istockphoto-1300261742-640_adpp_is.mp4" type="video/mp4">
                <source src="../assets/website images/istockphoto-1300261742-640_adpp_is.mp4" type="video/ogg">
              </video>
        </div>
	</div>
    <!-- Loading container -->

  <div class="container" id="container">

  </div>



  <div>
    <button type="button" class="delUserProfile" id="delUserProfile"><span class="hint--bottom hint--rounded" aria-label="Delete Avatar">Delete User Profile</button></span>
  </div>


  <script src="<%=request.getContextPath()%>/assets/js/userProfile.js"></script>
</body>

</html>