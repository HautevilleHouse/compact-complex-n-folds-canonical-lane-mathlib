import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure MoriMinimalModelPackage (M : ComplexManifoldPackage) where
  canonicalBundle : Type u
  kodairaDimension : ℤ
  minimalModelExists : Prop
  birationalEquivalenceClass : Prop
  minimalModelExistsClosed : minimalModelExists
  birationalEquivalenceClassClosed : birationalEquivalenceClass

structure MoriMinimalModelEvidence {M : ComplexManifoldPackage}
    (MM : MoriMinimalModelPackage M) where
  minimalModelExistsClosed : MM.minimalModelExists
  birationalEquivalenceClassClosed : MM.birationalEquivalenceClass

def MoriMinimalModelClosed {M : ComplexManifoldPackage}
    (MM : MoriMinimalModelPackage M) : Prop :=
  MM.minimalModelExists ∧ MM.birationalEquivalenceClass

theorem mori_minimal_model_closed_from_evidence {M : ComplexManifoldPackage}
    (MM : MoriMinimalModelPackage M) (E : MoriMinimalModelEvidence MM) :
    MoriMinimalModelClosed MM := by
  exact And.intro E.minimalModelExistsClosed E.birationalEquivalenceClassClosed

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
