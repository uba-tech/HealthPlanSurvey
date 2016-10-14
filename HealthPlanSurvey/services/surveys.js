angular.module('SurveyWrangler').factory('Survey', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/survey/survey/:responseId', { responseId: "@responseId" }, {
        update: {
            method: "PUT"
        }
    });
});
