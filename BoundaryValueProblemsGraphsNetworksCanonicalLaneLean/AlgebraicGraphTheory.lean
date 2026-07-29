import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure AlgebraicGraphPackage where
  graphLaplacian : Matrix ℕ ℕ ℝ
  laplacianEigenvalues : List ℝ
  incidenceMatrix : Matrix ℕ ℕ ℝ
  laplacianRank : ℕ
  bipartiteCharacterization : Prop
  connectednessViaSpectrum : Prop

structure AlgebraicGraphEvidence (A : AlgebraicGraphPackage) where
  bipartiteCharacterizationClosed : A.bipartiteCharacterization
  connectednessViaSpectrumClosed : A.connectednessViaSpectrum

def AlgebraicGraphClosed (A : AlgebraicGraphPackage) : Prop :=
  A.bipartiteCharacterization ∧ A.connectednessViaSpectrum

theorem algebraic_graph_closed_from_evidence (A : AlgebraicGraphPackage)
    (E : AlgebraicGraphEvidence A) : AlgebraicGraphClosed A :=
  And.intro E.bipartiteCharacterizationClosed E.connectednessViaSpectrumClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
