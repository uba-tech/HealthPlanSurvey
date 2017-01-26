angular.module('SurveyWrangler').factory('Person', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/person/person?personId=:id', { id: "@id" }, {
        get: {
            method: "GET",
            isArray: false
        }
    });
});
