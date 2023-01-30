import Publish
import DartSass



public extension Plugin {
	/// Compiles a `.sass` file into a single `.css` file.
	/// The returned `Plugin` value can be used in a publishing step via the `.installPlugin` function.
	/// - Parameters:
	///   - sassFilePath: The path of the input `.sass` file.
	///   - cssFilePath: The path of the output `.css` file.
	///   - compressed: If set, the oupt will be compressed on a single line.
	/// - Returns: A *Publish* `Plugin` that can be used in a Publishing step.
	static func compileSass(
		sassFilePath: Path,
		cssFilePath: Path,
		compressed: Bool = false
	) -> Self {
		Plugin(name: "Sass") { context in
			let sassFile = try context.file(at: sassFilePath)
			let cssFile = try context.createOutputFile(at: cssFilePath)
			
			let compiler = try Compiler()

			let results = try await compiler.compile(fileURL: sassFile.url, outputStyle: compressed ? .compressed : .expanded)
			try await compiler.shutdownGracefully()

			try cssFile.write(results.css)
		}
	}
}
