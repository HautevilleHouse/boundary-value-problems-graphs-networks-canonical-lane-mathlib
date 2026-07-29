import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GraphSpace where
  carrier : Type
  graphStructure : Prop

structure GraphAdmittedObject where
  space : GraphSpace
  finiteGraph : Prop
  connectedGraph : Prop
  boundaryCondition : Prop
  solutionExists : Prop
  conclusion : solutionExists

def GraphWitnessClosed (O : GraphAdmittedObject) : Prop :=
  O.solutionExists

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse