# 默认 git add .
export def ga [
  ...files:string # 可选提交文件
] {
  if ($files | is-empty) {
    git add . | lines | str trim | table -i false
  } else {
    git add ...$files | lines | str trim | table -i false
  }
}

# git commit -m
# 可以使用管道输入要提交的文件
# exp: [a.md b.md] | gcm "add a.md b.md"
export def gcm [
  msg: string = 'upd' # 默认提交信息 upd
] {
  each { |it| ga $it }
  git commit -m $msg | lines | str trim | table -i false
}


# ga && git commit -m
export def gam [
  msg: string = 'upd' # 默认提交信息 upd
] {
  ga
  gcm $msg
}


# git init && gam
export def ginit [
  msg: string = "init" # 默认提交信息 'init'
] {
  git init e>| ignore | lines | str trim | table -i false
  gam $msg
}