import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.BridgeLemmas
import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

def ConstrainedBVPGraphClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bvp_graph_endgame (A : AdmissibleClass) : ConstrainedBVPGraphClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
