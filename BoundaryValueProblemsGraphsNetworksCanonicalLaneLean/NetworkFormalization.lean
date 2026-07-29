import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.SmallWorldModel

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

structure NetworkFormalizationCertificate where
  graphSpectralData : Prop
  percolationData : Prop
  smallWorldData : Prop
  randomGraphData : Prop
  formalizationComplete : Prop
  graphSpectralDataClosed : graphSpectralData
  percolationDataClosed : percolationData
  smallWorldDataClosed : smallWorldData
  randomGraphDataClosed : randomGraphData

def NetworkFormalizationClosed (C : NetworkFormalizationCertificate) : Prop :=
  C.graphSpectralData ∧ C.percolationData ∧ C.smallWorldData ∧ C.randomGraphData

theorem network_formalization_closed (C : NetworkFormalizationCertificate) :
    NetworkFormalizationClosed C :=
  And.intro C.graphSpectralDataClosed
    (And.intro C.percolationDataClosed (And.intro C.smallWorldDataClosed C.randomGraphDataClosed))

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse