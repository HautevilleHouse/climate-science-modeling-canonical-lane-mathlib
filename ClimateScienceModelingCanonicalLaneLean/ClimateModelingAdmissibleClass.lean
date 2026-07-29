import canonicalLaneMathlib.AdmissibleClass
import ClimateScienceModelingCanonicalLaneLean.EnergyBalanceModel
import ClimateScienceModelingCanonicalLaneLean.MilankovitchCycles
import ClimateScienceModelingCanonicalLaneLean.IsotopicPaleothermometry
import ClimateScienceModelingCanonicalLaneLean.DansgaardOeschgerEvents
import ClimateScienceModelingCanonicalLaneLean.ClimateSensitivity

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure ClimateAdmittedObject where
  energyBalanceClosed : EnergyBalanceModelClosed (⟨0,0,0,0,True,True⟩ : EnergyBalanceModelPackage)
  milankovitchClosed : MilankovitchCyclesClosed (⟨0,0,0,0,True,True⟩ : MilankovitchCyclesPackage)
  isotopicClosed : IsotopicPaleothermometryClosed (⟨(fun _ => 0),(fun _ => 0),(fun _ => 0),True,True⟩ : IsotopicPaleothermometryPackage)
  dansgaardOeschgerClosed : DansgaardOeschgerEventsClosed (⟨0,0,0,True,True⟩ : DansgaardOeschgerEventsPackage)
  climateSensitivityClosed : ClimateSensitivityClosed (⟨0,0,0,True,True⟩ : ClimateSensitivityPackage)

structure ClimateAdmissibleClass where
  object : ClimateAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def constrainedClimateClosure (A : ClimateAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_climate_endgame (A : ClimateAdmissibleClass) :
    constrainedClimateClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse