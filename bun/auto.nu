# 自动下载elplus,axios,需要传个项目名称
export def bvue [project_name] {
  bun create vue@latest $project_name
  cd $project_name
  bun i axios element-plus @element-plus/icons-vue
}