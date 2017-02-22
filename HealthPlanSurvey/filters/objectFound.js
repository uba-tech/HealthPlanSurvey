angular.module('SurveyWrangler').filter("objectFound", function () {
  return function(list, obj) {

    return list.filter(function(l) {
      if (obj.indexOf(l.TypeId) >= 0) {
        return true;
      }
    });

  };
})
