import canonicalLaneMathlib.AdmissibleClass
import CompactComplexNFoldsCanonicalLaneLean.HodgeTheory

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure CalabiConjecturePackage (M : ComplexManifoldPackage) (K : KahlerPackage M) where
  ricciForm : Type u
  uniqueKahlerMetric : Prop
  existenceProof : Prop

structure CalabiConjectureEvidence {M : ComplexManifoldPackage}
    {K : KahlerPackage M} (C : CalabiConjecturePackage M K) where
  uniqueKahlerMetricClosed : C.uniqueKahlerMetric
  existenceProofClosed : C.existenceProof

def CalabiConjectureClosed {M : ComplexManifoldPackage}
    {K : KahlerPackage M} (C : CalabiConjecturePackage M K) : Prop :=
  C.uniqueKahlerMetric ∧ C.existenceProof

theorem calabi_conjecture_closed_from_evidence {M : ComplexManifoldPackage}
    {K : KahlerPackage M} (C : CalabiConjecturePackage M K)
    (E : CalabiConjectureEvidence C) : CalabiConjectureClosed C := by
  exact And.intro E.uniqueKahlerMetricClosed E.existenceProofClosed

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse