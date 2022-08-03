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

title = #"Out On The Coast"
composer = #"Larry Willys"
meter = #"(Funk / Swing)"
kwtempo = #"Med. Up"
kwstyle = #"Funk / Swing"
global = { \key es \major }

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

\layout {
  \context {
    \RhythmicStaff
    \override VerticalAxisGroup.staff-affinity = #DOWN
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
    #'((basic-distance . 0)
       (minimum-distance . 8.5 )
       (padding . 0)
       (stretchability . 0))
    \RemoveAllEmptyStaves
    \improvisationOn
    \override StaffSymbol.line-count = 0
    \remove Time_signature_engraver
    \remove Bar_engraver
} }

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Larry Willis" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=fEjthXH0zvM"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

message = \markup ""

Ossature = {
  % \showStartRepeatBar \bar "[|:"
  \time 4/4
  \polyMark #'lu \markup { \box Intro "funk" }
  s1*4 \break
  \polyMark #'lu \markup { \box A "funk" }
  \repeat volta 2 { s1*3 \break s \break}
  \polyMark #'lu \markup { \box B "Swing" \small "(double-time feel)" }
  \polyMark #'ld \markup { \small "  Walking in 8" }
  s1*4 \break
  \polyMark #'lu \markup { \box C "funk" }
  s1*4 \break
  \polyMark #'lu \markup { \box A "funk" }
  \repeat volta 2 { s1*3 \break s \break}
  \polyMark #'rde "See grid for solos"
  \bar ".."
}

VoixI =  \relative  {
  \global
  R1*4
  g''16 as r g8-. f-. es16~ 8 c16 bes es8-. c~ | 1~ | 2. r4
  r16 f, bes es \repeat unfold 2 { f8 c16 bes }  es8-. c~ | 1~ | 2. r4
  r8 d f d e c16 a r4 | fis'8 d16 b e d fis gis~ 2 |
  r16 bes, d8 f d16 bes e8 c16 a r4 | fis'8 d16 b e d fis gis r8 bes4.
  R1*4
  g16 as r g8-. f-. es16~ 8 c16 bes es8-. c~ | 1~ | 2. r4
  r16 f, bes es \repeat unfold 2 { f8 c16 bes }  es8-. c~ | 1~ | 2. r4
}

Basse =  \relative c {
  \global
  \clef "bass"
  \repeat unfold 10 { bes8 c r4 r2 }
  \comp #16
  \repeat unfold 10 { bes8 c r4 r2 }
}


accords = \chordmode {
  \set chordChanges = ##f
  d1:m7 g:7 c:7+ c:7+
}

grille = \chordmode {
  \polyMark #'lu \markup { \box "funk" }
  \repeat volta 2 { \repeat percent 4 { c1:m7 } } \break
  \polyMark #'lu \markup { \box "Swing" \small "(walking bass in 8)" }
  es2:7+ f:7+ g:7+ a:7+  es:7+ f:7+ g:7+ as4:7+ g:8 \break
  \polyMark #'lu \markup { \box "funk" }
  \repeat percent 4 { c1:m7 } \break
  \bar ".." }

GridRhythm = { s1* 7  \comp #2 c8 4.}


%CTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##f
    print-page-total = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
                %\line { "" }
          } } } \VoixI
          \new Staff \with { instrumentName = "Bass" } \Basse
          %\new Voice \with { \consists "Pitch_squash_engraver" }
      >> >>
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
      markup-system-spacing = #'((basic-distance . 15)
                                 (minimum-distance . 8)
                                 (padding . 4))
    }
    \new ChordGridScore <<
      \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \grille
    >>
} }

%Ca4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    print-page-number = ##f
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
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
                %\line { "" }
          } } } \VoixI
          \new Staff \with { instrumentName = "Bass" } \Basse
          %\new Voice \with { \consists "Pitch_squash_engraver" }
      >> >>
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
      markup-system-spacing = #'((basic-distance . 15)
                                 (minimum-distance . 8)
                                 (padding . 4))
    }
    \new ChordGridScore <<
      \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \grille
    >>
} }

%BbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##f
    print-page-total = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
                %\line { "" }
          } } }
          \transpose c d \VoixI
          \new Staff \with { instrumentName = "Bass" } \Basse
      >> >>
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
      markup-system-spacing = #'((basic-distance . 15)
                                 (minimum-distance . 8)
                                 (padding . 4))
    }
    \new ChordGridScore <<
      \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \transpose c d \grille
    >>
} }

%Bba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    print-page-number = ##f
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
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
                %\line { "" }
          } } }
          \transpose c d \VoixI
          \new Staff \with { instrumentName = "Bass" } \Basse
      >> >>
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
      markup-system-spacing = #'((basic-distance . 15)
                                 (minimum-distance . 8)
                                 (padding . 4))
    }
    \new ChordGridScore <<
      \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \transpose c d \grille
    >>
} }


%EbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##f
    print-page-total = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
                %\line { "" }
          } } }
          \transpose c a, \VoixI
          \new Staff \with { instrumentName = "Bass" } \Basse
      >> >>
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
      markup-system-spacing = #'((basic-distance . 15)
                                 (minimum-distance . 8)
                                 (padding . 4))
    }
    \new ChordGridScore <<
      \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \transpose c a \grille
    >>
} }


%Eba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    print-page-number = ##f
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
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
                %\line { "" }
          } } }
          \transpose c a, \VoixI
          \new Staff \with { instrumentName = "Bass" } \Basse
      >> >>
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
      markup-system-spacing = #'((basic-distance . 15)
                                 (minimum-distance . 8)
                                 (padding . 4))
    }
    \new ChordGridScore <<
      \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
      \new ChordGrid \transpose c a \grille
    >>
} }
