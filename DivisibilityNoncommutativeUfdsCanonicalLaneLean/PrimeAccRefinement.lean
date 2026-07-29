import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.AssociateIrreducibleStructure

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure PrimeAccRefinement {R : NoncommutativeRing}
    (S : AssociateIrreducibleStructure R) where
  accCondition : ∀ a : NonzeroDivisor R, (∀ b : NonzeroDivisor R, b ∣ a → b ∉ S.irreducibleSet →
    ∃ (c : NonzeroDivisor R), c ∈ S.irreducibleSet ∧ c ∣ b) →
    ∃ (f : ℕ → NonzeroDivisor R), (∀ n, f (n+1) ∣ f n) ∧ ¬ (∃ n, f n ∈ S.irreducibleSet)
  maximalCondition : ∀ (a : NonzeroDivisor R), (∀ b : NonzeroDivisor R, b ∣ a → b ∈ S.irreducibleSet) →
    a ∈ S.irreducibleSet

structure PrimeAccRefinementEvidence {R : NoncommutativeRing}
    {S : AssociateIrreducibleStructure R} (P : PrimeAccRefinement S) where
  accConditionClosed : P.accCondition
  maximalConditionClosed : P.maximalCondition

def PrimeAccRefinementClosed {R : NoncommutativeRing}
    {S : AssociateIrreducibleStructure R} (P : PrimeAccRefinement S) : Prop :=
  P.accCondition ∧ P.maximalCondition

theorem prime_acc_refinement_closed_from_evidence
    {R : NoncommutativeRing} {S : AssociateIrreducibleStructure R}
    (P : PrimeAccRefinement S) (E : PrimeAccRefinementEvidence P) :
    PrimeAccRefinementClosed P := by
  exact And.intro E.accConditionClosed E.maximalConditionClosed

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse
