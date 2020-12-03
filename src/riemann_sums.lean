import algebra.big_operators.basic data.real.basic
import data.pnat.basic

noncomputable theory
open_locale big_operators
open set

variables (a b : ℝ)
-- Icc a b it is ordered by definition
variables (x : ℕ → Icc a b) (i : ℕ)
-- I need a partition (I can't spell)

-- -- Pₙ = (a, x₁, ..., xₙ₋₁, b) -- this is painful, very
-- def P := set(Icc a b)

-- --def Δx (i : ℕ) := 

-- variables (f : Icc a b → ℝ) (C : Icc a b)

-- #check Sup (Icc a b)

-- def M (i : ℕ)  := Sup P

-- -- I need a way to restrict my domain to a set from `x i` to `x (i-1)`
-- -- 

/-
So a partition is a sequence {x_0, x_1, x_2, ..., x_k} right? (a = x_0 and b = x_k)

So we can think of this as a function x(n) from {0, ..., k} to ℝ, such that

x(0) = a
x(n) < x(n+1)
x(k) = b
-/

structure partition (n : ℕ) (a b : ℝ) :=
-- The function from {0, ..., n} to ℝ
(f : ℕ → ℝ)
-- f(0) = a
(hf0 : f 0 = a)
-- f(n) = b
(hfn : f n = b)
-- f is monotonically increasing
(hfmono : ∀ k, k + 1 < n → f k < f (k + 1))

instance (n : ℕ) (a b : ℝ) : has_coe_to_fun (partition n a b) := ⟨_, λ p, p.f⟩

def Δx {n : ℕ} (a b : ℝ) (p : partition n a b) (i : ℕ) := p i - p (i-1)

-- So something like this should work?
variables (f : ℝ → ℝ)

def M (i : ℕ) (n : ℕ) (a b : ℝ) (p : partition n a b) := Sup (f '' (Icc (p i) (p (i - 1)))) 

def m (i : ℕ) (n : ℕ) (a b : ℝ) (p : partition n a b) := Inf (f '' (Icc (p i) (p (i - 1))))

/-- Lower Riemann Sums! -/

def lower_Riemann_sum (n : ℕ) (a b : ℝ) (p : partition n a b) (i : ℕ) := ∑ m i n  * Δx a b p i in range n 