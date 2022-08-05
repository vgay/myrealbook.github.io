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

title = #"Angelica (Purple Gazelle)"
composer = #"Duke Ellington"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"
global = { \key bes \major }

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
  asplayed = #"Duke Ellington" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=S9WMdFpNBTk&t=188s"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

message = \markup "AABA Form"

Ossature = {
  %\time 3/4
  % \showStartRepeatBar \bar "[|:"
  \mark \default

  \repeat volta 2 {
    \repeat unfold 3 { s1*4 \break }
    s1*3 \alternative { { s1 } { s1 } } \break
  }
  \mark \default
  \repeat unfold 2 { s1*4 \break } \bar "||" \mark #1
  \repeat unfold 4{ s1*4 \break }
  \bar ".."
}

VoixI =  \relative c' {
  \override TextSpanner.bound-details.left.text = "F ped."
  \textSpannerDown
  \global
  f8 e g f r2 | r2 r4 r8 c | es d f es r2 | r2 r4 c8 cis |
  d g r d g2 | r r4 c,8 cis | es8 a r es a2 | R1
  f8 e g f r2 | r2 r4 r8 f | es d f es r2 | r1 |
  <f bes d>4.\startTextSpan <g c es>8~ q4 <gis cis e> |
  <a d f>4. <gis cis e>8~ 4 <g c es> \stopTextSpan
  <f bes? d>4 r8 <d f bes>8~ 2 | R1 | r2 r4 r8 ges
  bes4 r r2 | r4 r8 ges f es4 bes8 | des8 bes r4 es4. f8 | r bes r4 bes r8 ges |
  bes4 r r2 | r4 r8 ges f es4. | e4. f8 r4 r8 f' | g4 bes,,8 a~ 4 r
  f'8 e g f r2 | r2 r4 r8 c | es d f es r2 | r2 r4 c8 cis |
  d g r d g2 | r r4 c,8 cis | es8 a r es a2 | R1
  f8 e g f r2 | r2 r4 r8 f | es d f es r2 | r1 |
  <f bes d>4.\startTextSpan <g c es>8~ q4 <gis cis e> |
  <a d f>4. <gis cis e>8~ 4 <g c es> \stopTextSpan
  <f bes? d>4 r8 <d f bes>8~ 2 | R1 |
}

VoixII =  \relative c'' {
  \global
  % \partial 8
}


accords = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 2 { bes1*2:6 c1:m7 f:7 }
  bes:6 d2:m5-7 g:9- c1:m7 es2:m7 as:7
  bes4. c:m cis4:dim7 d4.:m cis:dim7 c4:m bes1:6 bes2:6 f:7 bes1:6
  es1*2:m6 bes1*2:m6 es1*2:m6 c1:7 f:7
  \repeat unfold 2 { bes1*2:6 c1:m7 f:7 }
  bes:6 d2:m5-7 g:9- c1:m7 es2:m7 as:7
  bes4. c:m cis4:dim7 d4.:m cis:dim7 c4:m bes1:6 bes1:6
}

grille = \chordmode {
  \bar "[|:" \mark \default
  \repeat volta 2 {
    \repeat unfold 2 { \repeat percent 2 { bes1:6 } c1:m7 f:7 \break }
    bes:6 d2:m5-7 g:9- c1:m7 es2:m7 as:7 \break
    bes2 c4:m cis4:dim7 d2:m cis4:dim7 c4:m bes1:6
    \set Score.repeatCommands = #'((volta "1.") )
    bes2:6 f:7 \set Score.repeatCommands = #'((volta #f) end-repeat)
    \break \stopStaff s1 \bar "" s \bar "" s \startStaff
    \set Score.repeatCommands = #'((volta "2.3.") )
    bes1:6 \fine \bar "||" \set Score.repeatCommands = #'((volta #f))
    %     <<
    %       \alternative {
    %         \volta 1 { bes2:6 f:7 }
    %       }
    %       \new ChordGrid {
    %         \alternative {
    %           \volta 2,3  {bes1:6 \fine \bar "||"  }
    %         }
    %         \stopStaff  }
    %     >>
  }
  \break \mark \default
  \repeat percent 2 { es1:m6 } \repeat percent 2 { bes1:m6 }  \break
  \repeat percent 2 { es1:m6 } c1:7 f:7  \bar ":|]"
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
  }
  \context {
    \Voice
    \remove Note_spacing_engraver
  }
}

GridRhythm = { s1* 12  \repeat unfold 2 { c4. 8~ 4 4 }  }

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
      ragged-last-bottom = ##t
      system-system-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 20)
         (padding . 0)
         (stretchability . 0))
    }
    \score {
      \new ChordGridScore <<
        \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
        \new ChordGrid \grille
      >>  %\message
      \layout {
        \enablePolymeter
        \context { \Voice \remove Note_spacing_engraver  }
      }
    } \message
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
      ragged-last-bottom = ##t
      system-system-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 20)
         (padding . 0)
         (stretchability . 0))
    }
    \score {
      \new ChordGridScore <<
        \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
        \new ChordGrid \transpose c d \grille
      >>  %\message
      \layout {
        \enablePolymeter
        \context { \Voice \remove Note_spacing_engraver  }
      }
    } \message
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
      ragged-last-bottom = ##t
      system-system-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 20)
         (padding . 0)
         (stretchability . 0))
    }
    \score {
      \new ChordGridScore <<
        \new RhythmicStaff \magnifyMusic 0.66 \GridRhythm
        \new ChordGrid \transpose c a \grille
      >>  %\message
      \layout {
        \enablePolymeter
        \context { \Voice \remove Note_spacing_engraver  }
      }
    } \message
} }
