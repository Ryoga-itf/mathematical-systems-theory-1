#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#import "@preview/physica:0.9.2": *
#import "@preview/cetz:0.5.0"

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第5回 レポート課題",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2026 年 5 月 28 日",
)

#set footnote(numbering: sym.dagger + "1")
#set math.mat(delim: "[", gap: 0.7em)

#let xx = $accent(x, dot)$

== 1

スカラーシステム $xx_1 (t) = a x_1(t) + b u_1(t)$ に対して状態フィードバックを用いた場合の、フィードバックゲインと閉ループ系の安定性について考察しなさい。

=== 解答

== 2

以下の状態方程式で表される 2 次のシステムに対し、ループ系の固有値（極）を $-3, -4$ に設定する状態フィードバックゲイン $F$ を求めなさい。

$
  xx(t) = mat(-2, 0; 1, -1) x(t) + mat(2, 0; 0, 1) u(t)
$

=== 解答

== 3

以下の状態方程式で表される 2 次のシステムを考える。

$
  mat(xx_1(t); xx_2(t)) = mat(0, 1; 0, -1) mat(x_1(t); x_2(t)) + mat(0; 1) u(t)
$

このシステムを安定化する状態フィードバック $u(t) = - f_1 x_1(t) - f_2 x_2(t)$ を、評価関数

$
  J = integral^infinity_0 { x_1(t)^2 + x_2(t)^2 + u(t)^2 } d t
$

を最小にするように求めなさい。

=== 解答

