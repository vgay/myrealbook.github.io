\version "2.23.11"
#(set-global-staff-size 17)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "poly-mark-engraver223.ly"
\include "BookPartPagesJAS223.ly"
\include "MRB223.ly"
% \include "twoCompoundMetersJAS223.ly"
% \include "staffColor.ly"
%\include "Bass_changes_equal_root223.ly"
%\include "enHarmoniszeChordsName.ly"

title = #"Nightfall"
composer = #"Larry Willis"
meter = #"(Med. Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"
global = { \key f \major  }

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
  asplayed = #"Larry Willis" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=rQjtgRqpL04"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

message = \markup ""

Ossature = {
  \time 3/4
  \showStartRepeatBar \bar "[|:"
  \polyMark #'cu \markup { \box Intro }
  \repeat volta 2 { s2.*4 } \break
  \polyMark #'rde \markup { \small "R.S. cont. simile" }
  \mark \default \repeat unfold 2 { s } \break
  \mark \default \repeat unfold 2 { s } \break
  \mark \default \repeat unfold 2 { s } \break
  \mark \default \repeat volta 2 { s }
}

VoixI =  \relative {
  \time 3/4
  \key f \major \time 3/4
  R2.*4 _"Piano fills"
  a'8 c8~ 2 | 8 bes r4 r8 f e a g2~ | 8 d r4 \tuplet 3/2 { r8 e f } |
  e2.~ | 2.~ | 2.~ | 2 r4 | \break
  <<
    {
      a8 c8~ 2 | 8 bes r4 r8 f e a g2~ | 8 d r4 \tuplet 3/2 { r8 e f }
      e2.~ ^"Piano fills" | 2.~ | 2. | e4 a c, |
      d2.~ | 2.~ | 4. r8 r4 | e4 a c, |
      d2.~ ^"Piano fills" | 2.~ | 4. r8 r4 | f4 f bes \break

    }
    \\
    {
      e,8 a8~ 2 | 8 g r4 r8 d | bes e e2~ | 8 bes r4 \tuplet 3/2 { r8 c d }
      cis2.~ | 2. | c | e4 a c, |
      b2.~ | 2.~ | 4. r8 r4 | e4 a c, |
      bes?2.~ | 2. | g4. r8 r4 | f'4 f bes

    }
  >>
  \break
  es2.~ ^"Piano fills" \repeat unfold 2 {  es2.~  | } 2. |
}

VoixII =  \relative c'' {
  \global
  % \partial 8
}

PianoRH =  \relative c' {
  \override NoteHead.no-ledgers = ##t
  \improvisationOn
  \repeat percent 2 { d4. 4.~ | 8 8~ 2  }
  \improvisationOff

}
Basse =  \relative c {
  \global
  \clef "bass"
  a4. 4.~ | 4. e'8 \tuplet 3/2 { g e d }

}


accords = \chordmode {
  \set chordChanges = ##f
  a2.*4:9-sus4 a2.*8:9-sus4 a2.*4:9-sus4 fis2.*2:m7 f:7+
  e2.*4:m7 bes2.*2:7+ as2.:7+ s2 c4:7/e f2.*2:m7 es:m7
}

grille = \chordmode {
    \polyMark #'cu \markup { \box Intro }
  \bar "[|:"
  \repeat percent 4 { a1:9-sus4 } \break \mark \default
  \repeat volta 2 { \repeat percent 4 { a1:9-sus4 } } \break \mark \default
  \repeat percent 4 { a1:9-sus4 } \break
  \repeat percent 2 { fis:m7 } \repeat percent 2 { f:7+ } \break \mark \default \bar "||"
  \repeat percent 4 { e:m7 } \break
  \repeat percent 2 { bes:7+ } as:7+ as2.:7+ c4:7/e \break \mark \default \bar "||-[|:"
  \repeat volta 2 { \repeat percent 2 { f1:m7 } \repeat percent 2 { es:m7 }}
 }


%CTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #1
    print-page-number = ##f
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
          } } }
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \VoixI
          \new Staff \with { instrumentName = "Rhythm Sec." }
          << \PianoRH \\ \Basse >>
      >> >>
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
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
                %\line { "" }
          } } }
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \VoixI
          \new Staff \with { instrumentName = "Rhythm Sec." } << \PianoRH \\ \Basse >>
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
    }
    \new ChordGridScore <<
      \new ChordGrid \grille
    >>
} }

%BbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #1
    print-page-number = ##f
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \VoixI
          \new Staff \with { instrumentName = "Rhythm Sec." } << \PianoRH \\ \Basse >>
      >> >>
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
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
                %\line { "" }
          } } }
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \VoixI
          \new Staff \with { instrumentName = "Rhythm Sec." } << \PianoRH \\ \Basse >>
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
    }
    \new ChordGridScore <<
      \new ChordGrid \transpose c d \grille
    >>
} }

%EbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #1
    print-page-number = ##f
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \VoixI
          \new Staff \with { instrumentName = "Rhythm Sec." } << \PianoRH \\ \Basse >>
      >> >>
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
        \new StaffGroup <<
          \new Staff \with {
            instrumentName = \markup {
              \center-column {
                \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
                %\line { "" }
          } } }
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \VoixI
          \new Staff \with { instrumentName = "Rhythm Sec." } << \PianoRH \\ \Basse >>
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
    }
    \new ChordGridScore <<
      \new ChordGrid \transpose c a \grille
    >>
} }
