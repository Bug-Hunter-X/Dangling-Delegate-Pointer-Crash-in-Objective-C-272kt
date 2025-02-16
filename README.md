# Dangling Delegate Pointer Crash in Objective-C

This repository demonstrates a common Objective-C memory management issue that can lead to crashes: dangling delegate pointers.

## The Problem

A `UIViewController` (ViewController.m) sets itself as the delegate of another object. If the view controller deallocates before the other object removes it as its delegate, a dangling pointer results, causing a crash when the other object tries to interact with the deallocated view controller.

## The Solution (ViewControllerFixed.m)

The solution involves ensuring that the delegate is properly released before the view controller deallocates. This can be done by using the `weak` keyword to declare the delegate, or by explicitly setting the delegate to `nil` in the view controller's `dealloc` method.   The example here uses `nil`ing the delegate.

## How to Reproduce

1. Clone the repository.
2. Open the project in Xcode.
3. Run the app (ViewController.m). It will crash.
4. Comment out ViewController.m and uncomment ViewControllerFixed.m.
5. Run the app again. It will run without crashing.

This example highlights the importance of careful memory management in Objective-C.