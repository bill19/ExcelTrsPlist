# ExcelTrsPlist
#将excel文件转化为plist文档
##第一步呢，把你的excel转化为需要的txt文档，若是文档读取不了，请使用vim 创建，然后把你的内容copy过去

##修改你需要的字段－也就是你的名称

- (void)buttonClick{

    NSString *schoolsPath = [[NSBundle mainBundle] pathForResource:@"im" ofType:@"txt"];
    NSString *schoolsContent = [[NSString alloc] initWithContentsOfFile:schoolsPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *schoolsArray = [schoolsContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

    NSString *plistPath = [NSHomeDirectory() stringByAppendingPathComponent:@"School.plist"];
    NSLog(@"%@",plistPath);
    NSMutableArray *resultsArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger j = 0; j < schoolsArray.count; j++){
        NSString *schoolStr = [schoolsArray objectAtIndex:j];
        NSArray *schoolArr = [schoolStr componentsSeparatedByString:@"\t"];
        [resultsArr addObject:@{@"schoolCode":[schoolArr objectAtIndex:0],@"schoolName":[schoolArr objectAtIndex:1],@"schoolother":[schoolArr objectAtIndex:2]}];
    }
    [resultsArr writeToFile:plistPath atomically:YES];
}

也就是这个类里面－－－－－可以修改自己的



##可以去你的沙盒下面读取你的plis文档了
