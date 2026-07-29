import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure ComplexManifoldPackage where
  carrier : Type u
  complexStructure : Carrier → Type v
  openCover : List (Carrier → Prop)
  holomorphicPatches : Prop
  hausdorffSecondCountable : Prop
  compact : Prop
  dimensionN : ℕ
  dimensionNPos : dimensionN > 0

structure ComplexManifoldEvidence (M : ComplexManifoldPackage) where
  holomorphicPatchesClosed : M.holomorphicPatches
  hausdorffSecondCountableClosed : M.hausdorffSecondCountable
  compactClosed : M.compact

def ComplexManifoldClosed (M : ComplexManifoldPackage) : Prop :=
  M.holomorphicPatches ∧ M.hausdorffSecondCountable ∧ M.compact

theorem complex_manifold_closed_from_evidence (M : ComplexManifoldPackage)
    (E : ComplexManifoldEvidence M) : ComplexManifoldClosed M := by
  exact And.intro E.holomorphicPatchesClosed
    (And.intro E.hausdorffSecondCountableClosed E.compactClosed)

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse