import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure DansgaardOeschgerEventsPackage where
  eventTiming : List ℝ
  temperatureJump : ℝ
  interstadialDuration : ℝ
  stadialDuration : ℝ
  recurrencePattern : Prop
  thresholdCrossingModel : Prop
  positiveTemperatureJump : temperatureJump > 1.0
  positiveInterstadialDuration : interstadialDuration > 0.0
  positiveStadialDuration : stadialDuration > 0.0

structure DansgaardOeschgerEventsEvidence (D : DansgaardOeschgerEventsPackage) where
  recurrencePatternClosed : D.recurrencePattern
  thresholdCrossingModelClosed : D.thresholdCrossingModel

def DansgaardOeschgerEventsClosed (D : DansgaardOeschgerEventsPackage) : Prop :=
  D.recurrencePattern ∧ D.thresholdCrossingModel

theorem dansgaard_oeschger_events_closed_from_evidence (D : DansgaardOeschgerEventsPackage)
    (Ev : DansgaardOeschgerEventsEvidence D) : DansgaardOeschgerEventsClosed D := by
  exact And.intro Ev.recurrencePatternClosed Ev.thresholdCrossingModelClosed

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse