import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.GraphGateLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

def ConstrainedGraphClosure (A : GraphAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_graph_endgame (A : GraphAdmissibleClass) :
    ConstrainedGraphClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse