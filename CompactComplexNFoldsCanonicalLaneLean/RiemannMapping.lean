import compactComplexNFoldsCanonicalLaneLean.AdmissibleClass

/-!
# Riemann Mapping for Compact Complex N Folds
-/

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure RiemannMappingPackage where
  domain : Prop
  holomorphicBiholomorphism : Prop
  conformalEquivalence : Prop
  univalence : Prop

def RiemannMappingClosed (R : RiemannMappingPackage) : Prop :=
  R.domain ∧ R.holomorphicBiholomorphism ∧ R.conformalEquivalence ∧ R.univalence

theorem riemann_mapping_closed_from_evidence (R : RiemannMappingPackage) (h : RiemannMappingClosed R) :
    RiemannMappingClosed R := h

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
