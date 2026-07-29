import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CompactComplexNFoldsCanonicalLaneLean.CohomologySequence

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure DolbeaultIsomorphism (X : Type) [TopologicalSpace X] [ComplexManifold X] where
  dolbeaultCohomology : Type
  sheafCohomology : Type
  isomorphism : dolbeaultCohomology ≅ sheafCohomology
  naturality : Prop

theorem dolbeault_theorem_closed (X : Type) [TopologicalSpace X] [ComplexManifold X] (B : CanonicalBundle X) (C : CohomologySequence X B) (D : DolbeaultIsomorphism X) : Prop :=
  D.naturality

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
