import canonicalLaneMathlib.AdmissibleClass
import CompactComplexNFoldsCanonicalLaneLean.KahlerGeometry

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure HodgePackage (M : ComplexManifoldPackage) (K : KahlerPackage M) where
  hodgeDecomposition : Prop
  hodgeNumbers : ℕ → ℕ → ℕ
  hodgeDiamond : Prop
  serreDuality : Prop

structure HodgeEvidence {M : ComplexManifoldPackage}
    {K : KahlerPackage M} (H : HodgePackage M K) where
  hodgeDecompositionClosed : H.hodgeDecomposition
  hodgeDiamondClosed : H.hodgeDiamond
  serreDualityClosed : H.serreDuality

def HodgeClosed {M : ComplexManifoldPackage}
    {K : KahlerPackage M} (H : HodgePackage M K) : Prop :=
  H.hodgeDecomposition ∧ H.hodgeDiamond ∧ H.serreDuality

theorem hodge_closed_from_evidence {M : ComplexManifoldPackage}
    {K : KahlerPackage M} (H : HodgePackage M K) (E : HodgeEvidence H) :
    HodgeClosed H := by
  exact And.intro E.hodgeDecompositionClosed
    (And.intro E.hodgeDiamondClosed E.serreDualityClosed)

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse