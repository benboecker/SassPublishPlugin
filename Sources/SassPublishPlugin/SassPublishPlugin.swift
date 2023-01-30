import Publish
import DartSass



public extension Plugin {
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
