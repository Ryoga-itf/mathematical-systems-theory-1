#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#import "@preview/physica:0.9.2": *
#import "@preview/cetz:0.5.0"

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第2回 レポート課題",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2026 年 4 月 23 日",
)

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

== 2-3

今回の 3 匹のモデルで別の条件ないしは拡張したモデルについて、平衡点を 1 つ指定しその安定性を示せ。
なお、平衡点が不安定でも安定であってもよいが、自身で立てた問いの難易度やカエルの行動との関連性をふまえて採点する。

=== 解答

