import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure CalabiYauMetricPackage (M : ComplexManifoldPackage) where
  kaehlerMetric : Type u
  ricciFlatCondition : Prop
  firstChernClassVanishes : Prop
  kaehlerMetricClosed : Prop
  ricciFlatClosed : ricciFlatCondition
  firstChernClassVanishesClosed : firstChernClassVanishes

structure CalabiYauMetricEvidence {M : ComplexManifoldPackage}
    (C : CalabiYauMetricPackage M) where
  ricciFlatClosed : C.ricciFlatCondition
  firstChernClassVanishesClosed : C.firstChernClassVanishes

def CalabiYauMetricClosed {M : ComplexManifoldPackage}
    (C : CalabiYauMetricPackage M) : Prop :=
  C.ricciFlatCondition ∧ C.firstChernClassVanishes

theorem calabi_yau_metric_closed_from_evidence {M : ComplexManifoldPackage}
    (C : CalabiYauMetricPackage M) (E : CalabiYauMetricEvidence C) :
    CalabiYauMetricClosed C := by
  exact And.intro E.ricciFlatClosed E.firstChernClassVanishesClosed

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
