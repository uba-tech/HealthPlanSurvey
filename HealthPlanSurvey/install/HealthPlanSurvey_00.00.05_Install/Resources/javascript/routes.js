﻿angular.module('SurveyWrangler').config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            redirectTo: '/surveys'
        })

        .when('/#', {
            redirectTo: '/surveys'
        })

    .when('/surveys', {
        templateUrl: "/DesktopModules/HealthPlanSurvey/templates/survey/index.html",
        controller: "SurveyIndexController"
    })

    .when('/surveys/new', {
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

    .when('/surveys/:id/carryforward', {
        templateUrl: "/DesktopModules/HealthPlanSurvey/templates/survey/carryForward.html",
        controller: "SurveyCarryForwardController"
    })
});