import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure PaleoclimateProxy where
  proxyType : String
  resolutionYears : ℝ
  coverageYears : ℕ × ℕ
  calibrationEquation : String

structure PaleoclimateProxyAdmissible (P : PaleoclimateProxy) : Prop :=
  resolutionFine : P.resolutionYears < 1000
  coverageValid : P.coverageYears.1 < P.coverageYears.2
  calibrationKnown : P.calibrationEquation ≠ ""
  proxyTypeValid : P.proxyType ∈ {"iceCore", "sediment", "speleothem", "coral", "treeRing"}

def PaleoclimateProxyAdmissibleClosed (P : PaleoclimateProxy) : Prop :=
  P.resolutionYears < 1000 ∧ P.coverageYears.1 < P.coverageYears.2 ∧
  P.calibrationEquation ≠ "" ∧ P.proxyType ∈ {"iceCore", "sediment", "speleothem", "coral", "treeRing"}

theorem paleoclimate_proxy_admissible_closed (P : PaleoclimateProxy)
    (A : PaleoclimateProxyAdmissible P) : PaleoclimateProxyAdmissibleClosed P := by
  exact And.intro A.resolutionFine (And.intro A.coverageValid
    (And.intro A.calibrationKnown A.proxyTypeValid))

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse