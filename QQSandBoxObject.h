//
//  QQSandBoxObject.h
//  QQBaseViewController
//
//  Created by QuinnQiu on 15/11/3.
//  Copyright © 2015年 QuinnQiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQSandBoxObject : NSObject
/**
 *
 *获得document
 *
 */
+ (NSString *)documentsPath ;


/**
 *
 *读取工程文件
 *
 */
+ (NSString *) productPath:(NSString*)filename;

/**
 *
 *获得document文件路径，名字方便记忆
 *
 */
+ (NSString *) documentPath:(NSString *)filename ;
/**
 *
 *获得document文件路径
 *
 */

+ (NSString *)fullpathOfFilename:(NSString *)filename ;


/**
 *
 *写入文件沙盒位置NSDictionary
 *
 */
+(void)saveNSDictionaryForDocument:(NSDictionary *)list  FileUrl:(NSString*) FileUrl  ;


/**
 *
 *写入文件存放到工程位置NSDictionary
 *
 */

+(void)saveNSDictionaryForProduct:(NSDictionary *)list  FileUrl:(NSString*) FileUrl  ;


/**
 *
 *写入文件 Array 工程
 *
 */
+(void)saveOrderArrayListProduct:(NSMutableArray *)list  FileUrl :(NSString*) FileUrl ;
/**
 *
 *写入文件 Array 沙盒
 *
 */
+(void)saveOrderArrayList:(NSMutableArray *)list  FileUrl :(NSString*) FileUrl ;

/**
 *
 *加载文件沙盒NSDictionary
 *
 */

+(NSDictionary *)loadNSDictionaryForDocument  : (NSString*) FileUrl ;


/**
 *
 *加载文件工程位置NSDictionary
 *
 */

+(NSDictionary *)loadNSDictionaryForProduct  : (NSString*) FileUrl ;


/**
 *
 *加载文件沙盒NSArray
 *
 */
+(NSArray *)loadArrayList   : (NSString*) FileUrl ;


/**
 *
 *加载文件工程位置NSArray
 *
 */
+(NSArray *)loadArrayListProduct   : (NSString*) FileUrl ;


/**
 *
 *拷贝文件到沙盒
 *
 */

+(int) CopyFileToDocument:(NSString*)FileName;


/**
 *
 *判断文件是否存在
 *
 */

+(BOOL) FileIsExists:(NSString*) checkFile;

/**
 *
 *沙盒目录下新建文件夹
 *
 */

+ (BOOL)creatDirectoryWithDirectoryName:(NSString *)directory;

/**
 *
 *返回截屏需要保存的路径
 *
 */
+ (NSString *) getLYSaveDatasPaths;



/**
 *
 *获取指定路径(沙盒Document目录下自己创建的文件夹）下全部的文件URL
 *
 */
+ (NSArray *)getDatasPathsWithSpecifiedDirectory : (NSString *)directory;

/**
 *
 *删除指定文件夹
 *、//我在测试的时候删除保存文件夹
 */
+ (BOOL)removeItemPathAtDirctory:(NSString *)directory;
/**
 *
 *删除指定路径的文件
 *
 */
+ (BOOL)remoItemAtPath : (NSString *)path;


@end
