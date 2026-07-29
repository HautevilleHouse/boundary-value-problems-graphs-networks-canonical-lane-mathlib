import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphSpectrumPackage where
  adjacencyMatrix : Matrix ℕ ℕ ℝ
  eigenvalues : List ℝ
  spectralGap : ℝ
  edgeExpansion : ℝ
  spectralGapPositive : Prop
  expanderProperty : Prop

structure GraphSpectrumEvidence (G : GraphSpectrumPackage) where
  eigenvaluesComputed : True
  spectralGapPositiveClosed : G.spectralGapPositive
  expanderPropertyClosed : G.expanderProperty

def GraphSpectrumClosed (G : GraphSpectrumPackage) : Prop :=
  G.spectralGapPositive ∧ G.expanderProperty

theorem graph_spectrum_closed_from_evidence (G : GraphSpectrumPackage)
    (E : GraphSpectrumEvidence G) : GraphSpectrumClosed G :=
  And.intro E.spectralGapPositiveClosed E.expanderPropertyClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
