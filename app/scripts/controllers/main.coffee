'use strict'

module = angular.module('mirthRestPatientQuerierApp')

module.controller 'MainCtrl', ($scope, $filter, $resource) ->
	$scope.results = new Array()
	$scope.submitPatientQuery = (patient) ->
		return false unless $scope.restURL
		
		if patient.dateOfBirth
			patient.dateOfBirth = $filter('date')(patient.dateOfBirth, 'mediumDate');
			
		$scope.patient = angular.copy(patient)
		
		myresource = $resource($scope.restURL, patient , { 'get': { method: 'GET', isArray: true } })
		myresource.get().$promise.then( (data) ->
				$scope.results = data
			, (error) ->
				console.log "fails"
				console.log error
		)