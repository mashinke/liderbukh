
\header {
  title = "די שבֿועה"
  subtitle = "Di Shvue"
  }
\version "2.18.2"
\language "english"

#(set-global-staff-size 17)

end =
  #(define-music-function
    (parser location signature)
    (fraction?)
  #{
    \once \omit Staff.TimeSignature \time #signature
  #})

\layout {
  \context {  % Use Typewriter font for chord symbols
    \ChordNames {
      \set chordChanges = ##t
      \override ChordName.font-family = #'typewriter
      }
    }
  \context {  % Change font size for lyrics
    \Lyrics {
      \override LyricText.font-size = #'-1
      }
    }
  \context {  % Beam according to rhythm
    \Staff {
      \set Timing.beamExceptions = #'()
      }
    }
  }

\paper {      % Load fonts
  fonts = #
  (make-pango-font-tree
   "Linux Libertine"
   "Linux Biolinum"
   "Courier 10 Pitch"
   (/ (* staff-height pt) 2.5)
    )
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line { \fromproperty #'header:dedication }
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \override #'(font-name . "Drugulin CLM")
          \huge \larger \larger \bold
          \fromproperty #'header:title
          }
        \fill-line {
          \large \bold
          \fromproperty #'header:subtitle
          }
        \fill-line {
          \smaller \bold
          \fromproperty #'header:subsubtitle
          }
        \fill-line {
          \fromproperty #'header:meter
          \fromproperty #'header:arranger
          }
          \fill-line {
          \override #'(font-name . "Drugulin CLM")
          \fromproperty #'header:composer
          { \large \bold \fromproperty #'header:instrument }
          \override #'(font-name . "Drugulin CLM")
          \fromproperty #'header:poet
          }
        }
      }
    }
    scoreTitleMarkup = \markup {
      \column {
      \on-the-fly \print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        \null
        \override #'(font-name . "Drugulin CLM")
        \huge
        \lower #5
        \fromproperty #'header:piece
        }
      }
    }
  }


mel-a = \relative d' {
  g4 bf8. bf16 a4 g8. g16 |
  a4 a8. a16 a4 r |
  a c8. c16 bf4 a8. g16 |
  bf4 bf8. bf16 bf4 r8 bf |
  bf4  d8. d16 c4 bf8. bf16 |
  a4 c8. c16 bf4( a8.) a16 |
  g8( a) bf d c( bf) a g |
  d'4 d8. d16 d4 r8 d |
  g( d)ef c bf4 a8. a16 |
  g4 bf8 d g,4 r |
  f'4 ef8 d g( f ef d) |
  c4 c8 c f( ef d) c |
  d4 f8. f16 ef4( d16) r16 g,8  |
  c4 c8 c  c( a) bf c |
  d4 ef8 c bf4 a8. g16 |
  g'4 g8 g g( d) ef c |
  d4 ef8 c bf4 a |
  g bf8( d) g,2 
}
acc-a = \chordmode {
  g1:m |
  d:7 |
  d:7 |
  g:m |
  bf: |
  d:7 |
  g2:m c:m |
  d1:7 |
  g4:m c:m d2:7 |
  g1:m |
  g:7 |
  c2:m f:7 |
  bf: c4:m g:7 |
  c2:m d:7 |
  g4:m c:m  d2:7 |
  g:m  g4:m c:m |
  g:m c:m  d2:7 |
  g4:m d:7 g2:m
}

\score {
  <<
    \new ChordNames {
        \acc-a

        }
    \new Staff {
      \clef treble
      \key g \minor
      \time 4/4
      \tempo Moderato
      \new Voice = "melody" {
        \mel-a 
        \bar "|."
      }
    }
    \new Lyrics \lyricsto "melody" {
      Bri -- der un shves -- ter fun ar -- bet un noyt,
      a -- le vos zay -- nen tse -- zeyt on tse -- shpreyt_—
      tsu -- za -- men, tsu -- za -- men, di fon zi iz greyt, __
      zi fla -- tert fun tso -- rn, fun blut iz zi royt,
      a shvu -- e! a shvu -- e oyf le -- bn un toyt!
      Hi -- ml un erd __  vet undz oys -- he -- ren, __
      ey -- des veln zayn __ di likh -- ti -- ke shte -- rn,
      a shvu -- e fun blut un a shvu -- e fun tre -- ren!
      mir shve -- rn, mir shve -- rn, mir shve -- rn!
    }
  >>
}
