//
//  QQSandBoxObject.m
//  QQBaseViewController
//
//  Created by QuinnQiu on 15/11/3.
//  Copyright © 2015年 QuinnQiu. All rights reserved.
//

#import "QQSandBoxObject.h"

#define kSPECIFIEDDIRECTORY @"LYScreenshots"


@implementation QQSandBoxObject



/**
 *
 *获得document
 *
 */
+ (NSString *) documentsPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [paths objectAtIndex:0];
    
}


/**
 *
 *读取工程文件
 *
 */
+ (NSString *) productPath:(NSString*)filename{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@""];
    
    return  path;
    
}

/**
 *
 *获得document文件路径，名字方便记忆
 *
 */
+ (NSString *) documentPath:(NSString *)filename {
    
    NSString *documentsPath = [self documentsPath];
    
    return [documentsPath stringByAppendingPathComponent:filename];
    
}
/**
 *
 *获得document文件路径
 *
 */

+ (NSString *)fullpathOfFilename:(NSString *)filename {
    
    NSString *documentsPath = [self documentsPath];
    
    return [documentsPath stringByAppendingPathComponent:filename];
    
}


/**
 *
 *写入文件沙盒位置NSDictionary
 *
 */
+(void)saveNSDictionaryForDocument:(NSDictionary *)list  FileUrl:(NSString*) FileUrl  {
    
    
    
    NSString *f = [self fullpathOfFilename:FileUrl];
    
    
    
    [list writeToFile:f atomically:YES];
    
}


/**
 *
 *写入文件存放到工程位置NSDictionary
 *
 */

+(void)saveNSDictionaryForProduct:(NSDictionary *)list  FileUrl:(NSString*) FileUrl  {
    
    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    
    NSString *f=[ProductPath stringByAppendingPathComponent:FileUrl];
    
    [list writeToFile:f atomically:YES];
    
}


/**
 *
 *写入文件 Array 工程
 *
 */
+(void)saveOrderArrayListProduct:(NSMutableArray *)list  FileUrl :(NSString*) FileUrl {
    
    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    
    NSString *f=[ProductPath stringByAppendingPathComponent:FileUrl];
    
    
    [list writeToFile:f atomically:YES];
    
}
/**
 *
 *写入文件 Array 沙盒
 *
 */
+(void)saveOrderArrayList:(NSMutableArray *)list  FileUrl :(NSString*) FileUrl {
    
    NSString *f = [self fullpathOfFilename:FileUrl];
    
    [list writeToFile:f atomically:YES];
    
}

/**
 *
 *加载文件沙盒NSDictionary
 *
 */

+(NSDictionary *)loadNSDictionaryForDocument  : (NSString*) FileUrl {
    
    
    
    NSString *f = [self fullpathOfFilename:FileUrl];
    
    NSDictionary *list = [ [NSDictionary alloc] initWithContentsOfFile:f];
    
    return list;
    
}


/**
 *
 *加载文件工程位置NSDictionary
 *
 */

+(NSDictionary *)loadNSDictionaryForProduct  : (NSString*) FileUrl {
    
    NSString *f = [self productPath:FileUrl];
    
    NSDictionary *list =[NSDictionary dictionaryWithContentsOfFile:f];
    
    return list;
    
}


/**
 *
 *加载文件沙盒NSArray
 *
 */
+(NSArray *)loadArrayList   : (NSString*) FileUrl {
    
    NSString *f   = [self fullpathOfFilename:FileUrl];

    NSArray *list = [NSArray  arrayWithContentsOfFile:f];
    
    return list;
    
}


/**
 *
 *加载文件工程位置NSArray
 *
 */
+(NSArray *)loadArrayListProduct   : (NSString*) FileUrl {
    
    NSString *f = [self productPath:FileUrl];
    
    NSArray *list = [NSArray  arrayWithContentsOfFile:f];
    
    return list;
    
}


/**
 *
 *拷贝文件到沙盒
 *
 */

+(int) CopyFileToDocument:(NSString*)FileName{
    
    NSString *appFileName =[self fullpathOfFilename:FileName];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    //判断沙盒下是否存在
    
    BOOL isExist = [fm fileExistsAtPath:appFileName];
    
    if (!isExist)   //不存在，把工程的文件复制document目录下
        
    {
        //获取工程中文件
        
        NSString *backupDbPath = [[NSBundle mainBundle]
                                  
                                  pathForResource:FileName
                                  
                                  ofType:@""];
        //这一步实现数据库的添加，
        
        // 通过NSFileManager 对象的复制属性，把工程中数据库的路径复制到应用程序的路径上
        
        BOOL cp = [fm copyItemAtPath:backupDbPath toPath:appFileName error:nil];
        
        return cp;
        
    } else {
        
        return  -1; //已经存在
        
    }
    
}


/**
 *
 *判断文件是否存在
 *
 */

+(BOOL) FileIsExists:(NSString*) checkFile{
    
    if([[NSFileManager defaultManager] fileExistsAtPath:checkFile])
        
    {
        return true;
        
    }
    
    return  false;
    
}

/**
 *
 *沙盒目录下新建文件夹
 *
 */

+ (BOOL)creatDirectoryWithDirectoryName:(NSString *)directory{
    
    NSString *document = [self documentsPath];
    
    
    NSString *createPath = [document stringByAppendingPathComponent:directory];
    
    //判断createPath路径文件夹是否已存在，此处createPath为需要新建的文件夹的绝对路径
    if ([[NSFileManager defaultManager] fileExistsAtPath:createPath])
    {
        return NO;
    }
    else
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];//创建文件夹
        return YES;
    }
}

+ (NSArray *)getAllData{
    
    NSArray*paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString*documentsDirectory= [paths objectAtIndex:0];
    NSLog(@"documentsDirectory%@",documentsDirectory);
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSString *myDirectory =[documentsDirectory stringByAppendingPathComponent:@"test"];
    NSArray *file = [fileManage subpathsOfDirectoryAtPath: documentsDirectory error:nil];
    NSLog(@"%@",file);
    
    NSArray *files= [fileManage subpathsAtPath: documentsDirectory];
    
    NSLog(@"%@",files);
    
    return file;
}
/**
 *
 *返回截屏需要保存的路径
 *
 */
+ (NSString *) getLYSaveDatasPaths{
    
    if ([self creatDirectoryWithDirectoryName:kSPECIFIEDDIRECTORY]) {
        NSLog(@"yes");
    }else{
        NSLog(@"no");
    }
    NSString *documentsDirectory= [self documentsPath];
    NSString *datasPath = [documentsDirectory stringByAppendingPathComponent:kSPECIFIEDDIRECTORY];
    return datasPath;
}

/**
 *
 *获取指定路径(沙盒Document目录下自己创建的文件夹）下全部的文件URL//目前默认文件夹，不需要设置文件夹
 *
 */
+ (NSArray *)getDatasPathsWithSpecifiedDirectory : (NSString *)directory{
    
    NSMutableArray *pathArray = [[NSMutableArray alloc] initWithCapacity:1];
    
    NSFileManager *fileManage = [NSFileManager defaultManager];
    
    NSString *filesPath = [self getLYSaveDatasPaths];
    
    NSArray *files = [fileManage subpathsAtPath:[self documentsPath]];
    //    for (int i = 0; i < files.count; i++) {
    //
    //        NSString *path = [[self documentsPath] stringByAppendingPathComponent:[files objectAtIndex:i]];
    //        BOOL su = [fileManage removeItemAtPath:path error:nil];
    //        if (su) {
    //            NSLog(@"success");
    //        }else{
    //            NSLog(@"failed");
    //        }
    //    }
    
    NSArray *filesArray = [fileManage subpathsOfDirectoryAtPath:filesPath error:nil];
    
    for (int i = 0; i < filesArray.count; i++) {
        
        NSString *path = [filesPath stringByAppendingPathComponent:[filesArray objectAtIndex:i]];
        
        [pathArray addObject:path];
    }
    
    return pathArray;
}
/**
 *
 *删除指定文件夹
 *
 */
+ (BOOL)removeItemPathAtDirctory:(NSString *)directory{
    
    NSFileManager *fileManage = [NSFileManager defaultManager];

    NSString *path            = [self getLYSaveDatasPaths];

    if ([fileManage removeItemAtPath:path error:nil]) {
        return YES;
    }
    
    return NO;
}

/**
 *
 *删除指定路径的文件
 *
 */
+ (BOOL)remoItemAtPath : (NSString *)path{
    
    NSFileManager *fileManage = [NSFileManager defaultManager];
    
    return [fileManage removeItemAtPath:path error:nil];
}

@end
