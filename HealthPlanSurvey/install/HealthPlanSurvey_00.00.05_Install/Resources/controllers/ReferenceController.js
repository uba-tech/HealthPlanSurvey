angular.module('SurveyWrangler').controller('ReferenceController', function (Reference, $scope, $attrs) {

    //$scope.init = function (tbl) {
    //    $scope.items = Reference.query({ tbl })
    //    console.log($scope.items)
    //};
    //function ReferenceController() {
    if (!$attrs.tablename) throw new Error("No tablename for ReferenceController")
    var tbl = $attrs.tablename;
        //var tbl = "NotParticipatingReasonType";
        this.items = Reference.query({ tbl })
        console.log(this.items)
    //}

});