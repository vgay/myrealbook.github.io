\version "2.23.11"
#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "poly-mark-engraver223.ly"
\include "BookPartPagesJAS223.ly"
\include "MRB223.ly"
% \include "twoCompoundMetersJAS223.ly"
% \include "staffColor.ly"
%\include "Bass_changes_equal_root223.ly"
%\include "enHarmoniszeChordsName.ly"

title = #"Children Of Harlem"
composer = #"Larry Willis"
meter = #"(Med. Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"
global = {  }

\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 12)
                             (padding . 0))
}

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}
%
% \layout {
%   \context {
%     \Score
%     dalSegnoTextFormatter = #(lambda (context return-count marks)
%                                #{ \markup { \with-color #red \fontsize #2 "D.C. al Coda"  } #})
%       }
% }


\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Gary Bartz" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=tSSTcYWO0Kw"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

message = \markup ""

Ossature = {
  \time 3/4
  \partial 4 s
  \mark \default
  \repeat volta 2 {
    s2.*4
    s2.*4 \break
    s2.*4
    s2.*4 \break
    s2.*4
    s2.*3
  }
  \alternative {
    \volta 1 { s2. }
    \volta 2 {s }
  }
  \bar "||" \mark \default \break
  s2.*4
  s2.*4 \break
  s2.*4
  s2.*4 \break
  \bar "||" \mark #1

  s2.*4
  s2.*4 \break
  s2.*4
  s2.*4 \break
  s2.*4
  s2.*4 \break
  \polyMark #'rde \markup \right-column {
    \concat { "after solos play last " \box A }
    "Then Vamp on last 4 bars" }
  \bar ".."
}

VoixI =  \relative c' {
  \global
  \partial 4 \tuplet 3/2 { r8 f ges  }
  f2~ \tuplet 3/2 { 8 bes, c } | des4 es~ \tuplet 3/2 { 8 f ges } |
  f2~ \tuplet 3/2 { 8 bes, c } | des4. es |
  f2~ \tuplet 3/2 { 8 bes, c } | d2.~ | d~ | d2 \tuplet 3/2 { r8 f ges  } |
  f2~ \tuplet 3/2 { 8 bes, c } | des4 es~ \tuplet 3/2 { 8 f ges } |
  f2~ \tuplet 3/2 { 8 bes, c } | des4. es |
  f2~ \tuplet 3/2 { 8 bes, c } | d2.~ | d~ | d2 r4 |
  bes'2~ 8 g | \tuplet 4/3 { es4 f g as } |
  b?2~ 8 g | \tuplet 4/3 { e4 fis g a } |
  b?2~ \tuplet 3/2 { 8 e, fis } | gis2.~ | 2.~ |
  2 \tuplet 3/2 { r8 f ges } | g2 \repeatTie r4
  f2 4 | 4. bes | c2.~ | 2 r4
  f,2~ \tuplet 3/2 { 8 ges es } | f4 f es' | f2.~ | 2 r4 |
  a,2~ \tuplet 3/2 { 8 fis e } | \tuplet 4/3 { fis4 a cis e } |
  f?2.~ | 2~ \tuplet 3/2 { 8 e d } |
  e2~ \tuplet 3/2 { 8 d c } | d2~ \tuplet 3/2 { 8 c bes } |
  c2~ \tuplet 3/2 { 8 bes as } | bes2~ \tuplet 3/2 { 8 f ges }
  f2~ \tuplet 3/2 { 8 bes, c } | des4 es~ \tuplet 3/2 { 8 f ges } |
  f2~ \tuplet 3/2 { 8 bes, c } | des4. es |
  f2~ \tuplet 3/2 { 8 bes, c } | d2.~ | d~ | d2 \tuplet 3/2 { r8 f ges  } |
  f2~ \tuplet 3/2 { 8 bes, c } | des4 es~ \tuplet 3/2 { 8 f ges } |
  f2~ \tuplet 3/2 { 8 bes, c } | des4. es |
  f2~ \tuplet 3/2 { 8 bes, c } | d2.~ | d~ | d2 r4 |
  bes'2~ 8 g | \tuplet 4/3 { es4 f g as } |
  b?2~ 8 g | \tuplet 4/3 { e4 fis g a } |
  b?2~ \tuplet 3/2 { 8 e, fis } | gis2.~ | 2.~ | 2.

}



accords = \chordmode {
  \set chordChanges = ##f
  s4 as2.*4:13sus4 c:13sus4 as2.*4:13sus4 c2.*2:m7 f:9-
  bes:13sus4 d:7sus4 b2.*4:13sus4  b2.:13sus4
  b2.*2:5-7+/ais bes:7+  b2.*2:5-7+/ais bes:7+  e:13sus4 e:9- f2.:7+ es:7+ des:7+ b:7+
  as2.*4:13sus4 c:13sus4 as2.*4:13sus4 c2.*2:m7 f:9-
  bes:13sus4 d:7sus4 b2.*4:13sus4

}

grille = \chordmode {
  \bar "[|:" \mark \default
  \repeat volta 2 {
    \repeat percent 4 { as1:13sus4 }
    \repeat percent 4 { c1:13sus4 } \break
    \repeat percent 4 { as1:13sus4 }
    \repeat percent 2 { c:m7 } \repeat percent 2 { f:9- } \break
    \repeat percent 2 { bes:13sus4 } \repeat percent 2 { d:7sus4 }
    \repeat percent 4 { b1:13sus4 } \break }
  \mark \default \repeat percent 2 { b:5-7+/ais } \repeat percent 2 { bes:7+ }
  \repeat percent 2 { b:5-7+/ais } \repeat percent 2 { bes:7+ } \break
  \repeat percent 2 { e:13sus4 } \repeat percent 2 { e:9- }
  f:7+ es:7+ des:7+ b:7+ \bar "||" \break \mark #1
  \repeat percent 4 { as1:13sus4 }
  \repeat percent 4 { c1:13sus4 } \break
  \repeat percent 4 { as1:13sus4 }
  \repeat percent 2 { c:m7 } \repeat percent 2 { f:9- } \break
  \repeat percent 2 { bes:13sus4 } \repeat percent 2 { d:7sus4 }
  \repeat percent 4 { b1:13sus4 }
  \polyMark #'rde \markup \right-column {
    \concat { "after solos play last " \box A }
    "Then Vamp on last 4 bars" }
  \bar ".." }


%CTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \VoixI
      >>
    } % \message
} }

%Ca4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \VoixI
      >>
    }
  } \bookpart {
    \paper {
      indent = 0
      ragged-right = ##f
      system-system-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 20)
         (padding . 0)
         (stretchability . 0))
    }
    \new ChordGridScore <<
      \new ChordGrid \grille
    >>  \message
} }

%BbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixI
      >>
    } % \message
} }

%Bba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixI
      >>
    }
  } \bookpart {
    \paper {
      indent = 0
      ragged-right = ##f
      system-system-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 20)
         (padding . 0)
         (stretchability . 0))
    }
    \new ChordGridScore <<
      \new ChordGrid \transpose c d \grille
    >>  \message
} }

%EbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a \VoixI
      >>
    } % \message
} }

%Eba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a \VoixI
      >>
    }
  } \bookpart {
    \paper {
      indent = 0
      ragged-right = ##f
      system-system-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 20)
         (padding . 0)
         (stretchability . 0))
    }
    \new ChordGridScore <<
      \new ChordGrid \transpose c a \grille
    >>  \message
} }
