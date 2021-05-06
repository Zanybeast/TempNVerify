//
//  CustomCell.m
//  testForClicked
//
//  Created by carl on 2021/5/5.
//

#import "CustomCell.h"
#import <WebKit/WebKit.h>
#import <AFNetworking/AFNetworking.h>
#import "MPAdvertiseModel.h"

#define Screen_Width     [[UIScreen mainScreen] bounds].size.width

@interface CustomCell() <WKNavigationDelegate>

@property (strong, nonatomic)WKWebView *webView; // 报网通广告
@property (nonatomic, copy)NSString *htmlStr;
@property(nonatomic,strong)MPAdvertiseModel * model;

@end

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initView];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [self getBaoWangTongData];
    
}

- (void)getBaoWangTongData {
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.requestSerializer = [AFJSONRequestSerializer serializer];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain" , @"application/json", @"text/html" ,nil];
//    NSDictionary *para = @{@"scid":_model.adslot};
    NSDictionary *para = @{@"scid":@899};
    NSDictionary *head = @{@"X-Auth-Key":@"8c01ea369e3cba9fa4f6bb91c19ca6fcb23a7c8c6dd1bd346470cd78327e2c24"};
    [manger  GET:@"https://ads.staging.newsochub.com/show/inapp/v1" parameters:para headers:head progress:^(NSProgress * _Nonnull downloadProgress) {
      } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//          NSString *errorMessage = responseObject[@"errorMessage"];
//          NSLog(@"request error: %@", errorMessage);    //错误信息
          
          NSArray *dataArr = responseObject[@"creatives"];
          self.htmlStr = dataArr.firstObject[@"markup"];
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [self.webView removeFromSuperview];
          
          if (_model.passbackModel.adslot.length > 0){ // 无广告内容 使用备用广告
              self.model.passbackModel.index = _model.index;
              self.model = self.model.passbackModel;
          }

          else{
//              if ([self.delegate respondsToSelector:@selector(mpBannerLoadFailure:)]) {// 移除空白广告
//                  [self.delegate mpBannerLoadFailure:_model];
//              }
          }
      }];
}

- (void)setHtmlStr:(NSString *)htmlStr {
    
//    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
//
//    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
//    [wkUController addUserScript:wkUScript];
//
//    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
//    wkWebConfig.userContentController = wkUController;
//
//    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake((Screen_Width - 300) / 2, 0, 450, 250) configuration:wkWebConfig];
    
    _htmlStr = htmlStr;
    NSString *strTemplateHTML = [NSString stringWithFormat:@"<html><head><style>img{max-width:100%%;height:auto !important;width:auto !important;};</style></head><body style='margin:0; padding:0;'>%@</body></html>", htmlStr];
    NSLog(@"-------------------------------------");
    NSLog(@"%@", htmlStr);
    NSLog(@"-------------------------------------");
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake((Screen_Width - 300) / 2, 0, 450, 250)];
    
    self.webView.navigationDelegate = self;
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.opaque = NO;
//    self.webView.autoresizesSubviews = YES;
    [self.webView loadHTMLString:strTemplateHTML baseURL:nil];
    [self addSubview:self.webView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    //1.拦截请求
    NSString *urlString = [navigationAction.request.URL absoluteString];
    //    2.跳转别的应用如系统浏览器（跨域跳转）、应用的web内跳转（不跨域跳转）
    NSString *hostname = navigationAction.request.URL.host.lowercaseString;
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {//跳转别的应用如系统浏览器
        // 对于跨域，需要手动跳转
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL
                                           options:[NSDictionary dictionary] completionHandler:nil];
        // 不允许web内跳转
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    } else {//应用的web内跳转
        decisionHandler (WKNavigationActionPolicyAllow);
    }
    
}


@end
