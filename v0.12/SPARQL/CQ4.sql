PREFIX rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl:   <http://www.w3.org/2002/07/owl#>
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd:   <http://www.w3.org/2001/XMLSchema#>
PREFIX LFTDO: <https://github.com/tumelomodise/LFTDO#>
#CQ4:Purpose is to retrieve livestock behaviour with start/end times
SELECT ?Livestock ?LivestockSpecies ?AttachedToDevice ?Location ?Latitude  ?Longitude
       ?Behaviour
       ?BehaviourType
       ?BehaviourState
       ?BehaviourStateType
       ?hasBehaviourStartTime
       ?hasBehaviourEndTime
       ?hasDuration
       ?hasTemporalContext

WHERE {
  ?Livestock        a                           LFTDO:Livestock .
  ?Livestock        LFTDO:hasSpecies            ?LivestockSpecies .
  ?Livestock 		LFTDO:isAttachedToDevice ?AttachedToDevice.
  ?Livestock    	LFTDO:hasCurrentLocation     ?Location .
  
  ?AttachedToDevice LFTDO:hasLatitude           ?Latitude .
  ?AttachedToDevice LFTDO:hasLongitude          ?Longitude .
  ?Livestock        LFTDO:exhibits			    ?Behaviour .
?BehaviourType rdfs:subClassOf*           LFTDO:Behaviour .
?Behaviour        LFTDO:hasBehaviourStartTime ?hasBehaviourStartTime .
?BehaviourState        LFTDO:hasBehaviourStateContext    ?hasTemporalContext .

  OPTIONAL { ?Behaviour LFTDO:hasBehaviourEndTime ?hasBehaviourEndTime }
  OPTIONAL { ?Behaviour LFTDO:hasDuration         ?hasDuration }
}

ORDER BY ?Livestock ?hasBehaviourStartTime