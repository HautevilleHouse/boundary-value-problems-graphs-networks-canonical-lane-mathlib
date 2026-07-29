import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure BoundaryValueProblemPackage where
  graph : Type u
  boundary : Finset graph
  interior : Finset graph
  laplacian : Matrix (Fin (Finset.card interior)) (Fin (Finset.card interior)) ℝ
  dirichletSolution : Prop
  existence : dirichletSolution
  uniqueness : dirichletSolution
  bvpEvidence : existence ∧ uniqueness

structure BoundaryValueProblemEvidence (B : BoundaryValueProblemPackage) where
  existenceClosed : B.existence
  uniquenessClosed : B.uniqueness
  bvpEvidenceClosed : B.bvpEvidence

def BoundaryValueProblemClosed (B : BoundaryValueProblemPackage) : Prop :=
  B.existence ∧ B.uniqueness

theorem bvp_closed_from_evidence (B : BoundaryValueProblemPackage) (E : BoundaryValueProblemEvidence B) :
    BoundaryValueProblemClosed B := by
  exact And.intro E.existenceClosed E.uniquenessClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse