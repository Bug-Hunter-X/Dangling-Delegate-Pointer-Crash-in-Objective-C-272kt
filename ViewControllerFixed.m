To fix the issue, ensure the delegate is set to `nil` before the view controller deallocates.  Add the following code to the `dealloc` method of the view controller:

```objectivec
- (void)dealloc {
    [super dealloc];
    //added this line to nil out the delegate
    myObject.delegate = nil;
}
```

Alternatively, declare the delegate property as `weak` to prevent the delegate from retaining the view controller:

```objectivec
@property (nonatomic, weak) id <MyDelegateProtocol> delegate; // declare delegate as weak
```

Using `weak` is generally preferred as it automatically handles the memory management in most cases.