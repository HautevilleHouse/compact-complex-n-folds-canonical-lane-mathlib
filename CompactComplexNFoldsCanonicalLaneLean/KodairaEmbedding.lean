import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCLL

structure KodairaEmbeddingPackage (M : ComplexManifoldPackage)
    (C : CanonicalBundlePackage M) where
  ampleCondition : Prop
  pluricanonicalSections : Prop
  projectiveEmbeddingObtained : Prop
  dimensionConstraint : M.complexDimension = 1

structure KodairaEmbeddingEvidence {M : ComplexManifoldPackage}
    {C : CanonicalBundlePackage M} (K : KodairaEmbeddingPackage M C) where
  ampleConditionClosed : K.ampleCondition
  pluricanonicalSectionsClosed : K.pluricanonicalSections
  projectiveEmbeddingObtainedClosed : K.projectiveEmbeddingObtained

def KodairaEmbeddingClosed {M : ComplexManifoldPackage}
    {C : CanonicalBundlePackage M} (K : KodairaEmbeddingPackage M C) : Prop :=
  K.ampleCondition ∧ K.pluricanonicalSections ∧ K.projectiveEmbeddingObtained ∧
  K.dimensionConstraint

theorem kodaira_embedding_closed_from_evidence
    {M : ComplexManifoldPackage} {C : CanonicalBundlePackage M}
    (K : KodairaEmbeddingPackage M C)
    (E : KodairaEmbeddingEvidence K) : KodairaEmbeddingClosed K := by
  have hdim : K.dimensionConstraint := K.dimensionConstraint
  exact And.intro E.ampleConditionClosed
    (And.intro E.pluricanonicalSectionsClosed
      (And.intro E.projectiveEmbeddingObtainedClosed hdim))

end CompactComplexNFoldsCLL
end HautevilleHouse
