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

== Even/Odd Functions

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*$f(x)$*], [*$g(x)$*], [*$f(x)+g(x)$*], [*$f(x) dot g(x)$*]
  ),
  "E", "E", "E", "E",
  "O", "O", "O", "O",
  "O", "E", "N", "O"
)

== Difference of Powers
- $a^2 - b^2 = (a-b)(a+b)$
- $a^3 - b^3 = (a-b)(a^3 + a^2b + a b^2 +b^3)$
- $a^4 - b^4 = (a-b)(a^4 + a^3b + a^2b^2 + a b^3 + b^4)$

== Exponents/Logarithms
=== Log Rules
1. $log_b (b^x) = x$ #h(34pt) $b^(log_b (x)) = x$
2. $log_b (x dot y) = log_b(x) + log_b(y)$
3. $log_b (x^n) = n dot log_b (x)$
5. $(log_a (x)) / (log_a (x)) = log_b (x)$

== Hyperbolic Trig
=== Definitions
- $sinh(x) = (e^x - e^(-x))/2$ #h(34pt) $sinh^(-1)(x) = ln(x + sqrt(x^2 + 1))$ 
- $cosh(x) = (e^x + e^(-x))/2$ #h(33pt) $cosh^(-1)(x) = ln(x + sqrt(x^2 -1))$

=== Identities
- Pythagorean: $cosh^2(t) - sinh^2(t) = 1$ \
 #h(59pt) $1 - tanh^2(t) = sech^2(t)$
- Double-angle: $sinh(2t) = 2 sinh(t) cosh(t)$ \
 #h(59pt) $cosh(2t) = cosh^2(t) + sinh^2(t)$


=== Derivatives
#table(
  columns: (auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*$f(x)$*], [*$f'(x)$*]
  ),
  $sech(t)$, $-sech(t)tanh(t)$,
  $csch(t)$, $-csch(t)coth(t)$,

)

=== Note on deriving formulas:
When encountering a $plus.minus$ inside of the logarithm, it is the case for the two inverse hyp. trig functions this happens to that the two forms are equivalent. Multiplying by the conjugate and recognizing the exponent $-1$ can be put into the expression using log rules will show this.

== Various tools that may be needed:
- quadratic equation
- triangle method + implicit differentiation
- log rules, exponent rules
- go slow on derivatives, _*especially*_ those with quotients!
- logarithmic differentiation might be better for the exponential function
- can you differentiate any inverse trig function?
- the tanh inverse and derivative