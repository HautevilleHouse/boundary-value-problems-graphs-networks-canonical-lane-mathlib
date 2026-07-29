import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure SmallWorldNetworkPackage where
  nodeCount : Nat
  rewiringProbability : ℝ
  clusteringCoefficient : ℝ
  averagePathLength : ℝ
  highClustering : clusteringCoefficient > 0.5
  shortPaths : averagePathLength < Real.log (nodeCount : ℝ) / Real.log 2
  smallWorldProperty : highClustering ∧ shortPaths

structure SmallWorldNetworkEvidence (P : SmallWorldNetworkPackage) where
  highClusteringClosed : P.highClustering
  shortPathsClosed : P.shortPaths

def SmallWorldNetworkClosed (P : SmallWorldNetworkPackage) : Prop :=
  P.highClustering ∧ P.shortPaths

theorem small_world_network_closed_from_evidence (P : SmallWorldNetworkPackage) (E : SmallWorldNetworkEvidence P) : SmallWorldNetworkClosed P := by
  exact And.intro E.highClusteringClosed E.shortPathsClosed

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
