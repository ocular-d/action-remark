# Notes WIP

```shell
./node_modules/.bin/remark --frail md > log 2>&1
```

```shell
$ ./node_modules/.bin/remark --frail md 2>&1 | tee outfile
md/1.md
  2:135  warning  Line must be at most 80 characters  maximum-line-length  remark-lint

md/2.md: no issues found

⚠ 1 warning
```

Add `-q` to only make noise on warning and error

```shell
$ ./node_modules/.bin/remark -q --frail docs 2>&1 | tee outfile

$ ./node_modules/.bin/remark -q --frail md 2>&1 | tee outfile
md/1.md
  2:135  warning  Line must be at most 80 characters  maximum-line-length  remark-lint

⚠ 1 warning
```
