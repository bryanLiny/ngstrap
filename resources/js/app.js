/*
	App主模块,所有模块都需加载
 */
var app = angular.module('tobaccoApp', ['ui.bootstrap', 'ngAnimate', 'ngSanitize',
		'ngMessages','ngRoute','tm.pagination','dialogs.main',
		'pascalprecht.translate','angularBootstrapNavTree']);


app.config(['dialogsProvider','$translateProvider','$controllerProvider',
            '$compileProvider','$filterProvider','$provide',
            function(dialogsProvider,$translateProvider,$controllerProvider, $compileProvider, $filterProvider,
		$provide) {
	// 注册模块
	app.register = {
		controller : $controllerProvider.register,
		directive : $compileProvider.directive,
		filter : $filterProvider.register,
		factory : $provide.factory,
		service : $provide.service
	};
	// 配置dialog国际化信息--本项目中文
	dialogsProvider.useBackdrop('static');
	dialogsProvider.useEscClose(false);
	dialogsProvider.useCopy(false);
	dialogsProvider.setSize('sm');

	$translateProvider.translations('zh',{
		DIALOGS_ERROR: "错误",
		DIALOGS_ERROR_MSG: "操作有误！",
		DIALOGS_CLOSE: "关闭",
		DIALOGS_PLEASE_WAIT: "正在执行...",
		DIALOGS_PLEASE_WAIT_ELIPS: "正在执行...",
		DIALOGS_PLEASE_WAIT_MSG: "正在执行...",
		DIALOGS_PERCENT_COMPLETE: "当前完成量(%)",
		DIALOGS_NOTIFICATION: "Notificacion",
		DIALOGS_NOTIFICATION_MSG: "是否需要操作该条数据？",
		DIALOGS_CONFIRMATION: "Confirmacion",
		DIALOGS_CONFIRMATION_MSG: "确定删除该条信息吗？",
		DIALOGS_OK: "确定",
		DIALOGS_YES: "确定",
		DIALOGS_NO: "取消"
	});

	$translateProvider.preferredLanguage('zh_CN');
	
	//设置异步加载js文件的方法，其中参数js为数组对象['xx.js','aaa.js',...]
	app.asyncjs = function (js) {
        return ["$q", "$route", "$rootScope", function ($q, $route, $rootScope) {
            var deferred = $q.defer();
            var dependencies = js;
            if (Array.isArray(dependencies)) {
                for (var i = 0; i < dependencies.length; i++) {
                    dependencies[i];
                }
            } else {
                dependencies;//v是版本号
            }
            $script(dependencies, function () {
                $rootScope.$apply(function () {
                    deferred.resolve();
                });
            });
            return deferred.promise;
        }];
    }
}]);
