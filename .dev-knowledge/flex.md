# Flexbox Containers

For more info check out [Flexbox CSS Tricks](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

Flexbox is applied to the container (usually a `<div>`) 

┌─────────────────────────────────────────┐
│ ``I'm a container!``                        │
└─────────────────────────────────────────┘
```css
.container {
  display: flex; /* or inline-flex */
}
```
In that container you have stuff. Flexbox determines how the things are arranged.

## flex-direction
```css
.container {
  flex-direction: row !default
}
```
``row``                                             ```row-reverse```
┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐         ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ 
│ ``1``     │ │ ``2``     │ │ ``3``     │ │ ``4``     │         │ ``4``     │ │ ``3``     │ │ ``2``     │ │ ``1``     │
└───────┘ └───────┘ └───────┘ └───────┘         └───────┘ └───────┘ └───────┘ └───────┘
---------------------->                                         <----------------------

``column``                                          ``column-reverse``
┌───────┐                                       ┌───────┐ 
│ ``1``     │ │                                     │ ``4``     │ ^                    
└───────┘ │                                     └───────┘ │
┌───────┐ │                                     ┌───────┐ │
│ ``2``     │ │                                     │ ``3``     │ │
└───────┘ │                                     └───────┘ │
┌───────┐ │                                     ┌───────┐ │
│ ``3``     │ │                                     │ ``2``     │ │
└───────┘ │                                     └───────┘ │
┌───────┐ │                                     ┌───────┐ │ 
│ ``4``     │ V                                     │ ``1``     │ │ 
└───────┘                                       └───────┘

## flex-wrap
By default, flex items will all try to fit onto one line. You can change that and allow the items to wrap as needed with this property.
```css
.container {
  flex-wrap: nowrap !default
}
```
- ``nowrap``: all flex items will be on one line
- ``wrap``: flex items will wrap onto multiple lines, from top to bottom.
- ``wrap-reverse``: flex items will wrap onto multiple lines from bottom to top.

## flex-flow
This is a shorthand for the flex-direction and flex-wrap properties, which together define the flex container’s main and cross axes. The default value is ``row nowrap``.
```css
.container {
  flex-flow: flex-direction flex-wrap;
}
```
## justify-content
```css
.container {
  justify-content: flex-start default! ... + safe | unsafe;
}
```
``flex-start``
┌───────────────────────────────────────────────────────────────────────────────────────┐
│┌───────┐ ┌───────┐ ┌───────┐                                                          │
││ ``1``     │ │ ``2``     │ │ ``3``     │                                                          │
│└───────┘ └───────┘ └───────┘                                                          │
└───────────────────────────────────────────────────────────────────────────────────────┘
``flex-end``
┌───────────────────────────────────────────────────────────────────────────────────────┐
│                                                          ┌───────┐ ┌───────┐ ┌───────┐│        
│                                                          │ ``1``     │ │ ``2``     │ │ ``3``     ││        
│                                                          └───────┘ └───────┘ └───────┘│       
└───────────────────────────────────────────────────────────────────────────────────────┘
``center``
┌───────────────────────────────────────────────────────────────────────────────────────┐
│                            ┌───────┐ ┌───────┐ ┌───────┐                              │
│                            │ ``1``     │ │ ``2``     │ │ ``3``     │                              │
│                            └───────┘ └───────┘ └───────┘                              │
└───────────────────────────────────────────────────────────────────────────────────────┘
``space-between``
┌───────────────────────────────────────────────────────────────────────────────────────┐
│┌───────┐                             ┌───────┐                               ┌───────┐│
││ ``1``     │                             │ ``2``     │                               │ ``3``     ││
│└───────┘                             └───────┘                               └───────┘│
└───────────────────────────────────────────────────────────────────────────────────────┘

- ``left``: items are packed toward left edge of the container, unless that doesn’t make sense with the flex-direction, then it behaves like start.
- ``right``: items are packed toward right edge of the container, unless that doesn’t make sense with the flex-direction, then it behaves like end.
- ``space-around``: items are evenly distributed in the line with equal space around them. Note that visually the spaces aren’t equal, since all the items have equal space on both sides. The first item will have one unit of space against the container edge, but two units of space between the next item because that next item has its own spacing that applies.
- ``space-evenly``: items are distributed so that the spacing between any two items (and the space to the edges) is equal.

## align-items
```css
.container {
  align-items: stretch !default + ... safe | unsafe;
}
```

``stretch``                         ``flex-start``
┌────────┬────────┬────────┐    ┌────────┬────────┬────────┐
│ ``1``      │ ``2``      │ ``3``      │    │ ``1``      │ ``2``      │ ``3``      │
│        │        │        │    ├────────│        │────────┤  
│        │        │        │    │        │        │        │
│        │        │        │    │        └────────┘        │
│        │        │        │    │                          │
│        │        │        │    │                          │
│        │        │        │    │                          │
│        │        │        │    │                          │
│        │        │        │    │                          │
└────────┴────────┴────────┘    └──────────────────────────┘

``flex-end``                        ``center``
┌──────────────────────────┐    ┌──────────────────────────┐
│                          │    │                          │
│                          │    │                          │
│                          │    │        ┌────────┐        │
│                          │    │────────┤        │────────┤
│                          │    │ ``1``      │ ``2``      │ ``3``      │
│        ┌────────┐        │    │────────┤        │────────┤      
│        │        │        │    │        └────────┘        │ 
├────────│        │────────┤    │                          │ 
│ ``1``      │ ``2``      │ ``3``      │    │                          │
└────────┴────────┴────────┘    └──────────────────────────┘ 

``basline``                       
┌──────────────────────────┐
│                          │
│                          │
│        ┌────────┐        │
│────────┤        │────────┤
│ ``text``   │ ``text``   │ ``text``   │
│──────────────────────────┤      
│        │────────┘        │ 
│────────┘                 │ 
│                          │
└──────────────────────────┘ 

- ``first baseline``
- ``last baseline``
- ``space-around``
- ``space-evenly``

## align-content
This aligns a flex container’s lines within when there is extra space in the cross-axis, similar to how ``justify-content`` aligns individual items within the main-axis.
```css
.container {
  align-content: flex-start + ... safe | unsafe;
}
```
>Note: This property only takes effect on multi-line flexible containers, where flex-wrap is set to either wrap or wrap-reverse). A single-line flexible container (i.e. where flex-wrap is set to its default value, no-wrap) will not reflect align-content.

- ``normal (default)``: items are packed in their default position as if no value was set.
- ``flex-start / start``: items packed to the start of the container. The (more supported) flex-start honors the flex-direction while start honors the writing-mode direction.
- ``flex-end / end``: items packed to the end of the container. The (more support) flex-end honors the flex-direction while end honors the writing-mode direction.
- ``center: items`` centered in the container
- ``space-between``: items evenly distributed; the first line is at the start of the container while the last one is at the end
- ``space-around``: items evenly distributed with equal space around each line
- ``space-evenly``: items are evenly distributed with equal space around them
- ``stretch``: lines stretch to take up the remaining space

## gap, row-gap, column-gap
The gap property explicitly controls the space between flex items. It applies that spacing only between items not on the outer edges.
```css
.container {
  display: flex;
  ...
  gap: 10px;
  gap: 10px 20px; /* row-gap column gap */
  row-gap: 10px;
  column-gap: 20px;
}
```
The behavior could be thought of as a minimum gutter, as if the gutter is bigger somehow (because of something like ``justify-content: space-between;``) then the gap will only take effect if that space would end up smaller.

It is not exclusively for flexbox, gap works in grid and multi-column layout as well.


# Flexbox Children

For more info check out [Flexbox CSS Tricks](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

This guide is about the things inside the ``container``

## order
```css
.item {
  order: 5; /* default is 0 */
}
```
┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐     │     ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ 
│ ``1``     │ │ ``1``     │ │ ``2``     │ │ ``3``     │     │     │ ``-1``    │ │ ``3``     │ │ ``100``   │ │ ``10000`` │
└───────┘ └───────┘ └───────┘ └───────┘     │     └───────┘ └───────┘ └───────┘ └───────┘

## flex 
This is the shorthad for flex-grow, flex-shrink, and flex-baisis
```css
.item {
  flex: none | [ <'flex-grow'> <'flex-shrink'>? || <'flex-basis'> ]
}
```
┌───────┐ ┌───────────┐ ┌───────┐ ┌───────┐
│ ``1``     │ │ ``2``         │ │ ``1``     │ │ ``1``     │
└───────┘ └───────────┘ └───────┘ └───────┘

> What is flex baisis? 

>This defines the default size of an element before the remaining space is distributed. It can be a length (e.g. 20%, 5rem, etc.) or a keyword. The auto keyword means “look at my width or height property” (which was temporarily done by the main-size keyword until deprecated). The content keyword means “size it based on the item’s content” – this keyword isn’t well supported yet, so it’s hard to test and harder to know what its brethren max-content, min-content, and fit-content do.

>If set to 0, the extra space around content isn’t factored in. If set to auto, the extra space is distributed based on its ``flex-grow`` value.

## align-self
override the ``align-items`` specified at the container level 
```css
.item {
  align-self: auto | flex-start | flex-end | center | baseline | stretch;
}
```
keywords: flex-box flex css