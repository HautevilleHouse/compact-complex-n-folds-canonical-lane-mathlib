import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCLL

structure CanonicalBundlePackage (M : ComplexManifoldPackage) where
  canonicalBundle : Type u
  transitionFunctionsHolomorphic : Prop
  hodgeDecomposition : Prop
  chernClassesDefined : Prop
  kodairaVanishing : Prop

structure CanonicalBundleEvidence {M : ComplexManifoldPackage}
    (C : CanonicalBundlePackage M) where
  transitionFunctionsHolomorphicClosed : C.transitionFunctionsHolomorphic
  hodgeDecompositionClosed : C.hodgeDecomposition
  chernClassesDefinedClosed : C.chernClassesDefined
  kodairaVanishingClosed : C.kodairaVanishing

def CanonicalBundleClosed {M : ComplexManifoldPackage}
    (C : CanonicalBundlePackage M) : Prop :=
  C.transitionFunctionsHolomorphic ∧ C.hodgeDecomposition ∧
  C.chernClassesDefined ∧ C.kodairaVanishing

theorem canonical_bundle_closed_from_evidence
    {M : ComplexManifoldPackage} (C : CanonicalBundlePackage M)
    (E : CanonicalBundleEvidence C) : CanonicalBundleClosed C := by
  exact And.intro E.transitionFunctionsHolomorphicClosed
    (And.intro E.hodgeDecompositionClosed
      (And.intro E.chernClassesDefinedClosed E.kodairaVanishingClosed))

end CompactComplexNFoldsCLL
end HautevilleHouse
