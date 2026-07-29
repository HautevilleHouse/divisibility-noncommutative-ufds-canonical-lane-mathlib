import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.NoncommutativeUFDAdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure AccConditionPackage (R : NoncommutativeAdmittedObject) where
  accOnRightDivisibility : Prop
  accOnLeftDivisibility : Prop
  bothAccHold : Prop
  rightAccWitness : accOnRightDivisibility
  leftAccWitness : accOnLeftDivisibility
  bothAccWitness : bothAccHold

structure AccConditionEvidence {R : NoncommutativeAdmittedObject} (A : AccConditionPackage R) where
  accOnRightDivisibilityClosed : A.accOnRightDivisibility
  accOnLeftDivisibilityClosed : A.accOnLeftDivisibility
  bothAccHoldClosed : A.bothAccHold

def AccConditionClosed {R : NoncommutativeAdmittedObject} (A : AccConditionPackage R) : Prop :=
  A.accOnRightDivisibility ∧ A.accOnLeftDivisibility ∧ A.bothAccHold

theorem acc_condition_closed_from_evidence
    {R : NoncommutativeAdmittedObject} (A : AccConditionPackage R) (E : AccConditionEvidence A) :
    AccConditionClosed A := by
  exact And.intro E.accOnRightDivisibilityClosed (And.intro E.accOnLeftDivisibilityClosed E.bothAccHoldClosed)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse