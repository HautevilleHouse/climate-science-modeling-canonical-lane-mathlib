import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure ClimateSensitivityPackage where
  forcingDoubleCO2 : ℝ
  feedbackStrength : ℝ
  equilibriumClimateSensitivity : ℝ
  radiativeForcingComputed : Prop
  feedbacksIncluded : Prop

structure ClimateSensitivityEvidence (C : ClimateSensitivityPackage) where
  radiativeForcingComputedClosed : C.radiativeForcingComputed
  feedbacksIncludedClosed : C.feedbacksIncluded

def ClimateSensitivityClosed (C : ClimateSensitivityPackage) : Prop :=
  C.radiativeForcingComputed ∧ C.feedbacksIncluded

theorem climate_sensitivity_closed_from_evidence (C : ClimateSensitivityPackage)
    (Ev : ClimateSensitivityEvidence C) : ClimateSensitivityClosed C :=
  And.intro Ev.radiativeForcingComputedClosed Ev.feedbacksIncludedClosed

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse