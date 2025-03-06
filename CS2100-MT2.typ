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

== Definitions
=== Relations
For the following definitions, consider a relation $R$ on a set $S$.
1. #underline[_Transitivity_]: $R$ is transitive $<=>$ $(a, b) in S, (b, c) in S => (a, c) in S$.
2. 
  #underline[_Reflexivity_]: $R$ is reflexive $<=>$ $forall a in S, (a, a) in R$. 
  #linebreak()
  #underline[_Irreflexivity_]: $R$ is irreflexive $<=>$ $forall a in S, (a, a) in.not R$.
3. 
  #underline[_Symmetry_]: $R$ is symmetric $<=>$ $(a, b) in R => (b, a) in R$.
  #linebreak()
  #underline[_Antisymmetry_]: $R$ is antisymmetric $<=>$ $(a, b) and (b, a) in R => a = b$.

- #underline[_Binary Relation_]: A relation from a set to itself.
- #underline[_Equivalence Relation_]: A relation that is reflexive, symmetric, and transitive.

#underline[_Partitions_]:
For a set $A$ to be a partition of $B$, the following must be true of $A$:
1. The sets contained in $A$ must be mutually disjoint.
2. The union of the sets contained in $A$ must be $B$.
3. Every set in $A$ must $!= diameter$
- #underline[_Equivalence Class_]: $[x]$ denotes the set of all elements related to $x$.

=== Ordering
- #underline[_Partial Ordering_]: A relation $R$ on $S$ is a partial order if it is reflexive, antisymmetric, and transitive.
  - Relations with partial orders may be drawn using a Hasse diagram.
- #underline[_Total Ordering_]: A relation $R$ on $S$ is a total order if it is a partial order and $forall a, b in S, (a, b) in R.$
- #underline[_Strict Ordering_]: Partial and Total orderings are strict if they are irreflexive.

=== Function
A #underline[_Function_] is a relation $F$ on a set $X$ to a set $Y$ where every element in $X$ maps to exactly one element of set $Y$.

- #underline[_Injectivity_]: $forall (a, b) in X, f(a) = f(b) <=> a = b$
- #underline[_Surjectivity_]: $forall a in Y, exists b "s.t." f(b) = a$
- #underline[_Bijectivity_]: Injective and Surjective

Useful Facts:
- Composing two injective functions gives an injective function.
- 2-regular functions: $f : A -> B$ is 2-regular $<=> forall b in B, exists$ exactly two distinct $a_1, a_2 in A "s.t." f(a_1) = f(a_2) = b$.
- #underline[Within the context of this class], invertible means bijective.
  - Invertible isn't really a formally defined term, so it can vary. In other contexts, it tends to simply mean injective.

Images and Preimages

_Cantor-Bernstein Theorem_: Given infinite sets $A$ and $B$, iff $exists$ some injective function from $A$ to $B$, and $exists$ some injective function from $B$ to $A$, $|A|$ = $|B|$.

=== Sets
- $P(A) = { S : S subset.eq A}$
- For a finite set $A$, if $|A| = k$, then $|P(A)| = 2^k$
- #underline[_Cartesian Product_]: $A times B = {(a, b) : a in A and b in B}$
- The dual of a statement about sets is one with each $union$ swapped with $inter$, each $inter$ swapped with $union$, each $UU$ (universal set) swapped with $diameter$, and each $diameter$ swapped with $UU$.
- Set equality: The formal definition: $A = B <=> A subset.eq B and B subset.eq A$.

== Useful Properties
1. Closure
2. Connectedness of a relation - strong & weak

// == Procedures
// === Proof Structure


== Types of Proof
=== Direct Proof
Directly show that if $p$ is true, then $q$ is true as well.
- This includes proof by induction.
1. Write the proposition
2. Start with a true hypothesis
  #linebreak()
  Through definitions, axioms, and properties, work your way to a conclusion
3. End with a true conclusion

=== Indirect Proof
// TODO: Re-write this section, this is ugly and verbose and bad.
Proofs of an equivalent implication. For example, the contrapositive of a statement can be used to prove that statement.
- Proof by Contradiction
Assume a counterexample can be found. Then there is an element in the domain that either:
  - Makes the hypothesis true (?)
  - Makes the conclusion false
This leads to a contradiction.

=== Proof Tips
- Use the definitions to express things that reveal fundamental properties
- Use variables that represent *any* element in the domain
- Do not use the same variable for two different things
- Apply rules/properties that apply to every element in the domain
- The resulting conclusions should be true for any element in the domain.
#linebreak()

- Element-wise Proofs
- Logical Equivalence proofs
- What about function proofs? Get a couple examples of these on the sheet.

=== Set-Builder Notation
$S = { "domain" | "predicate"}$
- ${x in NN : x "is even"}$
- ${x in NN : x mod 2 = 0}$

== Example Proofs
=== $sqrt(2) in.not QQ$ - by contradiction.
- Suppose not. That is, $exists p, q in ZZ != 0 "s.t." sqrt(2) = p/q, "s.t."$ (1) $p, q$ do not share a factor.
- Then $2 = p^2/q^2 => 2q^2 = p^2$.
- By definition of even, $p^2$ is even.
- This implies $p$ is even. (proof omitted)
- Then, $p = 2a, a in ZZ => 2 = (4a^2)/q^2 => q^2 = 2a^2$.
- By definition of even, $q^2$ is even.
- This implies $q$ is even.
- Since both are even, they both have a common factor $2$.
- This contradicts (1): $p, q$ do not share a factor. $qed$

=== There is no greatest even integer - by contradiction.
- Suppose not. That is, there is some greatest even integer, $n$.
- Then, by closure under addition, $n + 2 = k in ZZ$.
- By definition of even, $n = 2a, a in ZZ$.
- By substitution, $n + 2 = 2a + 2$.
- By distributive property, $2a + 2 = 2(a + 1)$.
- By definition of even, $2(a + 1)$ is even $=> n + 2$ is even.
- Since $n + 2 > n$ and $n + 2$ is even, this contradicts our original assumption that there must be a greatest even integer. $qed$

=== There are infinitely many prime numbers - by contradiction.
- Fact (1): Any integer $n > 1$ is divisible by some prime number.
- Fact (2): For any integer, $a$, and any prime number, $p$, if $p divides a => p divides.not a + 1$
- Assume there is a finite number of prime numbers. Then, let $p$ be the largest prime number.
- Then, we can write all the prime numbers in ascending order as such: $2, 3, 5, 7, 11, ..., p$.
- Let another integer, $n = (2 * 3 * 5 * 7 * ... * p) + 1$.
- We know by (2) that since $n$ is divisible by every prime number, $n + 1$ is divisible by no prime number.
- But by (1), $n + 1$ must be divisible by some prime number.
- This contradicts our assumption that $p$ is the largest prime number. Therefore, there are infinitely many prime numbers. $qed$

== Other
- Remainder theorem?
- What other theorems??