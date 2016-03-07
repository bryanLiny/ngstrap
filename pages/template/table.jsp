<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<form class="form-inline" role="form">
	<div class="form-group pull-left">
		<a class="btn btn-primary" ng-href="#/getFormEdit/add">addInfo</a>
	</div>
	<div style="margin-bottom: 10px;" class="form-group pull-right">
		<label>Search:</label>
		<input type="text" ng-model="searchKey" ng-change="searchData()" class="form-control" placeholder="Enter NickName">
	</div>
</form>
<div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>昵称</th>
				<th>电话</th>
				<th>真实姓名</th>
				<th>注册时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="member in members">
				<td>{{member.nickName}}</td>
				<td>{{member.tel}}</td>
				<td>{{member.realName}}</td>
				<td>{{member.regTime}}</td>
				<td>
					<a ng-href="#/getFormEdit/{{member.id}}">修改</a> | 
					<a href="" ng-click="deleteData(member.id)">删除</a>
				</td>
			</tr>
		</tbody>
	</table>
	<tm-pagination conf="paginationConf"></tm-pagination>
</div>