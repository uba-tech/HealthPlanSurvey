angular.module('SurveyWrangler').filter("getById", function () {
  return function(input, id) {
    var i=0, len=input.length;
    for (; i<len; i++) {
      if (+input[i].TypeId == +id) {
        return input[i];
      }
    }
    return null;
  }
})
