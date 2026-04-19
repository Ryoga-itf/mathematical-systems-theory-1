#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#import "@preview/physica:0.9.2": *
#import "@preview/cetz:0.5.0"

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

=== 解答

位相差 $phi$ について、

$
  dv(phi, t) = Delta omega - K sin phi
$

平衡点は

$
  dv(phi, t) = 0
$

を満たす $phi$ である。
すなわち、

$
  Delta omega - K sin phi = 0 \
  therefore sin phi = (Delta omega) / K
$

を満たす $phi$ が平衡点である。

$sin phi$ の値域は $-1 <= sin phi <= 1$ であるから、平衡点が存在するためには

$
  -1 <= (Delta omega) / K <= 1
$

よって、

$
  -K <= Delta omega <= K
$

が必要である。
今回 $Delta omega < 0$ の場合を考えるため、

- $Delta omega < -K$ では平衡点が存在しない
- $-K < Delta omega < 0$ では平衡点が 2 つ存在
- $Delta omega = -K$ では平衡点が 1 つに重なる

ことがわかる。

$Delta omega < 0$ より、$sin phi < 0$ を満たす範囲に平衡点がある。
位相差は $2 pi$ 周期なので、$-pi <= phi <= 0$ を代表の区間と取ると、2 つの平衡点は、

$
  phi_1 & = arcsin((Delta omega) / K)        &     (- pi/2 < phi < 0) \
  phi_2 & = - pi - arcsin((Delta omega) / K) & (-pi < phi < - pi / 2)
$

と書ける。
ここで、

$
  f(phi) = Delta omega - K sin phi
$

とおくと、

$
  f'(phi) = -K cos phi
$

であるから、安定平衡点の条件を考えると、$phi_1$ では、$f'(phi_1) = -K cos phi_1 < 0$
となり、これは安定平衡点。

一方 $phi_2$ では、$f'(phi_2) = -K cos phi_2 > 0$ となり、これは不安定平衡点。

$Delta omega = -K$ のとき、$sin phi = -1$ だから $phi = - pi / 2$

よって、分岐図は @fig1 のようになる。

#figure(
  cetz.canvas({
    import cetz.draw: *

    let pi-v = calc.pi

    let xmin = -1.15
    let xmax = 0.05
    let ymin = pi-v - 0.2
    let ymax = 2 * pi-v + 0.2

    let W = 12.0
    let H = 7.0

    let p = (x, y) => (
      (x - xmin) / (xmax - xmin) * W,
      (y - ymin) / (ymax - ymin) * H,
    )

    let n = 120
    let xs = range(n + 1).map(i => -1.0 + i * 1.0 / n)
    let stable = xs.map(x => p(x, 2 * pi-v + calc.asin(x).rad()))
    let unstable = xs.map(x => p(x, pi-v - calc.asin(x).rad()))

    rect((0, 0), (W, H), stroke: black + 0.5pt)

    for x in (-1.0, -0.8, -0.6, -0.4, -0.2, 0.0) {
      line(p(x, ymin), p(x, ymax), stroke: gray + 0.2pt)
    }
    for y in (pi-v, 3 * pi-v / 2, 2 * pi-v) {
      line(p(xmin, y), p(xmax, y), stroke: gray + 0.2pt)
    }

    // 安定枝
    line(..stable, stroke: (paint: blue, thickness: 1.2pt))

    // 不安定枝
    line(
      ..unstable,
      stroke: (
        paint: orange,
        thickness: 1.2pt,
        dash: "dashed",
      ),
    )

    circle(p(-1.0, 3 * pi-v / 2), radius: 1.8pt, fill: black)

    content((W, -0.6), [$Delta omega$])
    content((-0.5, H + 0.2), [$phi^*$])

    content((p(-1.0, ymin).at(0), -0.35), [$-K$])
    content((p(0.0, ymin).at(0), -0.35), [$0$])

    content((-0.4, p(xmin, pi-v).at(1)), [$-pi$])
    content((-0.7, p(xmin, 3 * pi-v / 2).at(1)), [$- 1 / 2 pi$])
    content((-0.5, p(xmin, 2 * pi-v).at(1)), [$O$])
  }),
  caption: [ホタルとライトのモデルの $Delta omega < 0$ の場合の分岐図],
) <fig1>

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
