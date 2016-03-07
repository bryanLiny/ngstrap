<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="row">
	<div class="col-xs-6">
		<abn-tree tree-data="my_data" 
			tree-control="my_tree"
			on-select="my_tree_handler(branch)"></abn-tree>
			
		<button ng-click="try_adding_a_branch()" class="btn btn-success">Add Branch</button>
	</div>
	<div class="col-xs-5">
		<p>你选中的是: {{output}}</p>
	</div>
</div>

