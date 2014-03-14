// an example karma.conf.js
module.exports = function(config) {
	config.set({
		basePath: '.',
		frameworks: ['jasmine'],

		browsers: [
            'Chrome',
            //'Firefox', // Firefox is slow!
            //'Safari'
        ],
		reporters: ['progress', 'junit', 'coverage', 'osx'],
		singleRun: false,
        autoWatch : true,

		coverageReporter: {
			type: 'lcovonly',
			dir: 'target/reports/js/coverage/'
		},

		junitReporter: {
			outputFile: 'target/reports/js/karma-test-results.xml',
            suite: 'unit'
		},
		
		files: [
	
			  // Load dependencies
		      'app/bower_components/angular/angular.js',
		      'app/bower_components/angular-resource/angular-resource.js',
		      'app/bower_components/angular-cookies/angular-cookies.js',
		      'app/bower_components/angular-sanitize/angular-sanitize.js',
		      'app/bower_components/angular-route/angular-route.js',
		      'app/bower_components/ng-table/ng-table.js',
	  
			  // Load the app (our code)
		      'app/scripts/!(*.spec).coffee',
		      'app/scripts/**/!(*.spec).coffee',
	  
			  // Load mocks
		      'app/bower_components/angular-mocks/angular-mocks.js',
		      'test/mock/**/*.coffee',
	  
			  // Finally, load our tests
		      'app/scripts/**/*.spec.coffee',
		      'test/spec/**/*.coffee'

		    ],
		exclude: [
		],

		plugins: [
			'karma-coverage',
			'karma-jasmine',
			'karma-chrome-launcher',
			'karma-firefox-launcher',
			'karma-safari-launcher',
			'karma-junit-reporter',
            'karma-coffee-preprocessor',
            'karma-ng-html2js-preprocessor',
            'karma-osx-reporter'
		],

        preprocessors: {
            '**/*.coffee': ['coffee'],
            '**/*.html': ['ng-html2js']
        },

        coffeePreprocessor: {
            // options passed to the coffee compiler
            options: {
                bare: true,
                sourceMap: false
            },
            // transforming the filenames
            transformPath: function(path) {
                return path.replace(/\.js$/, '.coffee');
            }
        },

        /**
         * Angular template loader.
         * see http://daginge.com/technology/2013/12/14/testing-angular-templates-with-jasmine-and-karma/
         */
        ngHtml2JsPreprocessor: {
            moduleName: 'templates',
            stripPrefix: 'grails-app/assets/javascripts/',
            prependPrefix:'/model_catalogue/assets/'
        }
	});
};
