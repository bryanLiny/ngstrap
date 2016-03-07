# ngstrap
angular + bootstrap with angularUI

1、	目录结构说明
a)	两大目录pages和resources
Pages目录下主要包括index.jsp文件和一个template目录，index.jsp问应用主入口，template目录存放HTML片段文件，template目录可以按需再添加子目录，例如system目录，order目录等等。
		Resources 目录下包含片段界面所需对应的css目录文件夹，image文件夹，js文件夹以及uploads文件上传存放路径。
		重点说明js文件夹下，包含components、controllers、directives、filters、lib、route、services文件夹，以及主文件app.js。
		Component：主要存放angular库文件。
		Controller：存放界面控制文件。
		Directive：存放自定义的指令文件，以便于DOM操作。
		Filter：存放过滤文件。例如日期的时间格式化等等。
		Lib：存放其他库文件，例如分页、菜单树等等。
		Router：angular App的路由文件存放路径，控制界面的转向。
		Service：存放service文件，用于与后台数据交互，并输送给controller。

整体页面结构截图如下：
 

2、	开发说明：
1）创建Jsp界面（以form.jsp为例）：
 
2）创建对应formController.js文件
 
注入说明：
		$scope: 为angular全局作用域参数，作为与界面进行双向绑定或者界面数据初始化等操作。一般为必须注入。
		$routeParams: 为获取router路由地址参数，例如$routeParams.id可以获取地址栏上的id值。
		$translate: 为国际化使用。
		dialogs: 为弹框提示信息。例如notify、confirm、error等。
		Formservice：为服务注入，数据交互。

3）创建formService服务：
		 

注入说明：
		$http: 进行数据通信。它简单封装了浏览器原生的XMLHttpRequest对象。$http成功，返回promise对象。
		$q：将promise对象作为异步执行操作结果对象进行交互的接口，在指定时间内可能完成或者不可能完成（如延迟、拦截等）。

4）配置路由router：
 

5）最终家在界面查看结果：
 
3、	数据库resource资源地址配置说明：
1）、数据库地址配置需要和路由地址保持一致，路由地址如上已经给出说明，举例说明：
A）	有参数：’/getFormEdit/:id/:name’
B）	无参数：’/getTable’
2）、界面地址配置
		地址链接一并以angular指令’ng-href’作为链接地址配置指令，需要注意的是地址必须以’#/’开头。举例说明：
<a ng-href="#/getFormEdit/6a410c73769e4a1d9b60a35c229a01a1/bryan">
	<span>点击</span>
</a>

<a ng-href="#/getTable">
	<span>点击</span>
</a>

4、/////待补充 

