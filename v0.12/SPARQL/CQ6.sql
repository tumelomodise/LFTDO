PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ6:Purpose is to retrieve individual livestock profile (ID, species, breed, location)
SELECT ?individual ?LivestockType ?Location ?AnimalID ?Species ?Breed
WHERE 
{
?individual    a                           ?LivestockType .
?LivestockType rdfs:subClassOf*           LFTDO:Livestock .
?individual LFTDO:hasCurrentLocation ?Location. 
?individual LFTDO:hasAnimalID  ?AnimalID.  
?individual LFTDO:hasSpecies ?Species.
?individual LFTDO:hasBreed ?Breed.  
}