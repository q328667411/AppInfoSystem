



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

			<div class="right_col" role="main">
				<div class="">

<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					APP 信息管理维护 <i class="fa fa-user"></i><small>测试账户001
						- 您可以通过搜索或者其他的筛选项对APP的信息进行修改、删除等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">

					<form:form method="post" modelAttribute="appInfo"  action="list">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="softwareName" type="text" class="form-control col-md-7 col-xs-12" value="">
							</div>
						</div>
					</li>

					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<%--<form:select items="${statusList}" path="status" class="form-control" itemLabel="valueName" itemValue="valueId"></form:select>--%>
								<select name="status" class="form-control">
									   <option value="">--请选择--</option>
									   <c:forEach var="status" items="${statusList}">
										  <c:if test="${status.valueId==appInfo.status}">
											   <option
													   value="${status.valueId}" selected="selected">${status.valueName}</option>
										   </c:if>
										   <c:if test="${status.valueId!=appInfo.status}">
                                              <option
                                                      value="${status.valueId}">${status.valueName}</option>
                                          </c:if>
									   </c:forEach>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<%--<form:select path="flatformId" class="form-control" items="${forms}"
								itemLabel="valueName" itemValue="valueId"></form:select>--%>
								<select name="flatformId" class="form-control">

									   <option value="">--请选择--</option>
									<c:forEach var="forms" items="${forms}">
										<c:if test="${forms.valueId==appInfo.flatformId}">
											<option
													value="${forms.valueId}" selected="selected">${forms.valueName}</option>
										</c:if>
										<c:if test="${forms.valueId!=appInfo.flatformId}">
											<option
													value="${forms.valueId}">${forms.valueName}</option>
										</c:if>

									</c:forEach>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="hidden" id="categoryLevel1Id" value="${appInfo.categoryLevel1}">
								<%--<form:select path="categoryLevel1" class="form-control"
								items="${queryCategoryLevel1}" itemLabel="categoryLevel1Name" itemValue="categoryLevel1"></form:select>--%>
								<select id="queryCategoryLevel1" name="categoryLevel1" class="form-control">

									   <option value="">--请选择--</option>
                                    <c:forEach var="queryCategoryLevel1" items="${queryCategoryLevel1}">
                                        <option
                                                value="${queryCategoryLevel1.id}">${queryCategoryLevel1.categoryName}</option>
                                    </c:forEach>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" name="categorylevel2list" id="categorylevel2list"/>
								<input type="hidden" id="categoryLevel2Id" value="${appInfo.categoryLevel2}">
								<%--<form:select path="categoryLevel2" class="form-control"></form:select>--%>
        						<select name="categoryLevel2" id="queryCategoryLevel2" class="form-control">
									<option value="">--请选择--</option>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
							<input type="hidden" id="categoryLevel3Id" value="${appInfo.categoryLevel3}">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<%--<form:select path="categoryLevel3" class="form-control"></form:select>--%>
        						<select name="categoryLevel3" id="queryCategoryLevel3" class="form-control">
									<option value="">--请选择--</option>
        						</select>
							</div>
						</div>
					</li>
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button></li>
				</ul>
							</form:form>
		</div>
	</div>
</div>
<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_content">
			<p class="text-muted font-13 m-b-30"></p>
			<div id="datatable-responsive_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap no-footer">
				<div class="row">
					<div class="col-sm-12">
					<a href="/dev/basics" class="btn btn-success btn-sm">新增APP基础信息</a>
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">软件名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										APK名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										软件大小(单位:M)</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										所属平台</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										所属分类(一级分类、二级分类、三级分类)</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										状态</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										下载次数</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										最新版本号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="appInfoLIst" items="${appInfoLIst}">
								<tr role="row" class="odd">
									<td tabindex="0" class="sorting_1">${appInfoLIst.softwareName}</td>
									<td>${appInfoLIst.apkName}</td>
									<td>${appInfoLIst.softwareSize}</td>
									<td>${appInfoLIst.flatformName}</td>
									<td>${appInfoLIst.categoryLevel1Name} -> ${appInfoLIst.categoryLevel2Name} -> ${appInfoLIst.categoryLevel3Name}</td>
									<td><span id="appInfoStatus${appInfoLIst.id}">${appInfoLIst.statusName}</span></td>
									<td>${appInfoLIst.downloads}</td>
									<td>${appInfoLIst.versionNo}</td>
									<td>


										<div class="btn-group">
											<button type="button" class="btn btn-danger">点击操作</button>
											<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li>
                                                    <c:if test="${appInfoLIst.status==2 or appInfoLIst.status==5}">
                                                        <a class="saleSwichClose" saleSwitch="open" appinfoid=${appInfoLIst.id}  appsoftwarename=${appInfoLIst.softwareName} Powder Toy data-toggle="tooltip" data-placement="top" title="" data-original-title="您可以点击下架来停止发布您的APP，市场将不提供APP的下载">上架</a>
                                                    </c:if>
                                                   <c:if test="${appInfoLIst.status==4}">
                                                        <a class="saleSwichClose" saleSwitch="close" appinfoid=${appInfoLIst.id}  appsoftwarename=${appInfoLIst.softwareName} Powder Toy data-toggle="tooltip" data-placement="top" title="" data-original-title="您可以点击下架来停止发布您的APP，市场将不提供APP的下载">下架</a>
                                                    </c:if>

												</li>
												<li><a class="addVersion" appinfoid="${appInfoLIst.id}" data-toggle="tooltip" data-placement="top" title="" data-original-title="新增APP版本信息">新增版本</a>
												</li>
												<li><a class="modifyVersion"
													   appinfoid="${appInfoLIst.id}" versionid="${appInfoLIst.versionId}" status="${appInfoLIst.status}"
													   statusname="${appInfoLIst.statusName}"
													   data-toggle="tooltip" data-placement="top" title="" data-original-title="修改APP最新版本信息">修改版本</a>
												</li>
												<li><a  class="modifyAppInfo"
														appinfoid="${appInfoLIst.id}" status="${appInfoLIst.status}" statusname="${appInfoLIst.statusName}"
														data-toggle="tooltip" data-placement="top" title="" data-original-title="修改APP基础信息">修改</a></li>
												<li><a  class="viewApp" appinfoid=${appInfoLIst.id}  data-toggle="tooltip" data-placement="top" title="" data-original-title="查看APP基础信息以及全部版本信息">查看</a></li>
												<li><a  class="deleteApp" appinfoid=${appInfoLIst.id}  appsoftwarename=${appInfoLIst.softwareName} Powder Toy data-toggle="tooltip" data-placement="top" title="" data-original-title="删除APP基础信息以及全部版本信息">删除</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<div class="dataTables_info" id="datatable-responsive_info"
							role="status" aria-live="polite">共${count}条记录
							${pageNo}/${totalPageCount}页</div>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="datatable-responsive_paginate">
							<ul class="pagination">


								<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],1);"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">首页</a>
								</li>
								<c:if test="${pageNo!=1}">
								<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pageNo-1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">上一页</a>
								</li>
								</c:if>
								<c:if test="${pageNo!=totalPageCount}">
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pageNo+1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">下一页</a>
									</li>
								</c:if>
									<li class="paginate_button next"><a
										href="javascript:page_nav(document.forms[0],${totalPageCount});"
										aria-controls="datatable-responsive" data-dt-idx="7"
										tabindex="0">最后一页</a>
									</li>

							</ul>
						</div>
					</div>
				</div>
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
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<script src="${pageContext.request.contextPath }/statics/localjs/appinfolist.js"></script>

<script>
	$(function(){
		var c1=$("#categoryLevel1Id").val();
		if(c1!=""){
			$("#queryCategoryLevel1").val(c1).change();//显示触发下拉框的onchange事件

		}
	})
</script>
