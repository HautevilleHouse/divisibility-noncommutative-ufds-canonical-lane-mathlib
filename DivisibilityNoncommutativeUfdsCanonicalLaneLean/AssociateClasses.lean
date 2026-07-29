import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure AssociateClassPackage where
  carrier : Type u
  multiplication : carrier → carrier → carrier
  units : Set carrier
  leftAssociate : carrier → carrier → Prop
  rightAssociate : carrier → carrier → Prop
  leftAssociateEquivalence : Prop
  rightAssociateEquivalence : Prop
  leftAndRightAssociateAgree : Prop

structure AssociateClassEvidence (A : AssociateClassPackage) where
  leftAssociateEquivalenceClosed : A.leftAssociateEquivalence
  rightAssociateEquivalenceClosed : A.rightAssociateEquivalence
  leftAndRightAssociateAgreeClosed : A.leftAndRightAssociateAgree

def AssociateClassClosed (A : AssociateClassPackage) : Prop :=
  A.leftAssociateEquivalence ∧ A.rightAssociateEquivalence ∧ A.leftAndRightAssociateAgree

theorem associate_class_closed_from_evidence (A : AssociateClassPackage)
    (E : AssociateClassEvidence A) : AssociateClassClosed A := by
  exact And.intro E.leftAssociateEquivalenceClosed (And.intro E.rightAssociateEquivalenceClosed
    E.leftAndRightAssociateAgreeClosed)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse