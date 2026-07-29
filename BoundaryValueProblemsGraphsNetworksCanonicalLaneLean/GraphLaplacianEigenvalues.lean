import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure GraphLaplacianEigenvaluePackage where
  graph : GraphLaplacianPackage
  eigenvalueZeroMultiplicity : Nat
  fiedlerEigenvalue : Float
  eigenvectorCentrality : Prop
  spectralClustering : Prop
  eigenvalueZeroMultiplicityEqualsConnectivity : eigenvalueZeroMultiplicity = 1 ↔ graph.isConnected

theorem eigenvalue_zero_multiplicity_one_iff_connected (G : GraphLaplacianPackage) : G.eigenvalueZeroMultiplicity = 1 ↔ G.isConnected := by
  exact G.eigenvalueZeroMultiplicityEqualsConnectivity

structure GraphLaplacianEigenvalueEvidence (E : GraphLaplacianEigenvaluePackage) where
  eigenvalueZeroMultiplicityClosed : E.eigenvalueZeroMultiplicity = 1 ↔ E.graph.isConnected
  fiedlerEigenvaluePositive : E.fiedlerEigenvalue > 0
  eigenvectorCentralityClosed : E.eigenvectorCentrality
  spectralClusteringClosed : E.spectralClustering

def GraphLaplacianEigenvalueClosed (E : GraphLaplacianEigenvaluePackage) : Prop :=
  (E.eigenvalueZeroMultiplicity = 1 ↔ E.graph.isConnected) ∧
  E.fiedlerEigenvalue > 0 ∧
  E.eigenvectorCentrality ∧
  E.spectralClustering

theorem graph_laplacian_eigenvalue_closed_from_evidence (E : GraphLaplacianEigenvaluePackage) (Ev : GraphLaplacianEigenvalueEvidence E) : GraphLaplacianEigenvalueClosed E := by
  exact And.intro Ev.eigenvalueZeroMultiplicityClosed (And.intro Ev.fiedlerEigenvaluePositive (And.intro Ev.eigenvectorCentralityClosed Ev.spectralClusteringClosed))

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse