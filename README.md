Are you tired to write an ugly and big `-prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender:` method like that?

```objective-c

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue1"]) {
        UIViewController *destination = segue.destinationViewController;
        destination.view.backgroundColor = [UIColor redColor];
    } else if ([segue.identifier isEqualToString:@"segue2"]) {
        UIViewController *destination = segue.destinationViewController;
        destination.view.backgroundColor = [UIColor blueColor];
    } else if ([segue.identifier isEqualToString:@"segue3"]) {
        UIViewController *destination = segue.destinationViewController;
        destination.view.backgroundColor = [UIColor greenColor];
    }
    ...
}
```

Check JMGBlockSegue and enjoy **defining a block** which will be executed to prepare segue **in the same place which you call to `performSegue`**.


## Install

Use JMGBlockSegue it's really easy, you only need to drop `JMGBlockSegue folder` to your project, or if you are a CocoaPods-lover, you can include this line in your Podfile as usual:

```
pod 'JMGBlockSegue'
```
After that, you need to import `UIViewController+BlockSegue.h` on each view controller where you want to configure segues.

## Use

JMGBlockSegue can be used in two ways: inline (when you performSegue programatically) or independently (in other line).


### Inline

Perform segue and configure the block which is executed in the same sentence.

```objective-c

[self performSegueWithIdentifier:@"segueIdentifier" sender:nil withBlock:^(id sender, id destinationVC) {
    NSLog(@"Segue configured inline");
    destinationVC.user = tmpUser;
}];
```


### independently

Configure segue block independently of his execution, this way could be called on viewDidLoad for example, and it's run with both the call performSegueWithIdentifier:sender: method and storyboard segue perform.


```objective-c

[self configureSegue:@"segueIdentifier" withBlock:^(id sender, id destinationVC) {
    NSLog(@"I'm a block fired with the segue!");
}];
```

## TODO

- Testing it. I know that this a very small lib, but I want to do it as an exercise with runtime & tests :)
- Issues and pull requests are welcome!


## Acknowledges
- Special thanks to [@luisobo](https://github.com/luisobo) for support me with `runtime.h`, thanks buddy!.
- I found very useful the [NSHipster about method swizzling](http://nshipster.com/method-swizzling/).
- It was inspired by [UIAlertView-Blocks](https://github.com/ryanmaxwell/UIAlertView-Blocks), which helps you to write good-looking code with sad UIAlertView interface / delegates.


## Author
- Jorge Maroto ([@patoroco](http://twitter.com/patoroco)).

## License
`JMGBlockSegue` is available under the MIT license. See the [LICENSE file](LICENSE.md) for more info.