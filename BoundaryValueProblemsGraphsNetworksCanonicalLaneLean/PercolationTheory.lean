import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure PercolationPackage where
  graph : Type u
  percolationParameter : ℝ
  infiniteCluster : Prop
  criticalThreshold : ℝ
  uniquenessOfInfiniteCluster : Prop
  sharpPhaseTransition : Prop

structure PercolationEvidence (P : PercolationPackage) where
  infiniteClusterClosed : P.infiniteCluster
  uniquenessOfInfiniteClusterClosed : P.uniquenessOfInfiniteCluster
  sharpPhaseTransitionClosed : P.sharpPhaseTransition

def PercolationClosed (P : PercolationPackage) : Prop :=
  P.infiniteCluster ∧ P.uniquenessOfInfiniteCluster ∧ P.sharpPhaseTransition

theorem percolation_closed_from_evidence (P : PercolationPackage)
    (E : PercolationEvidence P) : PercolationClosed P := by
  exact And.intro E.infiniteClusterClosed
    (And.intro E.uniquenessOfInfiniteClusterClosed E.sharpPhaseTransitionClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse