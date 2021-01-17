#import "RnBytes.h"


@implementation RnBytes

RCT_EXPORT_MODULE(RNBytes)

RCT_EXPORT_METHOD(getFileLength:(NSString *)path
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSError *error = nil;
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
    if (fileAttributes != nil) {
        NSNumber *fileSize = [fileAttributes objectForKey:NSFileSize];
        if (fileSize != nil) {
            resolve(fileSize);
            return;
        }
    }
    reject(@"not_found", error ? [error description] : @"File not found", error);
}

RCT_EXPORT_METHOD(readFromAndWriteTo:(NSString *)sourcePath
                  targetPath:(NSString *)targetPath
                  overwrite:(BOOL)overwrite
                  append:(BOOL)append
                  from:(NSNumber *)from
                  to:(NSNumber *)to
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if (!overwrite || append) {
        reject(@"TODO", @"append not supported", nil);
        return;
    }
    reject(@"todo", @"todo", nil);
}

@end
