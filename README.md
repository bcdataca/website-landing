This is a placeholder site for bcdata content. It is running a version of the
[Academic Hugo Theme/system](https://sourcethemes.com/academic/)

```bash
git clone https://github.com/bcdataca/website-landing
git submodule update --init --recursive
```

Make any changes you need to the content/config in the master branch. Once
you're finished, commit and push the changes back to github. Finally, run
`./publish.sh` which will run hugo and push the results to the `gh-pages` branch
of the website-landing repository.
