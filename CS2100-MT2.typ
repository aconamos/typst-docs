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
- #underline[_Surjectivity_]: $forall a in Y, exists b in X "s.t." f(b) = a$
- #underline[_Bijectivity_]: Injective and Surjective

Useful Facts:
- Composing two injective functions gives an injective function.
- 2-regular functions: $f : A -> B$ is 2-regular $<=> forall b in B, exists$ exactly two distinct $a_1, a_2 in A "s.t." f(a_1) = f(a_2) = b$.
- #underline[Within the context of this class], invertible means bijective.
  - Invertible isn't really a formally defined term, so it can vary. In other contexts, it tends to simply mean injective.

#underline[_Images_]: Given some $f : X -> Y$, The image of an input value $x$ is the set of outputs it may produce. The preimage of an output $y$ is the set of input values that produce $y$.

_Cantor-Bernstein Theorem_: Given infinite sets $A -> B$, iff $exists$ some injective function from $A -> B$, and $exists$ some injective function from $B -> A$, then $exists$ some bijective function from $A -> B$. It follows that the two sets have the same cardinality: $|A|$ = $|B|$.

=== Sets
- $P(A) = { S : S subset.eq A}$
- For a finite set $A$, if $|A| = k$, then $|P(A)| = 2^k$
- #underline[_Cartesian Product_]: $A times B = {(a, b) : a in A and b in B}$
- The dual of a statement about sets is one with each $union$ swapped with $inter$, each $inter$ swapped with $union$, each $UU$ (universal set) swapped with $diameter$, and each $diameter$ swapped with $UU$.
- Set equality: The formal definition: $A = B <=> A subset.eq B and B subset.eq A$.

== Useful Properties
1. Connectedness of a relation - strong & weak

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

== Subtypes of Proof (?)
=== Element-wise Proofs
Show that for _any_ arbitrary element inside a set, some relation holds.
- $A subset.eq B$: $forall x in A, x in B$ 
- $A = B$: $A subset.eq B and B subset.eq A$

=== Function Proofs
They basically involve proving either:
- Surjectivity
- Injectivity
- Both (Invertibility)

=== Logical Equivalence proofs
Show that two statements are logically equivalent using logic laws.

== Proof Tips
- Use the definitions to express things that reveal fundamental properties
- Use variables that represent *any* element in the domain
- Do not use the same variable for two different things
- Apply rules/properties that apply to every element in the domain
- The resulting conclusions should be true for any element in the domain.
#linebreak()


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

=== $A inter B subset.eq A$ - element-wise.
- Let $A$ and $B$ be any sets.
- Let $x$ be any element of $A inter B$.
- By definition of $inter$, $x in A and x in B$.
- Since our choice of $x$ was arbitrary, this implies every element in $A inter B$ is also in $A$.
- Therefore, $A inter B subset.eq A. qed$

=== $A subset.eq C and B subset.eq C => A union B subset.eq C$ - element-wise.
- Let sets $A, B, C$ be any sets s.t. $A subset.eq C and B subset.eq C$.
The goal here is to prove that for every element $x$, $x in A union B => x in C$.
- By definition of $union$, we consider two possible cases:
  - $x in A$
    - Since $A subset.eq C$, by definition of $subset.eq, x in C$.
  - $x in B$
    - Since $B subset.eq C$, by definition of $subset.eq, x in C$.
- In both cases, $x in C$; therefore, $A union B subset.eq C. qed$

=== $(A inter B) union (A inter C) = A inter (B union C)$ - element-wise.
By definition of set equality, we must prove two things:
1. $(A inter B) union (A inter C) subset.eq A inter (B union C)$
2. $A inter (B union C) subset.eq (A inter B) union (A inter C)$

  For 1: Let $x in (A inter B) union (A inter C)$. By definition of $union$, we consider two possible cases:
  1. $x in A inter B$
    - By definition of $inter$, $x in A and x in B$.
    - By definition of $union$, $x in B => x in B union C$.
    - By definition of $inter$, since $x in A and x in B union C, x in A inter (B union C)$.
  2. $x in A inter C$.
    - By definition of $inter$, $x in A and x in C$.
    - By definition of $union$, $x in C => x in B union C$.
    - By definition of $inter$, since $x in A and x in B union C, x in A inter (B union C)$.
  Therefore, $x in (A inter B) union (A inter C) subset.eq A inter (B union C). qed$

  For 2: Let $x in A inter (B union C)$. By definition of $inter$, we know $x in A and x in (B union C).$ By definition of $union$, we consider two possible cases:
  1. $x in A and x in B$.
    - By definition of $inter$, $x in A inter B$.
    - By definition of $union$, $x in (A inter B) union (A inter C)$.
  2. $x in A and x in C$.
    - By definition of $inter$, $x in A inter C$.
    - By definition of $union$, $x in (A inter B) union (A inter C)$.
  Therefore, $x in A inter (B union C) subset.eq (A inter B) union (A inter C). qed$

Since we have proved (1) and (2), $(A inter B) union (A inter C) = A inter (B union C). qed$

=== Prove that $g : QQ -> QQ$ with the rule $g(x) = 5x - 1$ is surjective - function proof.
- Let $y in QQ$ (the codomain).
- We wish to show that $exists x in QQ, g(x) = y$.
- By substitution, $5x - 1 = y$.
- By algebra, $x = (y + 1)/5$.
- We also wish to show that $x in QQ$.
- By closure under addition, $y + 1 in ZZ$.
- By definition of $QQ$, $(y + 1)/5 = p/q, p, q in ZZ => (y + 1)/5 in QQ$.

=== Prove that $f : ZZ -> ZZ$ with the rule $f(x) = 5x + 7$ is injective - function proof.
- Let $a, b in ZZ "s.t." f(a) = f(b)$. (Show they must be the same number)
- Then, $5a + 7 = 5b + 7$.
- By subtraction, $5a = 5b$.
- Since both sides are divisible by 5, the Division Theorem says the quotient must be unique.
- Therefore, $a = b. qed$

=== Prove that there are infinite integers - proof by contradiction.
- Assume not. That is, assume there is some integer $n$, s.t. $forall m in ZZ, n > m$.
- Consider $n + 1$. By closure over addition, $n + 1$ must be an integer as well.
- This contradicts our assumption that $n$ was the largest integer. Therefore, there are infinitely many integers. $qed$

=== Prove that the composition of two injective functions is itself an injective function - direct.
- Let $f : X -> Y, g : Y -> Z$, where $g, y$ are both injective functions.
- By definition of injectivity, $g(x_1) = g(x_2) => x_1 = x_2$, and $f(x_1) = f(x_2) => x_1 = x_2$. (variable names might not be acceptable here)
- Applying the composition, we want to show that $g(f(a)) = g(f(b)) => a = b$.
- By definition of injectivity, $g$ being injective implies $f(a) = f(b)$.
- By definition of injectivity, $f$ being injective implies $a = b. qed$

=== Prove that the composition of two injective functions is itself an injective function - contradiction.
- Assume not. That is, $exists "distinct" x_1, x_2 "s.t. (1) " g(f(x_1)) = g(f(x_2))$.
- By definition of injectivity, $g$ being injective implies $f(x_1) = f(x_2)$.
- By definition of injectivity, $f$ being injective implies $x_1 = x_2$.
- But this contradicts (1) - our assumption that $x_1$ and $x_2$ are distinct. Therefore, $g compose f (x)$ is injective. $qed$
This proof is basically just the direct proof again. Unsure if the one shown on 3/4 is correct...

== Other
- Remainder Theorem: any $a mod$ some $b$ has exactly one remainder.
- What other theorems??