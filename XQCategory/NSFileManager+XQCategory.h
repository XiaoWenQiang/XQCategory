//
//  NSFileManager+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CalculateSize)(unsigned long fileCount, unsigned long totalSize);


@interface NSFileManager (XQCategory)

//获取目录
- (NSString *)getDocumetsPath;
- (NSString *)getLibraryPath;
- (NSString *)getCachesPath;
- (NSString *)tmpPath;

//创建目录
-  (NSString *)createFolder:(NSString *)fileName;

//写入文件
- (BOOL)writeToFile:(NSString *)file;
- (BOOL)writeToFile:(NSString *)file filePath:(NSString *)filePath;

//删除文件
- (BOOL)deleteFileByPath:(NSString *)path;
//复制文件
- (BOOL)copyFile:(NSString *)path topath:(NSString *)topath;
//剪切文件
- (BOOL)cutFile:(NSString *)path topath:(NSString *)topath;

//得到磁盘缓存的大小
- (NSUInteger)getSize:(NSString *)filePath;
//获取磁盘中文件数量
- (NSUInteger)getDiskCount:(NSString *)filePath;
//异步计算磁盘缓存的大小
- (void)calculateSize:(NSString *)filePath calculateSize:(CalculateSize)calculateSize;
//文件属性
- (NSDictionary *)fileAttriutes:(NSString *)filePath;

@end
