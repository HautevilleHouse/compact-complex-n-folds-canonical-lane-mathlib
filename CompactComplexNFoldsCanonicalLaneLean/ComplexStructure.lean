import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCLL

structure ComplexManifoldPackage where
  baseManifold : Type u
  topology : TopologicalSpace baseManifold
  complexStructureSheaf : Type v
  holomorphicCharts : Prop
  complexDimension : Nat
  hausdorffProperty : Prop
  secondCountable : Prop

structure ComplexManifoldEvidence (M : ComplexManifoldPackage) where
  holomorphicChartsClosed : M.holomorphicCharts
  complexDimensionClosed : M.complexDimension = 1
  hausdorffPropertyClosed : M.hausdorffProperty
  secondCountableClosed : M.secondCountable

def ComplexManifoldClosed (M : ComplexManifoldPackage) : Prop :=
  M.holomorphicCharts ∧ M.complexDimension = 1 ∧ M.hausdorffProperty ∧ M.secondCountable

theorem complex_manifold_closed_from_evidence (M : ComplexManifoldPackage)
    (E : ComplexManifoldEvidence M) : ComplexManifoldClosed M := by
  exact And.intro E.holomorphicChartsClosed
    (And.intro E.complexDimensionClosed
      (And.intro E.hausdorffPropertyClosed E.secondCountableClosed))

end CompactComplexNFoldsCLL
end HautevilleHouse
