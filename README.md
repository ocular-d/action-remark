<div align="center">

# Remark GitHub Action

</div>

## Table of Contents

- [About the Project](#📄-about)
- [Usage](#🚀-usage)
- [Contributing](#🤝-contributing)
- [License](#📝-license)
- [Credits](#🙏-credits)

## 📄 About

[remarklint](https://github.com/remarkjs/remark-lint "Link to remarklint on GitHub") as GitHub Action.

## 🚀 Usage

Add the a workflow file in your repository: `.github/workflows/remark.yml`.

```yml
on: push
name: Remark Lint
jobs:
  remark:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: remark
      id: remark
      uses: ocular-d/action-remark@0.0.9
      with:
        check-dir: 'docs'

    - name: Create Issue
      if: ${{ steps.remark.outputs.exit_code }}
      uses: peter-evans/create-issue-from-file@v2
      with:
        title: Report
        content-filepath: error.log
        labels: report, automated issue

    - name: Fail if there were link errors
      run: exit ${{ steps.remark.outputs.exit_code }}
```

## 🤝 Contributing

We are a community effort, and everybody is most welcome to participate!

Be it filing bugs, formulating enhancements, creating pull requests, or any other means of contribution, we encourage contributions from everyone.

## 📝 License

Distributed under the [MIT](https://choosealicense.com/licenses/mit/ "Link to license") license.
