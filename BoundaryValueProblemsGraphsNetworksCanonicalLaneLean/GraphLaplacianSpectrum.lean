import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphLaplacianPackage where
  vertexCount : Nat
  adjacencyMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  degreeMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  laplacianMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  laplacianDefined : laplacianMatrix = degreeMatrix - adjacencyMatrix
  eigenvalues : List ℝ
  secondSmallestEigenvalue : ℝ
  algebraicConnectivity : secondSmallestEigenvalue = 0 → False
  spectrumSymmetric : Prop
  spectrumNonnegative : ∀ λ ∈ eigenvalues, 0 ≤ λ

structure GraphLaplacianEvidence (P : GraphLaplacianPackage) where
  laplacianDefinedClosed : P.laplacianDefined
  algebraicConnectivityClosed : P.algebraicConnectivity
  spectrumNonnegativeClosed : P.spectrumNonnegative

def GraphLaplacianClosed (P : GraphLaplacianPackage) : Prop :=
  P.laplacianDefined ∧ P.algebraicConnectivity ∧ P.spectrumNonnegative

theorem graph_laplacian_closed_from_evidence (P : GraphLaplacianPackage) (E : GraphLaplacianEvidence P) : GraphLaplacianClosed P := by
  exact And.intro E.laplacianDefinedClosed (And.intro E.algebraicConnectivityClosed E.spectrumNonnegativeClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
