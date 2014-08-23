#import "Book.h"
#import "BookChapter.h"

@interface Book ()

@end

@implementation Book

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure
{
    for (BookChapter *bookChapter in self.chapters) {
        [bookChapter deleteWithSuccess:nil failure:nil];
    }
    
    [super deleteWithSuccess:success failure:failure];
}

@end
