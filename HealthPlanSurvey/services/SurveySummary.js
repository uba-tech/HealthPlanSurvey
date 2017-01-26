angular.module('SurveyWrangler').factory('SurveySummary', function SurveyFactory($resource) {
    //return $resource('/survey/:id');
    return $resource('/DesktopModules/HealthPlanSurveyService/API/survey/surveysummary/:id');
    //return {
    //    paged: function (first, cnt) {
    //        return $http({ method: "GET", url: "/surveys" + first });
    //    },
    //    find: function (id) {
    //        return $http({ method: "GET", url: "/surveys" + id });
    //    }
    //}
});
