local function setup(on_attach, capabilities)
   require("lspconfig").nil_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
         ["nil"] = {
            formatting = {
               command = { "nixpkgs-fmt" },
            },
         },
      },
   })
end

return { setup = setup }