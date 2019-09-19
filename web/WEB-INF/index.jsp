<!DOCTYPE html>
<!-- saved from url=(0036)http://localhost:9090/AppInfoSystem/ -->

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>后台管理系统</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <%--<link href="${pageContext.request.contextPath }/statics/css/animate.min.css" rel="stylesheet">--%>
    <%@include file="jsp/wow/wow.jsp"%>
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div class="login_wrapper">
      <h1 class="wow slideInLeft" data-wow-delay="0.5s" data-wow-iteration="1">APP信息管理平台</h1>
      <div>
      <a href="/login/backLojin" class="btn btn-link wow fadeInUpBig" data-wow-delay="0.8s" data-wow-iteration="1">后台管理系统入口</a>
      </div>
      <div>
      <a href="/login/devLojin" class="btn btn-link wow fadeInUpBig" data-wow-delay="1.2s" data-wow-iteration="1">开发者平台 入口</a>
      </div>
    </div>
  
</body>
<%--<script src="/statics/js/wow.min.js" type="text/javascript"></script>
<script>
    new WOW().init();
</script>--%>
</html>