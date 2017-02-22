angular.module('SurveyWrangler').factory('Reference', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/reference/reference/:id', { id: "@id" }, {

    });
});
