#import "EBook.h"
#import "EBookChapter.h"

@interface EBook ()

@end

@implementation EBook

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure
{
    for (EBookChapter *ebookChapter in self.chapters) {
        [ebookChapter deleteWithSuccess:nil failure:nil];
    }
    
    [super deleteWithSuccess:success failure:failure];
}

@end
