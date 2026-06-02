PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ8: Purpose is to retrieve a specific livestock TheftEvent chain including indicators and severity
SELECT ?AffectedLivestock
       ?LivestockSpecies
       ?AnimalID
       ?TheftIndicator
       ?AlertLevel
       ?TheftEvent
       ?TheftEventType
       ?TheftEventStatus
       ?TheftEventTime
       ?Location
       ?Latitude
       ?Longitude
       ?NotifiedParticipant
       ?ParticipantRole
       ?SensorValue
       ?representsDataType
       ?hasUoM
WHERE { 
?TheftEvent  a ?TheftEventType .
?TheftEventType rdfs:subClassOf* LFTDO:TheftEvent .
?TheftEvent  LFTDO:isTriggeredBy ?AbnormalState.
?AbnormalState LFTDO:isTransitionedFrom ?NormalState.
?NormalState LFTDO:isCurrentBehaviourStateOf ?Behaviour.
?Behaviour LFTDO:exhibitedBy ?AffectedLivestock.

?AffectedLivestock LFTDO:hasSpecies ?LivestockSpecies.
?AffectedLivestock LFTDO:hasAnimalID  ?AnimalID.  
?AffectedLivestock LFTDO:hasCurrentLocation     ?Location .
?AffectedLivestock LFTDO:isAttachedToDevice ?AttachedToDevice. 
?AttachedToDevice  LFTDO:hasLatitude        ?Latitude .
?AttachedToDevice  LFTDO:hasLongitude       ?Longitude.  
?AttachedToDevice  LFTDO:generatesData ?SensorData.
?SensorData        LFTDO:representsDataType   ?representsDataType.
?SensorData        LFTDO:hasValue             ?SensorValue . 
?SensorData        LFTDO:hasUoM               ?hasUoM .

?TheftEvent LFTDO:isSupportedBy ?TheftIndicator.
?TheftIndicator LFTDO:triggersAlertLevel      ?AlertLevel .
?TheftIndicator LFTDO:isDetectedBy ?DetectionMethod.
?DetectionMethod LFTDO:isImplementedBy ?SoftwareApp.
?SoftwareApp LFTDO:notifies ?NotifiedParticipant.
    ?SoftwareApp LFTDO:uiUpdatedBy ?uiStatusUpdate.
    ?uiStatusUpdate LFTDO:hasEventDateTime ?TheftEventTime.
    ?uiStatusUpdate LFTDO:hasStatus ?TheftEventStatus.
    ?uiStatusUpdate LFTDO:isResolved ?Resolved.
	?NotifiedParticipant LFTDO:hasParticipantRole ?ParticipantRole.

}
