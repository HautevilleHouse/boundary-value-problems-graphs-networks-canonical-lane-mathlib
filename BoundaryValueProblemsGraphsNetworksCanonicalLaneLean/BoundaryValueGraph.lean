import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure BoundaryValueGraphPackage where
  graphType : String
  boundaryNodes : Set ℕ
  interiorNodes : Set ℕ
  dirichletEnergy : ℝ
  harmonicFunctionExists : Prop
  uniqueSolution : Prop

structure BoundaryValueGraphEvidence (B : BoundaryValueGraphPackage) where
  dirichletEnergyNonnegative : B.dirichletEnergy ≥ 0
  harmonicFunctionExists : B.harmonicFunctionExists
  uniqueSolution : B.uniqueSolution

def BoundaryValueGraphClosed (B : BoundaryValueGraphPackage) : Prop :=
  B.harmonicFunctionExists ∧ B.uniqueSolution

theorem boundary_value_graph_closed_from_evidence (B : BoundaryValueGraphPackage) (E : BoundaryValueGraphEvidence B) :
    BoundaryValueGraphClosed B := by
  exact And.intro E.harmonicFunctionExists E.uniqueSolution

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse