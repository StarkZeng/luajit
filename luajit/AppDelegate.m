//
//  AppDelegate.m
//  luajit
//
//  Created by qiang zeng on 15/6/13.
//
//

#import "AppDelegate.h"

#include "../include/lua.h"
#include "../include/lualib.h"
#include "../include/lauxlib.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    
    NSString *resPath= [[NSBundle mainBundle] resourcePath];
    const char *docPath = [resPath cStringUsingEncoding:NSASCIIStringEncoding];
    printf("path:%s\n", docPath);
    
    char res_path[200];
    printf("---------------- original lua \n");
    sprintf(res_path,"%s/test.lua",docPath);
    luaL_dofile(L,res_path);
    
    printf("----------------luajit -bg to create out file\n");
    sprintf(res_path,"%s/test.out",docPath);
    luaL_dofile(L,res_path);
    
   // printf("----------------luajit -bg to create obj file \n");
 //   sprintf(res_path,"%s/test.obj",docPath);
  //  luaL_dofile(L,res_path);
    
    
    lua_close(L);
    
    return YES;
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
}

@end
