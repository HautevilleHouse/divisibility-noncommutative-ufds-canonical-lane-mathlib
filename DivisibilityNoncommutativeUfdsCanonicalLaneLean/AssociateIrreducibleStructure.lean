import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure AssociateIrreducibleStructure (R : NoncommutativeRing) where
  irreducibleSet : Set (NonzeroDivisor R)
  factorizationExists : ∀ a : NonzeroDivisor R, ∃ (irrs : List (NonzeroDivisor R)) (u : Unit R),
    (∀ x ∈ irrs, x ∈ irreducibleSet) ∧ (product (u :: irrs) = a)
  uniquenessUpToAssociates : ∀ a : NonzeroDivisor R,
    ∀ (l1 l2 : List (NonzeroDivisor R)),
      (∀ x ∈ l1, x ∈ irreducibleSet) → (∀ x ∈ l2, x ∈ irreducibleSet) →
      (product l1 = a) → (product l2 = a) →
      (List.length l1 = List.length l2) ∧
      (∃ (σ : Perm (Fin (List.length l1))),
        ∀ i, (l1.get i) ≈ (l2.get (σ i)))
  where product : List (NonzeroDivisor R) → NonzeroDivisor R
    | [] => 1
    | (h :: t) => h * product t

structure AssociateIrreducibleEvidence {R : NoncommutativeRing}
    (S : AssociateIrreducibleStructure R) where
  factorizationExistsClosed : S.factorizationExists
  uniquenessUpToAssociatesClosed : S.uniquenessUpToAssociates

def AssociateIrreducibleClosed {R : NoncommutativeRing}
    (S : AssociateIrreducibleStructure R) : Prop :=
  S.factorizationExists ∧ S.uniquenessUpToAssociates

theorem associate_irreducible_closed_from_evidence
    {R : NoncommutativeRing} (S : AssociateIrreducibleStructure R)
    (E : AssociateIrreducibleEvidence S) : AssociateIrreducibleClosed S := by
  exact And.intro E.factorizationExistsClosed E.uniquenessUpToAssociatesClosed

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse
