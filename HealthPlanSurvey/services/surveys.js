angular.module('SurveyWrangler').factory('Survey', function SurveyFactory($resource) {
    return $resource('/DesktopModules/HealthPlanSurveyService/API/survey/survey/:responseId', { responseId: "@responseId" }, {
        save: {
            method: "PUT"
        },
        update: {
            method: "PUT"
        },
        getTemplate:{
           url: '/DesktopModules/HealthPlanSurveyService/API/survey/ResponseTemplate/',
           method: "GET",
           isArray:false
        },
        brokerDelete:{
           url: '/DesktopModules/HealthPlanSurveyService/API/survey/brokerdelete/',
           method: "POST",
           isArray:false
        }
    });
});
