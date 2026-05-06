#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#import "@preview/physica:0.9.8": *
#import "@preview/cetz:0.5.0"

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第2回 レポート課題",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2026 年 4 月 23 日",
)

#set math.mat(gap: 0.5em)
#set footnote(numbering: sym.dagger + "1")

== 2-1.

2 つの位相差 $phi_12 = theta_1 - theta_2$ と $phi_13 = theta_1 - theta_3$ を導入する。
このとき、$"d" phi_12 \/ "dt"$ と $"d" phi_13 \/ "dt"$ を導出せよ。

=== 解答

講義資料のレポート課題に関する補足式により、

$
  dv(theta_1, t) & = omega + K_(12) sin(theta_1 - theta_2) + K_(13) sin(theta_1 - theta_3) \
  dv(theta_2, t) & = omega + K_(12) sin(theta_2 - theta_1) + K_(23) sin(theta_2 - theta_3) \
  dv(theta_3, t) & = omega + K_(13) sin(theta_3 - theta_1) + K_(23) sin(theta_3 - theta_2)
$

である。

ここで、

$
  theta_2 - theta_3 & = theta_2 - theta_1 + theta_1 - theta_3 \
                    & = -(theta_1 - theta_2) + (theta_1 - theta_3) \
                    & = - phi_(12) + phi_(13) \
                    & = phi_(13) - phi_(12) \
  theta_3 - theta_2 & = theta_(12) - theta_(13)
$

である。

したがって、

$
  dv(phi_12, t) = dv(theta_1, t) - dv(theta_2, t)
$

より、

$
  dv(phi_12, t) = 2 K_12 sin phi_12 + K_13 sin phi_13 + K_23 sin(phi_12 - phi_13)
$

が得られる。
同様に、

$
  dv(phi_13, t) = dv(phi_1, t) - dv(phi_3, t)
$

より、

$
  dv(phi_13, t) = K_12 sin phi_12 + 2 K_13 sin phi_13 - K_23 sin(phi_12 - phi_13)
$

が得られる。

== 2-2

$K_12 = K_23 = K$ かつ $K_13 = 0$ のとき、$(phi_12, phi_13) = (pi, 0)$ が安定平衡点になることを示せ。

=== 解答

前問 2-1 の結果に $K_12 = K_23 = K, K_13 = 0$ を代入すると、

$
  dv(phi_12, t) & = 2 K sin phi_12 + K sin (phi_12 - phi_13) \
  dv(phi_13, t) & = K sin phi_12 - K sin (phi_12 - phi_13)
$

となる。

ここで

$
  f(phi_12, phi_13) & = 2 K sin phi_12 + K sin (phi_12 - phi_13) \
  g(phi_12, phi_13) & = K sin phi_12 - K sin (phi_12 - phi_13)
$

とおく。
講義資料の手順によって平衡点 $(phi_12, phi_13) = (pi, 0)$ について確認する。
さっそくこれを代入すると、

$
  sin pi = 0, space sin(pi - 0) = sin pi = 0
$

であるから、

$
  f(pi, 0) = 0, space g(pi, 0) = 0
$

であり、確かに平衡点である。

次にヤコビ行列を求める。

$
  J =
  mat(pdv(f, phi_12), pdv(f, phi_13); pdv(g, phi_12), pdv(g, phi_13))
$

各成分は、

$
  pdv(f, phi_12) & = 2 K cos phi_12 + K cos(phi_12 - phi_13) \
  pdv(f, phi_13) & = -K cos(phi_12 - phi_13) \
  pdv(g, phi_12) & = K cos phi_12 - K cos(phi_12 - phi_13) \
  pdv(g, phi_13) & = K cos(phi_12 - phi_13)
$

である。

$(phi_12, phi_13) = (pi, 0)$ では $cos pi = -1, space cos(pi - 0) = cos pi = -1$

なので、

$
  J =
  mat(-3K, K; 0, -K)
$

となる。
これは、上三角行列なので、固有値は対角成分から

$
  lambda_1 = -3K, space lambda_2 = -K
$

である。

$K > 0$ より、

$
  lambda_1 < 0, space lambda_2 < 0
$

だから、$(phi_12, phi_13) = (pi, 0)$ は安定平衡点である。

== 2-3

今回の 3 匹のモデルで別の条件ないしは拡張したモデルについて、平衡点を 1 つ指定しその安定性を示せ。
なお、平衡点が不安定でも安定であってもよいが、自身で立てた問いの難易度やカエルの行動との関連性をふまえて採点する。

=== 解答

