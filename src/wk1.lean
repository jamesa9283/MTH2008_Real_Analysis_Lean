import data.real.basic

variables (x y : ℝ)

/- 


-/


def anal.max (S : set ℝ) := (∃ x ∈ S, ∀ y ∈ S, y ≤ x) 

-- my problem here is that `x` doesn't necessarily have to be in T
-- with normal infimums / supremums (?) Is this a lean quirk?
--def anal.sup (T : set ℝ) := (∃ x ∈ T, ∀ y ∈ T, y ≤ x) 
--    ∧ (∃ t ∈ ℝ, ∀ y ∈ T, y ≤ t, x ≤ t)
 
def anal.inf (T : set ℝ) := (∃ x, ∀ y ∈ T, x ≤ y)

def anal.bounded_below (S : set ℝ) := (∃ a, ∀ x ∈ S, a ≤ x)

variables (S : set ℝ)

#print anal.bounded_below
-- anal.bounded_below is a prop, drat.

def anal.sup (S : set ℝ) := (∃ a, ∀ s ∈ (anal.bounded_below S), s ≤ a) ∧ (anal.bounded_below S)

def anal.bounded_above (T: set ℝ) := (∃ b, ∀ x ∈ T, x ≤ b)
