angular.module('SurveyWrangler').directive("swSection125", function () {
    return {
        replace: true,
        restrict:'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/Section125.html',
        scope: {
            section: '=ngModel'
        }
    }
});
