//
//  UIImage+IO.h
//  Shylf
//
//  Created by Philip Nichols on 8/15/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IO)

- (NSURL *)saveToDiskWithName:(NSString *)name;

// TODO: I guess it's kind of weird having this here. We probably need a general purpose file manager for saving and deleting, but this will suffice for now
+ (BOOL)deleteFromDiskWithFilePathURL:(NSURL *)filePathURL;

- (void)saveToDiskAsyncWithName:(NSString *)name success:(void(^)(NSURL *url))success failure:(void(^)(NSError *error))failure;
+ (void)deleteFromDiskAsyncWithFilePathURL:(NSURL *)filePathURL withSuccess:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
