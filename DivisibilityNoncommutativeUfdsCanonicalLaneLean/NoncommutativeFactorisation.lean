import DivisibilityNoncommutativeUfdsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure NoncommutativeFactorisationPackage where
  factorisationType : Type u
  irreducibleFactors : Prop
  factorisationExistence : Prop
  factorisationUniqueness : Prop
  factorisationExistenceClosed : factorisationExistence
  factorisationUniquenessClosed : factorisationUniqueness

def NoncommutativeFactorisationClosed (P : NoncommutativeFactorisationPackage) : Prop :=
  P.factorisationExistence ∧ P.factorisationUniqueness

theorem noncommutative_factorisation_closed_from_evidence
    (P : NoncommutativeFactorisationPackage) (E : P.factorisationExistenceClosed) (U : P.factorisationUniquenessClosed) :
    NoncommutativeFactorisationClosed P := by
  exact And.intro E U

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse