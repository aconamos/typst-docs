#set page(
  "us-letter",
  margin: 0.25in,
  columns: 2
)

#set text(
  size: 8pt // go to 8 when done
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

== Automata
=== DFA

A Deterministic Finite Automata is defined as 
$M = (Q, Sigma, delta, q_0, F)$
where
- $Q$: A _finite_ set of states
- $Sigma$: A finite set of symbols
- $delta$: Transition function
	- $delta : Q times Sigma -> Q$
- $F$: A set of accept states
  - $F subset Q$

Notes:
- $F = emptyset => L(M) = emptyset$

=== NFA

A Nondeterministic Finite Automata is defined as 
$M = (Q, Sigma, delta, q_0, F)$
where
- $Q$: A _finite_ set of states
- $Sigma$: A finite set of symbols
  - Let $Sigma_epsilon = Sigma union {epsilon}$
- $delta$: Transition function
	- $delta : Q times Sigma_epsilon -> cal(P)(Q)$
- $F$: A set of accept states

Notes:
- Implicit reject when no transition is labeled

=== PDA

A Pushdown Automata is defined as
$M = (Q, Sigma, Gamma, delta, q_0, F)$
where
- $Q$: Set of states
- $Sigma$: Input alphabet
- $Gamma$: Stack alphabet
- $delta$: $Q times Sigma_epsilon times Gamma_epsilon => cal(P)(Q times Gamma_epsilon)$
- $q_0$: Start state
- $F$: Set of accept states


== CFG
A CFG is defined as 
$(V, Sigma, R, S)$
where
- $V$: finite set of variables
- $Sigma$: finite set of terminals
- $R$: finite set of rules
- $S$: start variable



== Closure
=== Regular Languages

Closed under:
- Union
- Concatenation
- Star
- Intersection
- Complement

=== CFLs

Closed under:
- Union
- Concatenation
- Star

If $A_1$ is a regular language and $A_2$ is a CFL, then $A_1 union A_2$ is a CFL

== Pumping Lemmas
=== Regular Languages
$forall text("Regular Language") A, exists space p in ZZ^(>0) text("s.t.") s in A and |s| >= p => $
$s$ may be divided into 5 pieces, $s = x y z$ s.t.
#enum(numbering: "1)",
  [$x y^i z in A space forall space i >= 0$],
  [$|y| > 0$],
  [$|x y| <= p$]
)

=== CFLs
$forall text("CFL") A, exists space p in ZZ^(>0) text("s.t.") s in A and |s| >= p => $
$s$ may be divided into 5 pieces, $s = u v x y z$ s.t. 
#enum(numbering: "1)",
  [$u v^i x y^i z in A space forall space i >= 0$],
  [$v y != epsilon$],
  [$|v x y| <= p$]
)

#colbreak()

== Other

=== CNF

A CFG is in Chomsky Normal Form if every rule is of the form:
$ A -> B C $
$ A -> a $

and
- $a$ is a terminal
- $A, B, C$ are variables
- Start variable cannot be on the right side of any rule
- $S -> epsilon$ is permitted *only* for the start variable $S$

=== Converting to CNF

1. Add a new start variable $S_0$ and rule $S_0 -> S$, where S is the original start variable
2. Eliminate all $epsilon$-rules of the form $A -> epsilon$, where $A eq.not S_0$
  - For each occurrence of A on the right side of a rule, add a new rule with that occurrence removed
3. Eliminate unit rules of the form $A -> B$
  - For any rule $B -> u$, add $A -> u$
  - Including the start variable
4. Convert remaining rules to proper form
  - For each rule $A -> u_1 u_2 ... u_k, k >= 3$, where each $u_i$ is a variable or terminal:
    - Remove the rule and add the following rules: 
      - $A -> u_1 A_1, $
      - $A_1 -> u_2 A_2, $
      - $A_(k-2) -> u_(k-1) A_k, $

=== Converting CFG to PDA

#image("PDAfromCFG.png", width: 100%)

1. Place "\$" and then the start variable on the stack
2. Repeat the following steps:
  #enum(
    numbering: "a.",
    [If the top of the stack is a variable $A$, then:
      - Nondeterministically select one of the rules for A and substitue A with the right side of the rule],
    [If the top of the stack is a terminal $a$, then:
      - Read the next symbol from the input and compare it with a. If not match, reject the branch],
    [If the top of the stack is \$, then:
      - If all input has been read, accept.]
  )
