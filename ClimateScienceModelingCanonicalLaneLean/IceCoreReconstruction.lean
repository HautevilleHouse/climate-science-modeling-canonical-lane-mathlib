import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure IceCoreReconstructionPackage where
  accumulationRate : Prop
  gasTrappingProcess : Prop
  ageDepthModel : Prop
  dustConcentration : Prop
  isotopicRecord : Prop

structure IceCoreReconstructionEvidence (I : IceCoreReconstructionPackage) where
  accumulationRateClosed : I.accumulationRate
  gasTrappingProcessClosed : I.gasTrappingProcess
  ageDepthModelClosed : I.ageDepthModel
  dustConcentrationClosed : I.dustConcentration
  isotopicRecordClosed : I.isotopicRecord

def IceCoreReconstructionClosed (I : IceCoreReconstructionPackage) : Prop :=
  I.accumulationRate ∧ I.gasTrappingProcess ∧
  I.ageDepthModel ∧ I.dustConcentration ∧ I.isotopicRecord

theorem ice_core_reconstruction_closed_from_evidence
    (I : IceCoreReconstructionPackage) (E : IceCoreReconstructionEvidence I) :
    IceCoreReconstructionClosed I := by
  exact And.intro E.accumulationRateClosed
    (And.intro E.gasTrappingProcessClosed
      (And.intro E.ageDepthModelClosed
        (And.intro E.dustConcentrationClosed E.isotopicRecordClosed)))

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse