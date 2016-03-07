angular.module('tobaccoApp').controller("appController",
		[ "$scope","$http","$filter","$uibModal","$log",
		  function($scope,$http, $filter,$uibModal,$log) {
			
			$scope.isShow = true;

			$scope.showSubMenu = function() {

				$scope.isShow = !$scope.isShow;

				$scope.secMenu = [ {
					"text" : "Test Directive",
					"value" : "testDirective"
				}, {
					"text" : "angular-ui-tree",
					"value" : "getTree"
				}, {
					"text" : "数据列表",
					"value" : "getTable"
				} ];
			};
			
			
			/////////////////////菜单//////////////////////
			
			//控制菜单的显示和影藏
			$scope.showSubMenu1 = function(resource){
				
				resource.isHide = !resource.isHide;				
			}
			//初始化(获取)菜单数据
			$scope.resources = [];
			
			$http.get("getAllResource.do",{
				cache: true //菜单数据一旦形成，不会经常更改，可加入缓存
			}).success(function(data){
				
				$scope.resources = data;
				
			}).error(function(data){
				
			});
			
			/////////////////////////////////////////////////

			// 日期
			$scope.open1 = function() {
				$scope.popup1.opened = true;
			};
			$scope.popup1 = {
				opened : false
			};
			$scope.dateOptions = {
				formatYear : 'yy',
				startingDay : 1
			};
			$scope.altInputFormats = [ 'M!/d!/yyyy' ];

			// modal框
			var pagePath = 'pages/template',resoucepath = 'resources/js';
			$scope.items = [ 'item1', 'item2', 'item3' ];
			$scope.openModal = function(size) {

				var modalInstance = $uibModal.open({
					animation : true,
					templateUrl : pagePath + "/modal.jsp",
					controller : 'ModalInstanceCtrl',
					size : size,
					resolve : {
						items : function() {
							return $scope.items;
						},
						load : app.asyncjs(resoucepath + '/controllers/modalController.js')
					}
				});

				modalInstance.result.then(function(selectedItem) {
					$scope.selected = selectedItem;
				}, function() {
					$log.info('Modal dismissed at: ' + new Date());
				});
			};
			
			// 下拉框
			

		} ]);