//
//  UIImage+IO.m
//  Shylf
//
//  Created by Philip Nichols on 8/15/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "UIImage+IO.h"

static NSString * const UIImageDomain = @"UIImageDomain";

typedef NS_ENUM(NSInteger, UIImageIOError) {
    UIImageIOErrorSave,
    UIImageIOErrorDelete
};

@implementation UIImage (IO)

- (NSURL *)saveToDiskWithName:(NSString *)name error:(NSError **)error
{
    // Make sure each image is unique:
    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString] ;
    NSString *uniqueName = [NSString stringWithFormat:@"%@_%@", name, guid];
    
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg", uniqueName]];
    
    if (![fileManager createFileAtPath:fullPath contents:data attributes:nil]) {
        NSString *localizedDescription = [NSString stringWithFormat:@"There was an error saving the image to the path \"%@\"", fullPath];
        *error = [NSError errorWithDomain:UIImageDomain
                                     code:UIImageIOErrorSave
                                 userInfo:@{ NSLocalizedDescriptionKey : localizedDescription }];
        return nil;
    }
    
    return [NSURL fileURLWithPath:fullPath];
}

+ (BOOL)deleteFromDiskWithFilePathURL:(NSURL *)filePathURL error:(NSError **)error
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:[filePathURL path]]) {
        BOOL success = [fileManager removeItemAtURL:filePathURL error:&*error];
        if (!success && !*error) {
            NSString *localizedDescription = [NSString stringWithFormat:@"There was an error removing the image from the path \"%@\"", [filePathURL path]];
            *error = [NSError errorWithDomain:UIImageDomain
                                         code:UIImageIOErrorSave
                                     userInfo:@{ NSLocalizedDescriptionKey : localizedDescription }];
            return NO;
        } else if (*error) {
            return NO;
        }
    } else {
        DDLogInfo(@"The file could not be found at the specified URL, so it can't be deleted.");
    }
    
    return YES;
}

- (void)saveToDiskAsyncWithName:(NSString *)name success:(void(^)(NSURL *url))success failure:(void(^)(NSError *error))failure
{
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [backgroundQueue addOperationWithBlock:^{
        NSError *error = nil;
        NSURL *url = [self saveToDiskWithName:name error:&error];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (url) {
                if (success) {
                    success(url);
                }
            } else if (error) {
                if (failure) {
                    failure(error);
                }
            } else {
                if (failure) {
                    NSString *localizedDescription = [NSString stringWithFormat:@"There was an error saving the image with name \"%@\"", name];
                    NSError *error = [NSError errorWithDomain:UIImageDomain
                                                         code:UIImageIOErrorSave
                                                     userInfo:@{ NSLocalizedDescriptionKey : localizedDescription }];
                    failure(error);
                }
            }
        }];
    }];
}

+ (void)deleteFromDiskAsyncWithFilePathURL:(NSURL *)filePathURL withSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [backgroundQueue addOperationWithBlock:^{
        NSError *error = nil;
        BOOL succ = [self deleteFromDiskWithFilePathURL:filePathURL error:&error];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (succ) {
                if (success) {
                    success();
                }
            } else if (error) {
                if (failure) {
                    failure(error);
                }
            } else {
                if (failure) {
                    NSString *localizedDescription = [NSString stringWithFormat:@"There was an error removing the image from the path \"%@\"", [filePathURL path]];
                    NSError *error = [NSError errorWithDomain:UIImageDomain
                                                         code:UIImageIOErrorDelete
                                                     userInfo:@{ NSLocalizedDescriptionKey : localizedDescription }];
                    failure(error);
                }
            }
        }];
    }];
}

@end
