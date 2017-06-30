<html>
<head>
<meta name="layout" content="main" />
<style>
    table, th , td  {
        border: 1px solid grey;
        border-collapse: collapse;
        padding: 5px;
    }
    table tr:nth-child(odd) {
        background-color: #f1f1f1;
    }
    table tr:nth-child(even) {
        background-color: #ffffff;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
</head>
<body>
<br><br><br><br><br>
<div ng-app="myApp" ng-controller="customersCtrl">
    <table>
        <th>City Name</th>
        <th>ID</th>
        <tr ng-repeat="x in names">
            <td>{{ x.City }}</td>
            <td>{{ x.ID }}</td>
        </tr>
    </table>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<script>
    var app = angular.module('myApp', []);
    app.controller('customersCtrl', function($scope, $http) {
        $http.get("http://localhost:8080/angularJS/getCity")
            .then(function (response) {
                $scope.names = response.data.records;
            });
    });
</script>

</body>
</html>
