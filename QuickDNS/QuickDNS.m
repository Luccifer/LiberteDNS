//
//  QuickDNS.m
//  QuickDNS
//
//  Created by Gleb Karpushkin on 01/06/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

#import "QuickDNS.h"

@implementation QuickDNS

bool turnedOn = false;

- (void)mainViewDidLoad
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    turnedOn = [userDefaults boolForKey:@"dnsSwitchOn"];
    if (turnedOn) {
        _turnButton.title = @"Turn Off";
    }
}

- (IBAction)applyAction:(id)sender {
    
    NSButton *button = sender;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (turnedOn == 0) {
        button.title = @"Turn Off";
        [userDefaults setBool:true forKey:@"dnsSwitchOn"];
        turnedOn = true;
        NSPipe *pipe = [NSPipe pipe];
        NSTask *task = [[NSTask alloc] init];
        task.launchPath = @"/usr/sbin/networksetup";
        task.arguments = @[@"-setdnsservers", @"Wi-Fi", @"8.8.8.8", @"8.8.4.4", @"1.1.1.1", @"1.0.0.1"];
        task.standardOutput = pipe;
        [task launch];
    } else {
        button.title = @"Turn On";
        [userDefaults setBool:false forKey:@"dnsSwitchOn"];
        turnedOn = false;
        NSPipe *pipe = [NSPipe pipe];
        NSTask *task = [[NSTask alloc] init];
        task.launchPath = @"/usr/sbin/networksetup";
        task.arguments = @[@"-setdnsservers", @"Wi-Fi", @"empty"];
        task.standardOutput = pipe;
        [task launch];
    }
    
}

@end
