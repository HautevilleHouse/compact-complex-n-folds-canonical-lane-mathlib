import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure GeometrizationPackage {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (U : SurgeryPackage C) where
  finiteExtinctionAlternative : Prop
  thickThinDecomposition : Prop
  geometrizedPiecesClassified : Prop
  simplyConnectedCaseForcesSpherePiece : Prop

structure GeometrizationEvidence {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (Z : GeometrizationPackage U) where
  finiteExtinctionAlternativeClosed : Z.finiteExtinctionAlternative
  thickThinDecompositionClosed : Z.thickThinDecomposition
  geometrizedPiecesClassifiedClosed : Z.geometrizedPiecesClassified
  simplyConnectedCaseForcesSpherePieceClosed : Z.simplyConnectedCaseForcesSpherePiece

def GeometrizationClosed {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (Z : GeometrizationPackage U) : Prop :=
  Z.finiteExtinctionAlternative ∧ Z.thickThinDecomposition ∧
  Z.geometrizedPiecesClassified ∧ Z.simplyConnectedCaseForcesSpherePiece

theorem geometrization_closed_from_evidence
    {G : ComplexStructurePackage} {F : KahlerRicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : EntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q} {U : SurgeryPackage C}
    (Z : GeometrizationPackage U) (E : GeometrizationEvidence Z) :
    GeometrizationClosed Z := by
  exact And.intro E.finiteExtinctionAlternativeClosed
    (And.intro E.thickThinDecompositionClosed
      (And.intro E.geometrizedPiecesClassifiedClosed
        E.simplyConnectedCaseForcesSpherePieceClosed))

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse