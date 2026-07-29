import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphAdmissibleClass where
  object : GraphAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : GraphAdmissibleClass) : Prop :=
  GraphWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse