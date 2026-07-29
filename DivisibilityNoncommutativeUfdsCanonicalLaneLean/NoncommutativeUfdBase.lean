import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.PrimeAccRefinement

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure NoncommutativeUfdBase where
  ring : NoncommutativeRing
  associateIrreducibleStructure : AssociateIrreducibleStructure ring
  primeAccRefinement : PrimeAccRefinement associateIrreducibleStructure
  accSubsetPrimeCondition : ∀ (a b : NonzeroDivisor ring),
    (∃ (c : NonzeroDivisor ring), a = b * c) →
    (a ∈ associateIrreducibleStructure.irreducibleSet →
     b ∈ associateIrreducibleStructure.irreducibleSet ∨ a ≈ b)

structure NoncommutativeUfdBaseEvidence (B : NoncommutativeUfdBase) where
  associateIrreducibleEvidence : AssociateIrreducibleEvidence B.associateIrreducibleStructure
  primeAccRefinementEvidence : PrimeAccRefinementEvidence B.primeAccRefinement
  accSubsetPrimeConditionClosed : B.accSubsetPrimeCondition

def NoncommutativeUfdBaseClosed (B : NoncommutativeUfdBase) : Prop :=
  AssociateIrreducibleClosed B.associateIrreducibleStructure ∧
  PrimeAccRefinementClosed B.primeAccRefinement ∧
  B.accSubsetPrimeCondition

theorem noncommutative_ufd_base_closed_from_evidence
    (B : NoncommutativeUfdBase) (E : NoncommutativeUfdBaseEvidence B) :
    NoncommutativeUfdBaseClosed B := by
  refine And.intro (associate_irreducible_closed_from_evidence B.associateIrreducibleStructure E.associateIrreducibleEvidence)
    (And.intro (prime_acc_refinement_closed_from_evidence B.primeAccRefinement E.primeAccRefinementEvidence)
      E.accSubsetPrimeConditionClosed)

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse
