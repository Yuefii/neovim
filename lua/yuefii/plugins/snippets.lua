return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		-- React Component Snippets
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node

		-- Functional Component with useState
		ls.add_snippets("typescriptreact", {
			s("rfc", {
				t("import React, { useState } from 'react';"),
				t({ "", "" }),
				t("interface "),
				f(function(_, snip)
					return snip.env.TM_SELECTED_TEXT or "ComponentName"
				end, {}),
				t("Props {"),
				t({ "", "" }),
				t({ "  // props here", "" }),
				t("}"),
				t({ "", "" }),
				t({ "", "" }),
				t("const "),
				f(function(_, snip)
					return snip.env.TM_SELECTED_TEXT or "ComponentName"
				end, {}),
				t(": React.FC<"),
				f(function(_, snip)
					return snip.env.TM_SELECTED_TEXT or "ComponentName"
				end, {}),
				t("Props> = ({"),
				t({ "", "" }),
				t("}) => {"),
				t({ "", "  const [state, setState] = useState(" }),
				i(1, "initialState"),
				t(");"),
				t({ "", "", "  return (" }),
				t({ "    <div>", "" }),
				t("      "),
				i(2, "content"),
				t({ "", "    </div>" }),
				t(");"),
				t({ "", "};" }),
				t({ "", "", "export default " }),
				f(function(_, snip)
					return snip.env.TM_SELECTED_TEXT or "ComponentName"
				end, {}),
				t(";"),
			}),
		})

		-- useEffect Hook
		ls.add_snippets("typescriptreact", {
			s("uef", {
				t("useEffect(() => {"),
				t({ "", "  " }),
				i(1, "// effect logic"),
				t({ "", "}, [" }),
				i(2, "dependencies"),
				t("]);"),
			}),
		})

		-- Custom Hook
		ls.add_snippets("typescriptreact", {
			s("hook", {
				t("const use"),
				i(1, "HookName"),
				t(" = () => {"),
				t({ "", "  const [state, setState] = useState(" }),
				i(2, "initialState"),
				t(");"),
				t({ "", "", "  return {" }),
				t({ "    state," }),
				t({ "    setState," }),
				t("  };"),
				t({ "", "};" }),
				t({ "", "export default use" }),
				f(function(_, snip)
					return snip.env.TM_SELECTED_TEXT or "HookName"
				end, {}),
				t(";"),
			}),
		})

		-- Form with useState
		ls.add_snippets("typescriptreact", {
			s("form", {
				t("const [formData, setFormData] = useState({"),
				t({ "", "  " }),
				i(1, "field"),
				t(": "),
				i(2, "value"),
				t({ "", "});", "" }),
				t({ "", "const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {" }),
				t({ "", "  const { name, value } = e.target;" }),
				t({ "", "  setFormData(prev => ({" }),
				t({ "", "    ...prev," }),
				t({ "", "    [name]: value" }),
				t({ "", "  }));" }),
				t({ "", "};" }),
				t({ "", "const handleSubmit = (e: React.FormEvent) => {" }),
				t({ "", "  e.preventDefault();" }),
				t({ "", "  " }),
				i(3, "// handle submit"),
				t({ "", "};" }),
			}),
		})

		-- API Call with useEffect
		ls.add_snippets("typescriptreact", {
			s("api", {
				t("useEffect(() => {"),
				t({ "", "  const fetchData = async () => {" }),
				t({ "", "    try {" }),
				t({ "", "      const response = await fetch(" }),
				i(1, "'/api/endpoint'"),
				t(");"),
				t({ "", "      const data = await response.json();" }),
				t({ "", "      " }),
				i(2, "// handle data"),
				t({ "", "    } catch (error) {" }),
				t({ "", "      console.error('Error:', error);" }),
				t({ "", "    }" }),
				t({ "", "  };" }),
				t({ "", "  fetchData();" }),
				t({ "", "}, [" }),
				i(3, "dependencies"),
				t("]);"),
			}),
		})

		-- TypeScript Interface
		ls.add_snippets("typescriptreact", {
			s("int", {
				t("interface "),
				i(1, "InterfaceName"),
				t(" {"),
				t({ "", "  " }),
				i(2, "property"),
				t(": "),
				i(3, "string"),
				t(";"),
				t({ "", "}" }),
			}),
		})

		-- Import React
		ls.add_snippets("typescriptreact", {
			s("ir", {
				t("import React from 'react';"),
			}),
		})

		-- Import React with hooks
		ls.add_snippets("typescriptreact", {
			s("irh", {
				t("import React, { useState, useEffect } from 'react';"),
			}),
		})
	end,
}