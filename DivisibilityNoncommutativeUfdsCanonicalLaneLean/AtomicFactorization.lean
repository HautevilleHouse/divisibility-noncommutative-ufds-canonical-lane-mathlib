import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.NoncommutativeUFDAdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure AtomicFactorizationPackage (R : NoncommutativeAdmittedObject) where
  atomsClassify : Prop
  factorizationExists : Prop
  factorizationUnique : Prop

structure AtomicFactorizationEvidence {R : NoncommutativeAdmittedObject} (A : AtomicFactorizationPackage R) where
  atomsClassifyClosed : A.atomsClassify
  factorizationExistsClosed : A.factorizationExists
  factorizationUniqueClosed : A.factorizationUnique

def AtomicFactorizationClosed {R : NoncommutativeAdmittedObject} (A : AtomicFactorizationPackage R) : Prop :=
  A.atomsClassify ∧ A.factorizationExists ∧ A.factorizationUnique

theorem atomic_factorization_closed_from_evidence
    {R : NoncommutativeAdmittedObject} (A : AtomicFactorizationPackage R) (E : AtomicFactorizationEvidence A) :
    AtomicFactorizationClosed A := by
  exact And.intro E.atomsClassifyClosed (And.intro E.factorizationExistsClosed E.factorizationUniqueClosed)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse