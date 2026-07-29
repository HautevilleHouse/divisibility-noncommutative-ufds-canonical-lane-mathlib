import HautevilleHouse.DivisibilityNoncommutativeUfdsCanonicalLaneLean.NoncommutativeUfdBase

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsCanonicalLaneLean

structure NoncommutativeRing where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  addLeftNeg : ∀ a : carrier, ∃ b : carrier, add a b = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  mulOne : ∀ a : carrier, mul a one = a
  oneMul : ∀ a : carrier, mul one a = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)

structure NonzeroDivisor (R : NoncommutativeRing) where
  val : R.carrier
  notZeroDivisor : ∀ (x : R.carrier), R.mul x val = R.zero → x = R.zero

structure NoncommutativeUfdAdmittedObject where
  base : NoncommutativeUfdBase
  conclusion : NoncommutativeUfdBaseClosed base

end DivisibilityNoncommutativeUfdsCanonicalLaneLean
end HautevilleHouse
