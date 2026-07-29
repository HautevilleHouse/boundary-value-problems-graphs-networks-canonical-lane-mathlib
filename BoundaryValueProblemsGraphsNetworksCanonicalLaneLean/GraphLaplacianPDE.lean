import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure Node where
  idx : Nat
  label : Option String

def Edge : Type := (Node × Node)

structure Graph where
  nodes : List Node
  edges : List Edge
  adjacent : Node → Node → Prop
  adjacentDef : ∀ u v, adjacent u v ↔ (u, v) ∈ edges ∨ (v, u) ∈ edges

structure WeightedGraph extends Graph where
  weight : Edge → ℝ
  weightPos : ∀ e, weight e > 0

structure GraphLaplacianPackage (G : WeightedGraph) where
  laplacianMatrix : List (List ℝ)
  degreeMatrix : List (List ℝ)
  adjacencyMatrix : List (List ℝ)
  laplacianIsSemidefinite : Prop
  spectrum : List ℝ
  spectrumComputed : laplacianIsSemidefinite
  rayleighQuotient : Node → ℝ
  rayleighBound : Prop

structure GraphLaplacianEvidence {G : WeightedGraph} (L : GraphLaplacianPackage G) where
  laplacianSemidefiniteClosed : L.laplacianIsSemidefinite
  spectrumClosed : L.spectrumComputed
  rayleighBoundClosed : L.rayleighBound

def GraphLaplacianClosed {G : WeightedGraph} (L : GraphLaplacianPackage G) : Prop :=
  L.laplacianIsSemidefinite ∧ L.spectrumComputed ∧ L.rayleighBound

theorem graph_laplacian_closed_from_evidence {G : WeightedGraph} (L : GraphLaplacianPackage G) (E : GraphLaplacianEvidence L) : GraphLaplacianClosed L := by
  exact And.intro E.laplacianSemidefiniteClosed (And.intro E.spectrumClosed E.rayleighBoundClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
