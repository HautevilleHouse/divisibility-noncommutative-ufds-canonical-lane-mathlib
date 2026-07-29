import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsCanonicalLaneLean.NoncommutativeUfdDefinitions

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure PrimeElementSignature (R : Type u) [Ring R] where
  primePredicate : R → Prop
  primeProperties : ∀ (p : R), primePredicate p → (Irreducible p ∧ (∀ (a b : R), p ∣ a * b → p ∣ a ∨ p ∣ b))

structure PrimeElementPackage (R : Type u) [Ring R] (U : NoncommutativeUfd R) where
  primeSet : Set R
  classificationTheorem : ∀ (a : R), a ≠ 0 → (Irreducible a ↔ a ∈ primeSet)
  uniquenessOfPrimeFactors : ∀ (a : R) (p q : R), p ∈ primeSet → q ∈ primeSet → (p ∣ a ∧ q ∣ a) → (p = q)

structure PrimeElementEvidence {R : Type u} [Ring R] {U : NoncommutativeUfd R} (P : PrimeElementPackage R U) where
  classificationClosed : P.classificationTheorem
  uniquenessClosed : P.uniquenessOfPrimeFactors

def PrimeElementPackageClosed {R : Type u} [Ring R] {U : NoncommutativeUfd R} (P : PrimeElementPackage R U) : Prop :=
  P.classificationTheorem ∧ P.uniquenessOfPrimeFactors

theorem prime_element_package_closed_from_evidence {R : Type u} [Ring R] {U : NoncommutativeUfd R} (P : PrimeElementPackage R U) (E : PrimeElementEvidence P) : PrimeElementPackageClosed P := by
  exact And.intro E.classificationClosed E.uniquenessClosed

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse