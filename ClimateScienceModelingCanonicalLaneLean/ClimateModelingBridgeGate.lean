import ClimateScienceModelingCanonicalLaneLean.ClimateModelingAdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

def bridgeClosed (A : ClimateAdmissibleClass) : Prop :=
  (A.object.energyBalanceClosed ∧ A.object.milankovitchClosed ∧
   A.object.isotopicClosed ∧ A.object.dansgaardOeschgerClosed ∧
   A.object.climateSensitivityClosed)

def gateClosed (A : ClimateAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : ClimateAdmissibleClass) :
    bridgeClosed A :=
  And.intro A.object.energyBalanceClosed
    (And.intro A.object.milankovitchClosed
      (And.intro A.object.isotopicClosed
        (And.intro A.object.dansgaardOeschgerClosed
          A.object.climateSensitivityClosed)))

theorem gate_from_admissible_class (A : ClimateAdmissibleClass) :
    gateClosed A :=
  A.gateWitness

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse