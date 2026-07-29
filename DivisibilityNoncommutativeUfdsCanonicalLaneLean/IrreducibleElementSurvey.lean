import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsCanonicalLaneLean.NoncommutativeUfdDefinitions

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure IrreducibleElementSignature (R : Type u) [Ring R] where
  irreducibleSet : Set R
  irreducibilityCondition : ∀ (a : R), a ∈ irreducibleSet ↔ (¬ IsUnit a ∧ ∀ (x y : R), a = x * y → IsUnit x ∨ IsUnit y)

structure IrreducibleElementPackage {R : Type u} [Ring R] (U : NoncommutativeUfd R) where
  irreducibleSet : Set R
  irreducibleCharacterisation : ∀ (a : R), Irreducible a ↔ a ∈ irreducibleSet
  associationClasses : Set (Set R)
  associationClassPartition : ∀ (a : R), a ∈ U.noncommutativeUfd.toNoncommutativeDomain.toRing → ∃! (S : Set R), S ∈ associationClasses ∧ a ∈ S

structure IrreducibleElementEvidence {R : Type u} [Ring R] {U : NoncommutativeUfd R} (I : IrreducibleElementPackage U) where
  characterisationClosed : I.irreducibleCharacterisation
  partitionClosed : I.associationClassPartition

def IrreducibleElementPackageClosed {R : Type u} [Ring R] {U : NoncommutativeUfd R} (I : IrreducibleElementPackage U) : Prop :=
  I.irreducibleCharacterisation ∧ I.associationClassPartition

theorem irreducible_element_package_closed_from_evidence {R : Type u} [Ring R] {U : NoncommutativeUfd R} (I : IrreducibleElementPackage U) (E : IrreducibleElementEvidence I) : IrreducibleElementPackageClosed I := by
  exact And.intro E.characterisationClosed E.partitionClosed

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse