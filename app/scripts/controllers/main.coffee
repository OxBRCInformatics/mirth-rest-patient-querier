'use strict'

module = angular.module('mirthRestPatientQuerierApp')

module.controller 'MainCtrl', ($scope) ->
	
    $scope.submitPatientQuery = ->
    	#$scope.patient = angular.copy(patient)
    	console.log "hello?"
    	#resource = $resource($scope.restURL, { 'get': { method: 'GET', isArray: false }, 'update': { method: 'PUT'} })
    	#console.log resource.get()
