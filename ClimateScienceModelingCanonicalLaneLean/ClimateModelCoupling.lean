import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure CoupledModel where
  atmosphereComponent : Prop
  oceanComponent : Prop
  seaIceComponent : Prop
  landSurfaceComponent : Prop
  couplingSchemeConsistent : Prop
  conservationLaws : Prop
  numericalStability : Prop

structure CoupledModelEvidence (C : CoupledModel) where
  couplingSchemeConsistentClosed : C.couplingSchemeConsistent
  conservationLawsClosed : C.conservationLaws
  numericalStabilityClosed : C.numericalStability

def CoupledModelClosed (C : CoupledModel) : Prop :=
  C.couplingSchemeConsistent ∧ C.conservationLaws ∧ C.numericalStability

theorem coupled_model_closed_from_evidence (C : CoupledModel) (E : CoupledModelEvidence C) : CoupledModelClosed C :=
  by
    exact And.intro E.couplingSchemeConsistentClosed
      (And.intro E.conservationLawsClosed E.numericalStabilityClosed)

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse