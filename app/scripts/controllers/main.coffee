'use strict'

module = angular.module('mirthRestPatientQuerierApp')

module.controller 'MainCtrl', ($scope, $filter, $resource, ngTableParams) ->
	$scope.results = new Array()
	
	$scope.tableParams = new ngTableParams({
	        page: 1,            
	        count: 10           
	    }, {
	        total: $scope.results.length, 
	        getData: ($defer, params) ->
	            $defer.resolve($scope.results.slice((params.page() - 1) * params.count(), params.page() * params.count()));
	    });
		
	$scope.submitPatientQuery = (patient) ->
		return false unless $scope.restURL
		
		if patient && patient.dateOfBirth
			patient.dateOfBirth = $filter('date')(patient.dateOfBirth, 'mediumDate');
			
		$scope.patient = angular.copy(patient)
		
		myresource = $resource($scope.restURL, patient , { 'get': { method: 'GET', isArray: true } })
		myresource.get().$promise.then( (data) ->
				$scope.results = data
				$scope.tableParams.reload();
			, (error) ->
				console.log "fails"
				console.log error
		)