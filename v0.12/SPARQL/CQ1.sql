PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ1: Purpose is to list all livestock and their farm location
SELECT ?Livestock ?Farm ?CurrentLocation 
WHERE { 
?Livestock LFTDO:isLocatedAtFarm 
?Farm.?Livestock LFTDO:hasCurrentLocation 
?CurrentLocation
}