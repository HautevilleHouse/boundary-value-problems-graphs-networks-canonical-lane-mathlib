import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure RandomGraphErdosRenyiPackage where
  vertexCount : Nat
  edgeProbability : ℝ
  adjacencyMatrix : Matrix (Fin vertexCount) (Fin vertexCount) ℝ
  edgeDistribution : ∀ i j : Fin vertexCount, i ≠ j → (adjacencyMatrix i j = 1) ∨ (adjacencyMatrix i j = 0)
  expectedNumberEdges : ℕ
  connectivityThreshold : Prop
  giantComponentExists : Prop
  phaseTransition : (edgeProbability > Real.log (vertexCount : ℝ) / (vertexCount : ℝ) → giantComponentExists) ∧ (edgeProbability < 1 / (vertexCount : ℝ) → ¬ giantComponentExists)

structure RandomGraphErdosRenyiEvidence (P : RandomGraphErdosRenyiPackage) where
  edgeDistributionClosed : P.edgeDistribution
  phaseTransitionClosed : P.phaseTransition

def RandomGraphErdosRenyiClosed (P : RandomGraphErdosRenyiPackage) : Prop :=
  P.edgeDistribution ∧ P.phaseTransition

theorem random_graph_erdos_renyi_closed_from_evidence (P : RandomGraphErdosRenyiPackage) (E : RandomGraphErdosRenyiEvidence P) : RandomGraphErdosRenyiClosed P := by
  exact And.intro E.edgeDistributionClosed E.phaseTransitionClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
