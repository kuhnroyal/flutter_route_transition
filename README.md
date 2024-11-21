# flutter_route_transition repro

A new Flutter project demonstrating a problem probably originating from PR https://github.com/flutter/flutter/pull/150031.

After the changes a transition created between a `PageRouteBuilder` and a `MaterialPageRoute/fullscreenDialog: true)` is not working as expected on iOS.
