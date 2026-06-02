PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ7: Purpose is to retrieve historical TheftEvent types and counts
SELECT ?TheftEventType
       (COUNT(?TheftEvent)       AS ?TotalCount)
       (COUNT(DISTINCT ?AffectedLivestock) AS ?LivestockAffected)
       (MIN(?TheftEventTime)     AS ?EarliestEvent)
       (MAX(?TheftEventTime)     AS ?MostRecentEvent)
       (GROUP_CONCAT(DISTINCT ?TheftEventStatus ; SEPARATOR=", ") AS ?StatusSummary)
WHERE {
	?TheftEvent  a ?TheftEventType .
	?TheftEventType rdfs:subClassOf* LFTDO:TheftEvent .	
	?TheftEvent     LFTDO:affectsLivestock     ?AffectedLivestock .

	?TheftEvent LFTDO:isSupportedBy ?TheftIndicator.
    ?TheftIndicator LFTDO:isDetectedBy ?DetectionMethod.
  
    ?DetectionMethod LFTDO:isImplementedBy ?SoftwareApp.
    ?SoftwareApp LFTDO:notifies ?NotifiedFarmer.
    ?SoftwareApp LFTDO:uiUpdatedBy ?uiStatusUpdate.
    ?uiStatusUpdate LFTDO:hasEventDateTime ?TheftEventTime.
    ?uiStatusUpdate LFTDO:hasStatus ?TheftEventStatus.
    ?uiStatusUpdate LFTDO:isResolved ?Resolved.
	
	?TheftEvent  LFTDO:isTriggeredBy ?BehaviourState.
	?BehaviourState LFTDO:initiateStatusUpdate ?StatusUpdate.
	} 
GROUP BY ?TheftEventType
ORDER BY DESC(?TotalCount) 

