import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.GraphAdmissibleClass

/-!
# Network Percolation Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure NetworkPercolationPackage where
  graph : Type u
  vertexSet : Type v
  edgeSet : Type w
  percolationThreshold : ℝ
  giantComponentExistsAbove : Prop
  criticalExponents : Prop
  uniquenessOfInfiniteCluster : Prop

structure NetworkPercolationEvidence (P : NetworkPercolationPackage) where
  giantComponentExistsAboveClosed : P.giantComponentExistsAbove
  criticalExponentsClosed : P.criticalExponents
  uniquenessOfInfiniteClusterClosed : P.uniquenessOfInfiniteCluster

def NetworkPercolationClosed (P : NetworkPercolationPackage) : Prop :=
  P.giantComponentExistsAbove ∧ P.criticalExponents ∧ P.uniquenessOfInfiniteCluster

theorem network_percolation_closed_from_evidence
    (P : NetworkPercolationPackage) (E : NetworkPercolationEvidence P) :
    NetworkPercolationClosed P := by
  exact And.intro E.giantComponentExistsAboveClosed
    (And.intro E.criticalExponentsClosed E.uniquenessOfInfiniteClusterClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse