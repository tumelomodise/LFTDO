PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ3: Purpose is to retrieve livestock with sensor anomalies outside geo-fence
SELECT ?AffectedLivestock 
		?LivestockSpecies 
		?AttachedToDevice 
		?SensorData  
		?representsDataType 
		?hasValue 
		?hasUoM 
		?isSensorDataAnomaly 
		?hasTemporalContext 
		?hasSensorTimeStamp 
		?Location 
		?Latitude  
		?Longitude 
		?isOutsideGeofence
WHERE {  ?AffectedLivestock a LFTDO:Livestock . ?AffectedLivestock LFTDO:isAttachedToDevice ?AttachedToDevice . ?AffectedLivestock LFTDO:hasSpecies        ?LivestockSpecies . ?AffectedLivestock LFTDO:hasCurrentLocation     ?Location .
?AffectedLivestock LFTDO:isOutsideGeofence ?isOutsideGeofence.

?AffectedLivestock LFTDO:isAttachedToDevice ?AttachedToDevice. 
?AttachedToDevice  LFTDO:hasLatitude        ?Latitude .
?AttachedToDevice  LFTDO:hasLongitude       ?Longitude.  ?AttachedToDevice  LFTDO:generatesData ?SensorData.

?SensorData LFTDO:isSensorDataAnomaly ?isSensorDataAnomaly. 
?SensorData       LFTDO:representsDataType   ?representsDataType.
?SensorData       LFTDO:hasValue             ?hasValue . ?SensorData       LFTDO:hasUoM               ?hasUoM .
?SensorData       LFTDO:isSensorDataAnomaly  ?isSensorDataAnomaly . ?SensorData       LFTDO:hasTemporalContext   ?hasTemporalContext .
?SensorData       LFTDO:hasSensorTimeStamp   ?hasSensorTimeStamp .
  
FILTER(?isSensorDataAnomaly="true"^^<http://www.w3.org/2001/XMLSchema#boolean>). 
}