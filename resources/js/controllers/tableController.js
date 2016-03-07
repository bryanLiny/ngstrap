angular.module('tobaccoApp').config(['$httpProvider','$translateProvider',function($httpProvider,$translateProvider){
		//配置post请求的Content-Type为application/x-www-form-urlencoded
		//因为angular的$http默认Content-Type为application/json
		
	    //$httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
	    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
	    
}]).register.controller("tblController", [ "$scope","$http", "$templateCache","$translate","dialogs",
      function($scope, $http, $templateCache,$translate,dialogs) {

			// 初始化分页
			$scope.paginationConf = {
		        currentPage: 1,
		        itemsPerPage: 10
		    };
	
		 	// 查询框的change事件
			$scope.searchData = function(){
				
				GetAllEmployee();
			};
			// 分页方法
			var GetAllEmployee = function () {
				var pageInfo = {
		     		pageNo: $scope.paginationConf.currentPage,
		     		pageSize: $scope.paginationConf.itemsPerPage
		        };
				//searchKey获值，第一次进入界面$scope.searchKey为null时，赋值为""
				//避免后台JSONObject["searchKey"] not found 的情况
				var data = {
						pageInfo : pageInfo,
						searchKey : $scope.searchKey || "" 
				};
	            $http.post('getPageList.do', data).success(function (response) {
	                $scope.paginationConf.totalItems = response.totalCount;
	                $scope.members = response.result;
	            });
	        }
			// 分页当前页数和条数改变监听
			$scope.$watch('paginationConf.currentPage + paginationConf.itemsPerPage', GetAllEmployee);
			
			// 删除信息
			$scope.deleteData = function(memberId){
				var pageInfo = {
			     		pageNo: $scope.paginationConf.currentPage,
			     		pageSize: $scope.paginationConf.itemsPerPage
			        };
				var data = {
						pageInfo : pageInfo,
						memberId : memberId
				};
				$translate.use("zh");//设置dialog按钮中文
				dlg = dialogs.confirm('删除提示','确定删除该条数据吗？');
		        dlg.result.then(function(btn){
					$http.post('deleteMember.do', data).success(function (response) {
		                $scope.paginationConf.totalItems = response.totalCount;
		                $scope.members = response.result;
		            });
		        },function(btn){
		        	//点击取消，暂不做处理
		        	//console.log("nnnn");
		        });
			}
			
} ]);