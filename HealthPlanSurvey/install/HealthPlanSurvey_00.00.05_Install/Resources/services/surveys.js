angular.module('SurveyWrangler').factory('Survey', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/survey/survey/:responseId', { responseId: "@responseId" }, {
        save: {
            method: "PUT"
        },
        update: {
            method: "PUT"
        },
        changeStatus: {
            method: "POST"
        }
    });
});
