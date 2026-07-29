import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

def ConstrainedDivisibilityNoncommutativeUfdClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_divisibility_noncommutative_ufd_endgame (A : AdmissibleClass) :
    ConstrainedDivisibilityNoncommutativeUfdClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse
