local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

--- Setup project directory
local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", ".mvn" }, { upward = true })[1])

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "/packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(mason_path .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
		"\n"
	)
)

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-javaagent:" .. mason_path .. "/packages/jdtls/lombok.jar",

		"-jar",
		home .. "/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		home .. "/.local/share/jdtls/config_linux",

		"-data",
		workspace_dir,
	},

	filetypes = { "java" },

	root_dir = root_dir,

	settings = {
		java = {
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			referencesCodeLens = { enabled = true },
			references = { includeDecompiledSources = true },
			format = { enabled = true },
			inlayHints = { parameterNames = { enabled = "all" } },
			configuration = {
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "/usr/lib/jvm/java-8-openjdk-amd64",
					},
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk-amd64",
					},
				},
			},
		},
		signatureHelp = { enabled = true },
	},

	init_options = {
		bundles = bundles,
	},

	single_file_support = true,
}

require("jdtls").start_or_attach(config)
