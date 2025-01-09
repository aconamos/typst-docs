#set page(
  "us-letter",
  margin: 0.25in,
  columns: 2
)

#set text(
  size: 8pt
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

== Limits
=== Main Limit Theorem
1. $lim_(x->c) k=k$
2. $lim_(x->c) x=c$
3. $lim_(x->c) k dot f(x) = k dot lim_(x->c) f(x)$
4. $lim_(x->c) f(x) plus.minus g(x) = lim_(x->c) f(x) plus.minus lim_(x->c) g(x)$
5. $lim_(x->c) f(x) dot g(x) = lim_(x->c) f(x) dot lim_(x->c) g(x)$
6. $lim_(x->c) f(x)/g(x) = (lim_(x->c)f(x))/(lim_(x->c)g(x)) "where" g(x) != 0$

=== Trig Limits
Let $f(t)$ be one of ${sin(t), cos(t), tan(t), cot(t), sec(t), csc(t)}$. 
#linebreak()
Then $lim_(t->c) f(t) = f(c)$.

=== Asshole Limits
- $lim_(t->0) sin(t)/t = 1$
- $lim_(t->0) (1-cos(t))/t = 0$ 

=== Squeeze Theorem
Let $f(x)$, $g(x)$, $h(x)$ be functions defined at and near $c$.
#linebreak()
If $f(x) <= g(x) <= h(x) space forall space x$ near $c$ except possibly at $c$,
#linebreak()
and $lim_(x->c) f(x) = lim_(x->c) h(x) = L $, then $lim_(x->c) g(x) = L$.

== Derivatives
=== Trig

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*$f(x)$*], [*$f'(x)$*]
  ),
  $tan(x)$,
  $sec^2(x)$,
  $cot(x)$,
  $-csc^2(x)$,
  $sec(x)$,
  $sec(x) dot tan(x)$,
  $csc(x)$,
  $-cot(x) dot csc(x)$
)

=== Some Rules
- $(f(x)/g(x))' = (f'(x)g(x) - f(x)g'(x))/(g(x))^2$





#colbreak()
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