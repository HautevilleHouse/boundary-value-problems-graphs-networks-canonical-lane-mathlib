import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.GraphAdmissibleClass

/-!
# Graph Spectra Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphSpectraPackage where
  graph : Type u
  vertexSet : Type v
  edgeSet : Type w
  laplacian : Type uu
  eigenvalues : Type vv
  spectralGap : Prop
  expanderProperty : Prop
  cheegerInequality : Prop

structure GraphSpectraEvidence (G : GraphSpectraPackage) where
  spectralGapClosed : G.spectralGap
  expanderPropertyClosed : G.expanderProperty
  cheegerInequalityClosed : G.cheegerInequality

def GraphSpectraClosed (G : GraphSpectraPackage) : Prop :=
  G.spectralGap ∧ G.expanderProperty ∧ G.cheegerInequality

theorem graph_spectra_closed_from_evidence
    (G : GraphSpectraPackage) (E : GraphSpectraEvidence G) :
    GraphSpectraClosed G := by
  exact And.intro E.spectralGapClosed
    (And.intro E.expanderPropertyClosed E.cheegerInequalityClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse