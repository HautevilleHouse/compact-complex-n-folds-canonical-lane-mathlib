import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure EntropyPackage {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) where
  entropyFunctional : Type u
  reducedVolume : Type v
  monotonicityFormula : Prop
  entropyLowerBound : Prop
  noLocalCollapsingInput : Prop

structure EntropyEvidence {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (Epkg : EntropyPackage S) where
  monotonicityFormulaClosed : Epkg.monotonicityFormula
  entropyLowerBoundClosed : Epkg.entropyLowerBound
  noLocalCollapsingInputClosed : Epkg.noLocalCollapsingInput

def EntropyClosed {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (Epkg : EntropyPackage S) : Prop :=
  Epkg.monotonicityFormula ∧ Epkg.entropyLowerBound ∧ Epkg.noLocalCollapsingInput

theorem entropy_closed_from_evidence
    {G : ComplexStructurePackage} {F : KahlerRicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (Epkg : EntropyPackage S)
    (E : EntropyEvidence Epkg) : EntropyClosed Epkg := by
  exact And.intro E.monotonicityFormulaClosed
    (And.intro E.entropyLowerBoundClosed E.noLocalCollapsingInputClosed)

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse