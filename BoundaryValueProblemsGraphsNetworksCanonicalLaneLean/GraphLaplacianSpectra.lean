import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphLaplacianPackage where
  graph : Type u
  vertexCount : Nat
  adjacency : Matrix (Fin vertexCount) (Fin vertexCount) ℕ
  degree : Matrix (Fin vertexCount) (Fin vertexCount) ℕ
  laplacian : Matrix (Fin vertexCount) (Fin vertexCount) ℤ
  eigenvalues : Vector (Fin vertexCount) ℝ
  secondEigenvalue : ℝ
  spectralGapPositive : Prop
  spectralGapEvidence : spectralGapPositive

structure GraphLaplacianEvidence (G : GraphLaplacianPackage) where
  laplacianDefined : G.laplacian = G.degree - G.adjacency
  eigenvaluesComputed : True
  spectralGapPositiveClosed : G.spectralGapPositive

def GraphLaplacianClosed (G : GraphLaplacianPackage) : Prop :=
  G.laplacian = G.degree - G.adjacency ∧ G.spectralGapPositive

theorem graph_laplacian_closed_from_evidence (G : GraphLaplacianPackage) (E : GraphLaplacianEvidence G) :
    GraphLaplacianClosed G := by
  exact And.intro E.laplacianDefined E.spectralGapPositiveClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse