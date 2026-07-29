import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure EnergyBalanceModel where
  solarConstant : ℝ
  albedo : ℝ
  emissivity : ℝ
  heatCapacity : ℝ
  temperature : ℝ
  radiativeEquilibriumTemperature : ℝ
  steadyStateCondition : Prop
  equilibriumExists : Prop

structure EnergyBalanceEvidence (M : EnergyBalanceModel) where
  radiativeEquilibriumTemperatureClosed : M.radiativeEquilibriumTemperature = ((1 - M.albedo) * M.solarConstant / (4 * M.emissivity * 5.67e-8))^(1/4)
  steadyStateConditionClosed : M.steadyStateCondition
  equilibriumExistsClosed : M.equilibriumExists

def EnergyBalanceModelClosed (M : EnergyBalanceModel) : Prop :=
  M.radiativeEquilibriumTemperature = ((1 - M.albedo) * M.solarConstant / (4 * M.emissivity * 5.67e-8))^(1/4) ∧
  M.steadyStateCondition ∧
  M.equilibriumExists

theorem energy_balance_closed_from_evidence (M : EnergyBalanceModel) (E : EnergyBalanceEvidence M) : EnergyBalanceModelClosed M :=
  by
    exact And.intro E.radiativeEquilibriumTemperatureClosed
      (And.intro E.steadyStateConditionClosed E.equilibriumExistsClosed)

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse