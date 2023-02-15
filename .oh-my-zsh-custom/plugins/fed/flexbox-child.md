# Flexbox Children

---

For more info check out [Flexbox CSS Tricks](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

This guide is about the things inside the ``container``

## order

```
.item {
  order: 5; /* default is 0 */
}
```

┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐    │     ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ 
│ ``1``     │ │ ``1``     │ │ ``2``     │ │ ``3``     │    │     │ ``-1``    │ │ ``3``     │ │ ``100``   │ │ ``10000`` │
└───────┘ └───────┘ └───────┘ └───────┘    │     └───────┘ └───────┘ └───────┘ └───────┘

## flex 

This is the shorthad for flex-grow, flex-shrink, and flex-baisis

```
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

```
.item {
  align-self: auto | flex-start | flex-end | center | baseline | stretch;
}
```
