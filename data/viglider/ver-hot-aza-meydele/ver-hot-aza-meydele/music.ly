\version "2.18.2"
\language "english"
\include "../../../../templates/preamble.ly"

\score {
  <<
    \new ChordNames {
      \chordmode { 
        a2:m |
        a2:m |
        a2:m |
        e2:7 |
        a:m |
        a:m |
        a:m |
        e:7 |
        e:7 |
        a:m |
        f: |
        e:7 |
        e:7 |
        d:m6 |
        f: |
        e:7 |
        \repeat volta 2 {
          a:m |
          e:7 |
          e:7 |
          a:m |
          a:m |
          e:7 |
          d:m6 |
          a4:m e4:7 |
          c2: |
          d:m6 |
          d:m6 |
          a:m |
          a:m |
          e:7 |
        }
        \alternative {
          { d4:m6 e:7 | a4.:m e8:7 }
          { d4:m6 e:7 | a2.:m }
        }
      }
    }
    \new Staff {
      \clef treble
      \key a \minor
      \time 2/4
      \tempo "Allegro moderato"
      \new Voice = "melody" {
        \relative d'{
          e8 e e e |
          gs16 f e4. |
          f8 e f a |
          gs2 |
          a8 gs a b |
          c16 b a4. |
          c8 a c e |
          b2 |
          d8 b gs e |
          c'16 b a4. |
          gs8 a b c |
          b4. r8|
          c b gs e8 |
          c'16 b a4 r16 a |
          gs8 d f a |
          gs2 |
          
          \repeat volta 2 {
            e'8 c b a |
            gs8. ff16 e8. e16 |
            b'8 b c b |
            a2 |
            e8 c' b a |
            gs8. f16 e8 e16 e |
            b'8 b c b |
            a2 |
            c8 e e e |
            d8. c16 b4 |
            d8 f e d |
            c8. b16 a4 |
            e'8 c b a  |
            gs8. f16 e8 e |
            }
            \alternative {
              { b' b c b | a2 | }
              { e'8 d c b | a2 }
            }
          }
        \bar "|."
      }
    }
    \new Lyrics \lyricsto "melody" {
      Fun dem hi -- ml tsu -- ge -- shikt
      a ma -- to -- ne mir,
      mit an oy -- tser mikh ba -- glikt,
      hot got on a shir.
      
      Likh -- tik iz far mir mayn velt,
      nit mit zu -- nen -- shayn,
      krigt men den fun oyts -- res gelt,
      a mey -- de -- le vi mayn!
      
      Ver hot a -- za mey -- de -- le 
      a ma -- le -- khl a kleyns?
      Oy -- gn vi tsvey shte -- rn -- dlekh,
      a ne -- sho -- me -- le a reyns.
      
      \repeat volta 2 {
      Li -- ber Got, ikh bet bay dir,
      shits un hit zi op far mir!
      Ver hot a -- za mey -- de -- le,
      a 
      }
      \alternative { 
        { mey -- de -- le a kleyns! } 
        { mey -- de -- le a kleyns! }
      }
    }
  >>
}
