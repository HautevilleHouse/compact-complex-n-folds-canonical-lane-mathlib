import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure ComplexManifoldPackage where
  underlyingRealManifold : Type u
  complexStructure : underlyingRealManifold → Type v
  holomorphicCharts : Prop
  transitionFunctionsHolomorphic : Prop
  complexDimensionN : ℕ
  compactWithoutBoundary : Prop
  hausdorffSecondCountable : Prop

structure ComplexManifoldEvidence (M : ComplexManifoldPackage) where
  holomorphicChartsClosed : M.holomorphicCharts
  transitionFunctionsHolomorphicClosed : M.transitionFunctionsHolomorphic
  complexDimensionNCorrect : M.complexDimensionN = 1
  compactWithoutBoundaryClosed : M.compactWithoutBoundary
  hausdorffSecondCountableClosed : M.hausdorffSecondCountable

def ComplexManifoldClosed (M : ComplexManifoldPackage) : Prop :=
  M.holomorphicCharts ∧ M.transitionFunctionsHolomorphic ∧
  M.compactWithoutBoundary ∧ M.hausdorffSecondCountable

theorem complex_manifold_closed_from_evidence (M : ComplexManifoldPackage)
    (E : ComplexManifoldEvidence M) : ComplexManifoldClosed M := by
  exact And.intro E.holomorphicChartsClosed
    (And.intro E.transitionFunctionsHolomorphicClosed
      (And.intro E.compactWithoutBoundaryClosed E.hausdorffSecondCountableClosed))

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
