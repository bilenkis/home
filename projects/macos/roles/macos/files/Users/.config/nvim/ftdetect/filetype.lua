vim.filetype.add({
  extension = {
    libsonnet = "jsonnet",
    jsonnet = "jsonnet",
    -- gotmpl = "gohtmltmpl",
    -- yaml = "gotmpl",
    yaml = "helm",
    yml = "helm",
    -- yml = "gotmpl",
    tfvars = "hcl",
  },
})
