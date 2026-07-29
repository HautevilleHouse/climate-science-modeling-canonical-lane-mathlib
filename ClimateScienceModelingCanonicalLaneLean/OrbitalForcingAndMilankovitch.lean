import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure MilankovitchCyclesPackage where
  eccentricityVariations : Prop
  obliquityCycles : Prop
  precessionModulation : Prop
  insolationAnomalies : Prop

structure MilankovitchEvidence (M : MilankovitchCyclesPackage) where
  eccentricityVariationsClosed : M.eccentricityVariations
  obliquityCyclesClosed : M.obliquityCycles
  precessionModulationClosed : M.precessionModulation
  insolationAnomaliesClosed : M.insolationAnomalies

def MilankovitchCyclesClosed (M : MilankovitchCyclesPackage) : Prop :=
  M.eccentricityVariations ∧ M.obliquityCycles ∧
  M.precessionModulation ∧ M.insolationAnomalies

theorem milankovitch_cycles_closed_from_evidence
    (M : MilankovitchCyclesPackage) (E : MilankovitchEvidence M) :
    MilankovitchCyclesClosed M := by
  exact And.intro E.eccentricityVariationsClosed
    (And.intro E.obliquityCyclesClosed
      (And.intro E.precessionModulationClosed E.insolationAnomaliesClosed))

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse