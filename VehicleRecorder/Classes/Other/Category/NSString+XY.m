//
//  NSString+XY.m
//  GGEWaltzNew
//
//  Created by yan on 15/11/26.
//  Copyright © 2015年 yan. All rights reserved.
//

#import "NSString+XY.h"

@implementation NSString (XY)

- (NSURL *)getUrlWithString {
    return [NSURL URLWithString:self];
}

//- (NSMutableAttributedString *)strToAttributedStringForCommentLabel:(NSString *)toUsername {
//    // 富文本
//    NSString *string = self;
//    NSUInteger length = [toUsername length]+1;
//    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
//    //设置字体大小和颜色
//    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:NSMakeRange(2, length)];
//    [attrString addAttribute:NSForegroundColorAttributeName value:kColorMain range:NSMakeRange(2, length)];
//    return attrString;
//}

+ (NSString *)deleteSpaceAndEnterWithString:(NSString *)string
{
    // 判断最后字符是不是回车 如果是回车就删掉
    NSMutableString *str = [NSMutableString stringWithString:string];
    for (NSInteger i = [str length] - 1; i >= 0; i--) {
        if ([str characterAtIndex:i] == '\n' || [str characterAtIndex:i] == ' ') {
            [str deleteCharactersInRange:NSMakeRange(i, 1)];
        } else {
            break;
        }
    }
    return [NSString stringWithString:str];
}

#pragma mark - Emoji相关
/**
 *  判断是否是Emoji
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)isEmoji {
    const unichar high = [self characterAtIndex: 0];
    
    // Surrogate pair (U+1D000-1F77F)
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
}

/**
 *  判断字符串时候含有Emoji
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)isIncludingEmoji {
    BOOL __block result = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

/**
 *  移除掉字符串中的Emoji
 *
 *  @return 得到移除后的Emoji
 */
- (instancetype)removedEmojiString {
    NSMutableString* __block buffer = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              [buffer appendString:([substring isEmoji])? @"": substring];
                          }];
    
    return buffer;
}


@end
