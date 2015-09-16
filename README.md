Angular Responsive
==================

**Angular Responsive** is a nifty, growing set of directives to help you build responsive apps.

Installation
------------
Business as usual: `bower install cfts-angular-responsive --save`



Setup
-----
First, load `angular-responsive.js` into your HTML:

    <script src="dist/angular-responsive.js></script>
    <script src="angular.js"></script>

Then, load into your modules:
    
    var myModule = angular.module("myModule", ['angular-responsive']);

Now, you're ready to go.



Directives
----------

| directive | description | example
|---|---|---|
|`responsive`|This is your main directive. Use this to start watching over changes in `window`'s size. This will update width and height values to the `Breakpoint` service. Because of it's nature, It should be used in `<body>`, and **no more than once per app**. | `<body responsive>`
|`minWidth`|Defines a minimum width in pixels for the element to be displayed. If `window`'s width is less than this value, the element will be hidden. You shouldn't need to use this. Instead, you're encouraged to do your hiding/showing via CSS, but there it is, en case you ever need it. | `<div min-width="700">`|
|`maxWidth`| Same as `minWidth`: Defines a maximum width in pixels for the element to be displayed. If `window`'s width is greater than this value, the element will be hidden. You shouldn't need to use this. | `<div max-width="700">`|
|`responsiveBooleans`|A-ha, now this might be useful. Defines and appends a set of variables to your scope, which evaluate to `true`or `false`, given a width-comparison rule for each one of them. Works just like **ngClass**. The variables can be later used in your controller as you wish. | `<div responsive-booleans="{'thin': '<480', 'wide': '>1440'}" ng-show="thin">`|
|`responsiveClasses`|This is why I created this module. I needed to append/remove classes to a given element based on `window`'s width. And this is what this directive does. And works just like **ngClass**. | `<div responsive-classes="{'thin': '<480', 'wide': '>1440'}">`|



Afterword
---------
I'd like to hear feedback on how you use **Angular Responsive** and how to improve it in any way, be it performance, new features, best practices or even documentation. So please, feel free to open an issue, pull-request or drop a line. Proposals to improve this little module will make me happy.

Thanks!