angular.module('tobaccoApp').register.factory("formService", [ "$http","$q",
		function($http,$q) {
	
	// 保存获取更行数据
	var saveOrUpdate = function(member) {
		
		var defer = $q.defer();//声明延后执行
		
		var data = {
				member : member
		};
		var url = "saveOrUpdateMember.do";

		$http.post(url, data).success(function(status) {

			defer.resolve(status); // 执行成功，预处理数据
		
		}).error(function(){
			
			defer.reject(); // 声明执行失败
		});
		
		return defer.promise; // 返回承诺，返回获取数据的API
	};
	
	
	// 根据id获取对象
	var getDataById = function(memberId) {
		
		var defer = $q.defer();//声明延后执行
		
		var data = {
				memberId : memberId
		};
		var url = "getMemberById.do";

		$http.post(url, data).success(function(response) {

			defer.resolve(response); // 执行成功，预处理数据
		
		}).error(function(){
			
			defer.reject(); // 声明执行失败
		});
		
		return defer.promise; // 返回承诺，返回获取数据的API
	};
	
	// 返回定义的方法函数
	return {
		getDataById : function(memberId){
			
			return getDataById(memberId);
		},
		saveOrUpdate : function(member){
			
			return saveOrUpdate(member);
		}
	};

} ]);