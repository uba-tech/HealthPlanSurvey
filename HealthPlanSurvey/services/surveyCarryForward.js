angular.module('SurveyWrangler').factory('SurveyCarryForward', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/survey/SurveyCarryForward/:id', { id: "@id" }, {

    });
});
