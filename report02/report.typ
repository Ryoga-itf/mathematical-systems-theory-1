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

== 2-2

$K_12 = K_23 = K$ かつ $K_13 = 0$ のとき、$(phi_12, phi_13) = (pi, 0)$ が安定平衡点になることを示せ。

=== 解答

== 2-3

今回の 3 匹のモデルで別の条件ないしは拡張したモデルについて、平衡点を 1 つ指定しその安定性を示せ。
なお、平衡点が不安定でも安定であってもよいが、自身で立てた問いの難易度やカエルの行動との関連性をふまえて採点する。

=== 解答

