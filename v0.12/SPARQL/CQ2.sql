PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ2: Purpose is to retrieve all TheftEvents with time, location, and affected livestock
SELECT
?TheftEvent ?TheftEventType ?AbnormalState ?NormalState ?Behaviour ?AffectedLivestock ?LivestockSpecies ?AttachedToDevice ?TheftIndicator 
?DetectionMethod ?SoftwareApp ?NotifiedFarmer ?uiStatusUpdate ?TheftEventTime ?Location ?Latitude ?Longitude ?AlertLevel ?TheftEventStatus ?Resolved
WHERE {
  ?TheftEvent    a                           ?TheftEventType .
  ?TheftEventType rdfs:subClassOf*           LFTDO:TheftEvent .
  ?TheftEvent  LFTDO:isTriggeredBy ?AbnormalState.
  ?AbnormalState LFTDO:isTransitionedFrom ?NormalState.
  ?NormalState LFTDO:isCurrentBehaviourStateOf ?Behaviour.
  ?Behaviour LFTDO:exhibitedBy ?AffectedLivestock.
  ?AffectedLivestock LFTDO:hasSpecies        ?LivestockSpecies .
  ?AffectedLivestock LFTDO:isAttachedToDevice ?AttachedToDevice.
  ?TheftEvent LFTDO:isSupportedBy ?TheftIndicator.
  #?TheftIndicator LFTDO:triggersAlertLevel ?AlertLevel.
  ?TheftIndicator LFTDO:isDetectedBy ?DetectionMethod.
  
  ?DetectionMethod LFTDO:isImplementedBy ?SoftwareApp.
  ?SoftwareApp LFTDO:notifies ?NotifiedFarmer.
  ?SoftwareApp LFTDO:uiUpdatedBy ?uiStatusUpdate.
  ?uiStatusUpdate LFTDO:hasEventDateTime ?TheftEventTime.
  ?uiStatusUpdate LFTDO:hasStatus ?TheftEventStatus.
  ?uiStatusUpdate LFTDO:isResolved ?Resolved.
  
  ?AffectedLivestock    LFTDO:hasCurrentLocation     ?Location .
  ?AttachedToDevice      LFTDO:hasLatitude           ?Latitude .
  ?AttachedToDevice      LFTDO:hasLongitude          ?Longitude .
  OPTIONAL {
    ?TheftIndicator LFTDO:triggersAlertLevel      ?AlertLevel .
  }
}
ORDER BY DESC(?TheftEventTime) ?AffectedLivestock