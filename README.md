# CalcuLayout
CalcuLayout is a domain specific language to make iOS AutoLayout easy, intuitive, and look like simple math.

## Swift 3 WARNING
Due to upgrading to Swift 3, certain parts of the framework are bugged. If you know a solution, please send a pull request :)
Current issues include:
* Adjacent operators are in unordered precedence groups 'ConstraintPrecedence' and 'AdditionPrecedence'
  - ConstraintPrecedence is declared with higherThan precedence set to BitwiseShiftPrecedence!
* 


## Basics
This is how constraints are added natively in Swift through Anchors:

```swift

button.widthAnchor.constraintEqualToAnchor(button.heightAnchor, multiplier: 2.0, constant: 40.0).active = true

```

This is how constraints are added using CalcuLayout

```swift

button.width <> button.height * 2^ + 40^++

```

## Documentation

#### Making a new constraint

###### Making a new constraint with an Equal Relation

To make a constraint connecting two anchors or an anchor and a constant, you use the **<>** operator.
```swift

// Normal Way 
button.widthAnchor.constraintEqualToAnchor(button.heightAnchor)

// CalcuLayout Way
button.width <> button.height

```

Alternatively, you can use the **==** operator.

```swift

// CalcuLayout way
button.width == button.height

```
*Warning: This operator can cause confusion as == is normally used for comparison*

###### Making a new constraint with an Greater Than Equal To/ Less Than Equal To Relation

To make a constraint connecting two anchors, you use the **<>** operator.
```swift

// Normal Way 
button.widthAnchor.constraintGreaterThanOrEqualToAnchor(button.heightAnchor)
button.widthAnchor.constraintLessThanOrEqualToAnchor(button.heightAnchor)

// CalcuLayout Way
button.width >> button.height
button.width << button.width

```

Alternatively, you can use the **>=** and **<=** operator.

```swift

// CalcuLayout Way
button.width >= button.height
button.width <= button.width

```
*Warning: This operator can cause confusion as >= and <= are normally used for comparison*

###### Making a new constraint equal to a constant

To make a constraint connecting two anchors or an anchor and a constant, you use the **<>** operator.
```swift

// Normal Way 
button.widthAnchor.equalToConstant(100)

// CalcuLayout Way
button.width <> 100^

```

<br>

#### Adding a constant to the constraint

##### Converting a number into a Layout Modifier
 
 To convert a number into a Layout Modifier, you simply use the postfix operator ^
 
```swift

100^

```

Alternatively, you can use the method C or M. Functionally they do the same thing but can make it easier to read.

```swift

100.C
100.M

```

##### Applying the Layout Modifier

Now to actually apply a Layout Constraint as a constant:

```swift

// Normal Way
button.widthAnchor.constraintEqualToAnchor(button.heightAnchor, constant: 40.0)

// CalcuLayout Way
button.width <> button.height + 40^
// or 
// button.width <> button.height + 40.C

```

<br>

#### Adding a multiplier to the constraint

Adding a multiplier is very similar to a constant

```swift

// Normal Way
button.widthAnchor.constraintEqualToAnchor(button.heightAnchor, multiplier: 2.0)

// CalcuLayout Way

button.width <> button.height * 2^
// or 
// button.width <> button.height + 40.M

```

<br>

#### Activating a Constraint

Normally, you activate a constraint by setting it's *active* property to *true*
With CalcuLayout, you activate a constraint by using the ++ at the end of the constraint's expression

```swift

// Normal One Liner Way
button.widthAnchor.constraintEqualToAnchor(button.heightAnchor, constant: 50.0, multiplier: 2.0).active = true

// CalcuLayout One Liner Way

button.width <> button.height + 50^ * 2^++


// Normal Two Liner Way
let constraint = button.widthAnchor.constraintEqualToAnchor(button.heightAnchor, constant: 50.0, multiplier: 2.0)
constraint.active = true

// CalcuLayout Two Liner Way

let constraint = button.width <> button.height + 50^ * 2^
constraint++

```
