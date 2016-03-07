/**
 * 路由
 * APP需要引入ui.router
 * 现不适用
 */
angular.module('tobaccoApp').config(
		[ '$routeProvider','$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
			
			$urlRouterProvider.when("/", "/");

			$stateProvider
			        .state("PageTab", {
			            url: "/PageTab",
			            templateUrl: "PageTab.html"
			        })
			        .state("PageTab.Page1", {
			            url:"/Page1",
			            templateUrl: "Page-1.html"
			        })
			        .state("PageTab.Page2", {
			            url:"/Page2",
			            templateUrl: "Page-2.html"
			        })
			        .state("PageTab.Page3", {
			            url:"/Page3",
			            templateUrl: "Page3.html"
			        });
			
			
			var pagePath = 'pages/template',
				basepath = 'cops';
			
			$routeProvider.when('/getTable', {
				templateUrl : pagePath + '/table.jsp',
				controller : 'tblController'
			}).otherwise({
				redirectTo : '/index'
			});

			// $locationProvider.html5Mode(true).hashPrefix('!');

		} ]);