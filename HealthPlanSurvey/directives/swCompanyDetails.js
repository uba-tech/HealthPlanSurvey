angular.module('SurveyWrangler').directive("swCompanyDetails", function () {
    return {
        replace: true,
        restrict:'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/editCompany.html',
        scope: {
            response: '=ngModel'
        }
    }
});
