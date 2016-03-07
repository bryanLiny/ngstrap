/**
 * 路由
 */
angular.module('tobaccoApp').config(
		[ '$routeProvider', function($routeProvider) {
			
			var pagePath = 'pages/template',
				resoucepath = 'resources/js/';
			
			$routeProvider
			.when('/getFormEdit/:id', {//需要传递id参数
				templateUrl : pagePath + '/form.jsp',
				controller : 'formController',
				resolve : {
					load : app.asyncjs([resoucepath + 'services/formService.js',
					                    resoucepath + 'controllers/formController.js'])
				}
			})
			.when('/getTable', {
				templateUrl : pagePath + '/table.jsp',
				controller : 'tblController',
				resolve : {
					load : app.asyncjs(resoucepath + 'controllers/tableController.js')
				}
			})
			.when('/getTree', {
				templateUrl : pagePath + '/tree.jsp',
				controller : 'treeController',
				resolve : {
					load : app.asyncjs([resoucepath + 'services/treeService.js',
					                    resoucepath + 'controllers/treeController.js'])
				}
			}).when('/testDirective', {
				templateUrl : pagePath + '/resourceTree.jsp',
//				controller : 'treeController',
//				resolve : {
//					load : app.asyncjs([resoucepath + 'directives/testDirective.js'])
//				}
			}).otherwise({
				redirectTo : '/'
			});


		} ]);