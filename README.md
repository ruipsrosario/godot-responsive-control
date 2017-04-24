# Godot Responsive Control

This project is a plugin implementation for [Godot Engine](https://godotengine.org/). The plugin consists
of two custom nodes, `ResponsiveSection` and `ResponsiveSizing`, that together allow a GUI to dynamically
adapt to differing resolutions.

## Feature List

- Automatic detection of parent node resizing;
- Anchor and margin dynamic updates;
- Dynamic size flags and scale updates;
- Automatic visibility change for different resolutions;

## Usage

If you want to see an example in action check out the [example scene](source/example/ResponsiveExample.tscn).
The example is set up as follows:

- There is a root `Panel` that encloses all of the `ResponsiveSection` nodes. This is required since
  the parent of a `ResponsiveSection` node must be a descendant of `Control`, in order to respond to the
  `resized` signal.
- Each `ResponsiveSection` node has one or more `ResponsiveSizing` nodes as direct descendants (again required
  in order for the `ResponsiveSection` node to dynamically iterate all children for the correct responsive
  layout to apply) that have the `Minimum Parent Size` property set accordingly (along with the layout
  information).
- Besides the `ResponsiveSizing` nodes, each `ResponsiveSection` node then has the actual GUI components to
  display.

---

**I acknowledge the example provided is not the best, but it was something I just slapped together in order to
showcase the responsive capabilities. If you have a better example or if you have a bug fix / new feature that
you want to contribute just fork the repo and then issue a pull request (if you can't for any reason just
contact me directly or create an issue). **
