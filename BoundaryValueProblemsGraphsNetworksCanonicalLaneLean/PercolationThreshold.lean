import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure PercolationThresholdPackage where
  graphType : Type
  edgeProbability : ℝ
  infiniteClusterExists : Prop
  criticalProbability : ℝ
  thresholdBound : criticalProbability = 0.5 → False
  phaseTransition : (edgeProbability < criticalProbability → ¬ infiniteClusterExists) ∧ (edgeProbability > criticalProbability → infiniteClusterExists)

structure PercolationThresholdEvidence (P : PercolationThresholdPackage) where
  thresholdBoundClosed : P.thresholdBound
  phaseTransitionClosed : P.phaseTransition

def PercolationThresholdClosed (P : PercolationThresholdPackage) : Prop :=
  P.thresholdBound ∧ P.phaseTransition

theorem percolation_threshold_closed_from_evidence (P : PercolationThresholdPackage) (E : PercolationThresholdEvidence P) : PercolationThresholdClosed P := by
  exact And.intro E.thresholdBoundClosed E.phaseTransitionClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
