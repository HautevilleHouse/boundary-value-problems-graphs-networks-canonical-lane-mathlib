import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsGraphsNetworksCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsGraphsNetworksCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GraphWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsGraphsNetworksCanonicalLaneLean
end HautevilleHouse
