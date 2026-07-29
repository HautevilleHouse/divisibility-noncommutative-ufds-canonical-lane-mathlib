import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure PrimeElementPackage where
  carrier : Type u
  multiplication : carrier → carrier → carrier
  primeSet : Set carrier
  irreducibleSet : Set carrier
  primeImpliesIrreducible : Prop
  irreducibleFactorExists : Prop
  primeFactorExists : Prop

structure PrimeElementEvidence (P : PrimeElementPackage) where
  primeImpliesIrreducibleClosed : P.primeImpliesIrreducible
  irreducibleFactorExistsClosed : P.irreducibleFactorExists
  primeFactorExistsClosed : P.primeFactorExists

def PrimeElementClosed (P : PrimeElementPackage) : Prop :=
  P.primeImpliesIrreducible ∧ P.irreducibleFactorExists ∧ P.primeFactorExists

theorem prime_element_closed_from_evidence (P : PrimeElementPackage)
    (E : PrimeElementEvidence P) : PrimeElementClosed P := by
  exact And.intro E.primeImpliesIrreducibleClosed (And.intro E.irreducibleFactorExistsClosed
    E.primeFactorExistsClosed)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse