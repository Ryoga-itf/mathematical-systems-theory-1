#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#import "@preview/physica:0.9.2": *
#import "@preview/cetz:0.5.0"

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第4回 レポート課題",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2026 年 5 月 21 日",
)

#set footnote(numbering: sym.dagger + "1")
#set math.mat(delim: "[", gap: 0.5em)

== 1

次の連立微分方程式を線形の状態方程式で表しなさい．

$
  accent(x, dot.double)_1 + 2 accent(x, dot)_1 + 3 accent(x, dot)_2 + 4 x_1 + 5 x_2 & = 2 u_1 + u_1 \
  accent(x, dot.double)_2 + 6 accent(x, dot)_1 + 7 accent(x, dot)_2 + 8 x_1 + 9 x_2 & = 3 u_2
$

=== 解答

状態変数を

$
  z = mat(z_1; z_2; z_3; z_4) = mat(x_1; x_2; accent(x, dot)_1; accent(x, dot)_2), space u = mat(u_1; u_2)
$

とする。
このとき、

$
  accent(z, dot)_1 & = z_3 \
  accent(z, dot)_2 & = z_4
$

である。また、元の式を $accent(x, dot.double)_1, accent(x, dot.double)_2$ について解くと、

$
  accent(x, dot.double)_1 = -4 x_1 - 5 x_2 - 2 accent(x, dot)_1 - 3 accent(x, dot)_2 + 2 u_1 + u_2 \
  accent(x, dot.double)_2 = -8 x_1 - 9 x_2 - 6 accent(x, dot)_1 - 7 accent(x, dot)_2 + 3 u_2
$

したがって、

$
  accent(z, dot) = A z + B u
$

として、

$
  accent(z, dot) = mat(
    0, 0, 1, 0;
    0, 0, 0, 1;
    -4, -5, -2, -3;
    -8, -9, -6, -7
  ) z + mat(
    0, 0;
    0, 0;
    2, 1;
    0, 3
  ) u
$

となる。

== 2

以下の図で示されるような横につながった 2 つのタンクの水位システムを考える．
それぞれのタンクの断面積を $A_1, A_2$，単位時間あたりに流入する流量を $q_(1i), q_(2i)$，流出する流量を $q_(1o), q_(2o)$，タンクの水位を $h_1, h_2$ とする．
また，$k_1, k_2, k_3$ を定数として，$q_(1o) = k_1 sqrt(h_1), q_(2o) = k_2 sqrt(h_2), q_(21) = k_3 sqrt(|h_2 - h_1|) dot sgn(h_2 - h_1)$ の関係が成り立つものとする．

このとき，(1) このタンクの水位の変動を表す連立方程式を求め，(2) 平衡状態（$h_(10), h_(20)$ のように添え字 $0$ をつけることとし、$h_(20) > h_(10)$ が成立）からの微小変動に関して線形化した状態方程式を求めなさい．

#figure(
  image("fig01.jpg", width: 50%),
)

=== 解答

==== (1)

タンク 1 について、流入は $q_(1i)$ と $q_(21)$、流出は $q_(1o)$ である。
したがって、

$
  A_1 accent(h, dot)_1 = q_(1i) - q_(1o) + q_(21)
$

タンク 2 について、流入は $q_(2i)$、流出は $q_(2o)$ と $q_(21)$ である。
したがって、

$
  A_2 accent(h, dot)_2 = q_(2i) - q_(2o) - q_(21)
$

ここで、問題文により、

$
  q_(1o) = k_1 sqrt(h_1) \
  q_(2o) = k_2 sqrt(h_2) \
  q_(21) = k_3 sqrt(|h_2 - h_1|) sgn(h_2 - h_1)
$

である。

よって、水位の非線形連立微分方程式は、

$
  accent(h, dot)_1 & = 1 / A_1 [ q_(1i) - k_1 sqrt(h_1) + k_3 sqrt(|h_2 - h_1|) sgn(h_2 - h_1) ] \
  accent(h, dot)_2 & = 1 / A_2 [ q_(2i) - k_2 sqrt(h_2) + k_3 sqrt(|h_2 - h_1|) sgn(h_2 - h_1) ]
$

==== (2)

平衡状態を $h_1 = h_(10), space h_2 = h_(20)$ とし、問題文より $h_(20) > h_(10)$ とする。

このとき、平衡点近傍では $h_2 - h_1 > 0$ とみなせるので、

$
  q_(21) = k_3 sqrt(h_2 - h_1)
$

である。

微小変動を

$
     Delta h_1 & = h_1 - h_(10) \
     Delta h_2 & = h_2 - h_(20) \
  Delta q_(1i) & = q_(1i) - q_(1 i 0) \
  Delta q_(2i) & = q_(2i) - q_(2 i 0) \
$

とおく。また、

$
  d_0 = h_(20) - h_(10)
$

とおく。

非線形方程式を平衡点まわりで 1 次近似する。

まずタンク 1 について、

$
  accent(h, dot)_1 = 1 / A_1 [ q_(1i) - k_1 sqrt(h_1) + k_3 sqrt(h_2 - h_1) ]
$

である。各偏微分は

$
     pdv(accent(h, dot)_1, h_1) & = 1 / A_1 ( - k_1 / (2 sqrt(h_(10))) - k_3 / (2 sqrt(d_0)) ) \
     pdv(accent(h, dot)_1, h_2) & = 1 / A_1 k_3 / (2 sqrt(d_0)) \
  pdv(accent(h, dot)_1, q_(1i)) & = 1 / A_1
$

である。
次にタンク 2 について、

$
  accent(h, dot)_2 = 1 / A_2 [ q_(2i) - k_2 sqrt(h_2) - k_3 sqrt(h_2 - h_1) ]
$

である。各偏微分は、

$
     pdv(accent(h, dot)_2, h_1) & = 1 / A_2 k_3 / (2 sqrt(d_0)) \
     pdv(accent(h, dot)_2, h_2) & = 1 / A_2 ( - k_2 / (2 sqrt(h_(20))) - k_3 / (2 sqrt(d_0)) ) \
  pdv(accent(h, dot)_2, q_(2i)) & = 1 / A_2
$

である。
したがって、状態変数と入力を、

$
  x = mat(Delta h_1; Delta h_2), space u = mat(Delta q_(1i); Delta q_(2i))
$

とすると、線形化した状態方程式は、

$
  accent(x, dot) = mat(
    - k_1 / (2 A_1 sqrt(h_(10))) - k_3 / (2A_1 sqrt(d_0)), k_3 / (2 A_1 sqrt(d_0));
    k_3 / (2 A_2 sqrt(d_0)), - k_2 / (2 A_2 sqrt(h_(20))) - k_3 / (2 A_2 sqrt(d_0))
  ) x + mat(
    1 / A_1, 0;
    0, 1 / A_2
  ) u
$

ただし、$d_0 = h_(20) - h_(10)$ である。
