# Predicate

WIP statically-typed NSPredicate for Swift.

From:
```swift
NSPredicate(format: "type MATCHES %@ OR type MATCHES %@", argumentArray: ["Fuji", "Gala"])
```

To:
```swift
NSPredicate.with(type: Apple.self)[\.type].matches("Fuji")
    .or[\.type].matches("Gala").predicateResult
```
