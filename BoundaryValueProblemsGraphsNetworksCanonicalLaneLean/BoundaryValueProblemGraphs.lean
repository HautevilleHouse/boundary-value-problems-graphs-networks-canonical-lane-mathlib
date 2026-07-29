import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.AdmissibleClass

/-!
# Boundary Value Problems on Graphs Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure BVPGraphPackage where
  graph : Type u
  boundaryVertices : Set (graph)
  interiorVertices : Set (graph)
  laplacian : (graph → ℝ) → (graph → ℝ)
  boundaryCondition : graph → ℝ
  solution : graph → ℝ
  solutionSatisfies : Prop
  existence : Prop
  uniqueness : Prop

structure BVPGraphEvidence (B : BVPGraphPackage) where
  solutionSatisfiesClosed : B.solutionSatisfies
  existenceClosed : B.existence
  uniquenessClosed : B.uniqueness

def BVPGraphClosed (B : BVPGraphPackage) : Prop :=
  B.solutionSatisfies ∧ B.existence ∧ B.uniqueness

theorem bvp_graph_closed_from_evidence (B : BVPGraphPackage) (E : BVPGraphEvidence B) :
    BVPGraphClosed B := by
  exact And.intro E.solutionSatisfiesClosed (And.intro E.existenceClosed E.uniquenessClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse