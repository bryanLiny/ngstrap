angular.module('tobaccoApp').register.factory("treeService", [ "$http","$q",
		function($http,$q) {
	
	var getTreeData = function(){
		var treeData = [], defer = $q.defer();
		$http.get("getResourceList.do").success(function(data){
			angular.forEach(data,function(obj){
				var data = {
						children : [],
						classes : [],
						label : obj.name,
						parent_uid : obj.fkParentId,
						uid : obj.id
				};
				treeData.push(data);
			});
			defer.resolve(treeData);
		
		}).error(function(data){
			defer.reject();
		});
		return defer.promise;
	};
	
	var getsubMenuByParentId = function(parentId){
		
		var treeData = [], defer = $q.defer();
		var data = {
				parentId : parentId
		};
		$http.post("getsubMenuByParentId.do",data).success(function(data){
			angular.forEach(data,function(obj){
				var data = {
						children : [],
						classes : [],
						label : obj.name,
						parent_uid : obj.fkParentId,
						uid : obj.id
				};
				treeData.push(data);
			});
			defer.resolve(treeData);
		
		}).error(function(data){
			defer.reject();
		});
		return defer.promise;
	};
	
	// 返回定义的方法函数
	return {
		getTreeData : function(){
			
			return getTreeData();
		},
		getsubMenuByParentId : function(parentId){
			return getsubMenuByParentId(parentId);
		}
	};

} ]);