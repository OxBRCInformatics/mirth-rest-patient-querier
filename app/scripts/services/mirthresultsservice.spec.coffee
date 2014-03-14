'use strict'

describe 'MainCtrl', ->
	
	# load the controller's module
	beforeEach module 'MirthResults'
  	
	apiUrl = "http://sometesturl/a/path.json"
	service = null
	$httpBackend = null
	
	# Initialize the controller and a mock scope
	beforeEach inject (MirthResultsService, _$httpBackend_) ->	
		$httpBackend = _$httpBackend_
		service = MirthResultsService
		service.setApiUrl(apiUrl)
	
	afterEach ->
	        $httpBackend.verifyNoOutstandingExpectation()
	        $httpBackend.verifyNoOutstandingRequest()
		
	it "should query the REST API for a list of patients and return it", ->
		$httpBackend.expectGET(apiUrl).respond(200, [{subjectKey: 123},{subjectKey:1000}])
		result = service.getPatients()
		result.$promise.then( ->
			expect(result.length).toBe 2
			)
		$httpBackend.flush()
		
	describe "Multiple async calls", ->
		result = null
		beforeEach ->
			result = null
			
		it "should query the REST API only once when requested many times", ->
			$httpBackend.expectGET(apiUrl).respond(200, [{subjectKey: 123},{subjectKey:1000}])
			result = service.getPatients()
			result.$promise.then( ->
				expect(result.length).toBe 2
				)
		
			result = service.getPatients()
			result.$promise.then( ->
				expect(result.length).toBe 2
				)
		
			result = service.getPatients()
			result.$promise.then( ->
				expect(result.length).toBe 2
			)
			$httpBackend.flush()
			

	#it "should query the REST API for a list of patients given some specific filter", ->
	#	result = service.getPatients()
	#	#expect to see REST call
	#
	#it "should return the correct number of patients", ->
	#	$httpBackend.expectGET(apiUrl).respond(200, [{subjectKey: 123},{subjectKey:1000}])
	#	patientCount = service.getPatientCount()
	#	expect(patientCount).toBe(2)
	#	$httpBackend.flush()
	#	
	#it "should return a single patient when given a single subject key", ->
	#	expectedPatient = {
	#        gender: "1",
	#        names: [
	#            {
	#                first: "Test",
	#                last: "Patient",
	#                nameKey: 15487
	#            }
	#        ],
	#        subjectKey: 123
	#	}
	#	patient = service.getPatient("123")
	#	expect(patient).toEqual(expectedPatient)
	
	