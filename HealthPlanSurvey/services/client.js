angular.module('SurveyWrangler').factory('Client', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/client/client/:id', { id: "@id" }, {

    });
});
