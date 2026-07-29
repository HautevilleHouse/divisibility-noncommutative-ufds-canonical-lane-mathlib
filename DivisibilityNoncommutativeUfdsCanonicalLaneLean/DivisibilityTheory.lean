import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure DivisibilityPackage where
  carrier : Type u
  multiplication : carrier → carrier → carrier
  leftDivisibility : carrier → carrier → Prop
  rightDivisibility : carrier → carrier → Prop
  leftDivisibilityReflexive : Prop
  leftDivisibilityTransitive : Prop
  rightDivisibilityReflexive : Prop
  rightDivisibilityTransitive : Prop
  leftAndRightCompatible : Prop

structure DivisibilityEvidence (D : DivisibilityPackage) where
  leftDivisibilityReflexiveClosed : D.leftDivisibilityReflexive
  leftDivisibilityTransitiveClosed : D.leftDivisibilityTransitive
  rightDivisibilityReflexiveClosed : D.rightDivisibilityReflexive
  rightDivisibilityTransitiveClosed : D.rightDivisibilityTransitive
  leftAndRightCompatibleClosed : D.leftAndRightCompatible

def DivisibilityClosed (D : DivisibilityPackage) : Prop :=
  D.leftDivisibilityReflexive ∧ D.leftDivisibilityTransitive ∧
  D.rightDivisibilityReflexive ∧ D.rightDivisibilityTransitive ∧
  D.leftAndRightCompatible

theorem divisibility_closed_from_evidence (D : DivisibilityPackage)
    (E : DivisibilityEvidence D) : DivisibilityClosed D := by
  exact And.intro E.leftDivisibilityReflexiveClosed (And.intro E.leftDivisibilityTransitiveClosed
    (And.intro E.rightDivisibilityReflexiveClosed (And.intro E.rightDivisibilityTransitiveClosed
      E.leftAndRightCompatibleClosed)))

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse