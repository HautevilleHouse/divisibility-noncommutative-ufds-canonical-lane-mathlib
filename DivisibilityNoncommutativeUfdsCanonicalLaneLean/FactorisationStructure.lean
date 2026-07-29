import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsCanonicalLaneLean.PrimeElementClassification

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure FactorisationStructurePackage {R : Type u} [Ring R] {U : NoncommutativeUfd R} (P : PrimeElementPackage R U) where
  factorisationFunction : (a : R) → (a ≠ 0) → List R
  factorisationProperties : ∀ (a : R) (h : a ≠ 0),
    (∀ r ∈ factorisationFunction a h, P.primeSet r) ∧ a = (∏ r in factorisationFunction a h, r)
  factorisationRespectsMultiplication : ∀ (a b : R) (ha : a ≠ 0) (hb : b ≠ 0),
    factorisationFunction (a * b) (mul_ne_zero ha hb) = factorisationFunction a ha ++ factorisationFunction b hb

structure FactorisationStructureEvidence {R : Type u} [Ring R] {U : NoncommutativeUfd R} {P : PrimeElementPackage R U}
    (F : FactorisationStructurePackage R U P) where
  factorisationPropertiesClosed : F.factorisationProperties
  multiplicationRespectedClosed : F.factorisationRespectsMultiplication

def FactorisationStructureClosed {R : Type u} [Ring R] {U : NoncommutativeUfd R} {P : PrimeElementPackage R U}
    (F : FactorisationStructurePackage R U P) : Prop :=
  F.factorisationProperties ∧ F.factorisationRespectsMultiplication

theorem factorisation_structure_closed_from_evidence {R : Type u} [Ring R] {U : NoncommutativeUfd R} {P : PrimeElementPackage R U}
    (F : FactorisationStructurePackage R U P) (E : FactorisationStructureEvidence F) : FactorisationStructureClosed F := by
  exact And.intro E.factorisationPropertiesClosed E.multiplicationRespectedClosed

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse