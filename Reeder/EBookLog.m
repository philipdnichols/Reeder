#import "EBookLog.h"
#import "EBookChapter.h"

@interface EBookLog ()

@end

@implementation EBookLog

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure
{
    for (EBookChapter *ebookChapter in self.chapters) {
        [ebookChapter removeEbookLogsObject:self];
    }
    
    for (EBookChapter *partialEBookChapter in self.partialChapters) {
        [partialEBookChapter removeEbookLogsObject:self];
    }
    
    [super deleteWithSuccess:success failure:failure];
}

@end
