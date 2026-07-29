import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure AdmissibleClass where
  object : NoncommutativeUfdAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NoncommutativeUfdWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse
