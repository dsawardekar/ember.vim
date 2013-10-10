# Ember [![Build Status][19]][20] [![Dependency Status][21]][22]

Ember.vim is a Vim plugin for the [Emberjs][1] frontend framework inspired by [vim-rails][3].

The core feature set is derived from [Portkey][2]. Briefly, Portkey provides the foundation needed to
do vim-rails style `:Alternate`, `:Related` navigation within an Emberjs project.
This plugin provides default projections for a typical ember project.

## Features

* Alternate and Related navigation with `:A` and `:R`
* Resource navigation with `:(E|S|T|V|D)resource`
* [CtrlP][10] based fuzzy searching for resources
* New file creation with `:Emodel post!`
* Simple refactoring with `:<range>Esource destination`
* [Ember Appkit][6] based project layout
* Boilerplate for Javascript and Coffeescript files
* Improved syntax highlighting for Javascript, Coffeescript and Handlebars files

## Usage

After installing the Portkey and Ember.vim plugins, Create a `portkey.json` in your project root with
contents like below,

```json
{
  "portkeys": ["ember"]
}
```

Then reload the file with,

```viml
:e!
```

That' it. This will load the ember extension with the [Ember Appkit][6] file layout and Javascript
boilerplate.

## Supported Layouts

The default extension follows the [Ember Appkit][6] layout. The expected
layout of files in your ember project is,

```
app/
├── models
├── routes
├── controllers
├── views
├── templates
├── components
├── helpers
├── styles
│
├── app.js
├── store.js
└── router.js
```

You can add additional patterns to the `portkey.json` to match additions to your project.

```json
{
  "app/adapters/*.js": {
    "type": "adapter",
    "test": "tests/adapters/%s_test.js"
  }
}
```

Here a custom projection for `adapters` is added to match files in the `app/adapters` folder.

## Supported Variations

By default the extension will use Javascript file patterns and Appkit based boilerplate templates. You can
choose a different `portkey.json` variant using the syntax, `ember:variant-lang`.

```json
{
  "portkeys": ["ember:classic-coffee"]
}
```

Here ember with classic boilerplate with coffeescript file patterns will be used.

The following variations are supported.

1. `appkit` or `appkit-js`
This is the default layout when a variant is not specified. It contains boilerplate templates
for the `es6` module transpiler.

2. `appkit-coffee`:
Ember Appkit with Coffee script boilerplate and patterns.

3. `classic` or `classic-js`:
Classic Emberjs boilerplate in Javascript.

4. `classic-coffee`
Classic with Coffeescript boilerplate and patterns.

## Navigation with Alternate & Related

Portkeys Ex commands `:A` and `:R` navigate to the alternate and related
files relative to the current file.

The default `alternate` and `related` varies based on the current file. The
table below lists these relations.


Resource | Alternate | Related
---|---|---
model | route | controller
route | model | controller or template
controller | route + model | template + view
template | route + model | controller + view
view | route + model | controller + template
component | none | template

## Navigation with Resource Ex commands

The Emberjs resources like models, controllers, routes, etc get their own
Ex command.

`:Emodel post` opens the Post model in the current buffer.
`:Scontroller post` opens the PostController in a horizontal split.

In addition the resource command can resolve the target resource from the
current buffer's name.

`:Eroute` in the `post` model, will go to the `PostRoute`.

The resource commands have variants `E`, `S`, `V`, `T` and `D` that
can be used to customize the window to open the file in.

See [here][13] for details on these variants.

## Creating new Files

To create a new file, use the corresponding resource command with bang.

```viml
:Emodel comment!
```

This will create a new comment model, `app/models/comment.js`.

The `:A` and `:R` commands can also be used with bang to
create new files.

The related for models as described in the table above
is a controller. So from the `Post` model use,

```viml
:R!
```

to create the file, `app/controllers/post.js`.

## Navigation with CtrlP

With [CtrlP][10], Portkey provides the following default mappings. These
mappings open a CtrlP menu with a list of resource of that type.

Hitting enter opens the resource in the current window. `Ctrl-v` and `Ctrl-s` open
the file in vertical or horizontal splits respectively.

Mapping        | Resource
---------------|---------
`<LocalLeader>cm`   |    component
`<LocalLeader>cn`   |    controller
`<LocalLeader>ap`   |    app
`<LocalLeader>r`    |    route
`<LocalLeader>s`    |    stylesheet
`<LocalLeader>ts`   |    test
`<LocalLeader>tm`   |    template
`<LocalLeader>v`    |    view
`<LocalLeader>g`    |    grunt
`<LocalLeader>h`    |    helper
`<LocalLeader>m`    |    model

## Customization

Any additional projections in your `portkey.json` take precedence over the
extension's projections. Additional patterns are merged with existing ones.

For Eg:- To change the template for models use,

```json
{
  "app/models/*.js": {
    "type": "model",
    "template": "MyApp.Model = Em.Model.extend({\n\t\n});"
  }
}
```

## System Requirements

Ember.vim is an extension of [Portkey][2]. See [here][4]
for instructions on how to install Portkey.

In addition the following plugins are recommended.

* [vim-handlebars][5] - Provides base Handlebars syntax highlighting

## Installation

##### 1. With [Vundle][7]
`Bundle 'dsawardekar/ember.vim'`

##### 2. With [Pathogen][8]
`git clone https://github.com/dsawardekar/ember.vim ~/.vim/bundle/ember.vim`

## TODO

- Improve Portkey's Extractor.
- Improve Portkey's GetFile Finder.
- Vim compiler plugin to run grunt test with `:Run`

## Authors

* Darshan Sawardekar [@_dsawardekar][14]

## Thanks

1. [Yehuda Katz][15] and the Emberjs team for Ember.
2. [Tim Pope][16] - For [vim-rails][3].

## Contributing

See [instructions][17] for Portkey.

## License

MIT License. Copyright © 2013 Darshan Sawardekar.

[1]: https://github.com/emberjs/ember.js
[2]: https://github.com/dsawardekar/portkey
[3]: https://github.com/tpope/vim-rails
[4]: https://github.com/dsawardekar/portkey#Installation
[5]: https://github.com/nono/vim-handlebars
[6]: https://github.com/stefanpenner/ember-app-kit
[7]: https://github.com/gmarik/vundle
[8]: https://github.com/tpope/vim-pathogen
[9]: https://github.com/luke-gru/riml
[10]: https://github.com/kien/ctrlp.vim
[11]: https://github.com/nvie/gitflow
[12]: https://github.com/dsawardekar/speckle
[13]: https://github.com/dsawardekar/portkey#navigation-with-resource-commands-eresource
[14]: https://twitter.com/_dsawardekar
[15]: https://github.com/wycats
[16]: https://github.com/tpope
[17]: https://github.com/dsawardekar/portkey#contributing
[18]: https://github.com/dsawardekar/portkey#installation

[19]: https://travis-ci.org/dsawardekar/ember.vim.png
[20]: https://travis-ci.org/dsawardekar/ember.vim
[21]: https://gemnasium.com/dsawardekar/ember.vim.png
[22]: https://gemnasium.com/dsawardekar/ember.vim
