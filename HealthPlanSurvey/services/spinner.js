﻿/*
 * The spinner-service is used by the spinner directive to register new spinners.
 * It's also used by anyone who wishes to interface with the API to hide/show spinners on the page.
 */
angular.module('SurveyWrangler').factory('SpinnerService', function () {
    // create an object to store spinner APIs.
    var spinners = {};
    return {
        // private method for spinner registration.
        _register: function (data) {
            if (!data.hasOwnProperty('name')) {
                throw new Error("Spinner must specify a name when registering with the spinner service.");
            }
            if (spinners.hasOwnProperty(data.name)) {
                throw new Error("A spinner with the name '" + data.name + "' has already been registered.");
            }
            spinners[data.name] = data;
        },
        // unused private method for unregistering a directive,
        // for convenience just in case.
        _unregister: function (name) {
            if (spinners.hasOwnProperty(name)) {
                delete spinners[name];
            }
        },
        _unregisterGroup: function (group) {
            for (var name in spinners) {
                if (spinners[name].group === group) {
                    delete spinners[name];
                }
            }
        },
        _unregisterAll: function () {
            for (var name in spinners) {
                delete spinners[name];
            }
        },
        show: function (name) {
            var spinner = spinners[name];
            if (!spinner) {
                throw new Error("No spinner named '" + name + "' is registered.");
            }
            spinner.show();
        },
        hide: function (name) {
            var spinner = spinners[name];
            if (!spinner) {
                throw new Error("No spinner named '" + name + "' is registered.");
            }
            spinner.hide();
        },
        showGroup: function (group) {
            var groupExists = false;
            for (var name in spinners) {
                var spinner = spinners[name];
                if (spinner.group === group) {
                    spinner.show();
                    groupExists = true;
                }
            }
            if (!groupExists) {
                throw new Error("No spinners found with group '" + group + "'.")
            }
        },
        hideGroup: function (group) {
            var groupExists = false;
            for (var name in spinners) {
                var spinner = spinners[name];
                if (spinner.group === group) {
                    spinner.hide();
                    groupExists = true;
                }
            }
            if (!groupExists) {
                throw new Error("No spinners found with group '" + group + "'.")
            }
        },
        showAll: function () {
            for (var name in spinners) {
                spinners[name].show();
            }
        },
        hideAll: function () {
            for (var name in spinners) {
                spinners[name].hide();
            }
        }
    };
});