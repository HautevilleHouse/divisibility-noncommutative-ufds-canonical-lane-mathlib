import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure NoncommutativeUfdPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  isRing : Prop
  isDomain : Prop
  noZeroDivisors : Prop
  accDivisorChain : Prop
  uniqueFactorizationNoncomm : Prop

structure NoncommutativeUfdEvidence (P : NoncommutativeUfdPackage) where
  isRingClosed : P.isRing
  isDomainClosed : P.isDomain
  noZeroDivisorsClosed : P.noZeroDivisors
  accDivisorChainClosed : P.accDivisorChain
  uniqueFactorizationNoncommClosed : P.uniqueFactorizationNoncomm

def NoncommutativeUfdClosed (P : NoncommutativeUfdPackage) : Prop :=
  P.isRing ∧ P.isDomain ∧ P.noZeroDivisors ∧ P.accDivisorChain ∧ P.uniqueFactorizationNoncomm

theorem noncommutative_ufd_closed_from_evidence (P : NoncommutativeUfdPackage)
    (E : NoncommutativeUfdEvidence P) : NoncommutativeUfdClosed P := by
  exact And.intro E.isRingClosed (And.intro E.isDomainClosed (And.intro E.noZeroDivisorsClosed
    (And.intro E.accDivisorChainClosed E.uniqueFactorizationNoncommClosed)))

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse