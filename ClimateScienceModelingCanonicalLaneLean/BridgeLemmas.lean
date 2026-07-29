import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClimateWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse