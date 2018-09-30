//
//  ViewController.m
//  OneDriveForBusiness-Failure-Repro
//
//  Created by Mark on 30/09/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

#import "ViewController.h"
#import <OneDriveSDK/OneDriveSDK.h>

static NSString *kApplicationId = @"8c10a31a-0f4b-4931-a450-c2959b0a7169";
static NSString *kRedirectUri = @"https://azure-redirect-uri.strongboxsafe.com";

@implementation ViewController

- (IBAction)onDoIt:(id)sender {
    NSLog(@"Doing Something");
    
    [ODClient setActiveDirectoryAppId:kApplicationId redirectURL:kRedirectUri];
    
    [ODClient clientWithCompletion:^(ODClient *client, NSError *error){
        if (!error){
            ODChildrenCollectionRequest *request = [[[[client drive] items: @"root"] children] request];
            
            [request getWithCompletion:^(ODCollection *response, ODChildrenCollectionRequest *nr, NSError *error) {
                if(error) {
                    NSLog(@"ODChildrenCollectionRequest getWithCompletion error: %@", error);
                    return;
                }
                
                NSArray<ODItem *> *entries = response.value;
                
                NSLog(@"Successfully Got items: [%lu]", (unsigned long)entries.count);
            }];
        }
        else {
            NSLog(@"Onedrive clientWithCompletion error: %@", error);
        }
    }];
}

@end


// Use the below to reset/clear any session if necessary...
//
//    ODClient* blah = [ODClient loadCurrentClient];
//    if(blah) {
//        [blah signOutWithCompletion:^(NSError *error) {
//            NSLog(@"Signed Out");
//            NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//            for (NSHTTPCookie *each in cookieStorage.cookies) { [cookieStorage deleteCookie:each]; }
//        }];
//    }
//    else {
//        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//        for (NSHTTPCookie *each in cookieStorage.cookies) { [cookieStorage deleteCookie:each]; }
//    }


