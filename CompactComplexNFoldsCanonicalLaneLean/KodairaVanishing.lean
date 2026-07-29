import canonicalLaneMathlib.AdmissibleClass
import CompactComplexNFoldsCanonicalLaneLean.CanonicalBundle

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure KodairaVanishingPackage (M : ComplexManifoldPackage) where
  positiveBundle : Type u
  cohomologyVanishing : Prop
  dimensionCondition : Prop

structure KodairaVanishingEvidence {M : ComplexManifoldPackage}
    (K : KodairaVanishingPackage M) where
  cohomologyVanishingClosed : K.cohomologyVanishing
  dimensionConditionClosed : K.dimensionCondition

def KodairaVanishingClosed {M : ComplexManifoldPackage}
    (K : KodairaVanishingPackage M) : Prop :=
  K.cohomologyVanishing ∧ K.dimensionCondition

theorem kodaira_vanishing_closed_from_evidence {M : ComplexManifoldPackage}
    (K : KodairaVanishingPackage M) (E : KodairaVanishingEvidence K) :
    KodairaVanishingClosed K := by
  exact And.intro E.cohomologyVanishingClosed E.dimensionConditionClosed

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse