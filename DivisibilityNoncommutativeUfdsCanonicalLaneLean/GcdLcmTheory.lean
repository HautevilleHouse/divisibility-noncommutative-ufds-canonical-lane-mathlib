import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsCanonicalLaneLean.FactorisationStructure

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure GcdLcmSignature (R : Type u) [Ring R] where
  gcd : R → R → R
  lcm : R → R → R
  gcdProperties : ∀ (a b : R), gcd a b ∣ a ∧ gcd a b ∣ b ∧ ∀ (d : R), (d ∣ a ∧ d ∣ b) → d ∣ gcd a b
  lcmProperties : ∀ (a b : R), a ∣ lcm a b ∧ b ∣ lcm a b ∧ ∀ (m : R), (a ∣ m ∧ b ∣ m) → lcm a b ∣ m
  relationship : ∀ (a b : R), a * b = gcd a b * lcm a b

structure GcdLcmPackage {R : Type u} [Ring R] {U : NoncommutativeUfd R} {P : PrimeElementPackage R U} {F : FactorisationStructurePackage R U P} where
  gcdFunction : R → R → R
  lcmFunction : R → R → R
  gcdPropertiesClosed : ∀ (a b : R), gcdFunction a b ∣ a ∧ gcdFunction a b ∣ b ∧ ∀ (d : R), (d ∣ a ∧ d ∣ b) → d ∣ gcdFunction a b
  lcmPropertiesClosed : ∀ (a b : R), a ∣ lcmFunction a b ∧ b ∣ lcmFunction a b ∧ ∀ (m : R), (a ∣ m ∧ b ∣ m) → lcmFunction a b ∣ m
  relationshipClosed : ∀ (a b : R), a * b = gcdFunction a b * lcmFunction a b

def GcdLcmPackageClosed {R : Type u} [Ring R] {U : NoncommutativeUfd R} {P : PrimeElementPackage R U} {F : FactorisationStructurePackage R U P} (G : GcdLcmPackage R U P F) : Prop :=
  (∀ (a b : R), G.gcdPropertiesClosed a b) ∧ (∀ (a b : R), G.lcmPropertiesClosed a b) ∧ G.relationshipClosed

theorem gcd_lcm_package_closed {R : Type u} [Ring R] {U : NoncommutativeUfd R} {P : PrimeElementPackage R U} {F : FactorisationStructurePackage R U P} (G : GcdLcmPackage R U P F) : GcdLcmPackageClosed G := by
  refine And.intro ?_ (And.intro ?_ G.relationshipClosed)
  · intro a b; exact G.gcdPropertiesClosed a b
  · intro a b; exact G.lcmPropertiesClosed a b

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse