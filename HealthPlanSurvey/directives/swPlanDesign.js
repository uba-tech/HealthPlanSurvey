angular.module('SurveyWrangler').directive("swPlanDesign", function () {

    return {
        replace: true,
        restrict:'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/PlanDesign.html',
        scope: {
            design: '=ngModel',
        }
    }
});
