angular.module('SurveyWrangler').directive("swActivePlan", function ($timeout) {
    return {
        replace: true,
        restrict: 'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/ActivePlan.html',
        scope: {
            activePlan: '=ngModel',
        }
    }
});
