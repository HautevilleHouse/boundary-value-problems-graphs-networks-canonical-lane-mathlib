import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphSpectralPackage where
  adjacencyMatrix : Type u
  graphLaplacian : Type v
  eigenvalueList : Type w
  spectralGap : Prop
  graphConnected : Prop
  expanderMixing : Prop

structure GraphSpectralEvidence (G : GraphSpectralPackage) where
  spectralGapClosed : G.spectralGap
  graphConnectedClosed : G.graphConnected
  expanderMixingClosed : G.expanderMixing

def GraphSpectralClosed (G : GraphSpectralPackage) : Prop :=
  G.spectralGap ∧ G.graphConnected ∧ G.expanderMixing

theorem graph_spectral_closed_from_evidence (G : GraphSpectralPackage)
    (E : GraphSpectralEvidence G) : GraphSpectralClosed G := by
  exact And.intro E.spectralGapClosed
    (And.intro E.graphConnectedClosed E.expanderMixingClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse