import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure SmallWorldModel where
  latticeDimension : ℕ
  rewiringProbability : ℝ
  averagePathLength : ℝ
  clusteringCoefficient : ℝ
  smallWorldProperty : Prop
  highClustering : Prop

structure SmallWorldEvidence (S : SmallWorldModel) where
  smallWorldPropertyClosed : S.smallWorldProperty
  highClusteringClosed : S.highClustering

def SmallWorldClosed (S : SmallWorldModel) : Prop :=
  S.smallWorldProperty ∧ S.highClustering

theorem small_world_closed_from_evidence (S : SmallWorldModel)
    (E : SmallWorldEvidence S) : SmallWorldClosed S :=
  And.intro E.smallWorldPropertyClosed E.highClusteringClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
