angular.module('tobaccoApp').register.controller("treeController",

[ "$scope", "$http","treeService", function($scope,$http,treeService) {
	
	var tree;
	
	$scope.my_data = [];
	
	var promise = treeService.getTreeData();
	
	promise.then(function(data){
			
		$scope.my_data = data;
		
	},function(data){
		
	});

	$scope.my_tree_handler = function(branch) {
		if(!branch.children.length){//避免重复请求数据
			var parentid = branch.uid;
			var pro = treeService.getsubMenuByParentId(parentid);
			pro.then(function(data){
				branch.children = data;
				branch.expanded = true;
			},function(){
			///	
			});
		}
		$scope.output = "You selected: " + branch.label;
	};
	
	$scope.my_tree = tree = {};

	return $scope.try_adding_a_branch = function() {
		var b;
		b = tree.get_selected_branch();
		return tree.add_branch(b, {
			label : 'New Branch',
			data : {
				something : 42,
				"else" : 43
			}
		});
	};

} ]);