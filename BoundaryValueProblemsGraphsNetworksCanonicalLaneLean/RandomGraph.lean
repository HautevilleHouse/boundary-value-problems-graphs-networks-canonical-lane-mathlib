import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure RandomGraphPackage where
  edgeProbability : ℝ
  degreeDistribution : List ℝ
  connectivityThreshold : ℝ
  giantComponentExists : Prop

structure RandomGraphEvidence (R : RandomGraphPackage) where
  edgeProbabilityInUnitInterval : R.edgeProbability ∈ Set.Ioo (0 : ℝ) 1
  degreeDistributionNonempty : R.degreeDistribution ≠ []
  connectivityThresholdPositive : R.connectivityThreshold > 0
  giantComponentExistsClosed : R.giantComponentExists

def RandomGraphClosed (R : RandomGraphPackage) : Prop :=
  R.edgeProbability ∈ Set.Ioo (0 : ℝ) 1 ∧ R.degreeDistribution ≠ [] ∧ R.connectivityThreshold > 0 ∧ R.giantComponentExists

theorem random_graph_closed_from_evidence (R : RandomGraphPackage) (E : RandomGraphEvidence R) :
    RandomGraphClosed R := by
  exact And.intro E.edgeProbabilityInUnitInterval (And.intro E.degreeDistributionNonempty (And.intro E.connectivityThresholdPositive E.giantComponentExistsClosed))

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
