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

== Closure of Languages
#image("ClosureOfLanguages.png", width: 100%)

== Reduction
$A$ can be reduced to $B$:
1. $A$ is no harder than $B$
2. $B$ is easy $=> A$ is easy
3. $A$ is hard $=> B$ is hard

== Computability
A language $L$ is recognizable (recursively enumerable) iff $exists$ recognizer $T$ s.t. $L(T) = L$.
- Recognizer either halts and accepts, halts and rejects, or spins indefinitely and rejects.
A language $L$ is decidable (recursive) iff $exists$ decider $T$ s.t. $L(T) = L$.
- Decider either halts and accepts, or halts and rejects.

If a language $L$ is recognizable, and $overline(L)$ is recognizable, then $L$ is decidable:
1. Construct TM $M$ deciding $L$:
  - On input $w$:
    1. Simulate one step of the turing machine recognizing $L$
    2. Simulate one step of the turing machine recognizing $overline(L)$
    3. If the first machine accepts, accept
    4. If the first machine accepts, reject
    5. Otherwise, repeat at (1)

$M$ will accept if $w in L$, and reject if $w in.not L$. It will never keep spinning, because one of these machines _will_ accept.

=== Important Problems in Computability

#underline([_Shit we covered in class_]):
1. $A_"DFA"$: Acceptance problem for DFAs; _decidable_
2. $A_"NFA"$: Acceptance problem for NFAs; _decidable_
  - $A_"NFA"$ = "On input $chevron B, w chevron.r$:
    1. Convert NFA $B$ to equivalent DFA $B'$ 
    2. Run TM $D_"A-DFA"$ on input $chevron B', w chevron.r$.
    3. If $D_"A-DFA"$ accepts, accept; otherwise, reject.
3. $A_"REX"$: Acceptance problem for regular expressions; _decidable_
  - convert regex to NFA, run $D_"A-NFA"$ on it
4. $E_"DFA"$: Emptiness problem for DFAs; _decidable_
5. $E Q_"DFA"$: Equivalence problem for DFAs; _decidable_
  - construct DFA for the symmetric difference of the two langauges, which we know we can do by properties of regular languages 
6. $A_"CFG"$: Acceptance problem for CFGs; _decidable_
7. $E_"CFG"$: Emptiness problem for CFGs; _decidable_
8. $E Q_"CFG"$: Equivalence problem for CFGs; _not decidable_
  - can't use the same strategy as EQ for DFAs, because CFLs are not closed under complementation or intersection
9. $A_"TM"$: Acceptance problem for TMs; _not decidable_
  - $A_"TM" = {chevron M, w chevron.r | M "is a TM and" M "accepts" w}$ 
  - Assume some TM $H$ decides $A_"TM"$.
  - Construct TM $D$:
    $D$ = "On input $chevron M chevron.r$:
    1. Run $H$ on input $chevron M, chevron M chevron.r chevron.r$.
    2. Accept if $H$ rejects, reject if $H$ accepts.
  - $D$ accepts $chevron M chevron.r$ iff $M$ doesn't accept any $chevron M chevron.r$, for any $M$.
  - Let $M = D$:
    $D$ accepts $chevron D chevron.r$ iff $D$ doesn't accept $chevron D chevron.r$.
    This is a contradiction, and so our initial assumption is false; $A_"TM"$ is undecidable.
10. $overline(A_"TM")$: Not Turing-recognizable.
  - Assume that $overline(A_"TM")$ is Turing-recognizable.
  - We know that $A_"TM"$ is Turing-recognizable.
  - But, because if $L$ and $overline(L)$ is recognizable, then $L$ is decidable, this implies $A_"TM"$ is decidable.
  - But this contradicts what we know, that $A_"TM"$ is not decidable. Therefore, $overline(A_"TM")$ is not Turing-recognizable.
11. $H A L T_"TM"$: Undecidable.
  - $H A L T_"TM" = {chevron M, w chevron.r | M "is a TM and" M "halts on input" w}$ 
  - Assume that $H A L T_"TM"$ is decidable; then, $exists$ TM $R$ s.t. $R$ decides $H A L T_"TM"$.
  - Construct a new machine, $S$ = "On input $chevron M, w chevron.r$:
    1. Run $R$ on $chevron M, w chevron.r$.
    2. If $R$ rejects - that is, if $M$ spins forever on $w$ - reject.
    3. Otherwise, $M$ will halt. Simulate $M$ on $w$; if $M$ accepts, accept, and if $M$ rejects, then reject.
  - This machine decides $A_"TM"$: For any Turing Machine $M$ and string $w$, it decides the output of $M$ on $w$. This is a contradiction, because we know that $A_"TM"$ isn't decidable, and so our initial assumption that $H A L T_"TM"$ is decidable is false.
12. $E_"TM"$ is undecidable.
  - $E_"TM" = {chevron M chevron.r | M "is a TM and" L(M) = emptyset}$
  - Assume that $E_"TM"$ is decidable. Then, $exists "TM" R "s.t." R "decides" E_"TM"$.
  - We can then construct $S$ that decides $A_"TM"$.
  - $S = "On input" chevron M, w chevron.r $:
    1. Construct a new TM, $M_w$ = On input $x$:
      1. If $x != w$, reject.
      2. If $x = w$:
        - Simulate $M$ on $w$. Accept if $M$ accepts.
      3. Run $R$ on $M_w$.
      4. If $R$ accepts, then $L(M_w) = emptyset$, and $M$ rejects $w$. Reject.
      5. Otherwise, then $L(M_w) = {w}$, and $M$ accepts $w$. Accept.
  - $S$ decides $A_"TM"$, which is a contradiction, yada yada, you get the picture.
13. $R E G U L A R_"TM"$ is undecidable.
  - $R E G U L A R_"TM" = {chevron M chevron.r | L(M) "is regular"}$
14. $E Q_"TM"$ is undecidable.
  - $E Q_"TM" = {chevron M_1, M_2 chevron.r | M_1 "and" M_2 "are TMs and" L(M_1) = L(M_2)}$.
  - Assume that $E Q_"TM"$ is decidable. Then, $exists$ TM $R$ deciding $E Q_"TM"$.
  - We can construct $S$ deciding $E_"TM"$:
  - $S = "On input" chevron M chevron.r$:
    1. Construct a TM $M'$ s.t. $L(M') = emptyset$
    2. Run $R$ on $chevron M, M' chevron.r$
    3. Accept if $R$ accepts; otherwise, reject.
  - $S$ decides $E_"TM"$, contradiction,f a;osihopa 94hoaeirth

== Complexity
- P: The set of problems with a polynomial-time solution
- NP: The set of problems with a nondeterministic polynomial-time solution; equivalent to the set of problems whose solutions are verifiable in polynomial time
- NPC: The set of problems in NP-Hard and NP
- NP-Hard:
  A problem $B$ is in NP-Hard iff one of the following conditions is true:
  1. $forall "problem" A in "NP", A <=""_p space B$; that is, $A$ can be reduced to $B$ in polynomial time.
  2. $exists "NP-Hard problem" A space s.t. space A <=""_p space B$.