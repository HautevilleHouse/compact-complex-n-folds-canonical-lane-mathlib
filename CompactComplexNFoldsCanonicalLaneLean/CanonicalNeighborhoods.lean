import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure CanonicalNeighborhoodsPackage {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    (Q : SingularityModelsPackage N) where
  highCurvatureRegionCovered : Prop
  neckCapDecomposition : Prop
  scaleCompatibility : Prop
  persistenceUnderFlow : Prop

structure CanonicalNeighborhoodsEvidence {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} (C : CanonicalNeighborhoodsPackage Q) where
  highCurvatureRegionCoveredClosed : C.highCurvatureRegionCovered
  neckCapDecompositionClosed : C.neckCapDecomposition
  scaleCompatibilityClosed : C.scaleCompatibility
  persistenceUnderFlowClosed : C.persistenceUnderFlow

def CanonicalNeighborhoodsClosed {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} (C : CanonicalNeighborhoodsPackage Q) : Prop :=
  C.highCurvatureRegionCovered ∧ C.neckCapDecomposition ∧
  C.scaleCompatibility ∧ C.persistenceUnderFlow

theorem canonical_neighborhoods_closed_from_evidence
    {G : ComplexStructurePackage} {F : KahlerRicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : EntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    (C : CanonicalNeighborhoodsPackage Q) (E : CanonicalNeighborhoodsEvidence C) :
    CanonicalNeighborhoodsClosed C := by
  exact And.intro E.highCurvatureRegionCoveredClosed
    (And.intro E.neckCapDecompositionClosed
      (And.intro E.scaleCompatibilityClosed E.persistenceUnderFlowClosed))

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse