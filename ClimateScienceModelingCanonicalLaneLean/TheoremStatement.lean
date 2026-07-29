import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure ClimateAdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  climateModelValid : Prop
  milankovitchCycles : Prop
  dansgaardOeschgerEvents : Prop
  isotopicPaleothermometry : Prop
  energyBalanceModel : Prop
  conclusion : climateModelValid ∧ milankovitchCycles ∧ dansgaardOeschgerEvents ∧ isotopicPaleothermometry ∧ energyBalanceModel

def ClimateWitnessClosed (O : ClimateAdmittedObject) : Prop :=
  O.conclusion

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse