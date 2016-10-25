angular.module('SurveyWrangler').directive("swRetireePlan", function () {
    return {
        replace: true,
        restrict:'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/RetireePlan.html',
        scope: {
            retireePlan: '=ngModel'
        }
    }
});
