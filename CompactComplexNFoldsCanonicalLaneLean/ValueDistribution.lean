import compactComplexNFoldsCanonicalLaneLean.AdmissibleClass

/-!
# Value Distribution Theory for Compact Complex N Folds
-/

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure ValueDistributionPackage where
  nevanlinnaTheory : Prop
  defectRelation : Prop
  coveringSurface : Prop
  ramificationIndex : Prop

def ValueDistributionClosed (V : ValueDistributionPackage) : Prop :=
  V.nevanlinnaTheory ∧ V.defectRelation ∧ V.coveringSurface ∧ V.ramificationIndex

theorem value_distribution_closed_from_evidence (V : ValueDistributionPackage) (h : ValueDistributionClosed V) :
    ValueDistributionClosed V := h

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse
