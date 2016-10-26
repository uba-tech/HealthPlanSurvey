angular.module('SurveyWrangler').directive("swSurveyFilter", function ($timeout) {
    return {
        replace: true,
        restrict: 'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/utility/SurveyFilter.html',
        scope: {
            activePlan: '=ngModel',
        }
    }
});
