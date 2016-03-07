<style>
	.form-group{
		height: 35px;
	}
</style>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="resource" value="${basePath}/resources" />
<c:set var="pages" value="${basePath}/pages" />

<form name="Formdata" ng-submit="submitFormData()" class="form-horizontal" novalidate="novalidate" role="form">
	
	<div class="form-group">
		<label class="col-sm-2 control-label text-right" for="user_Name">许可证号：</label>
		<div class="col-sm-9">
			<input type="text" name="tobaccoRetailLicenses" ng-model="formData.tobaccoRetailLicenses" id="user_Name"
				class="form-control" ng-maxlength="20" ng-minlength="3" required />
			<ng-messages for="Formdata.tobaccoRetailLicenses.$error">
			  	<div class="error" ng-messages-include="${pages }/template/error.jsp"></div>
			</ng-messages>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2 text-right" for="user_identityCard">身份证号：</label>
		<div class="col-sm-9">
			<input type="text" ng-model="formData.identityCard"
				id="user_identityCard" class="form-control" maxlength="20" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2 text-right" for="user_loginName">登录名：</label>
		<div class="col-sm-9">
			<input type="text" ng-model="formData.loginName"
				id="user_loginName" class="form-control" maxlength="20" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2 text-right" for="user_tel">电话号码：</label>
		<div class="col-sm-9">
			<input type="text" ng-model="formData.tel"
				id="user_tel" class="form-control" maxlength="20" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2 text-right" for="user_pwd">登录密码：</label>
		<div class="col-sm-9">
			<input type="password" name="userPwd" ng-model="formData.password"
				id="user_pwd" class="form-control" maxlength="20" />
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-11">
			<button type="submit" class="btn btn-success pull-right">submit</button>
		</div>
	</div>

	
	<div class="form-group">
		<label class="control-label col-sm-2 text-right">Checkbox:</label>
		<div class="col-sm-9 btn-group">
	        <label class="btn btn-primary" ng-model="checkModel.left" uib-btn-checkbox>Left</label>
	        <label class="btn btn-primary" ng-model="checkModel.middle" uib-btn-checkbox>Middle</label>
	        <label class="btn btn-primary" ng-model="checkModel.right" uib-btn-checkbox>Right</label>
	    </div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2 text-right">Radio Model:</label>
		<div class="col-sm-9 btn-group">
	        <label class="btn btn-primary" ng-model="radioModel" uib-btn-radio="'Left'">Left</label>
	        <label class="btn btn-primary" ng-model="radioModel" uib-btn-radio="'Middle'">Middle</label>
	        <label class="btn btn-primary" ng-model="radioModel" uib-btn-radio="'Right'">Right</label>
	    </div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2 text-right">DatePicker:</label>
		<div class="col-sm-9">
	        <p class="input-group">
              <input type="text" class="form-control" uib-datepicker-popup="yyyy-MM-dd" 
              ng-model="dt" is-open="popup1.opened" 
              datepicker-options="dateOptions" ng-required="true" 
              close-text="Close" alt-input-formats="altInputFormats" />
              <span class="input-group-btn">
                <button type="button" class="btn btn-default" ng-click="open1()">
                	<i class="glyphicon glyphicon-calendar"></i>
                </button>
              </span>
            </p>
	    </div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2 text-right">Modal dialog:</label>
		<div class="col-sm-9">
			<button type="button" class="btn btn-default" ng-click="openModal('lg')">弹出modal框</button>
			<label>你选的是：{{selected}}</label>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2 text-right">Dropdown:</label>
		<div class="btn-group col-sm-9" uib-dropdown>
			<a id="single-button" data-placement="bottom-left" class="btn btn-primary"
				uib-dropdown-toggle ng-disabled="disabled">
				我是下拉
				<span class="caret"></span>
			</a>
			<ul uib-dropdown-menu class="dropdown-menu-left" role="menu" aria-labelledby="single-button">
				<li role="menuitem"><a href="#">Action</a></li>
				<li role="menuitem"><a href="#">Another action</a></li>
				<li role="menuitem"><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li role="menuitem"><a href="#">Separated link</a></li>
			</ul>
		</div>
	</div>
	
</form>


