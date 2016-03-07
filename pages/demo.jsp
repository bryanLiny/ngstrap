<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>烟易付后台管理系统</title>
	<!-- bootstrap css 和 图标 -->
	<link rel="stylesheet" type="text/css" href="bower_components/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="{resource}/bower_components/bootstrap/css/font-awesome.css">
	<!-- 动画CSS -->
	<link href="{resource}/bower_components/angular-motion/angular-motion.css" rel="stylesheet">
	<!-- 外加CSS样式 -->
	<link href="{resource}/bower_components/bootstrap-additions/bootstrap-additions.min.css" rel="stylesheet">

	<link rel="stylesheet" href="{resource}/css/app.css">
</head>

<body ng-app="navApp">
<div class="app">
	<div ng-controller="NavBarController" class="navbar" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">
				<i class="fa fa-btc"></i>
				angularStrap
			</a>
		</div>
		<div class="collapse navbar-collapse navbar-container">
			
			<!-- link and dropdown -->
			<ul class="nav navbar-nav hidden-sm">
				<li class="dropdown">
					<a class="btn" data-animation="am-flip-x"
					 bs-dropdown="dropdown_toggle" aria-haspopup="true" aria-expanded="false">
					 	<span>toggle dropdown</span>
					 	<span class="caret"></span>
					 </a>
				</li>
				<li class="dropdown">
					<a class="btn" data-animation="am-flip-x" bs-dropdown aria-haspopup="true" aria-expanded="false">
					  	<span>sibling dropdown</span>
					 	<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
					  <li><a href="#anotherAction"><i class="fa fa-download"></i>&nbsp;动作</a></li>
					  <li><a ng-click="$alert('我是alert')"><i class="fa fa-globe"></i>&nbsp;一个alert</a></li>
					  <li ng-repeat="i in [{value:'url1',text:'动作1'}, {value:'url2',text:'动作2'}, {value:'url3',text:'动作3'}]"><a ng-href="#action{{i.value}}"><i class="fa fa-chevron-right"></i>&nbsp;{{i.text}}</a></li>
					</ul>				
				</li>
			</ul>
			<!-- link and dropdown end -->
			<!-- user nav -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown dropdown-margin">
					<a class="btn dropdown-toggle" data-animation="am-fade-and-slide-bottom"
					 bs-dropdown data-placement="bottom-right" aria-expanded="true">
					 	<i class="fa fa-warning"></i>
					 </a>
					 <div class="dropdown-menu dropdown-width-250">
					 	<div class="panel bg-white">
			                <div class="panel-heading">
			                  <strong>You have <span>2</span> notifications</strong>
			                </div>
			                <div class="list-group">
			                  <a href="" class="media list-group-item">
			                    <span class="media-body">
			                      1.0 initial released<br>
			                      <small class="text-muted">1 hour ago</small>
			                    </span>
			                  </a>
			                </div>
			                <div class="panel-footer">
			                  <a href="" class="pull-right"><i class="fa fa-cog"></i></a>
			                  <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
			                </div>
			              </div>
					 </div>
				</li>
				<li class="dropdown dropdown-margin">
					<a class="btn" data-animation="am-fade-and-slide-right"
					bs-dropdown data-placement="bottom-right" aria-expanded="false">
					 	<i class="fa fa-user"></i>
					 	<span>Bryanlin</span>
					 	<span class="caret"></span>
					 </a>
					 <ul class="dropdown-menu">
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
			<!-- user nav end -->
		</div>
	</div>
	
	<div ng-controller="SidebarController" >
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
								<a href="" ng-click="getListData(smenu)">
									<span>{{smenu.text}}</span>
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a > 
							<i class="glyphicon glyphicon-calendar"></i> 
							<span class="font-bold">Calendar</span>
						</a>
					</li>
					
					<!-- <li class="">
						<a href="" class="auto" ng-click="showSubMenu()"> 
							<span class="pull-right text-muted"> 
								<i class="fa fa-fw fa-angle-right" ng-show="isShow"></i> 
								<i class="fa fa-fw fa-angle-down" ng-hide="isShow"></i>
							</span> 
							<i class="glyphicon glyphicon-th-large text-success"></i> 
							<span class="font-bold">Apps</span>
						</a>
						<ul class="nav nav-sub am-slide-left" ng-hide="isShow">
							<li class="">
								<a href="#"> 
									<span>Note</span>
								</a>
							</li>
						</ul>
					</li> -->
				</ul>
			</nav>
		</div>
		
		<div class="app-content">
			<div ng-include="info.template" class="am-slide-bottom app-include"></div>
		</div>
	</div>
	
</div>
</body>
	<script type="text/javascript" src="/bower_components/angular/angular.js"></script>
	<!--净化HTML -->
	<script type="text/javascript" src="{resource}/bower_components/angular/angular-sanitize.min.js"></script>
	<!--表单验证 -->
	<script type="text/javascript" src="{resource}/bower_components/angular/angular-messages.min.js"></script>
	
	<!-- <script type="text/javascript" src="../bower_components/angular/angular-aria.min.js"></script>
	<script type="text/javascript" src="../bower_components/angular/angular-cookies.min.js"></script>
	<script type="text/javascript" src="../bower_components/angular/angular-loader.min.js"></script>
	
	<script type="text/javascript" src="../bower_components/angular/angular-resource.min.js"></script>
	
	
	<script type="text/javascript" src="../bower_components/angular/angular-route.min.js"></script>
	
	<script type="text/javascript" src="../bower_components/angular/angular-touch.min.js"></script>
	<script type="text/javascript" src="../bower_components/angular/angular-mocks.js"></script>
	<script type="text/javascript" src="../bower_components/angular/angular-scenario.js"></script> -->
	<!-- angular结束 -->
	<!-- angularStrap tpl模板 -->
	<script type="text/javascript" src="{resource}/bower_components/angular-strap/angular-strap.min.js"></script>
	<script type="text/javascript" src="{resource}/bower_components/angular-strap/angular-strap.tpl.min.js"></script>
	<!-- 动画 -->
	<script type="text/javascript" src="{resource}/bower_components/angular-animate/angular-animate.min.js"></script>

	<script type="text/javascript" src="{resource}/js/navbar.js"></script>
	<script type="text/javascript" src="{resource}/js/controllers/NavController.js"></script>
	<script type="text/javascript" src="{resource}/js/controllers/SidebarController.js"></script>
</html>