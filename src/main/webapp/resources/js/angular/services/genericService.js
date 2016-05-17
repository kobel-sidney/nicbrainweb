angular.module('nicbrainApp').service('GenericService', ['$http', '$q', function($http, $q) {
        return {
            obter: function(path, data) {
                var deferred = $q.defer();

                $http.get('/nicBrain/rest' + path)
                        .then(function (response) {
                            deferred.resolve(response.data);
                        }, function () {
                            deferred.reject('Erro ao obter lista');
                        });

                return deferred.promise;
            },
            
            atualizar: function(path, data) {
                var deferred = $q.defer();

                $http.put('/nicBrain/rest' + path + '/' + data.id, data)
                        .then(function (response) {
                            deferred.resolve(response.data);
                        }, function () {
                            deferred.reject('Erro ao atualizar');
                        });

                return deferred.promise;
            }
        };
    }]);