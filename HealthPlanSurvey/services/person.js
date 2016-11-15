angular.module('SurveyWrangler').factory('Person', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/person/person/:id', { id: "@id" }, {
        get: {
            method: "GET",
            isArray: true
        }
    });
});
