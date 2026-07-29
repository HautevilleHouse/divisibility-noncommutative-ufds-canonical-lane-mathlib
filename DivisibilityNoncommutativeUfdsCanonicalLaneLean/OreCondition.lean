import DivisibilityNoncommutativeUfdsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure OreConditionPackage (R : NoncommutativeUfdAdmittedObject) where
  hasLeftOreCondition : Prop
  hasRightOreCondition : Prop
  leftOreConditionClosed : hasLeftOreCondition
  rightOreConditionClosed : hasRightOreCondition

def OreConditionClosed (R : NoncommutativeUfdAdmittedObject) (P : OreConditionPackage R) : Prop :=
  P.hasLeftOreCondition ∧ P.hasRightOreCondition

theorem ore_condition_closed_from_evidence (R : NoncommutativeUfdAdmittedObject)
    (P : OreConditionPackage R) (L : P.hasLeftOreCondition) (Rgt : P.hasRightOreCondition) :
    OreConditionClosed R P := by
  exact And.intro L Rgt

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse