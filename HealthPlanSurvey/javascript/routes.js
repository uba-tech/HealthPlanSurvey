angular.module('SurveyWrangler').config(function ($routeProvider) {

    $routeProvider
        .when('', {
            redirectTo: '/surveys'
        })

        .when('/', {
            redirectTo: '/surveys'
        })


        .when('#', {
            redirectTo: '/surveys'
        })

    .when('/surveys', {
        controller: "SurveyIndexController",
        templateUrl: "/DesktopModules/HealthPlanSurvey/templates/survey/index.html"

    })

    .when('/surveys/new/:brokerId', {
        templateUrl: "/DesktopModules/HealthPlanSurvey/templates/survey/create.html",
        controller: "SurveyCreateController"
    })

    .when('/surveys/:id', {
        templateUrl: "/DesktopModules/HealthPlanSurvey/templates/survey/show.html",
        controller: "SurveyShowController"
    })

    .when('/surveys/:id/edit', {
        templateUrl: "/DesktopModules/HealthPlanSurvey/templates/survey/edit.html",
        controller: "SurveyEditController"
    })

    .when('/surveys/:clientId/carryforward', {
        templateUrl: "/DesktopModules/HealthPlanSurvey/templates/survey/create.html",
        controller: "SurveyCarryForwardController"
    })

});
