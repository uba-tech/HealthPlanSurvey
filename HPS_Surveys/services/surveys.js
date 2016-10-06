angular.module('SurveyWrangler').factory('Surveys', function SurveyFactory($resource) {
    return $resource('/surveys/:id');
    //return {
    //    paged: function (first, cnt) {
    //        return $http({ method: "GET", url: "/surveys" + first });
    //    },
    //    find: function (id) {
    //        return $http({ method: "GET", url: "/surveys" + id });
    //    }
    //}
});
