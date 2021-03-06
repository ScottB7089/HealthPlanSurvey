﻿angular.module('SurveyWrangler').controller('SurveyCarryForwardController', function ($scope, SurveyCarryForward, $routeParams, $location) {
    $scope.isSubmitting = false;
    console.log($routeParams)
    var clientId = $routeParams.clientId;

    SurveyCarryForward.get({ responseId: clientId }).$promise.then(function (data) {
        data.ActivePlans.forEach(function (plan) {
            var renewalDt = new Date(plan.ActivePlan.RenewalDate);
            var local = new Date(plan.ActivePlan.RenewalDate);
            local.setMinutes(renewalDt.getMinutes() + renewalDt.getTimezoneOffset() + 1);
            plan.ActivePlan.RenewalDate = local;
        });
        $scope.survey = data;
        console.log($scope.survey);
    }).catch(function (error) {
        alert("There was an error. Status: " + err.status + " - " + err.statusText);
        console.log(error)
    });

    $scope.setSelected = function (selected) {
        $scope.tab = selected;
        //$scope.nextTab = next;
        //console.log($scope.tab)
    };

    $scope.saveSurvey = function (survey) {
        $scope.isSubmitting = true;
        console.log(survey)
        survey.$save()
            .then(successMethod)
            .catch(errorMethod)
            .finally(function () {
                $scope.isSubmitting = false;
            });
    };

    function successMethod(response) {
        console.log(response)
        alert("Your changes were saved successfully");
        $location.path("/surveys/" + response.ResponseId + "/edit");
        //var url = "http://" + $window.location.host + "/surveys/" + response.ResponseId + "/edit";
        //$window.location.href = url;
        //$scope.survey.GeneralResponse.ResponseId = response.ResponseId;
    };

    function errorMethod(err) {
        console.log(err)
        alert("There was an error. Status: " + err.status + " - " + err.statusText);
    };
});