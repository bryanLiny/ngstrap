angular.module('tobaccoApp').register.controller("formController", [
		"$scope",
		"$filter",
		"$routeParams",
		"$translate",
		"dialogs",
		"formService",
		function($scope,$filter,$routeParams,$translate,dialogs,formService) {
			
			$translate.use("zh");//设置dialog按钮中文

			// 数据提交
			$scope.submitFormData = function() {
				// 时间格式化
				$scope.formData.selectedDate = $filter('date')(
						$scope.formData.selectedDate, 'yyyy-MM-dd');

				var promise = formService.saveOrUpdate($scope.formData);
			
				promise.then(function(status){
					if(status){
						dialogs.notify('保存提示','信息保存成功！');
					}
				},function(status){
					if(!status){
						dialogs.error('保存提示','信息保存失败！');
					}
				});
			}
			
			// 根据id获取数据
			function getMemberById(memberId){
				
				var promise = formService.getDataById(memberId);
				
				promise.then(function(data){
					
					$scope.formData = data; //调用承诺接口resolove()
					
				},function(data){
					
					$scope.formData = {}; //调用承诺接口reject();
				});
			}
			
			getMemberById($routeParams.id);
			
			//
			
		} ]);