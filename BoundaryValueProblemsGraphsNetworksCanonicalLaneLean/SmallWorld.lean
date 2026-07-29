import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure SmallWorldPackage where
  n : Nat
  averagePathLength : ℝ
  clusteringCoefficient : ℝ
  isSmallWorld : Prop

structure SmallWorldEvidence (S : SmallWorldPackage) where
  averagePathLengthLogN : S.averagePathLength ≤ Real.log S.n
  clusteringCoefficientPositive : S.clusteringCoefficient > 0

def SmallWorldClosed (S : SmallWorldPackage) : Prop :=
  S.isSmallWorld ∧ S.averagePathLength ≤ Real.log S.n ∧ S.clusteringCoefficient > 0

theorem small_world_closed_from_evidence (S : SmallWorldPackage) (E : SmallWorldEvidence S) :
    SmallWorldClosed S := by
  exact And.intro S.isSmallWorld (And.intro E.averagePathLengthLogN E.clusteringCoefficientPositive)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse