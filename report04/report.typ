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

== 1

次の連立微分方程式を線形の状態方程式で表しなさい．

$
  accent(x, dot.double)_1 + 2 accent(x, dot)_1 + 3 accent(x, dot)_2 + 4 x_1 + 5 x_2 & = 2 u_1 + u_1 \
  accent(x, dot.double)_2 + 6 accent(x, dot)_1 + 7 accent(x, dot)_2 + 8 x_1 + 9 x_2 & = 3 u_2
$

=== 解答

== 2

以下の図で示されるような横につながった 2 つのタンクの水位システムを考える．
それぞれのタンクの断面積を $A_1, A_2$，単位時間あたりに流入する流量を $q_(1i), q_(2i)$，流出する流量を $q_(1o), q_(2o)$，タンクの水位を $h_1, h_2$ とする．
また，$k_1, k_2, k_3$ を定数として，$q_(1o) = k_1 sqrt(h_1), q_(2o) = k_2 sqrt(h_2), q_(21) = k_3 sqrt(|h_2 - h_1|) dot sgn(h_2 - h_1)$ の関係が成り立つものとする．

このとき，(1) このタンクの水位の変動を表す連立方程式を求め，(2) 平衡状態（$h_(10), h_(20)$ のように添え字 $0$ をつけることとし、$h_(20) > h_(10)$ が成立）からの微小変動に関して線形化した状態方程式を求めなさい．

#figure(
  image("fig01.jpg", width: 50%),
)

=== 解答
