import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure MilankovitchCyclesPackage where
  eccentricity : ℝ → ℝ
  obliquity : ℝ → ℝ
  precession : ℝ → ℝ
  insolationAt65N : ℝ → ℝ
  orbitalParametersPeriodic : Prop
  insolationResponseLinear : Prop
  eccentricityBounded : eccentricity 0 > 0.0 ∧ eccentricity 0 < 0.06
  obliquityBounded : obliquity 0 > 22.0 ∧ obliquity 0 < 25.0
  precessionBounded : precession 0 > 0.0 ∧ precession 0 < 2*π

structure MilankovitchCyclesEvidence (M : MilankovitchCyclesPackage) where
  orbitalParametersPeriodicClosed : M.orbitalParametersPeriodic
  insolationResponseLinearClosed : M.insolationResponseLinear

def MilankovitchCyclesClosed (M : MilankovitchCyclesPackage) : Prop :=
  M.orbitalParametersPeriodic ∧ M.insolationResponseLinear

theorem milankovitch_cycles_closed_from_evidence (M : MilankovitchCyclesPackage)
    (Ev : MilankovitchCyclesEvidence M) : MilankovitchCyclesClosed M := by
  exact And.intro Ev.orbitalParametersPeriodicClosed Ev.insolationResponseLinearClosed

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse