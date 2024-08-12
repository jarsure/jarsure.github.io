---
title: "Flexbox简介"
description: 
date: 2024-08-12T17:41:09+08:00
image: ti.jpg
math: 
license: 
hidden: false
comments: true
draft: false
categories: ["前端","css","flexbox","flex"]
tags: ["前端","css","flexbox","flex"]
keywords: ["前端","css","flexbox","flex"]
---



## Flexbox 简介

Flexbox（Flexible Box）是一种 CSS 布局模式，旨在更好地排列和对齐容器中的子元素，特别是在容器的大小未知或动态变化时。Flexbox 布局的主要思想是让容器的子元素能够“弹性”地填充空间，并且能够轻松地调整元素之间的间距。

### Flex 容器与子元素

要使用 Flexbox 布局，首先需要将容器设为 `flex` 容器。容器的子元素会自动成为 `flex` 项目（flex items）。

```
css复制代码.container {
    display: flex;
}
```

## 容器属性

### 1. `flex-direction`

决定主轴（主轴是定义子元素排列方向的轴）的方向。

- `row` (默认): 子元素按行排列（从左到右）。
- `row-reverse`: 子元素按行反向排列（从右到左）。
- `column`: 子元素按列排列（从上到下）。
- `column-reverse`: 子元素按列反向排列（从下到上）。

```
css复制代码.container {
    display: flex;
    flex-direction: row; /* or row-reverse, column, column-reverse */
}
```

### 2. `flex-wrap`

决定子元素是否可以在容器中换行。

- `nowrap` (默认): 所有子元素保持在同一行或列中，不换行。
- `wrap`: 子元素在必要时换行。
- `wrap-reverse`: 子元素在必要时换行，但换行的顺序反向。

```
css复制代码.container {
    display: flex;
    flex-wrap: wrap; /* or nowrap, wrap-reverse */
}
```

### 3. `justify-content`

控制子元素在主轴方向上的对齐方式。

- `flex-start` (默认): 子元素靠起始端对齐。
- `flex-end`: 子元素靠末端对齐。
- `center`: 子元素在主轴上居中对齐。
- `space-between`: 子元素之间平均分配空间，首个元素靠起始端，最后一个元素靠末端对齐。将子元素沿主轴均匀分布，每个子元素之间的间距相等，但是第一个子元素与容器的起始端之间没有间距，最后一个子元素与容器的末尾端之间也没有间距。这意味着空白空间仅在子元素之间进行分配。
- `space-around`: 子元素之间以及子元素与容器边缘之间的空间均匀分布。
- `space-evenly`: 将子元素沿主轴均匀分布，每个子元素之间的间距相等，同时第一个子元素与容器的起始端和最后一个子元素与容器的末尾端之间的间距也相等。这意味着空白空间将平均分配给所有子元素。

space-between和space-evenly的区别: 简单来说，两者的区别在于对容器两端的间距处理。`space-evenly` 会在容器两端和子元素之间均匀分配空白空间，而 `space-between` 只在子元素之间均匀分配空白空间，容器两端没有额外的间距。

```
css复制代码.container {
    display: flex;
    justify-content: center; /* or flex-start, flex-end, space-between, space-around */
}
```

### 4. `align-items`

控制子元素在交叉轴（与主轴垂直的轴）方向上的对齐方式。

- `stretch` (默认): 子元素在交叉轴上拉伸以填充容器。
- `flex-start`: 子元素靠交叉轴的起始端对齐。
- `flex-end`: 子元素靠交叉轴的末端对齐。
- `center`: 子元素在交叉轴上居中对齐。
- `baseline`: 子元素基于其内容的基线对齐。

```
css复制代码.container {
    display: flex;
    align-items: center; /* or flex-start, flex-end, stretch, baseline */
}
```

### 5. `align-content`

控制多行子元素在交叉轴上的对齐方式。适用于有多行子元素的情况。

- `stretch` (默认): 各行均匀拉伸以填充容器。
- `flex-start`: 各行靠交叉轴的起始端对齐。
- `flex-end`: 各行靠交叉轴的末端对齐。
- `center`: 各行在交叉轴上居中对齐。
- `space-between`: 各行之间的空间平均分配，第一行靠起始端，最后一行靠末端。
- `space-around`: 各行之间以及与容器边缘之间的空间均匀分布。

```
css复制代码.container {
    display: flex;
    align-content: center; /* or flex-start, flex-end, space-between, space-around, stretch */
}
```

## 子元素属性

### 1. `order`

控制子元素在容器中的排列顺序，默认值为 `0`。可以设置正值或负值来调整顺序。

```
css复制代码.item {
    order: 1; /* Change the order of the item */
}
```

### 2. `flex-grow`

定义子元素的可伸展比例，默认值为 `0`，表示子元素不伸展。大于 `0` 的值表示子元素会根据剩余空间进行伸展。

```
css复制代码.item {
    flex-grow: 1; /* Item will grow to fill the space */
}
```

### 3. `flex-shrink`

定义子元素的收缩比例，默认值为 `1`，表示子元素可以收缩。设置为 `0` 则表示子元素不会收缩。

```
css复制代码.item {
    flex-shrink: 1; /* Item will shrink if needed */
}
```

### 4. `flex-basis`

设置子元素的初始主轴尺寸。可以是长度单位（如 `px`, `em`）或 `auto`。

```
css复制代码.item {
    flex-basis: 100px; /* Initial size of the item */
}
```

### 5. `align-self`

允许子元素单独调整在交叉轴上的对齐方式，覆盖 `align-items` 属性。

- `auto` (默认): 继承 `align-items` 的值。
- 其他值同 `align-items`。

```
css复制代码.item {
    align-self: flex-end; /* or flex-start, center, baseline, stretch */
}
```

## 常见布局示例

### 1. 水平居中

```
css复制代码.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height */
}
```

### 2. 垂直居中

```
css复制代码.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    height: 100vh;
}
```

### 3. 等间距布局

```
css复制代码.container {
    display: flex;
    justify-content: space-between;
}
```

### 4. 响应式网格布局

```
css复制代码.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}
.item {
    flex-basis: calc(33.333% - 20px);
    margin: 10px;
}
```

## 结论

Flexbox 是一种功能强大且直观的布局工具，适用于各种响应式布局和复杂的对齐需求。通过结合使用容器和子元素的属性，可以创建灵活、可调整的布局。希望这份文档对你理解和使用 Flexbox 有所帮助！