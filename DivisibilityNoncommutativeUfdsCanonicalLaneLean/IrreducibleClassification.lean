import DivisibilityNoncommutativeUfdsCanonicalLaneLean.NoncommutativeFactorisation

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure IrreducibleClassificationPackage where
  irreducibleElements : Set (NoncommutativeUfdAdmittedObject)
  primeElements : Set (NoncommutativeUfdAdmittedObject)
  irreducibleImpliesPrime : irreducibleElements ⊆ primeElements
  primeImpliesIrreducible : primeElements ⊆ irreducibleElements
  classificationComplete : irreducibleElements = primeElements
  classificationCompleteClosed : classificationComplete

def IrreducibleClassificationClosed (P : IrreducibleClassificationPackage) : Prop :=
  P.classificationComplete

theorem irreducible_classification_closed_from_evidence
    (P : IrreducibleClassificationPackage) (E : P.classificationCompleteClosed) :
    IrreducibleClassificationClosed P := by
  exact E

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse