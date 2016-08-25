//
//  NSString+XY.h
//  GGEWaltzNew
//
//  Created by yan on 15/11/26.
//  Copyright © 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XY)

// 把string转url
- (NSURL *)getUrlWithString;

// 富文本-高亮
//- (NSMutableAttributedString *)strToAttributedStringForCommentLabel:(NSString *)toUsername;

/**
 *  删除空格和回车键，从后面删除
 */
+ (NSString *)deleteSpaceAndEnterWithString:(NSString *)string;

#pragma mark - Emoji
/**
 *  判断字符串时候含有Emoji
 */
- (BOOL)isIncludingEmoji;
/**
 *  移除掉字符串中的Emoji
 */
- (instancetype)removedEmojiString;

@end
