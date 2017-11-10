# source{d} Tech Talks pages
[![Build Status](https://drone.srcd.host/api/badges/src-d/talks/status.svg)](https://drone.srcd.host/src-d/talks)
[![Docker Repository on Quay](https://quay.io/repository/srcd/talks/status "Docker Repository on Quay")](https://quay.io/repository/srcd/talks)


## Creating a new talk

Creating the site for a new talk is as easy as typing the following command:

```shell
bin/create-talk subfolder
```

Usually, the subfolder follows the patterns `name-of-conference-year`.

This command will:

* Add the talk to the list of talks to be built and deployed by our CI
* Add a file to `landing/_current_talks` with the basic information for that
  talk. In particular, look for a cool image to be shown in the landing and
  don't forget to change the date.
* Add a subfolder with the given name with a complete site to configure for
  this new talk.

You are now ready to edit your new site.

## Editing a talk

### _config.yml

Please, make sure  you are comfortable working with the `_config.yml` file,
since there is configured most of the things related to your new conference
landing page. Especially, don't forget to:

* Add the right link to your ticket sales system.
* Configure the `metaKeywords`.
* Configure the data related to the conference place, date and title.

### Speakers

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

### Sessions

TBD

### Schedule

TBD

### images

There are two types of images to consider: Section images and speaker images


#### Section images

Redimension the section images to have a width of maximum 1665 like this:

```shell
convert image-orig.ext -scale 1665 image.ext
```

#### Speaker images

Photos need to be square to fit in both places nicely. Ask for one that at
least can be cropped. Take your time since some photos might not be good for
current design. After cropping it to a square, scale it to 200x200 like this:

```shell
convert image-orig.ext -scale 200 image.ext
```

## What happens after that?

TBD

## License

MIT License, see [LICENSE](LICENSE)
