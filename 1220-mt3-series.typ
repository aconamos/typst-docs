#set page(
  "us-letter",
  margin: 0.25in,
  columns: 2
)

#set text(
  size: 10pt // 8pt for final notesheets if you have to cram
)

// This show rule requires page breaks between every top-level header.
// This is not scuffed at all and I totally know what I am doing.
#show heading.where(level: 1): body => {
  // For the top-level header, escape the two-column restriction and align with the page's top and center.
  place(
    top + center,
    float: true,
    scope:"parent",
    body
  )
}

== Derivatives / Integrals
=== Exponentials
#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [$e$ form], [*$f(x)$*], [*$f'(x)$*], [*$integral f(x) d x$*]
  ),
  $$, $e^x$, $e^x$, $e^x + C$,
  $e^(ln(b) dot x)$, $b^x$, $ln(b) dot b^x$, $1/(ln(b)) dot b^x + C$,
  $$, $ln|x|^*$, $1/x$, $???$,
  $ln(x)/ln(b)$, $log_b (x)$, $1/(ln(b) dot x)$, $???$,
)
\*: $ln(x)$ has the same derivative; the absolute value is used to give a larger domain for the integral of $1/x$. 

=== Trig

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*$f(x)$*], [*$f'(x)$*], [*$integral f(x) d x$*]
  ),
  $tan(x)$, $sec^2(x)$, $-ln|cos(x)| + C$,
  $cot(x)$, $-csc^2(x)$, $ln|sin(x)| + C$,
  $sec(x)$, $sec(x) dot tan(x)$, $???$,
  $csc(x)$, $-cot(x) dot csc(x)$, $???$,
)

=== Some Rules
- $(f(x)/g(x))' = (f'(x)g(x) - f(x)g'(x))/(g(x))^2$

== Trig Identities
=== Pythagorean
- $sin^2(x) + cos^2(x) = 1$
- $1 + cot^2(x) = csc^2(x)$
- $tan^2(x) + 1 = sec^2(x)$

=== Euler's Formula (just derive them lol)
$e^(i theta) = cos(theta) + i sin(theta)$

=== Double-Angle
- $cos(2x) = cos^2(x) - sin^2(x)$ #linebreak()
$#h(34pt) = 2 dot cos^2(x) + 1$ #linebreak() 
$#h(34pt) = 1 - 2 dot sin^2(x)$
- $tan(2x)= (2tan(x))/(1 - tan^2(x))$

=== Power Reduction
- $sin^2(x) = (1 - cos(2x))/2$
- $cos^2(x) = (1 + cos(2x))/2$
- $tan^2(x) = (1 - cos(2x))/(1 + cos(2x))$

=== Angle-Sum
- $cos(x plus.minus y) = "???"$ #h(34pt) $sin(x plus.minus y) = "???"$
Hint: $e^(x + y) = e^x e^y$


#colbreak()

== Differential Equations
- General and specific solutions (initial conditions?)
=== Separable Equations
Form: $ y' = f(x) dot g(y) "; alternatively," (d y)/(d x) = f(x) dot g(y) $

Solve: $ integral (d y)/g(y) = integral f(x) d x $

=== First-order Linear
Form: $ y' + a(x) dot y = f(x) $

Solve: Multiply the whole equation by the integrating factor, $ u(x) = e^(integral a(x) d x) $

$ u dot y' + u' dot y = f(x) dot u(x) $

$ (u dot y)' = f(x) dot u(x) $

$ u dot y = integral f(x) dot u(x) d x $

$ y = (integral f(x) dot u(x) d x) / u $


#set page(
  "us-letter",
  margin: 0.25in,
  columns: 1
)

= Series
== Common Types
#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Type*], [*Form*], [*Formula (if applicable)*], [*Converges when*]
  ),
  "Geometric", $ sum_(n=0)^oo a r^n $, $ a/(1 - r) $, $ |r| < 1 $,
)

== Properties of Convergeence
Let $A tilde.equiv B$ indicate $A$ and $B$ have the same convergence behavior.
- $ sum_(n=a)^oo s_n tilde.equiv sum_(n=b)^oo s_n $
- $ a dot sum_(n=c)^oo s_n tilde.equiv b dot sum_(n=c)^oo s_n $

== Tests
// #block($ "Let " S_n " be " sum_(n=c)^oo a_n. $)
Let $a_n, b_n$ be sequences.
#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Test*], [*Conditions*], [*Result*]
  ),
  "Divergence", $ lim_(n->oo) a_n eq.not 0 $, $ sum_(n=c)^oo a_n "diverges" $,
  "Monotone Convergence Theorem", enum($ a_n "has upper (lower) bound" b "on" [m, oo) $, $ a_n "is monotonically increasing (decreasing) on" [m, oo)$), $ lim_(n->oo) a_n "converges" $ ,
  "Integral", enum($a_n >= 0 space forall space n in [c, oo)$, $a_n "is decreasing on" [c, oo)$, $ a_n "is integrable on" [c, oo) $), $ integral_c^oo a_n d n tilde.equiv sum_(n=c)^oo a_n $,
  "Comparison", enum($a_n >= b_n >= 0 space forall space n in [c, oo)$, $ sum_(n=c)^oo a_n "converges" $), $ sum_(n=c)^oo b_n "converges" $,
  "Limit Comparison Test", $ lim_(n->oo) a_n/b_n = L $, [$ L != 0 in RR =>sum_(n=c)^oo a_n tilde.equiv sum_(n=c)^oo b_n $ $ L = 0 => sum_(n=c)^oo a_n < sum_(n=c)^oo b_n $ $ L = oo => sum_(n=c)^oo a_n > sum_(n=c)^oo b_n $],
  "Ratio test", $ lim_(n->oo) |(a_(n+1))/a_n| = L $, [$ L > 1 => sum_(n=c)^oo a_n "diverges" $ $ L < 1 => sum_(n=c)^oo a_n "converges" $]
)
