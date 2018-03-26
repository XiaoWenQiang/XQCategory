//
//  NSFileManager+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "NSFileManager+XQCategory.h"

@implementation NSFileManager (XQCategory)

- (NSString *)getDocumetsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths[0];
}

- (NSString *)getLibraryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return paths[0];
}

- (NSString *)getCachesPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return paths[0];
}

- (NSString *)tmpPath {
    NSString *path = NSTemporaryDirectory();
    return path;
}


- (NSString *)createFolder:(NSString *)fileName {
    NSString *documentsPath = [self getDocumetsPath];
    NSString *folderPath = [documentsPath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isEixt = NO;
    if ([fileManager fileExistsAtPath:folderPath isDirectory:&isEixt]) {//判断路径是否存在
        return folderPath;
    } else {
        BOOL isSuccess = [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil]; //创建文件路径
        if (isSuccess) {
            return folderPath;
        } else {
            return nil;
        }
    }
}


- (BOOL)writeToFile:(NSString *)file {
   return [self writeToFile:file filePath:file];
}
- (BOOL)writeToFile:(NSString *)file filePath:(NSString *)filePath {
    if (!file) {
        return NO;
    }
    BOOL isSuccess = [file writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    return isSuccess;
}


- (BOOL)deleteFileByPath:(NSString *)path {
    BOOL res = [self removeItemAtPath:path error:nil];
    NSLog(@"文件是否存在: %@",[self isExecutableFileAtPath:path]?@"YES":@"NO");
    return res;
}

- (BOOL)copyFile:(NSString *)path topath:(NSString *)topath {
    BOOL result = NO;
    NSError * error = nil;
    
    result = [self copyItemAtPath:path toPath:topath error:&error];
    
    if (error){
        NSLog(@"copy失败：%@",[error localizedDescription]);
    }
    return result;
}

- (BOOL)cutFile:(NSString *)path topath:(NSString *)topath {
    BOOL result = NO;
    NSError * error = nil;
    result = [self moveItemAtPath:path toPath:topath error:&error ];
    if (error){
        NSLog(@"cut失败：%@",[error localizedDescription]);
    }
    return result;
}

- (NSUInteger)getSize:(NSString *)filePath {
    NSUInteger size = 0;
    NSDirectoryEnumerator *fileEnumerator = [self enumeratorAtPath:filePath];
    for (NSString *fileName in fileEnumerator) {
        NSString *filePaths = [filePath stringByAppendingPathComponent:fileName];
        NSDictionary<NSString *, id> *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePaths error:nil];
        size += [attrs fileSize];
    }
    return size;
}

- (NSUInteger)getDiskCount:(NSString *)filePath {
    __block NSUInteger count = 0;
    dispatch_sync(dispatch_queue_create("xq_filePath", DISPATCH_QUEUE_CONCURRENT), ^{
        NSDirectoryEnumerator *fileEnumerator = [self enumeratorAtPath:filePath];
        count = fileEnumerator.allObjects.count;
    });
    return count;
}

- (void)calculateSize:(NSString *)filePath calculateSize:(CalculateSize)calculateSize {
    NSURL *diskCacheURL = [NSURL fileURLWithPath:filePath isDirectory:YES];
    
    dispatch_async(dispatch_queue_create("xq_filePath", DISPATCH_QUEUE_CONCURRENT), ^{
        NSUInteger fileCount = 0;
        NSUInteger totalSize = 0;
        
        NSDirectoryEnumerator *fileEnumerator = [self enumeratorAtURL:diskCacheURL
                                                  includingPropertiesForKeys:@[NSFileSize]
                                                                     options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                errorHandler:NULL];
        for (NSURL *fileURL in fileEnumerator) {
            NSNumber *fileSize;
            [fileURL getResourceValue:&fileSize forKey:NSURLFileSizeKey error:NULL];
            totalSize += fileSize.unsignedIntegerValue;
            fileCount += 1;
        }
        NSLog(@"fileCount:%lu  totalSize:%lu",(unsigned long)fileCount,(unsigned long)totalSize);
        calculateSize(fileCount,totalSize);
    });
}

- (NSDictionary *)fileAttriutes:(NSString *)filePath{
    NSDictionary *fileAttributes = [self attributesOfItemAtPath:filePath error:nil];
    NSArray *keys;
    id key, value;
    keys = [fileAttributes allKeys];
    NSInteger count = [keys count];
    NSMutableDictionary *attriutesDic = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < count; i++) {
        key = [keys objectAtIndex: i];  //文件名
        value = [fileAttributes objectForKey: key];  //文件属性
        [attriutesDic setObject:value forKey:key];
    }
    return [attriutesDic copy];
}

@end
