angular.module('SurveyWrangler').controller('ReferenceController', function (Reference, $scope, $attrs) {
    $scope.survey = $scope.$parent.$parent.$parent.$survey;
    if (!$attrs.tablename) throw new Error("No tablename for ReferenceController")
    var tbl = $attrs.tablename;
    this.items = Reference.query({ tbl })
   // console.log(this.items)
});
