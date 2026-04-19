#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第1回 レポート課題",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2026 年 4 月 16 日",
)

#set footnote(numbering: sym.dagger + "1")

== 1-1.

ホタルとライトのモデルについて、$Delta omega < 0$ の場合の分岐図を書け。
ただし、図だけでなく、その図になる理由の説明も含めること。

== 1-2.

2 匹のカエルが等間隔で交互に鳴いているとする。
この状態を位相差 $phi$ を用いると、$0$ から $2 pi$ の範囲のうちどの値として表せるか答えよ。
計算過程も含めて説明せよ。

=== 解答

位相差は

$
  phi = 2 pi dot (t_B(n) - t_A(m)) / (t_A(m + 1) - t_A(m))
$

と表せられる。

ここで 2 匹のカエルが等間隔で交互に鳴いているという前提より、

$
  t_B(n) - t_A(m) = (t_A(m + 1) - t_A(m)) / 2
$

といえる。

よって、

$
  phi & = 2 pi dot (t_B(n) - t_A(m)) / (t_A(m + 1) - t_A(m)) \
      & = 2 pi dot (t_a(m + 1) - t_a(m)) / (t_a(m + 1) - t_a(m)) dot 1 / 2 \
      & = pi
$

== 1-3.

カエル 2 匹が相互作用する数理モデルを、授業で扱ったホタルの数理モデルを拡張して次式で記述するものとする。

$
  dv(theta_1, t) = omega - K sin(theta_1 - theta_2 + alpha) \
  dv(theta_2, t) = omega - K sin(theta_2 - theta_1 + alpha)
$

このとき、問1-2の位相差を安定平衡点として説明するαの条件を求めよ。
ただし、$omega$ および $K$ は正の値とする。

=== 解答

位相差を $phi = theta_1 - theta_2$ とおく。すると、

$
  dv(phi, t) = dv(theta_1, t) - dv(theta_2, t)
$

となる。

$
  dv(phi, t) & = (omega - K sin(theta_1 - theta_2 + alpha)) - (omega - K sin(theta_2 - theta_1 + alpha)) \
             & = -K sin(phi + alpha) + K sin(-phi + alpha) \
             & = K (sin(alpha - phi) - sin(alpha + phi))
$

ここで三角関数の公式

$
  sin A - sin B = 2 cos (A+B)/2 sin (A-B)/2
$

を用いることにより、

$
  sin(alpha - phi) - sin(alpha + phi) = 2 cos alpha sin (-phi) = -2 cos alpha sin phi
$

が得られる。
よって、

$
  dv(phi, t) = -2 K cos alpha sin phi
$

となる。

平衡点は $-2K cos alpha sin phi = 0$ を満たす $phi$ である。

$K > 0$ なので、$cos alpha != 0$ なら $sin phi = 0$

すなわち、$phi = 0, pi (mod 2pi)$ が平衡点である。

前問 1-2 より、交互に鳴く状態は、$phi = pi$ なので、これが安定かどうか調べればよい。

$
  g(phi) = -2 K cos alpha sin phi
$

とおくと、

$
  g'(phi) = -2 K cos alpha cos phi
$

である。

$phi = pi$ では $cos pi = -1$ なので

$
  g'(pi) = -2 K cos alpha (-1) = 2 K cos alpha
$

となる。

安定平衡点となる条件は、$g'(pi) < 0$ であるから、

$
  2 K cos alpha < 0 \
  therefore cos alpha < 0
$

を得る。$0 <= alpha < 2 pi$ の範囲で書けば、

$
  pi / 2 < alpha < 3 / 2 pi
$
