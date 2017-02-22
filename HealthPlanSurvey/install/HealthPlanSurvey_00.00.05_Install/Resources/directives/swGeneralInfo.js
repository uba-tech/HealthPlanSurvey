angular.module('SurveyWrangler').directive("swGeneralInfo", function () {
    return {
        replace: true,
        restrict:'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/GeneralInfo.html',
        scope: {
            response: '=ngModel'
        }
    }
});
