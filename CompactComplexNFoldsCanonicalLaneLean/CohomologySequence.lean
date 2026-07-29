import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CompactComplexNFoldsCanonicalLaneLean.CanonicalBundle

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure CohomologySequence (X : Type) [TopologicalSpace X] [ComplexManifold X] (B : CanonicalBundle X) where
  indexRange : ℕ → ℕ
  differentials : ℕ → Type
  exactness : Prop

def CohomologySequenceClosed (X : Type) [TopologicalSpace X] [ComplexManifold X] (B : CanonicalBundle X) (C : CohomologySequence X B) : Prop :=
  C.exactness

theorem cohomology_closed_from_evidence (X : Type) [TopologicalSpace X] [ComplexManifold X] (B : CanonicalBundle X) (C : CohomologySequence X B) (E : C.exactness) :
  CohomologySequenceClosed X B C :=
  E

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
