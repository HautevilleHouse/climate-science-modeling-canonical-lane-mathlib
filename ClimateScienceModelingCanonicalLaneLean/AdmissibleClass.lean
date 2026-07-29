import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure AdmissibleClass where
  object : ClimateAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ClimateWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse