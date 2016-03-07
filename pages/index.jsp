<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="resource" value="${basePath}/resources" />
<c:set var="pages" value="${basePath}/pages" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- bootstrap css 和 图标 -->
	<link rel="stylesheet" type="text/css" href="${resource}/js/bower_components/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${resource}/js/bower_components/bootstrap/css/font-awesome.css">
	<!-- 动画CSS -->
	<link href="${resource}/js/bower_components/angular-motion/angular-motion.css" rel="stylesheet">
	<!-- 外加CSS样式 -->
	<link href="${resource}/js/bower_components/bootstrap-additions/bootstrap-additions.min.css" rel="stylesheet">
	<!-- tree -->
	<link href="${resource}/js/lib/abn_tree/abn_tree.css" rel="stylesheet">
	<!-- app.css -->
	<link rel="stylesheet" href="${resource}/css/app.css">
	
	<title>烟易付管理系统</title>
</head>
<body ng-app="tobaccoApp">
<div ng-controller="appController" ng-init="basepath='${basePath }';pages='${pages}'">
	<div class="navbar" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">
				<i class="fa fa-btc"></i>
				angularStrap
			</a>
		</div>
		<div class="collapse navbar-collapse navbar-container">
			<ul class="nav navbar-nav navbar-right">
				<li uib-dropdown class="dropdown">
					<a id="single-button"
					 class="btn btn-default" data-placement="bottom-right"
						uib-dropdown-toggle ng-disabled="disabled">
						<i class="fa fa-user"></i>
					 	<span>&nbsp;Bryanlin&nbsp;</span>
					 	<span class="caret"></span>
					</a>
					 <ul uib-dropdown-menu class="dropdown-menu">
						<li>
							<a href="#"> 
								<span class="badge bg-danger pull-right">30%</span>
								<span>Settings</span>
							</a>
						</li>
						<li>
							<a href="#">Profile</a>
						</li>
						<li>
							<a href="#"> 
							<span class="label bg-info pull-right">new</span> Help
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="#">
							<i class="fa fa-lock"></i>
							<span>Logout</span>
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="app-sidebar">
		<nav>
			<ul class="nav">
				<li class="">
					<a href="" class="auto" ng-click="showSubMenu()"> 
						<span class="pull-right text-muted"> 
							<i class="fa fa-fw fa-angle-right" ng-show="isShow"></i> 
							<i class="fa fa-fw fa-angle-down" ng-hide="isShow"></i>
						</span> 
						<i class="glyphicon glyphicon-stats"></i> 
						<span class="font-bold">Dashboard</span>
					</a>
					<ul class="nav nav-sub am-slide-left" ng-hide="isShow">
						<li class="" ng-repeat="smenu in secMenu">
							<a ng-href="#/{{smenu.value}}">
								<span>{{smenu.text}}</span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href=""> 
						<i class="glyphicon glyphicon-calendar"></i> 
						<span class="font-bold">Calendar</span>
					</a>
				</li>
				
				<li class="res-data" ng-repeat="resource in resources track by resource.id">
					<a href="" class="auto res-click" ng-click="showSubMenu1(resource)"> 
						<span class="pull-right text-muted"> 
							<i class="fa fa-fw fa-angle-right" ng-hide='resource.isHide'></i> 
							<i class="fa fa-fw fa-angle-down" ng-show='resource.isHide'></i>
						</span> 
						<i class="glyphicon glyphicon-stats"></i> 
						<span class="font-bold">{{resource.name}}</span>
					</a>
					<ul class="nav nav-sub am-slide-left" ng-show='resource.isHide'>
						<li class="" ng-repeat="subResouce in resource.listResource">
							<a ng-href="#/{{subResouce.value}}">
								<span>{{subResouce.name}}</span>
							</a>
						</li>
					</ul>
				</li>
				
			</ul>
			
		</nav>
	</div>
	<div class="app-content">
		<!-- <div ng-include="info.template" class="am-slide-bottom app-include"></div> -->
		<div ng-view class="am-slide-bottom app-include container-fluid"></div>
		<!-- <div ui-view class="am-slide-bottom app-include"></div> -->
	</div>
</div>
</body>

	<!-- 异步加载器 -->
	<script type="text/javascript" src="${resource}/js/scripts/script.min.js"></script>
	<!-- jquery -->
	<script type="text/javascript" src="${resource}/js/bower_components/jquery/jquery.min.js"></script>
	<!-- angular -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular/angular.js"></script>
	<!-- 国际化 -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular-translate/angular-translate.js"></script>
	<!-- ui-bootstrap -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular-bootstrap/ui-bootstrap.js"></script>
	<script type="text/javascript" src="${resource}/js/bower_components/angular-bootstrap/ui-bootstrap-tpls.js"></script>
	<!--净化HTML -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular/angular-sanitize.min.js"></script>
	<!--表单验证 -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular/angular-messages.min.js"></script>
	<!-- 路由ngRoute -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular/angular-route.min.js"></script>
	<!-- 分页 -->
	<script type="text/javascript" src="${resource }/js/lib/pagination/tm.pagination.js"></script>
	<!-- 动画 -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular-animate/angular-animate.min.js"></script>
	<!-- dialog(notify、error、wait、confirm等) -->
	<script type="text/javascript" src="${resource}/js/bower_components/angular-dialog-service/dialogs.js"></script>
	<!-- tree -->	
	<script type="text/javascript" src="${resource}/js/lib/abn_tree/abn_tree_directive.js"></script>
	<!-- app -->
	<script type="text/javascript" src="${resource}/js/app.js"></script>
	<!-- 路由 -->
	<script type="text/javascript" src="${resource}/js/route/appRoute2.js"></script>
	<!-- appController -->
	<script type="text/javascript" src="${resource}/js/controllers/appController.js"></script>
	
	<script type="text/javascript" src="${resource}/js/directives/testDirective.js"></script>
	
</html>