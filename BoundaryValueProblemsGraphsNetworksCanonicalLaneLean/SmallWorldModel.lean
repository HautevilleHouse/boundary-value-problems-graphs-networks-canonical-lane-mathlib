import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure RegularRing (n k : ℕ) where
  vertices : ℕ
  degree : ℕ
  edges : Set Edge
  ringStructure : vertices = n ∧ degree = k

structure RandomRewiring (G : RegularRing n k) where
  rewiringProbability : ℝ
  longRangeEdges : Set Edge
  rewiredGraph : Graph
  rewiredEdgesCount : ℕ
  smallWorldProperty : Prop
  clusteringCoefficient : ℝ
  averagePathLength : ℝ
  smallWorldClosed : smallWorldProperty
  clusteringClosed : clusteringCoefficient > 0
  pathClosed : averagePathLength < ℕ → averagePathLength < 10

structure SmallWorldEvidence (n k : ℕ) {G : RegularRing n k} (R : RandomRewiring G) where
  smallWorldClosedClosed : R.smallWorldClosed
  clusteringClosedClosed : R.clusteringClosed
  pathClosedClosed : R.pathClosed

def SmallWorldClosed (n k : ℕ) {G : RegularRing n k} (R : RandomRewiring G) : Prop :=
  R.smallWorldProperty ∧ R.clusteringCoefficient > 0 ∧ R.averagePathLength < ℕ → R.averagePathLength < 10

theorem small_world_closed_from_evidence (n k : ℕ) {G : RegularRing n k} (R : RandomRewiring G) (E : SmallWorldEvidence n k R) : SmallWorldClosed n k R := by
  exact And.intro E.smallWorldClosedClosed (And.intro E.clusteringClosedClosed E.pathClosedClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
