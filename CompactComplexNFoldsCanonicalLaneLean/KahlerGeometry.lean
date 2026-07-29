import canonicalLaneMathlib.AdmissibleClass
import CompactComplexNFoldsCanonicalLaneLean.ComplexManifold

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure KahlerPackage (M : ComplexManifoldPackage) where
  kahlerMetric : Type u
  closedTwoForm : Prop
  positivity : Prop
  leviCivitaCompatible : Prop

structure KahlerEvidence {M : ComplexManifoldPackage} (K : KahlerPackage M) where
  closedTwoFormClosed : K.closedTwoForm
  positivityClosed : K.positivity
  leviCivitaCompatibleClosed : K.leviCivitaCompatible

def KahlerClosed {M : ComplexManifoldPackage} (K : KahlerPackage M) : Prop :=
  K.closedTwoForm ∧ K.positivity ∧ K.leviCivitaCompatible

theorem kahler_closed_from_evidence {M : ComplexManifoldPackage}
    (K : KahlerPackage M) (E : KahlerEvidence K) : KahlerClosed K := by
  exact And.intro E.closedTwoFormClosed
    (And.intro E.positivityClosed E.leviCivitaCompatibleClosed)

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse