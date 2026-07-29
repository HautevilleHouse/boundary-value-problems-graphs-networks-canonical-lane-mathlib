import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure PercolationModelPackage where
  percolationThreshold : ℝ
  clusterSizeDistribution : List ℝ
  connectivityCritical : Prop
  infiniteClusterExists : Prop

structure PercolationModelEvidence (P : PercolationModelPackage) where
  percolationThresholdBounded : P.percolationThreshold ∈ Set.Ioo (0 : ℝ) 1
  clusterSizeDistributionNonempty : P.clusterSizeDistribution ≠ []
  connectivityCriticalClosed : P.connectivityCritical

def PercolationModelClosed (P : PercolationModelPackage) : Prop :=
  P.percolationThreshold ∈ Set.Ioo (0 : ℝ) 1 ∧ P.clusterSizeDistribution ≠ [] ∧ P.connectivityCritical

theorem percolation_model_closed_from_evidence (P : PercolationModelPackage) (E : PercolationModelEvidence P) :
    PercolationModelClosed P := by
  exact And.intro E.percolationThresholdBounded (And.intro E.clusterSizeDistributionNonempty E.connectivityCriticalClosed)

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
