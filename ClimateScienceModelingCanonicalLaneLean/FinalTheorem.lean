import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClimateScienceModelingCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ClimateScienceModelingCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

def ConstrainedClimateClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_climate_endgame (A : AdmissibleClass) :
    ConstrainedClimateClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse