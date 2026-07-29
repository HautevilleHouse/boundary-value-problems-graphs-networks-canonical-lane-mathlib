import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.AdmissibleClass

/-!
# Graph Spectra Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphSpectraPackage where
  adjacencyMatrix : Type u
  laplacianMatrix : Type v
  eigenvalues : List ℝ
  eigenvalueBounds : Prop
  spectralGapPositive : Prop
  connectivityFromSpectrum : Prop

structure GraphSpectraEvidence (G : GraphSpectraPackage) where
  eigenvalueBoundsClosed : G.eigenvalueBounds
  spectralGapPositiveClosed : G.spectralGapPositive
  connectivityFromSpectrumClosed : G.connectivityFromSpectrum

def GraphSpectraClosed (G : GraphSpectraPackage) : Prop :=
  G.eigenvalueBounds ∧ G.spectralGapPositive ∧ G.connectivityFromSpectrum

theorem graph_spectra_closed_from_evidence (G : GraphSpectraPackage) (E : GraphSpectraEvidence G) :
    GraphSpectraClosed G := by
  exact And.intro E.eigenvalueBoundsClosed (And.intro E.spectralGapPositiveClosed E.connectivityFromSpectrumClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse