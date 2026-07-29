import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure NoncommutativeDomain (R : Type u) [Ring R] where
  noZeroDivisors : ∀ (a b : R), a * b = 0 → a = 0 ∨ b = 0

structure NoncommutativeUfd (R : Type u) [Ring R] extends NoncommutativeDomain R where
  factorizationExists : ∀ (a : R), a ≠ 0 → ∃ (irrs : List R), (∀ r ∈ irrs, Irreducible r) ∧ a = (∏ r in irrs, r)
  factorizationUnique : ∀ (a : R) (irrs1 irrs2 : List R),
    (∀ r ∈ irrs1, Irreducible r) → (∀ r ∈ irrs2, Irreducible r) →
    a = (∏ r in irrs1, r) → a = (∏ r in irrs2, r) →
    Multiset.ofList irrs1 = Multiset.ofList irrs2

structure DivisorTheorySignature (R : Type u) [CommRing R] where
  divisorPoset : Set (R × R)
  divisibilityClosed : Prop
  factorisationRespectsOrder : Prop

structure AdmissibleRing extends AdmissibleClass where
  ring : Type u
  ringStr : Ring ring
  noncommutativeUfd : NoncommutativeUfd ring

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse