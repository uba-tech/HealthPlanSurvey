angular.module('SurveyWrangler').directive("swMedicalPlan", function () {
    return {
        replace: true,
        restrict:'E',
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/MedicalPlan.html',
        scope: {
            activePlan: '=ngModel'
        }
    }
});
