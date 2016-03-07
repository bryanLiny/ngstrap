/*
 * 自定义菜单树 ---Bryan
 * 包裹折叠
 * */
app.directive('accordion', function() {
    return {
        restrict : 'EA',
        replace : true,
        transclude : true,
        template : '<ul class="nav" ng-transclude></ul>',
        controller : function() {
            var expanders = [];
            this.gotOpened = function(selectedExpander) {
                angular.forEach(expanders, function(expander) {
                    if (selectedExpander != expander) {
                        expander.showMe = false;
                    }
                });
                
                
            }
            this.addExpander = function(expander) {
                expanders.push(expander);
            }
        }
    }
});

/*
 * 自定义菜单树 ---Bryan
 * 展开
 * */
app.directive('expander', function() {
    return {
        restrict : 'EA',
        replace : true, // 替换
        transclude : true, // 嵌入 ng-transclude
        require : '^?accordion', // 引入
        scope : {
            title : '=expanderTitle',
            subList : '=subList'
        },
        template : '<li>'
	                   + '<a href="" class="auto res-click" ng-click="toggle()"> '
		                   + '<span class="pull-right text-muted"> '
			                   + '<i class="fa fa-fw fa-angle-right" ng-hide="showMe"></i> '
			                   + '<i class="fa fa-fw fa-angle-down" ng-show="showMe"></i>'
		                   + '</span> '
		                   + '<i class="glyphicon glyphicon-stats"></i> '
		                   + '<span class="font-bold">{{title}}</span>'
	                   + '</a>'
	                   + '<ul class="nav nav-sub am-slide-left" ng-show="showMe"> '
		                   + '<li class="" ng-repeat="subResouce in subList">'
			                   + '<a ng-href="#/{{subResouce.value}}">'
			                   + '	<span>{{subResouce.name}}</span>'
			                   + '</a>'
		                   + '</li>'
	                   + '</ul>'
                   + '</li>',
        link : function(scope, element, attrs, accordionController) {
            scope.showMe = false;
            accordionController.addExpander(scope);
            scope.toggle = function toggle() {
                scope.showMe = !scope.showMe;
                accordionController.gotOpened(scope);
            }
        }
    }
});