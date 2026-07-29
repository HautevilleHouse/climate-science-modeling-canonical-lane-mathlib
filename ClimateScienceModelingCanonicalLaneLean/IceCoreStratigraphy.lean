import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceModelingCanonicalLaneLean

structure IceCoreStratigraphy where
  depthAgeRelationship : ℝ → ℝ
  accumulationRate : ℝ
  annualLayerCount : ℕ
  layerPreservation : Prop
  ageModelAccuracy : Prop
  layerCountConsistent : Prop

structure IceCoreEvidence (I : IceCoreStratigraphy) where
  layerPreservationClosed : I.layerPreservation
  ageModelAccuracyClosed : I.ageModelAccuracy
  layerCountConsistentClosed : I.layerCountConsistent

def IceCoreStratigraphyClosed (I : IceCoreStratigraphy) : Prop :=
  I.layerPreservation ∧ I.ageModelAccuracy ∧ I.layerCountConsistent

theorem ice_core_stratigraphy_closed_from_evidence (I : IceCoreStratigraphy) (E : IceCoreEvidence I) : IceCoreStratigraphyClosed I :=
  by
    exact And.intro E.layerPreservationClosed
      (And.intro E.ageModelAccuracyClosed E.layerCountConsistentClosed)

end ClimateScienceModelingCanonicalLaneLean
end HautevilleHouse