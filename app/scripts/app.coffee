'use strict'

angular.module('mirthRestPatientQuerierApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ngResource',
  'ngTable',
  'MirthResults'
])
	.config ($routeProvider) ->
		$routeProvider
			.when '/',
				templateUrl: 'views/main.html'
				controller: 'MainCtrl'
			.when '/patient/:id',
				templateUrl: 'views/patient.html'
				controller: 'PatientDetailCtrl'
			.when '/about',
				templateUrl: 'views/about.html'
			.otherwise
				redirectTo: '/'
