import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure KahlerRicciFlowPDEPackage (G : ComplexStructurePackage) where
  timeParameter : Type u
  kahlerMetricAt : timeParameter -> Type v
  initialMetricMatches : Prop
  differentiableMetricFamily : Prop
  kahlerRicciFlowEquation : Prop
  maximalTimeInterval : Prop

structure KahlerRicciFlowPDEEvidence {G : ComplexStructurePackage}
    (F : KahlerRicciFlowPDEPackage G) where
  initialMetricMatchesClosed : F.initialMetricMatches
  differentiableMetricFamilyClosed : F.differentiableMetricFamily
  kahlerRicciFlowEquationClosed : F.kahlerRicciFlowEquation
  maximalTimeIntervalClosed : F.maximalTimeInterval

def KahlerRicciFlowPDEClosed {G : ComplexStructurePackage}
    (F : KahlerRicciFlowPDEPackage G) : Prop :=
  F.initialMetricMatches ∧
  F.differentiableMetricFamily ∧
  F.kahlerRicciFlowEquation ∧
  F.maximalTimeInterval

theorem kahler_ricci_flow_pde_closed_from_evidence
    {G : ComplexStructurePackage} (F : KahlerRicciFlowPDEPackage G)
    (E : KahlerRicciFlowPDEEvidence F) : KahlerRicciFlowPDEClosed F := by
  exact And.intro E.initialMetricMatchesClosed
    (And.intro E.differentiableMetricFamilyClosed
      (And.intro E.kahlerRicciFlowEquationClosed E.maximalTimeIntervalClosed))

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse