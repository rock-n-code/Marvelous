<p align="center"><img src="http://dropbox.rock-n-co.de/marvelous/logo.png" alt="Marvelous" title="Marvelous"></p>

**Marvelous** is an unofficial native interface to the [Marvel Comics](http://marvel.com) API for both iOS and OSX platforms. It is built on top of the [Foundation framework](https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/objc_classic/_index.html) and it uses the high-level operation and networking abstractions built into the Cocoa framework. The design of this interface aims to be easy-to-use in your projects and semantically related to the API.

## Requirements

**Marvelous** requires:
- *XCode 5.0* or higher
- *iOS 7.0* (and higher) or *OSX 10.8* Mountain Lion (and higher)
- *ARC*

## How To Get Started

**Marvelous** can be included into your projects by downloading a compiled library or framework that you will setup by hand with lots of wisdom and patience or you can just use [Cocoapods](http://cocoapods.org) the library as a pod.

### Installing by getting your hands dirty

1. Download the [static library for iOS](http://dropbox.rock-n-co.de/marvelous/libMarvelous-0.7.3.zip) or the [framework for OSX](http://dropbox.rock-n-co.de/marvelous/Marvelous-0.7.3.zip).
2. Install the [static library](https://developer.apple.com/library/ios/technotes/iOSStaticLibraries/Articles/configuration.html) or [framework](https://developer.apple.com/library/mac/documentation/macosx/conceptual/BPFrameworks/Tasks/InstallingFrameworks.html#//apple_ref/doc/uid/20002261-BBCCFBJA) into your prject.
3. Create your [Marvel developer account](https://developer.marvel.com/account) to obtain the public and private keys required to sign any request to the API. Of course, you can skip this step in case you already have a developer account.
4. [Play with it](https://www.youtube.com/watch?v=sGjmXhES2wQ) 'til you drop!
5. Check the documentation included with the library/framework .zip files for further information about the library.
6. Check the [Marvel Comics online documentation](http://developer.marvel.com/docs) for further information about the API calls.

### Installing using CocoaPods

1. [Install Cocoapods](http://guides.cocoapods.org/using/getting-started.html) on your system. If you already have it installed, proceed to the next step.
```bash
$ sudo gem install cocoapods
```
2. [Create a Podfile](http://guides.cocoapods.org/using/using-cocoapods.html) which will define the dependencies of your project.
```bash
YourProject$ pod init
```
3. Add the **Marvelous** dependency into your [Podfile](http://guides.cocoapods.org/syntax/podfile.html).
```ruby
platform :ios, '7.0'
# platform :osx, '10.8'
xcodeproj 'YourProject'
pod 'Marvelous' #, '~> 0.7.3'
# ... more settings ...
```
4. Install the dependencies.
```bash
YourProject$ pod install
```
5. Open the `YourProject.xcworkspace` and build in case you've created a new XCode project with Cocoapods. Otherwise, you should integrate your workspace into the Podfile.
```ruby
workspace 'YourProject'
```

## Architecture

### API Interface

The manager (or singleton) class that provides the interface to the API and it is able to call a certain API and return its response as a callback.

- `RCMarvelAPI`

### Filters you might use

Depending the call, you are able to use filters to finegrain your search. You just need to pass 'em as a parameter to the method you call on the `RCMarvelAPI` class.

- `RCCharacterFilter`
- `RCComicsFilter`
- `RCCreatorFilter`
- `RCEventFilter`
- `RCSeriesFilter`
- `RCStoriesFilter`

### Objects you might receive

Every time the `RCMarvelAPI` class receives a non-error response from the API, it will return a `RCQueryInfoObject` object and a `RCCharacterObject`, `RCComicsObject`, `RCCreatorObject`, `RCEventObject`, `RCSeriesObject` or a `RCStoryObject` object. These objects can also contain other custom objects.

- `RCQueryInfoObject`
- `RCCharacterObject`
- `RCComicsObject`
- `RCCreatorObject`
- `RCEventObject`
- `RCSeriesObject`
- `RCStoryObject`
- `RCListObject`
- `RCImageObject`
- `RCComicPriceObject`
- `RCComicDateObject`
- `RCTextObject`
- `RCSummaryObject`
- `RCURLObject`

### Enumerations you might encounter

Both the filters and the objects provide enumerations to avoid any ambiguity and make your life easier.

- `RCAPITypes`
- `RCOrderByTypeCodes`
- `RCIssueFormatCodes`
- `RCIssueTypeCodes`
- `RCFrequencyTypeCodes`
- `RCDateDescriptorCodes`
- `RCImageAspectRatioCodes`
- `RCImageSizeCodes`
- `RCBooleanValueCodes`

## Example Usage

```objective-c
#import <Marvelous/RCMarvelAPI.h>

// First, you need to define your Marvel developer public and private keys
[RCMarvelAPI api].publicKey = @"YourMarvelPublicKey";
[RCMarvelAPI api].privateKey = @"YourMarvelPrivateKey";

// Then, you can use the API interface to search for a single resource by its identifier
NSNumber *identifier = @1234;

[[RCMarvelAPI api] characterByIdentifier:identifier andCallbackBlock:^(id result, RCQueryInfoObject *info, NSError *error) {
  NSLog(@"ERROR: %@", error);
  NSLog(@"QUERY INFO: %@", info);
  NSLog(@"RESULT: %@", result);
}];

// Or you can use the API interface to search for multiple resources by its filter
RCCharacterFilter * filter = [[RCCharacterFilter alloc] init];

filter.nameStartsWith = @"Wol";
filter.limit = @2;
filter.orderBy = @[@(RCOrderByTypeCodeNameAscending)];

[[RCMarvelAPI api] charactersByFilter:filter andCallbackBlock:^(NSArray *results, RCQueryInfoObject *info, NSError *error) {
  NSLog(@"ERROR: %@", error);
  NSLog(@"QUERY INFO: %@", info);
  NSLog(@"RESULTS: %@", results);
}];

// Finally, you can use the API interface to search for multiple resources by an identifier and a filter
NSNumber identifier = @4321;
RCCharacterFilter * filter = [[RCCharacterFilter alloc] init];

filter.name = @"Captain America";
filter.orderBy = @[@(RCOrderByTypeCodeDateModifieDescending)];

[[RCMarvelAPI api] charactersByComicIdentifier:identifier filter:filter andCallbackBlock:^(NSArray *results, RCQueryInfoObject *info, NSError *error) {
  NSLog(@"ERROR: %@", error);
  NSLog(@"QUERY INFO: %@", info);
  NSLog(@"RESULTS: %@", results);
}];
```

## Unit Tests

**Marvelous** includes a suite of unit tests within the *MarvelousTests* folder. You can execute the test suite inside XCode by selecting either the *Marvelous*  or the *MarvelousOSX* scheme and then pressing the &#8984;+U key shortcut.

## Documentation

**Marvelous** includes documentation written in [HeaderDoc](https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/HeaderDoc/intro/intro.html), which is included with XCode. It also support the new feature introduced by XCode 5.0 to display source code comments as documentation in the *Quick Help Inspector*, in the *Help Popup* and *Code Completion*.

## Online Documentation

**Marvelous** online documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/Marvelous). You're also able to import these docs as docsets to [XCode](https://developer.apple.com/xcode/) and/or to [Dash](http://kapeli.com/dash).

## TODOs

- `RCMarvelAPI` asynchronous tests

## Credits

**Marvelous** was created by [Javier Cicchelli](https://github.com/mr-rock) as a side project while working on some other stuff. I'm a big  **Marvel** fan (Practically I've been raised on *X-Men* so go figure...) and I've got so inspired by such a simple and nice API design described on  [Marvel's Interactive documentation](http://developer.marvel.com/docs) that well... I dedicated some time into crafting this beauty you're about to use.

The truth is that working on this library helped me clean my head and keep my sanity! :P

## Contact

Stay tune for more updates regarding this nice library, among other awesome stuff! Also don't hesitate to reach me for comments, suggestions, issues and constructive criticism.

- Follow [Rock & Code on Twitter](https://twitter.com/rockncode)
- Like [Rock & Code on Facebook](https://www.facebook.com/rock.n.code)
- Follow [Rock & Code on LinkedIn](http://www.linkedin.com/company/rock-&-code)
- Bookmark [Rock & Code on your browser](http://rock-n-code.com)

### Maintainers

- [Javier Cicchelli](http://github.com/mr-rock) ([@monsieur_rock](https://twitter.com/monsieur_rock))

## Just one more thing, folks...

**Marvelous** was crafted with Objective-C, some Software engineering and lots of geekness, fandom and love. And you're all welcome to contribute to it in any way possible: from reporting issues or fixing bugs  to share its existence on Twitter/Facebook/etc.. or just use it on your apps. Just don't forget to mention it and spread the love around, will ya?

If any of you guys who are working on *Marvel* read these parragraphs, I've just want you to use this library on your apps! That would be like a dream come true and I'll be tremendously happy for giving you guys something back for sticking up with me since I remember. In a way, this is my little *thank you* to you, **Marvel**. ;)

## License

**Marvelous** is available under the *MIT* license. See the LICENSE file for more info.

## Attribution

API data provided by **Marvel**. &copy; 2014 [Marvel](http://marvel.com)
