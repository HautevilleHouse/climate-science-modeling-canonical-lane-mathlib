import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure IsotopicPaleothermometryPackage where
  delta18O : ℝ
  deltaD : ℝ
  temperatureProxy : ℝ
  calibrationEquation : Prop
  proxyDataAvailable : Prop
  calibrationValid : calibrationEquation → proxyDataAvailable → temperatureProxy > 200

structure IsotopicPaleothermometryEvidence (I : IsotopicPaleothermometryPackage) where
  calibrationEquationClosed : I.calibrationEquation
  proxyDataAvailableClosed : I.proxyDataAvailable

def IsotopicPaleothermometryClosed (I : IsotopicPaleothermometryPackage) : Prop :=
  I.calibrationEquation ∧ I.proxyDataAvailable

theorem isotopic_paleothermometry_closed_from_evidence (I : IsotopicPaleothermometryPackage)
    (Ev : IsotopicPaleothermometryEvidence I) : IsotopicPaleothermometryClosed I := by
  exact And.intro Ev.calibrationEquationClosed Ev.proxyDataAvailableClosed

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse