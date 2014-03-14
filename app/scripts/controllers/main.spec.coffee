'use strict'

describe 'MainCtrl', ->
	
	# load the controller's module
	beforeEach module 'mirthRestPatientQuerierApp'
  	
	MainCtrl = {}
	scope = {}
  	
	# Initialize the controller and a mock scope
	beforeEach inject ($controller, $rootScope) ->
		scope = $rootScope.$new()
		MainCtrl = $controller 'MainCtrl', {
			$scope: scope
		}
	  	
	it "should pass a test", ->
		return true