import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CompactComplexNFoldsCanonicalLaneLean.CanonicalBundle

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure HermitianMetric (X : Type) [TopologicalSpace X] [ComplexManifold X] where
  metric : X → PositiveDefiniteHermitianForm
  compatibility : Prop

structure StabilityCondition (X : Type) [TopologicalSpace X] [ComplexManifold X] (H : HermitianMetric X) where
  slopeStable : Prop
  hubbleInequality : Prop

def StableBundle (X : Type) [TopologicalSpace X] [ComplexManifold X] (H : HermitianMetric X) (S : StabilityCondition X H) : Prop :=
  S.slopeStable ∧ S.hubbleInequality

theorem stability_closed_from_evidence (X : Type) [TopologicalSpace X] [ComplexManifold X] (H : HermitianMetric X) (S : StabilityCondition X H) (E : S.slopeStable) (F : S.hubbleInequality) :
  StableBundle X H S :=
  And.intro E F

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
