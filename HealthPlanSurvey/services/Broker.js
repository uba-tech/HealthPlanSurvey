angular.module('SurveyWrangler').factory('Broker', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/broker/broker/:id', { id: "@id" }, {

    });
});
