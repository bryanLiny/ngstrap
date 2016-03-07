/**
 * 入口文件
 * 2014-11-30 mon
 */
require.config({
    baseUrl: "/cops/resources/js/",
    paths: {
    
    	//基本的angularjs文件
      "jquery": "bower_components/jquery/jquery.min",
      "angular" : "bower_components/angular/angular",
      "angular-route" : "bower_components/angular/angular-route.min",
      "angular-sanitize" : "bower_components/angular/angular-sanitize.min",
      "angular-messages" : "bower_components/angular/angular-messages.min",
      "angular-resource" : "bower_components/angular/angular-resource.min",
      "angular-animate" : "bower_components/angular-animate/angular-animate.min",
      "angular-strap" : "bower_components/angular-strap/angular-strap.min",
      "angular-strap-tpl" : "bower_components/angular-strap/angular-strap.tpl.min",

      // app.js
      "app" : "app",
      
      // services
      
      // controllers
      "NavBarController" : "controllers/NavController",
      "SidebarController" : "controllers/SidebarController",

      // 路由template加载
      "route" : "route/appRoute"
    }
});


require(['jquery','angular','angular-route','angular-sanitize',
         'angular-route','angular-resource','angular-messages','angular-animate',
         'angular-strap','angular-strap-tpl','app',
         'NavBarController','SidebarController'],
         function ($,angular){

      $(function () {

            angular.bootstrap(document,["tobaccoApp"]);
      })

});