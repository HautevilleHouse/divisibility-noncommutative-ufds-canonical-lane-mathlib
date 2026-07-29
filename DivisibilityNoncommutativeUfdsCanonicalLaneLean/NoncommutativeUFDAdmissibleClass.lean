import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure NoncommutativeAdmittedObject where
  ring : Type u
  ringStr : Ring ring
  domain : Prop
  accp : Prop
  accpTerm : accp

def WitnessClosed (O : NoncommutativeAdmittedObject) : Prop :=
  O.accp

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse