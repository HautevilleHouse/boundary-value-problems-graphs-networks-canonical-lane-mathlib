import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.GraphAdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

def bridgeClosed (A : GraphAdmissibleClass) : Prop :=
  GraphWitnessClosed A.object

theorem bridge_from_admissible_class (A : GraphAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse