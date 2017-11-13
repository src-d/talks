# Contributing

You will find here the conventions and rules to create new talks and to develop new features and enhancements.

Please,
- [open an issue](https://github.com/src-d/talks/issues) to request any new feature or to report a bug.
- [create a new PR](https://github.com/src-d/talks/pulls) to request the review of a talk or feature.


## Table of contents

<!-- TOC -->

- [Contributing](#contributing)
    - [Table of contents](#table-of-contents)
- [Site architecture](#site-architecture)
- [Preview the site](#preview-the-site)
    - [Preview a static copy of the whole site](#preview-a-static-copy-of-the-whole-site)
    - [Preview a live copy of only one talk](#preview-a-live-copy-of-only-one-talk)
- [Creating a new talk](#creating-a-new-talk)
- [Editing a talk](#editing-a-talk)
    - [_config.yml](#_configyml)
    - [Speakers](#speakers)
    - [Images](#images)
        - [Section images](#section-images)
        - [Speaker images](#speaker-images)
    - [Resource optimizations (optional)](#resource-optimizations-optional)
- [How to publish and deploy talks](#how-to-publish-and-deploy-talks)
- [Project Zeppelin](#project-zeppelin)
    - [Used libraries](#used-libraries)
    - [Original contributors](#original-contributors)

<!-- /TOC -->

# Site architecture

The project comes with:

- `bin` directory containing the `bin/create-talk` command to [create new talks](#creating-a-new-talk)
- `blueprint` directory containing the sources of the new talks, used by `bin/create-talk`
- `landing` directory containing the contents of the landing; inside `_current_talks` and `_past_talks` will be stored one `__TALK_NAME__.md` file per talk with its information. 
- one directory per talk

`landing` and each talk directories follows the template given by [Project Zeppelin](#project-zeppelin) when this talks site [was forked from zeppling](https://github.com/gdg-x/zeppelin/tree/e0f54e40ee323b9bd5b3c5b63685da5de2ca5da7)

The `blueprint` contains:
- `per_talk` directory, with sources that are copied to a new talk when it is created
- `shared` directory contains sources that are linked from each talk when it is created

Each talk uses the [Project Zeppelin](CONTRIBUTING.md#project-zeppelin) as a blueprint and is stored under a dedicated directory as it was a single site.

# Preview the site 

To locally serve the blog, you need to satisfy the [project requirements](README.md#requirements), and choose one of the following:

## Preview a static copy of the whole site

From the root path, run:

```shell
make serve;
```

and go to [http://localhost:8484](http://localhost:8484)

## Preview a live copy of only one talk

You can preview a live copy of only one talk, that will be refreshed when you update its sources; to do so it is neede to run, from the directory of that talk:

```shell
make serve;
```

and go to [http://localhost:4000/__TALK_NAME__](http://localhost:4000/__TALK_NAME__)

**NOTE:** in this mode all changes to html and data files will be automatically regenerated, but after changing ```_config.yml``` you have to stop and re-run the `make serve` command.


# Creating a new talk

You can create a talk running, from the project root:

```shell
bin/create-talk __TALK_NAME__;
```

**WARNING**: It was found a couple of bugs in the `create-talk` command, that must be considered after creating a new talk:

- bin/create-talk seems broken [#93](https://github.com/src-d/talks/issues/93)
- Fix duplicities and links in js when creating a new talk [#92](https://github.com/src-d/talks/issues/92)

This command will:

* Add the talk to the list of talks to be built and deployed by our CI
* Create a new `landing/src/_current_talks/__TALK_NAME__.md` file, with the basic information for that talk. In particular, look for a cool image to be shown in the landing and don't forget to change the date.
* Add a subfolder named `__TALK_NAME__` with the given name with a complete site to configure for this new talk.


# Editing a talk

Since the contents of the new talk folder will be created using the blueprint, you should know that there are three kinds of contents:
- some of them are unique for the new talk, and contains talk info, talk photos...
- other contents are copies from the `blueprint/per_talk` directory, so it can be edited at will,
- other contents are links to the `blueprint/shared` directory, so its content are used by the other talks. Be careful when editing this kind of contents.

## _config.yml

Please, make sure  you are comfortable working with the `_config.yml` file,
since there is configured most of the things related to your new conference
landing page. Especially, don't forget to:

* Add the right link to your ticket sales system.
* Configure the `metaKeywords`.
* Configure the data related to the conference place, date and title.

## Speakers

Each speaker contains the following data, all of them compulsory and configured
in `_data/speakers.yml`.

- `id` will be used to reference the speakers in other places like the
  schedule.
- `name`
- `surname`
- `company`
- `title`
- `bio`
- `thumnailUrl` is the path below `img/people` to the photo.
- `rockstar` true if the candidate can be shown in the front page, false
  otherwise.
- `social` a collection of links.

## Images

There are two types of images to consider: Section images and speaker images

### Section images
Redimension the section images to have a width of maximum 1665 like this:

```shell
convert image-orig.ext -scale 1665 image.ext
```

### Speaker images
Photos need to be square to fit in both places nicely. Ask for one that at
least can be cropped. Take your time since some photos might not be good for
current design. After cropping it to a square, scale it to 200x200 like this:

```shell
convert image-orig.ext -scale 200 image.ext
```

## Resource optimizations (optional)

**NOTE** `automation` directory as used in this section can be found under `__TALK_NAME__/src/automation` or `blueprint/shared/src/automation`, depending on when the talk was created. This section of the guide was copy pasted from the original README, and it could need some rework.

You can optimize images and minify css and javascript automatically (for now only on Windows).
But for Mac OS users available amazing tool - [imageoptim](https://imageoptim.com/). Thanks [@raphaelsavina](https://github.com/raphaelsavina) for link.
Optimize all images by running this script from `/automation/images/` folder:
```bash
all_image_optimization.bat -d -jtran -pout -pquant -optip -gsicle -svgo
```

To minify CSS and JS run `minify_js.bat` (for Windows) and `minify_js.sh` (for Linux and MacOS) from `/automation/minifying/` folder:
```bash
minify_js.bat
```

Learn more about available optimization options from [documentation](https://github.com/gdg-x/zeppelin/wiki/Resources-optimizations).


# How to publish and deploy talks

The talks site is published automatically following the source{d} [Continous Delivery rules for web applications](https://github.com/src-d/guide/blob/master/engineering/continuous-delivery.md)



# Project Zeppelin

Project Zeppelin allows you to setup awesome GDG DevFest site in 5 minutes.

Project is built on top of [Jekyll](http://jekyllrb.com/) - simple, blog-aware, static site generator. Jekyll also happens to be the engine behind GitHub Pages, which means you can use Jekyll to host your website from GitHub’s servers for free. [Learn more about Jekyll](http://jekyllrb.com/).

Template is brought by [GDG Lviv](http://lviv.gdg.org.ua/) team.

You will find the full documentation of Zeppling template at [gdg-x/zeppelin/wiki](https://github.com/gdg-x/zeppelin/wiki).

## Used libraries
* [Bootstrap](https://github.com/twbs/bootstrap)
* [Animate.css](https://github.com/daneden/animate.css)
* [Waves](https://github.com/publicis-indonesia/Waves)
* [jquery.appear](https://github.com/bas2k/jquery.appear)
* [jQuery countTo Plugin](https://github.com/mhuggins/jquery-countTo)
* [Typed.js](https://github.com/mattboldt/typed.js)
* [Sticky-kit](https://github.com/leafo/sticky-kit)

## Original contributors

* Design and web development: [Oleh Zasadnyy](https://github.com/ozasadnyy)
* Idea: [Vitaliy Zasadnyy](https://github.com/zasadnyy)

See [list of contributors](https://github.com/gdg-x/zepplin/graphs/contributors)
