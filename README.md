# FSVideoKit

FSVideoKit is a Swift Package Manager (SPM) package designed to play Kayo assets using Kayo authentication.

## Requirements

- iOS 15+
- Xcode 16.2+
- Swift 5+

## Installation

FSVideoKit is available via Swift Package Manager.
To install, add the following package dependency:

```sh
https://github.com/fsa-streamotion/streamotion-mobile-ios-videokit-spec.git
```

## Usage

### Importing FSVideoKit

```swift
import FSVideoKit
```

### Playing a Video

```swift
let playerViewController = FSPlayerViewController()
playerViewController.play(withAssetId: "123")
```

### Authentication

#### Logout

```swift
FSAuthManager.shared.logout { _ in
    // Handle logout completion
}
```

#### Authentication Status

```swift
FSAuthManager.shared.authenticationStatus(shouldRefresh: true) { status in
    // Handle authentication status
}
```
