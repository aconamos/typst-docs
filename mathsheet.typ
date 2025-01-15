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

=== Double-Angle
- $sin(2x) = 2 dot sin(x) dot cos(x)$
- $cos(2x) = cos^2(x) - sin^2(x)$ #linebreak()
$#h(34pt) = 2 dot cos^2(x) + 1$ #linebreak() 
$#h(34pt) = 1 - 2 dot sin^2(x)$
- $tan(2x)= (2tan(x))/(1 - tan^2(x))$

=== Power Reduction
- $sin^2(x) = (1 - cos(2x))/2$
- $cos^2(x) = (1 + cos(2x))/2$
- $tan^2(x) = (1 - cos(2x))/(1 + cos(2x))$




#colbreak()

== Even/Odd Functions

Let $E$ denote even, $O$ denote odd, $N$ denote neither.

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
#super("in case you have to prove the power rule")
- $a^2 - b^2 = (a-b)(a+b)$
- $a^3 - b^3 = (a-b)(a^3 + a^2b + a b^2 +b^3)$
- $a^4 - b^4 = (a-b)(a^4 + a^3b + a^2b^2 + a b^3 + b^4)$
and so on...

== Exponents/Logarithms
=== Log Rules
1. $log_b (b^x) = x$ #h(34pt) $b^(log_b (x)) = x$
2. $log_b (x dot y) = log_b(x) + log_b(y)$
3. $log_b (x^n) = n dot log_b (x)$
5. $(log_a (x)) / (log_a (x)) = log_b (x)$

=== Exponential Form
Any exponential function of the form $b^x$ can be written (using exponent rules) as $e^(k x)$, where $k$ is a constant. This leads to the general exponential form:
$A e^(k t)$. 

=== Exponential Fitting
Given any two points, $a = (x, y)$ and $b = (x, y)$, we can fit a unique exponential function to them.
Let $f(x) = A e^(k t)$. 

- $f(a_x) = A e^(k a_x) = a_y$.
- $f(b_x) = A e^(k b_x) = b_y$.
- $(A e^(k b_x))/(A e^(k a_x)) = b_y/a_y = e^(k (b_x - a_x))$
- $ln(b_y/a_y) = k(b_x - a_x)$
- Now we can isolate $k$:
- $ln(b_y/a_y)/(b_x-a_x) = k$
- With this $k$, we can plug it back in to either of the original equations and acquire our $A$, or our principal.
- $A e^(k a_x) = a_y$
- $A = (a_y)/(e^(k a_x))$