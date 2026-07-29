import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.NoncommutativeUFDAdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure PrimalityConditionsPackage (R : NoncommutativeAdmittedObject) where
  irreducibleImpliesPrime : Prop
  primeClosedUnderMultiplication : Prop
  primeConditionHolds : Prop

structure PrimalityConditionsEvidence {R : NoncommutativeAdmittedObject} (P : PrimalityConditionsPackage R) where
  irreducibleImpliesPrimeClosed : P.irreducibleImpliesPrime
  primeClosedUnderMultiplicationClosed : P.primeClosedUnderMultiplication
  primeConditionHoldsClosed : P.primeConditionHolds

def PrimalityConditionsClosed {R : NoncommutativeAdmittedObject} (P : PrimalityConditionsPackage R) : Prop :=
  P.irreducibleImpliesPrime ∧ P.primeClosedUnderMultiplication ∧ P.primeConditionHolds

theorem primality_conditions_closed_from_evidence
    {R : NoncommutativeAdmittedObject} (P : PrimalityConditionsPackage R) (E : PrimalityConditionsEvidence P) :
    PrimalityConditionsClosed P := by
  exact And.intro E.irreducibleImpliesPrimeClosed (And.intro E.primeClosedUnderMultiplicationClosed E.primeConditionHoldsClosed)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse