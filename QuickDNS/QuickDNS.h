//
//  QuickDNS.h
//  QuickDNS
//
//  Created by Gleb Karpushkin on 01/06/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

#import <PreferencePanes/PreferencePanes.h>

@interface QuickDNS : NSPreferencePane

@property (weak) IBOutlet NSButton *turnButton;

- (void)mainViewDidLoad;

- (IBAction)applyAction:(id)sender;

@end
