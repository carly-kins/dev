# Bootstrap Grid System

00      01       02       03       04       05       06       07       08       09       10       11       12
┌────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┐
│``.col-12`` │``.col-12`` │.``col-12`` │``.col-12`` │``.col-12`` │``.col-12`` │``.col-12`` │``.col-12`` │``.col-12`` │``.col-12`` │``.col-12`` │``.col-12`` │ ``.row``
├────────┴────────┴────────┴────────┴────────┴────────┤────────┴────────┴────────┴────────┴────────┴────────┤
│``.col-6``                                               │ ``.col-6``                                              │ ``.row``
├───────────────────────────────────┬─────────────────┴─────────────────────────────────────────────────────┤
│``.col-4``                             │``.col-8``                                                                 │ ``.row``
├──────────────────────────┬────────┴─────────────────┬──────────────────────────┬──────────────────────────┤
│``.col-3``                    │``.col-3``                    │``.col-3``                    │``.col-3``                    │ ``.row``
└──────────────────────────┴──────────────────────────┴──────────────────────────┴──────────────────────────┘


How this works: 
1. Create a `<div class="container">`
2. In that container, create a `<div class="row">`
3. That `.row` will have some`.col`. The total of the numbers of the columns should = 12 
4. The size specified effects where it will wrap/no-wrap. 
    - ex. Columns start at 50% wide on mobile (they will stack) and bump up to 33.3% wide on desktop (they will not stack)

        ```
        <div class="row">
            <div class="col-6 col-md-4"></div>
            <div class="col-6 col-md-4"></div>
            <div class="col-6 col-md-4"></div>
        </div>
        ```


|                       	| **Xtra-Small** 	| **Small** 	| **Medium** 	| **Large** 	| **Xtra-Large** 	|
|-----------------------	|----------------	|-----------	|------------	|-----------	|----------------	|
| _Breakpoint_          	| <576px         	| ≥576px    	| ≥768px     	| ≥992px    	| ≥1200px        	|
| _Class prefix_        	| .col-          	| .col-sm-  	| .col-md-   	| .col-lg-  	| .col-xl-       	|
| _Max container Width_ 	| None (auto)    	| 540px     	| 720px      	| 960px     	| 1140px         	|

## Other Notes 

- Gutter width = 30px (15px on each side of a column)
- Nestable = Yes
- Column ordering = Yes
- Offsetting can be done with `.offset-md-* classes.` These classes increase the left margin of a column by * columns. For example, `.offset-md-4` moves .col-md-4 over four columns.
    - However, putting a `margin-left: auto;` or a `margin-right: auto;` may be better. In this case, the total column can equal < 12 if you nest the entire structure in a `.col-12`; the auto margin will fill in the rest.


        ```
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-6 col-md-2"></div>
                    <div class="col-6 col-md-2"></div>
                    <div class="col-6 col-md-2"></div> <!-- This one would have the  margin-left: auto;-->
                </div>
            </div>
        </div>
        ```
