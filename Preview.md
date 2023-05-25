# 我测! —— 度量世界

<https://github.com/InnocentFIVE/I-Measure>
小飞舞
2023 | 05 | 25

## 摘要

这是一篇科普风格的文章. 因此对于文中所述定理, 我并不会全部给出证明[^1]. 大多数具体的证明可见[^Folland99].

这篇文章的本意是想要把一些测度的构造说清楚, 诚然, 测度的构造有许多种路径, 本文只是选取笔者最熟悉的一种路径, 同时对构造中所遇障碍以及对测度的积分进行一些阐述: 第一到第六节循序渐进地阐述了标准的实分析内容: 测度的构造, 延拓和 Lebesgue 测度; 第七节按照惯例阐述对测度的积分, 但自然而然地, 对积分的介绍不可避免地变得相当冗长, 几乎用了全文的一半内容才堪堪完成任务. 本文另一个特殊的点是注释繁多: 主要用于介绍测度相关的其余内容和一些对积分, 求导的处理, 终究是实分析的主干内容之一, 但因各种原因含量远超预算, 此主要由于笔者写作风格随性所致. 虽言"写科普要做减法", 但笔者无法合理地处理注释的删减, 因此在此版本中保留了所有注释, 并将其置于文末以便提升正文阅读体验. 虽然, 但笔者仍然认为注释是本文中相当有趣的一部分, 笔者在此记录了不少自身的理解以及某些板块之间的联系(以及可爱猫猫的图片), 某种意义上也算是(超大量的)饭后甜品, 食之无妨.

因笔者能力有限, 故差错难以避免, 还望读者海涵.

---

## 引论

> 少女祈祷中......

测度(measure)一词可望文生义地理解为对集合"大小"之描述. 如: 从古希腊时期始, 数学家们就为了给出圆的面积做了许多工作; 而放到现在来看, 面积, 体积, 长度等描述其实都是 Lebesgue 测度上在良好性质集合下之限制. 为了避免把路走窄, 我们并不会从 Lebesgue 测度开始引入. 而是先介绍另一种"离散"的测度.

**定义** *(计数测度)* 令 $X$ 是集合, $\mathcal P(X)$ 是集合的子集所构成的集合, 也即"幂集". 定义函数 $\operatorname{card}:\mathcal P(X)\to \mathbb Z_{\geqslant 0}\cup\left\{ \infty \right\}$. 返回集合中元素个数, 若集合无穷则返回 $\infty$[^2]. <span style="float:right;">⌟</span>

诚然, 这是一种粗糙的测量集合的方法, 我们现在应该从中提取和一般"体积", "面积"之类描述相同的性质以为己用. 事实上, 我们并不会多关注这个测度, 将这个测度放在一开始的初衷在于让大家看到测度的其他潜能, 这种潜能我们会在后续的描述中逐步揭晓.

"测度"的性质, Ver.1
: 古老的测度是用来描述圆, 正方形这类几何对象的, 从现在的观点上看, 这些对象只是 $\mathbb R^2$ 上的良好子集, 因此不妨设有一个大空间 $X$, 而测度描述其子集返回一个正数(或者 $\infty$). 也即 $\mu :\mathcal P(X)\to [\,0,\infty\,]$.
: 测度应该满足一定意义上的"可加性", 直观上来看就是两个不交的几何对象的体积应该是其体积之和. 也即:
$$
A\cap B=\varnothing\implies \mu (A\cup B)=\mu (A)+\mu (B).
$$
当然这性质可以归纳到有限个两两不交集合的情形, 我们称此性质为"有限可加性".
: 对于 $\mathbb R^n$ 中的测度, 还应该满足旋转, 平移不变性. 更一般地, 它也应当有合理的伸缩性质, 也即:
          若 $T$ 是 $\mathbb R^n$ 上的线性变换, 那么应当有 $\mu (T(E)) = |\!\det T|\cdot \mu (E)$. 此处我们稍稍利用了下 $\mathbb R^n$ 上线性变换的几何直观.

直觉告诉我们这个"测度"的性质, 或依赖该性质的定义是没有什么太大的意义的, 否则也不会出现在本文的开头. 问题出现在有限可加性与旋转, 平移不变性之间. 在 1924 年, S. Banach and A. Tarski 在一篇令人惊讶的论文 *Sur la decomposition des ensembles de points en parties respectivement congruentes* 中证明了这样的事实:

**定理** *(S. Banach, A. Tarski)* 令 $A$, $B$ 是 $\mathbb R^n$ 中的开集, 其中 $n\geqslant 3$. 则我们可以将 $A$, $B$ 分为同样多份: $A_1$, $\dots$ , $A_k$, $B_1$, $\dots$ , $B_k$ 且 $A_i$ 两两不交, $B_i$ 亦然. 且各 $A_i$ 可由 $B_i$ 旋转, 平移得到[^3]. <span style="float:right;">⌟</span>

这个定理一般被称为 Banach--Tarski 定理, 或者在现在网络的普及下, "*分球悖论*"这个名字流传更为广泛. 证明这定理的过程需要用到一个叫做选择公理的集合论假设, 通俗来说其保证了无穷个集合的 Cartesian 积的存在性.

因此我们的有限可加"测度"幻梦在这机械降神下突然破灭. 这启迪我们, $\mathbb R^n$ 并非那么单纯. 我们需要削减测度的要求才能继续向前.

思来想去, 既然连"有限可加"那么"显然"的性质都会在选择公理的作用下毁灭, 那咱不如摆烂: 直接讨论所有"可测"的集合, 换句话说就是我无论怎么玩弄都不会产生任何悖论的集合. 而如何得到这样的集合就是一个重点.

在引入"可测集合"的概念之前, 我们仍需引入测度. 考虑到我们可能需要在一些特殊的可数集上面做文章: 比如 $\mathbb Q$ 之类, 亦或者能够对更多的集合(尤其是与可数个小集合的并相关)都保有良好的性质, 我们处理测度时会把"有限可加性"加强为"可数可加性", 也即: 若 $\{A_n\}_{n\geqslant 0}$ 两两不交, 则 $\mu (\bigcup_{n\geqslant 0} A_n) = \sum_{n\geqslant 0} \mu (A_n)$.

"测度"的性质, Ver.2
: $\mu :\mathcal M_\mu\to [\,0,\infty\,]$. 其中 $\mathcal M_\mu$ 是性质良好集合的集合.
: $\{A_n\}_{n\geqslant 0}$ 两两不交, $\mu (\bigcup_{n\geqslant 0} A_n) = \sum_{n\geqslant 0} \mu (A_n)$.
: 我们稍稍加上一个新的假设: $\mu (\varnothing) = 0$\endnote{事实上在第二款中令 $A_n=\varnothing$, 则有"$\mu (\varnothing)=\infty\varnothing \implies \mu (\varnothing)=0$ 或 $\mu (\varnothing)=\infty$."}. 因为测度函数返回的值最好不要太大.

这已经是我们现在处理的测度了, 不过我们需要知道 $\mathcal M_\mu$ 到底是什么.

## $\boldsymbol{\sigma}$-代数

> 选择公理? 是不可能承认的, 这辈子都不可能承认的!

关于这个"可测集合", 我们暂且先放一边. 测度的可数可加性意味着如果 $\{A_n\}_{n\geqslant 0}\in\mathcal M_\mu$ 且两两不交, 则 $\bigcup_{n\geqslant 0} A_n \in \mathcal M_\mu$.

另外地, "可测集合"乃是一种"信息集", 如何我们令测度 $\mu : \mathcal M_\mu\to [\,0,1\,]$, $\mu (X)=1$. 则 $\mu (A)$ 其实是 $A$ 在 $X$ 中的占比, 亦或者是发生 $A$ 事件的概率. 因此"可测集合"有时可以认为是一些事件的集合. 这意味着我们也要考虑 $A^\complement$ 的测度, 其中 $A^\complement$ 是 $A$ 的补集.

我们把这些东西归结如下:

**定义** *(($\sigma$-)代数)* 令 $X$ 是集合, $\mathcal M \subseteq \mathcal P(X)$ 若满足以下条件:

- $\varnothing\in \mathcal M$;
- $A\in\mathcal M\implies A^\complement\in \mathcal M$;
- $A$, $B\in \mathcal M\implies A\cup B\in\mathcal M$.

我们管这样的集合称为代数, 如果还满足 $\{A_n\}_{n\geqslant 0}\subseteq\mathcal M$, $\bigcup_{n\geqslant 0} A_n\in\mathcal M$. 则我们管它叫 $\sigma $-代数. 同时, 由于$\sigma $-代数和测度联系在一起, 我们命 $(X,\mathcal M)$ 为测度空间. <span style="float:right;">⌟</span>

由此可见, 我们的``可测集''至少得构成一个 $\sigma $-代数, 这样才有比较丰富的讨论价值. 但问题是, $\sigma $-代数是不好处理的------其上面的定义并不能让我们有直观感受, 我们在此举一些例子:

- **平凡的例子**: 比如说 $\mathcal P(x)$ 本身或者 $\{\varnothing,X\}$.
- **可数-余可数 $\boldsymbol\sigma $-代数** 令 $\mathcal M=\bigl\{\,A\subseteq X\bigm| A\text{ 可数或~} A^\complement\text{ 可数}\,\bigr\}$.

考虑到 $\sigma $-代数的抽象性, 我们急需使用新的方法来表征 $\sigma $-代数, 这个方法其实就是老生常谈的``生成''. 我们先回顾下($\mathbb F$ 上)线性空间的生成:

一组向量 $b_1,\dots,b_n$ 生成的子空间是包含 $b_1,\dots,b_n$ 的最小子空间, 而这个子空间有明确的构造:
$$
\left<b_1,\dots,b_n \right> \coloneqq \biggl\{\, \sum_{j=1}^n x_jb_j \biggm| x_1,\dots,x_n\in\mathbb F \,\biggr\}.
$$

因此对这个``子空间''的研究可以通过对 $b_1,\dots,b_n$ 的研究来实现. 至于对无穷个(甚至不可数个)向量 $\{b_\alpha \}_{\alpha\in A}$ 张成的子空间, 我们并不能那么方便地构造, 而且构造方法和有限情形有不少区别, 我们唯一知道的情形是其生成的子空间是包含这无穷个向量的最小子空间, 因此我们只能定义为:

$$
\mathop{\text{``min\kern-.1ex''}}\bigl\{\,E \textit{ 是子空间} \bigm| \forall\alpha\in A,\, b_ \alpha \in E\,\bigr\}.
$$

为了实现这里的 $\min$, 由于子空间的任意交都是子空间. 因此所有子空间的交必然会退化到最小的那一个子空间:
$$
\mathop{\text{``min\kern-.1ex''}}\bigl\{\,E \textit{ 是子空间} \mid \forall\alpha\in A,\,b_\alpha \in E\,\bigr\} = \bigcap_{E,\textit{子空间}\atop \mkern-8mu\forall\alpha\in A, b_ \alpha \in E\mkern-8mu}E.
$$

回到对 $\sigma $-代数的处理上来, 由于 $\sigma $-代数的任意交仍然是 $\sigma $-代数. 因此定义由子集生成的 $\sigma $-代数为:
