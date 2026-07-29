import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure PercolationPackage where
  graphType : String
  edgeProbability : ℝ
  criticalThreshold : ℝ
  infiniteClusterExists : Prop
  percolationProbability : ℝ

structure PercolationEvidence (P : PercolationPackage) where
  criticalThresholdBound : 0 < P.criticalThreshold ∧ P.criticalThreshold < 1
  percolationProbabilityPos : P.percolationProbability > 0
  clusterExistenceCorrect : (P.edgeProbability > P.criticalThreshold) ↔ P.infiniteClusterExists

def PercolationClosed (P : PercolationPackage) : Prop :=
  P.infiniteClusterExists ∨ P.edgeProbability ≤ P.criticalThreshold

theorem percolation_closed_from_evidence (P : PercolationPackage) (E : PercolationEvidence P) :
    PercolationClosed P := by
  rcases E.criticalThresholdBound with ⟨h1, h2⟩
  by_cases h : P.edgeProbability > P.criticalThreshold
  · left; exact (E.clusterExistenceCorrect.mp h)
  · right; exact h

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse