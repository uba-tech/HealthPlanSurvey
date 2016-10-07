angular.module('SurveyWrangler').factory('Survey', function SurveyFactory($resource) {
    //return $resource('/survey/:id');
    return $resource('/DesktopModules/HealthPlanSurveyService/API/survey/survey/:id');
    //return {
    //    paged: function (first, cnt) {
    //        return $http({ method: "GET", url: "/surveys" + first });
    //    },
    //    find: function (id) {
    //        return $http({ method: "GET", url: "/surveys" + id });
    //    }
    //}
});
