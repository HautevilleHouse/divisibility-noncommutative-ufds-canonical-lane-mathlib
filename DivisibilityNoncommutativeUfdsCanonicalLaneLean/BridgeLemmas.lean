import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NoncommutativeUfdWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse
