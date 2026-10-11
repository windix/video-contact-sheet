# Video Contact Sheet *NIX

[documentation]: https://p.outlyer.net/vcs/docs

Homepage: https://p.outlyer.net/vcs

This is a bash script meant to create video contact sheets (previews) of videos. Any video supported by mplayer and ffmpeg can be used. A note of warning: Unlike most similar tools it, by default, makes screenshots the same size as the video, see below for details on how to change this.

Take a look at the [documentation] and/or use the `--help` and `--fullhelp` options to learn how to use it.

## Samples

[sample-bbb]: https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_5x4_160px_default.jpg
[sample-mariposahd]: https://p.outlyer.net/_media/vcs/samples/mariposahd_s01e05_1.0.4b.jpg
[sample-bbb-black]: https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_allblack.jpg
[sample-bbb-nopadding]: https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_5x4_160px_config.jpg
[sample-bbb-white]: https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_allwhite.jpg
[sample-heavyrain-casting]: https://p.outlyer.net/_media/vcs/samples/heavyrain_casting_1.0.11.jpg
[sample-coral-reef-adv]: https://p.outlyer.net/_media/vcs/coral_reef_adventure_1080.wmv-fullsheet.jpg
[sample-film-mode]: https://p.outlyer.net/_media/vcs/samples/film_mode_sample.jpg


[![5x4 grid](https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_5x4_160px_default.jpg?w=250&tok=297cda)][sample-bbb]
[![Black contact sheet](https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_allblack.jpg?w=250&tok=2c1221)][sample-bbb-black]
[![5x4 grid, no padding](https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_5x4_160px_config.jpg?w=250&tok=7b0caf)][sample-bbb-nopadding]
[![Complete contact sheet](https://p.outlyer.net/_media/vcs/coral_reef_adventure_1080.wmv-fullsheet.jpg?w=250&tok=688d77)][sample-coral-reef-adv]
[![Command: vcs -E0 -S 2 -S 4m38 -i 1m 169_heavyrain_om_ps3_051906_hd.avi](https://p.outlyer.net/_media/vcs/samples/heavyrain_casting_1.0.11.jpg?w=250&tok=b14b20)][sample-heavyrain-casting]
[![Command: $ vcs -n6 -H 540  mariposaHD.S01E05.1080p.en.wmv](https://p.outlyer.net/_media/vcs/samples/mariposahd_s01e05_1.0.4b.jpg?w=250&tok=b9b44f)][sample-mariposahd]
[![Filmstrip-mode sample](https://p.outlyer.net/_media/vcs/samples/film_mode_sample.jpg?w=250&tok=329f98)][sample-film-mode]
[![White contact sheet](https://p.outlyer.net/_media/vcs/samples/bbb_excfgs_allwhite.jpg?w=250&tok=d5310f)][sample-bbb-white]

## Releasing

Releases are published by the [Release workflow](.github/workflows/release.yml):

1. In a pull request, set `VERSION` (and `RELEASE=1`) in `dist/vcs` and add an entry for that version at the top of `dist/CHANGELOG`. The workflow previews the release notes in the PR's job summary and fails if the CHANGELOG entry is missing.
2. Merge it. The workflow tags `v<VERSION>` and publishes a GitHub release whose notes are the CHANGELOG entry plus [`.github/release/install.md`](.github/release/install.md).
3. The [windix/tap](https://github.com/windix/homebrew-tap) autobump job opens a pull request updating the Homebrew formula within a day.
