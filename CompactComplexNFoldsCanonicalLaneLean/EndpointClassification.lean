import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompactComplexNFoldsCanonicalLaneLean

structure EndpointClassificationPackage {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (Z : GeometrizationPackage U) where
  targetManifold : Type u
  targetTopology : TopologicalSpace targetManifold
  simplyConnectedClosedNManifold : Prop
  sphereEndpoint : ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere targetManifold (Nat.succ (Nat.succ 1))
  endpointMatchesCSCStatement : Prop

structure EndpointClassificationEvidence {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    (Epkg2 : EndpointClassificationPackage Z) where
  simplyConnectedClosedNManifoldClosed : Epkg2.simplyConnectedClosedNManifold
  endpointMatchesCSCStatementClosed : Epkg2.endpointMatchesCSCStatement

def EndpointClassificationClosed {G : ComplexStructurePackage}
    {F : KahlerRicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : EntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    (Epkg2 : EndpointClassificationPackage Z) : Prop :=
  Epkg2.simplyConnectedClosedNManifold ∧
  Epkg2.endpointMatchesCSCStatement

theorem endpoint_classification_closed_from_evidence
    {G : ComplexStructurePackage} {F : KahlerRicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : EntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q} {U : SurgeryPackage C}
    {Z : GeometrizationPackage U} (Epkg2 : EndpointClassificationPackage Z)
    (E : EndpointClassificationEvidence Epkg2) : EndpointClassificationClosed Epkg2 := by
  exact And.intro E.simplyConnectedClosedNManifoldClosed
    E.endpointMatchesCSCStatementClosed

end CompactComplexNFoldsCanonicalLaneLean
end HautevilleHouse