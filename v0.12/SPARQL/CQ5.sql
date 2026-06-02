PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ5:Purpose is to retrieve ordered movement path during TheftEvent window
SELECT  ?AffectedLivestock 
		?TheftEvent
        ?TheftEventType
		?TheftIndicator 
		?LivestockSpecies 
		?AttachedToDevice 
		?SensorData  
		?representsDataType 
		?hasValue 
		?hasUoM 
		?hasTemporalContext 
		?hasSensorTimeStamp 
		?Location 
		?Latitude  
		?Longitude 
		?Behaviour
		?NormalState
		?AbnormalState
        ?AlertLevel

WHERE {  
?TheftEvent    a                           ?TheftEventType .
?TheftEventType rdfs:subClassOf*           LFTDO:TheftEvent .
?TheftEvent  LFTDO:isTriggeredBy ?BehaviourState.
?TheftEvent LFTDO:isSupportedBy ?TheftIndicator.
?TheftIndicator LFTDO:isDetectedBy ?DetectionMethod.
?TheftEvent  LFTDO:isTriggeredBy ?AbnormalState.
  ?AbnormalState LFTDO:isTransitionedFrom ?NormalState.
  ?NormalState LFTDO:isCurrentBehaviourStateOf ?Behaviour.
  ?Behaviour LFTDO:exhibitedBy ?AffectedLivestock.
  
?AffectedLivestock LFTDO:isAttachedToDevice ?AttachedToDevice . 
?AffectedLivestock LFTDO:hasSpecies        ?LivestockSpecies . 
?AffectedLivestock LFTDO:hasCurrentLocation     ?Location .

?AffectedLivestock LFTDO:isAttachedToDevice ?AttachedToDevice. 
?AttachedToDevice  LFTDO:hasLatitude        ?Latitude .
?AttachedToDevice  LFTDO:hasLongitude       ?Longitude.  
?AttachedToDevice  LFTDO:generatesData ?SensorData.

?SensorData       LFTDO:representsDataType   ?representsDataType.
?SensorData       LFTDO:hasValue             ?hasValue . 
?SensorData       LFTDO:hasUoM               ?hasUoM .
?SensorData       LFTDO:hasTemporalContext   ?hasTemporalContext .
?SensorData       LFTDO:hasSensorTimeStamp   ?hasSensorTimeStamp .

OPTIONAL {
    ?TheftIndicator LFTDO:triggersAlertLevel      ?AlertLevel .
  }
}
ORDER BY ?AffectedLivestock ?hasSensorTimeStamp
