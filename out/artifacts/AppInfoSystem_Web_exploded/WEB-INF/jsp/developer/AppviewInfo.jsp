<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	<!-- NProgress -->9
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
			<div class="col-md-3 left_col menu_fixed">
				<div class="left_col scroll-view"></div>
			</div>
        <%@include file="head/head.jsp"%>
			<%--<!-- top navigation -->
			<div class="top_nav"></div>
			<!-- /top navigation -->
			<div class="right_col" role="main">
				<div class="">--%>

<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>查看APP信息 <i class="fa fa-user"></i><small>${devUser.devName}</small></h2>
             <div class="clearfix"></div>
      </div>
     <%-- <div class="x_title">
            <h2>APP基础信息</h2>
          <div class="clearfix"></div>
      </div>--%>
      <div class="x_content1">
        <form class="form-horizontal form-label-left" >
          <input type="hidden" name="id" value="${appInfo.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">软件名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${appInfo.softwareName}"
              type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">APK名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              value="${appInfo.apkName}" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">支持ROM <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.supportRom}" type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">界面语言 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" readonly="readonly"
              	value="${appInfo.interfaceLanguage}" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">软件大小 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.softwareSize}"
              class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">下载次数 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.downloads}"
               class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">所属平台 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.flatformName}" readonly="readonly">
            
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="select">所属分类 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.categoryLevel1Name} --> ${appInfo.categoryLevel2Name} --> ${appInfo.categoryLevel3Name}" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">APP状态 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            	<input type="text" class="form-control col-md-7 col-xs-12"
              	value="${appInfo.statusName}" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">应用简介 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea class="form-control col-md-7 col-xs-12" readonly="readonly">${appInfo.appInfo}</textarea>
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">LOGO图片 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
			  
				   
				     
				    <img src="http://localhost:8080/xz/${appInfo.logoPicPath}" width="100px;"/>
				   
               
            </div>
          </div>
        </form>
        </div>
        <div class="clearfix"></div>
        <div class="x_title">
            <h2>历史版本列表</h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
            </ul>
          <div class="clearfix"></div>
        </div>
        <div class="x_content" style="display: block;">
         <br>
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
                        <c:forEach items="${VersionList}" var="VersionList">
                            <tr role="row">
                                <th class="sorting_asc" tabindex="0"
                                    aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                    style="width: 70px;" aria-label="First name: activate to sort column descending"
                                    aria-sort="ascending">${VersionList.softwareName}</th>
                                <th class="sorting" tabindex="0"
                                    aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                    style="width: 10px;"
                                    aria-label="Last name: activate to sort column ascending">
                                        ${VersionList.versionNo}</th>
                                <th class="sorting" tabindex="0"
                                    aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                    style="width: 90px;"
                                    aria-label="Last name: activate to sort column ascending">
                                        ${VersionList.versionSize}</th>
                                <th class="sorting" tabindex="0"
                                    aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                    style="width: 50px;"
                                    aria-label="Last name: activate to sort column ascending">
                                        ${VersionList.valueName}</th>
                                <th class="sorting" tabindex="0"
                                    aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                    style="width: 50px;"
                                    aria-label="Last name: activate to sort column ascending" >
                                    <a href="download?filename=${VersionList.apkFileName}">${VersionList.apkFileName}</a> </th>
                                <th class="sorting" tabindex="0"
                                    aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                    style="width: 50px;"
                                    aria-label="Last name: activate to sort column ascending">
                                    <fmt:formatDate value="${VersionList.modifyDate}" pattern="yyyy-MM-dd HH:mm:ss"/></th>
                            </tr>
                        </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
      </div>
    </div>
     <div class="form-group">
        <div class="col-md-6 col-md-offset-3">
          <button type="button" class="btn btn-primary" id="back">返回</button>
        </div>
      </div>
    <div class="clearfix"></div>
    <br/><br/>
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
<script src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>