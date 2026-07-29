import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.GraphBridgeLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

def gateClosed (A : GraphAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : GraphAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse