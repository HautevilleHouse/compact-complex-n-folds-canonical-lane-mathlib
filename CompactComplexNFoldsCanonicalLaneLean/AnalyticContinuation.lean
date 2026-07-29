import compactComplexNFoldsCanonicalLaneLean.AdmissibleClass

/-!
# Analytic Continuation for Compact Complex N Folds
-/

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure AnalyticContinuationPackage where
  pathConnectedness : Prop
  monodromyTheorem : Prop
  uniquenessOfContinuation : Prop
  analyticGerm : Prop

def AnalyticContinuationClosed (A : AnalyticContinuationPackage) : Prop :=
  A.pathConnectedness ∧ A.monodromyTheorem ∧ A.uniquenessOfContinuation ∧ A.analyticGerm

theorem analytic_continuation_closed_from_evidence (A : AnalyticContinuationPackage) (h : AnalyticContinuationClosed A) :
    AnalyticContinuationClosed A := h

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
