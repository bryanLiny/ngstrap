<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<accordion>
    <expander class='expander' ng-repeat='resource in resources' 
    	sub-list='resource.listResource' expander-title='resource.name'>
    </expander>
</accordion>

