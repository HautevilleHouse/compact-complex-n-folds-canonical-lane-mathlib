import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCLL

def ConstrainedCompactComplexNFoldsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_compact_complex_n_folds_endgame (A : AdmissibleClass) :
    ConstrainedCompactComplexNFoldsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CompactComplexNFoldsCLL
end HautevilleHouse
