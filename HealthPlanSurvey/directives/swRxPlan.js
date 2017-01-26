angular.module('SurveyWrangler').directive("swRxPlan", function () {
    return {
        replace: true,
        restrict:'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/RxPlan.html',
        scope: {
            rxPlan: '=ngModel'
        }
    }
});
