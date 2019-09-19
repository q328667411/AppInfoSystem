﻿



<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>APP开发者平台</title>

	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
	<!-- NProgress -->
	<link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
	<!-- iCheck -->
	<link href="${pageContext.request.contextPath }/statics/css/green.css" rel="stylesheet">
	<!-- bootstrap-progressbar -->
	<link href="${pageContext.request.contextPath }/statics/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
	<!-- JQVMap -->
	<link href="${pageContext.request.contextPath }/statics/css/jqvmap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/statics/css/dropzone.min.css" rel="stylesheet">
	<!-- Custom Theme Style -->
	<link href="${pageContext.request.contextPath }/statics/css/custom.min.css"	rel="stylesheet">
	
	<!-- add localcss 2016-8-18 -->
	<link href='${pageContext.request.contextPath }/statics/localcss/appinfoadd.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath }/statics/localcss/appinfolist.css' rel='stylesheet'>
</head>
<body class="nav-md footer_fixed">
	<div class="container body">
		<div class="main_container">
			<%@include file="head/head.jsp"%>
			<%--<div class="col-md-3 left_col menu_fixed"></div>

			<!-- top navigation -->
			<div class="top_nav"></div>--%>
			<!-- /top navigation -->
			<div class="right_col" role="main">
				<div class="">

<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>新增APP版本信息 <i class="fa fa-user"></i><small>${devUser.devCode}</small></h2>
            <div class="clearfix"></div>
      </div>
      <div class="x_title">
            <h2>历史版本列表</h2>
          <div class="clearfix"></div>
      </div>
      <div class="x_content1">
      <div class="clearfix"></div>
	  <p class="text-muted font-13 m-b-30"></p>
		<div id="datatable-responsive_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<div class="row">
				<div class="col-sm-12">
					<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
						cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0"
									aria-controls="datatable-responsive" rowspan="1" colspan="1"
									style="width: 70px;" aria-label="First name: activate to sort column descending"
									aria-sort="ascending">软件名称</th>
								<th class="sorting" tabindex="0"
									aria-controls="datatable-responsive" rowspan="1" colspan="1"
									style="width: 10px;"
									aria-label="Last name: activate to sort column ascending">
									版本号</th>
								<th class="sorting" tabindex="0"
									aria-controls="datatable-responsive" rowspan="1" colspan="1"
									style="width: 90px;"
									aria-label="Last name: activate to sort column ascending">
									版本大小(单位:M)</th>
								<th class="sorting" tabindex="0"
									aria-controls="datatable-responsive" rowspan="1" colspan="1"
									style="width: 50px;"
									aria-label="Last name: activate to sort column ascending">
									发布状态</th>
								<th class="sorting" tabindex="0"
									aria-controls="datatable-responsive" rowspan="1" colspan="1"
									style="width: 50px;"
									aria-label="Last name: activate to sort column ascending">
									APK文件下载</th>
								<th class="sorting" tabindex="0"
									aria-controls="datatable-responsive" rowspan="1" colspan="1"
									style="width: 50px;"
									aria-label="Last name: activate to sort column ascending">
									最新更新时间</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
        <div class="clearfix"></div>
        <div class="x_title">
            <h2>新增版本信息</h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
            </ul>
          <div class="clearfix"></div>
        </div>
        <div class="x_content" style="display: block;">
         <br>
        <form class="form-horizontal form-label-left" action="/dev/add" method="post" enctype="multipart/form-data">
           <input type="hidden" name="appId" name="appId" value="53">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionNo">版本号 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="versionNo" class="form-control col-md-7 col-xs-12" 
               data-validate-length-range="20" data-validate-words="1" name="versionNo"  
               placeholder="请输入版本号" type="text"  required="required">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionSize">版本大小 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="number" id="versionSize" name="versionSize"  required="required"
              data-validate-minmax="10,500"  placeholder="请输入版本大小，单位为Mb" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
       
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="publishStatus">发布状态 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" name="publishStatus" id="publishStatus" value="3">预发布
            </div>
          </div>
        
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionInfo">版本简介 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea id="versionInfo" name="versionInfo" required="required"
              placeholder="请输入本版本的相关信息，本信息作为该版本的详细信息进行版本介绍。" class="form-control col-md-7 col-xs-12"></textarea>
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="a_downloadLink">apk文件 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="file" class="form-control col-md-7 col-xs-12" name="a_downloadLink" id="a_downloadLink"  required="required"/>
            
            </div>
          </div>
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button id="send" type="submit" class="btn btn-success">保存</button>
              <button type="button" class="btn btn-primary" id="back">返回</button>
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
  </div>
</div>
  </div>
 </div>
<!-- /page content -->
<!-- footer content -->
<footer>
	<div class="pull-right">©2016 All Rights Reserved.</div>
	<div class="clearfix"></div>
</footer>
<!-- /footer content -->
</div>
</div>
   <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath }/statics/js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath }/statics/js/nprogress.js"></script>
    <!-- jQuery custom content scroller -->
    <script src="${pageContext.request.contextPath }/statics/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
    <!-- validator -->

    <!-- dropzone -->
    <script src="${pageContext.request.contextPath }/statics/js/dropzone.js"></script>  
</body>
</html>
<script src="${pageContext.request.contextPath }/statics/localjs/appversionadd.js"></script>