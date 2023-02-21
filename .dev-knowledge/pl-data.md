# Mustache, HBS, JSON, And Patternlab

More information of Patterlab can be found at https://patternlab.io/docs/overview-of-patterns/

This guide covers both Mustache and HBS syntax. Note you can use mustache syntax within .hbs files. 

## **{{ text }}**

1. Put value of JSON "text" here
    ```html

    <!--mustache--> 
        <p>{{ text }}</p>

    <!--JSON-->
    {
        "text": "I am text."
    }

    <!--output--> 
        <p>I am text.</p>
    ```
*Note: use {{{ text }}} to render HTML tags within the json. 

---

## **{{ #thing }}{{ /thing }}**

1. Does thing exist - test if a key is present in JSON (TRUE)
        <br> 
    - Set to true
        ```html

        <!--mustache--> 
            <p>{{ #thing }}I am text.{{ /thing }}</p>
        <!--JSON-->
        {
            "thing": true 
        }
        <!--output--> 
            <p>I am text.</p>
        ```
    - JSON exists but with different text
        ```html

        <!--mustache--> 
            <p>{{ #thing }}I am text.{{ /thing }}</p>
        <!--JSON--> 
        {
            "thing": "I am different!" 
        }
        <!--output--> 
            <p>I am text.</p>
        ```
    - Nested Key
        ```html

        <!--mustache--> 
            <p>{{ #thing }}I am text.{{ /thing }}</p>
        <!--JSON--> 
        {
            "thing": {
                "another-key": false
                    } 
        }
        <!--output--> 
            <p>I am text.</p>
        ```
2. Does thing exist - test if a key is present in JSON (FALSE)
        <br> 
    - Set to False
        ```html

        <!--mustache--> 
            <p>{{ #thing }}I am text.{{ /thing }}</p>
        <!--JSON--> 
        {
            "thing": false 
        }
        <!--output--> 
            <p>I am text.</p>
        ```
    - Empty
        ```html

        <!--mustache--> 
            <p>{{ #thing }}I am text.{{ /thing }}</p>
        <!--JSON-->   
        {
        }
        <!--output--> 
            <p></p>
        ```
3. Go inside object
    - Nested key 
        ```html

        <!--mustache--> 
            <p>{{ text }}{{ #thing }}{{ text }}{{ /thing }}</p>
        <!--JSON--> 
        {
            "text" : "I am different.",
            "thing": {
                "text": "I am text."
                }
        }
        <!--output--> 
            <p>I am different. I am text.</p>
        ``` 
4. For each thing in {{ #thing }}
    ```html

    <!--mustache-->
        <ul>
            {{ #thing }}
            <li>{{ text }}</li>
            {{ /thing }}
        </ul>
    <!--JSON--> 
    {
        "thing": [
            {
            "text": "I am text."
            },{
            "text": "So am I."
            }
        ]
    }
    <!--output-->
        <ul>
            <li>I am text.</li>
            <li>So am I.</li>
        </ul>
    ```
---

## **{{.}}**

1. Loop through the things in the array w/o having to set the object
    ```html

    <!--mustache-->
        <ul>
            {{ #thing }}
            <li>{{ . }}</li>
            {{ /thing }}
        </ul>
    <!--JSON--> 
    {
        "thing": [
            "I am text.",
            "So am I."
        ]
    }
    <!--output--> 
        <ul>
            <li>I am text.</li>
            <li>So am I.</li>
        </ul>
    ```
---
## **{{ ^thing }}{{ /thing }}**
2. Does thing NOT exist - test if a key is present in JSON 
    <br> 
    - Set to False
        ```html

        <!--mustache--> 
            <p>{{ ^thing }}I am text.{{ /thing }}</p>
        <!--JSON--> 
        {
        "thing": false 
        }
        <!--output--> 
            <p>I am text.</p>
        ```
    - Empty
        ```html

        <!--mustache--> 
            <p>{{ ^thing }}I am text.{{ /thing }}</p>
        <!--JSON--> 
            {
                "thing": true
            }
        <!--output--> 
            <p></p>
        ```
---

## PL 3 Upgrades
1. Handlebars allows you to call upon nested variables in the pattern! Yay!!!
    ```html

    <!--hbs--> 
        <img
            src="{{ square.src }}"
            alt="{{ square.alt }}"
            width="{{ square.width }}"
            height="{{ square.height }}"
        />
    <!--JSON--> 
    {
        "square": {
            "src": "../../images/fpo_square.png",
            "alt": "Square",
            "width": "600",
            "height": "600"
        },
        "avatar": {
            "src": "../../images/fpo_avatar.png",
            "alt": "Avatar",
            "width": "300",
            "height": "300"
        }
    }
    <!--output--> 
        <img src="../../images/fpo_square.png" alt="Square" width="600" height="600" />
    ```
2. The Pattern Parameter Syntax
    <br> 
    - The attributes listed in the pattern parameters need to match Mustache variable names in your pattern. The values listed for each attribute will replace the Mustache variables. For example:
        ```html

        <!--hbs--> 
            {{> patternGroup-pattern(attribute1: value, attribute2: "value string") }}
        <!--example mustache--> 
            <div class="main-container">
                {{> atoms-message(message: "this is an alert message") }}
                <div>
                    <!--A bunch of extra information-->
                </div>
                {{> atoms-message(message: "this is an informational message") }}
            </div>
        <!--output--> 
            <div class="main-container">
                <p>"this is an alert message"</p>
                <div>
                    <!--A bunch of extra information-->
                </div>
                <p>"this is an informational message"</p>
            </div>
        ```

    - You can also use this to toggle ``{{ #thing }}{{ /thing }}``.
        ```html

        <!--Organism--> 
            <div class="main-container">
                {{# emergency }}
                <div class="alert">
                    <p>Emergency!!!</p>
                </div>
                {{/ emergency }}
            </div>
        <!--Import--> 
            {{> organisms-header(emergency: true) }}
        <!--output--> 
            <div class="main-container">
                <div class="alert">
                    <p>Emergency!!!</p>
                </div>
            </div>
        ```
3. Other interesting HBS things (https://handlebarsjs.com/guide/) 
    Note: there are a few hbs syntax items in hbs that I know PL can use. Others that I haven't tested can be found here: https://handlebarsjs.com/guide/builtin-helpers.html#lookup
    <br> 
    - With - The with-helper dives into an object-property, giving you access to its properties
        ```html

        <!--hbs--> 
            {{#with person}}
                <p>{{firstname}} {{lastname}}</p>
            {{/with}}
        <!--JSON--> 
             {
                  person: {
                    firstname: "Yehuda",
                    lastname: "Katz",
                }
            }
        <!--output--> 
            <p>Yehuda Katz</p>
        ```

    - Each - The each-helper iterates an array, allowing you to access the properties of each object via simple handlebars expressions. (similar to {{ # this }}{{ / this }} )
        ```html

        <!--hbs--> 
            <ul class="people_list">
                {{#each people}}
                <li>{{this}}</li>
                {{/each}}
            </ul>
        <!--JSON--> 
        {
            people: [
                "Yehuda Katz",
                "Alan Johnson",
                "Charles Jolley",
            ]
        }
        <!--output--> 
        <ul class="people_list">
            <li>Yehuda Katz</li>
            <li>Alan Johnson</li>
            <li>Charles Jolley</li>
        </ul>
        ```

---

## Other notes and considerations
- **{{ > import }}** : _import pattern from another part of patternlab._
    - Importing a pattern is simply puting in the name of the level + pattern name
        - ``{{ > atoms-text }}``
    - Data can be "inherited" from the JSON of the file, but any new wrappings can also be applied.
    <br> 
- **{{! comment }}** : _A comment._

## JSON Flow 
- **Data Folder** :
    - Location: _data foloder
    - Name: Same as pattern
        - ``00-text.mustache``
        - ``_data/partials/../00-text.JSON``
    - Purpose: The main data for a file. Get built into ``data.json`` 
    <br> 
- **Pseudo Patterns** : 
    - Location: In the folder next to the pattern
    - Name: Same as pattern + ~descriptor
        - ``00-text.mustache``
        - ``00-text~extra-text.JSON``
    - Purpose: Show a pattern in a different state.
    <br> 
- **Sibling Pattern** : 
    - Location: In the folder next to the pattern
    - Name: Same as pattern
        - ``00-text.mustache``
        - ``00-text.JSON``
    - Purpose: Show a pattern in a different state in isolation. THIS DATA WILL OVERWRITE DATA IN DATA FILE
    - _**NOTE: THE BUILD WILL OVERWRITE ANY ARRAYS SPECIFIED IN DATA, BUT MADE IN SIBLING.**_

