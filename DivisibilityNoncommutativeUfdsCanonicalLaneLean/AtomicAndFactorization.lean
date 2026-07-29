import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure AtomicFactorizationPackage where
  carrier : Type u
  multiplication : carrier → carrier → carrier
  atomicElements : Set carrier
  factorizationExists : Prop
  factorizationUnique : Prop
  atomicImpliesIrreducible : Prop

structure AtomicFactorizationEvidence (A : AtomicFactorizationPackage) where
  factorizationExistsClosed : A.factorizationExists
  factorizationUniqueClosed : A.factorizationUnique
  atomicImpliesIrreducibleClosed : A.atomicImpliesIrreducible

def AtomicFactorizationClosed (A : AtomicFactorizationPackage) : Prop :=
  A.factorizationExists ∧ A.factorizationUnique ∧ A.atomicImpliesIrreducible

theorem atomic_factorization_closed_from_evidence (A : AtomicFactorizationPackage)
    (E : AtomicFactorizationEvidence A) : AtomicFactorizationClosed A := by
  exact And.intro E.factorizationExistsClosed (And.intro E.factorizationUniqueClosed
    E.atomicImpliesIrreducibleClosed)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse