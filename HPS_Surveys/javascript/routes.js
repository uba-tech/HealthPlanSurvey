angular.module('SurveyWrangler').config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            redirectTo: '/surveys'
        })

    .when('/surveys', {
        templateUrl: "templates/surveys/index.html",
        controller: "SurveysIndexController"
    })

    .when('/surveys/new', {
        templateUrl: "templates/surveys/new.html",
        controller: "SurveysCreateController"
    })

    .when('/surveys/:id', {
        templateUrl: "templates/surveys/show.html",
        controller: "SurveysShowController"
    })

    .when('/surveys/:id/edit', {
        templateUrl: "templates/surveys/edit.html",
        controller: "SurveysEditController"
    })
});