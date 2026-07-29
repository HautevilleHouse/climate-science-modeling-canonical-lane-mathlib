import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure AtmosphericLayers where
  layerCount : ℕ
  opticalDepth : List ℝ
  emissivityProfile : List ℝ

structure RadiativeTransferPackage (Atm : AtmosphericLayers) where
  surfaceTemperature : ℝ
  topOfAtmosphereFlux : ℝ

structure GreenhouseEffectEvidence {Atm : AtmosphericLayers}
    (R : RadiativeTransferPackage Atm) where
  layerCountPositive : Atm.layerCount > 0
  opticalDepthPositive : All (λ d => d > 0) Atm.opticalDepth
  emissivityProfileInUnit : All (λ e => e > 0 ∧ e < 1) Atm.emissivityProfile
  surfaceTemperatureClosed : R.surfaceTemperature > 250
  topOfAtmosphereFluxClosed : R.topOfAtmosphereFlux < 400

def GreenhouseEffectClosed {Atm : AtmosphericLayers}
    (R : RadiativeTransferPackage Atm) : Prop :=
  Atm.layerCount > 0 ∧ All (λ d => d > 0) Atm.opticalDepth ∧
  All (λ e => e > 0 ∧ e < 1) Atm.emissivityProfile ∧
  R.surfaceTemperature > 250 ∧ R.topOfAtmosphereFlux < 400

theorem greenhouse_effect_closed_from_evidence {Atm : AtmosphericLayers}
    (R : RadiativeTransferPackage Atm) (E : GreenhouseEffectEvidence R) :
    GreenhouseEffectClosed R := by
  exact And.intro E.layerCountPositive (And.intro E.opticalDepthPositive
    (And.intro E.emissivityProfileInUnit
      (And.intro E.surfaceTemperatureClosed E.topOfAtmosphereFluxClosed)))

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse