angular.module('SurveyWrangler').controller('PersonController', function (Person, $scope, $attrs) {


    var person = JSON.parse(localStorage.getItem('completedBy'));
    console.log(person)

    Person.get({ id: person }).$promise.then(function (data) {
        this.person = data;
        console.log(this.person)
    }).catch(function (error) {
        console.log(error);
    });

});
