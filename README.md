# CalcuLayout
CalcuLayout is a domain specific language to make iOS AutoLayout easy, intuitive, and look like simple math.

## Basics
This is how constraints are added natively in Swift through Anchors:

```swift

button.widthAnchor.constraintEqualToAnchor(button.heightAnchor, multiplier: 2.0, constant: 40.0).active = true

```

This is how constraints are added using CalcuLayout

```swift

button.width <> button.height * 2^ + 40^++

```



