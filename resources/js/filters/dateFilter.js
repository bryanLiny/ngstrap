angular.module("tobaccoApp").register.filter("fomatDate",function(){
	return function(date){
		return $filter('date')(date,'yyyy-MM-dd');
	} 
});

