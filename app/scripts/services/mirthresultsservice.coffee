module = angular.module('MirthResults', ['ngResource'])

module.service "MirthResultsService", ($resource) ->
	
	apiUrl = null
	patients = null
	
	patientQuery = null
	
	fetchPatients = () ->
		myresource = $resource(apiUrl, patientQuery , { 'get': { method: 'GET', isArray: true } })
		patients = myresource.get()

	setApiUrl: (newURL) ->
		apiUrl = newURL
	
	getPatients: (patientObject) ->
		patientQuery = patientObject
		if patients is null
			fetchPatients()
		return patients
		
	getPatient: (subjectKey) ->
		if patients is null
			fetchPatients()
		return null
		
	getPatientCount: () ->
		if patients is null
			fetchPatients()
		return patients.length