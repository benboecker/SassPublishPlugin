# SassPublishPlugin

This package provides a plugin for the [Publish static site generator](https://github.com/JohnSundell/Publish) that compiles .sass files to CSS.

It is inspired by an older package of the [same name](https://github.com/Hejki/SassPublishPlugin), that seems to be unsupported by now.

This plugin depends on the [Swift Sass](https://github.com/johnfairh/swift-sass.git) package, which in turn uses the [Dart Sass](https://sass-lang.com/dart-sass) compiler to turn `.scss` files into `.css`. The main advantage is, that you don't need to have `libsass` installed on your mac and can use the package as-is.

## Installation

The plugin is available via swift package manager, so add a package dependency for the plugin.

```swift
dependencies: [
	.package(url: "https://github.com/benboecker/SassPublishPlugin.git", from: "1.0.0"),
],
```

Then, add a target dependency for the plugin.

```swift
.product(name: "SassPublishPlugin", package: "sasspublishplugin"),
```

## Usage

Add the plugin via a `.installPlugin` publishing step. This should be declared as the first publishing step, so that the resulting CSS will be used by the remaining publishing steps.

```swift
try MyTheme().publish(using: [
	.installPlugin(
		.compileSass(
			sassFilePath: "path/to/input.scss",
			cssFilePath: "path/to/output.css"
		)
	),
	
	// more publishing steps
])
```

If you have more than one `.scss` file, you can create a single one and import the other files in there like so.

```scss
@import 'constants.scss';
@import 'fonts.scss';
@import 'standard.scss';
```

Maybe the plugin will support multiple files as the input in the future.
