angular.module('SurveyWrangler').controller('PersonController', function (Person, $scope, $attrs) {
    var id = $attrs.id;
    //this.person = Person.get({ UserId: id });
    Person.get({ userId: id }).$promise.then(function(data){
      this.person = data;
      console.log(this.person)
    }).catch(function(error){
      console.log(error);
    });

});
