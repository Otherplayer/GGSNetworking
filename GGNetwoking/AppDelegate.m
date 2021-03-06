//
//  AppDelegate.m
//  GGNetwoking
//
//  Created by __无邪_ on 15/8/26.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "AppDelegate.h"
#import "GGBASEModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Register Network Monitor
    [[GGReachibility sharedInstance] startMonitoringInternetStates];
    [GGBASEModel initKeyMapper];
    
    // Register Splite
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"GGNetworking.sqlite"];
    
    
//    //获取当前应用程序对象
//    UIApplication *app = [UIApplication sharedApplication];
//    //获取一个应用程序对象的shortcutItem列表
//    id existingShortcutItems = [app shortcutItems];
//    //获取第0个shortcutItem
//    id oldItem = [existingShortcutItems objectAtIndex: 0];
//    //将旧的shortcutItem改变为可修改类型shortcutItem
//    id mutableItem = [oldItem mutableCopy];
//    //修改shortcutItem的显示标题
//    [mutableItem setLocalizedTitle: @"Click Lewis"];
//
//    
//    //根据旧的shortcutItems生成可变shortcutItems数组
//    id updatedShortcutItems = [existingShortcutItems mutableCopy];
//    //修改可变shortcutItems数组中对应index下的元素为新的shortcutItem
//    [updatedShortcutItems replaceObjectAtIndex: 0 withObject: mutableItem];
//    //修改应用程序对象的shortcutItems为新的数组
//    [app setShortcutItems: updatedShortcutItems];
    
    
    
    
    //给App图标添加3D Touch菜单
    //拍照
    
//    //菜单图标
//    UIApplicationShortcutIcon *iconCamera = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
//    //菜单文字
//    UIMutableApplicationShortcutItem *itemCamera = [[UIMutableApplicationShortcutItem alloc] initWithType:@"1" localizedTitle:@"拍照"];
//    //绑定信息到指定菜单
//    itemCamera.icon = iconCamera;
//    
//    //相册
//    //菜单图标
//    UIApplicationShortcutIcon *iconPhotoLibrary = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
//    //菜单文字
//    UIMutableApplicationShortcutItem *itemPhotoLibrary = [[UIMutableApplicationShortcutItem alloc] initWithType:@"2" localizedTitle:@"相册"];
//    //绑定信息到指定菜单
//    itemPhotoLibrary.icon = iconPhotoLibrary;
//    //绑定到App icon
//    application.shortcutItems = @[itemCamera,itemPhotoLibrary];
    
    
    
    return YES;
}





- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
    
    //identifies the type of action to perform.
    NSLog(@"%@ \n【%@】【%@】【%@】【%@】",shortcutItem,shortcutItem.localizedTitle,shortcutItem.localizedSubtitle,shortcutItem.type,shortcutItem.userInfo);
    
    if ([shortcutItem.type isEqualToString:@"com.hotyq.HotYQ.First"]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
        picker.allowsEditing = YES;//设置可编辑
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.window.rootViewController presentViewController:picker animated:YES completion:nil];//进入照相界面
    }
    
}








- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    [MagicalRecord cleanUp];
}

@end
