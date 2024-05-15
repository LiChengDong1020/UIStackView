//
//  ViewController.m
//  UIStackView
//
//  Created by lichengdong on 2024/4/24.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UIStackView *stackView;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
/**
 我们只负责定义UIStackView的位置（position），UIStackView的大小（size）是可选的。当没有设置size的时候，UIStackView会根据它的内容的大小来调整自己的大小，即子视图各个控件的大小决定了UIStackView的大小，当子视图的各个控件大小为0，那么UIStackView的大小同样0。
 
 UIStackView的相关属性
 Alignment: 控制subView对齐方式
水平方向
 Fill：子视图填充StackView。
 Leading：靠左对齐。
 Trailing：靠右对齐。
 Center：子视图以中线为基准对齐。
 
垂直方向
 Fill：子视图填充StackView。
 Top：靠顶部对齐。
 Center：子视图以中线为基准对齐。
 Bottom：靠底部对齐。
 First Baseline：按照第一个子视图中文字的第一行对齐。
 Last Baseline：按照最后一个子视图中文字的最后一行对齐。
 
 
 Distribution:填充形式，或者理解为定义subview的分布方式，简单一点理解就是宽或者高的排列情况
 Fill  沿Axis方向填充所有区域,UIStackView会扩大一个子视图，填充额外的区域，该view有着最低的水平内容紧靠优先级（lowest horizontal content hugging priority），如果所有的view的优先级相等，那么会扩大第一个view。
 
 
 
 作者：Longshihua
 链接：https://www.jianshu.com/p/1b31adf3396f
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    stackView = [[UIStackView alloc]init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 20;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.backgroundColor = UIColor.brownColor;
    [self.view addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view).inset(20);
    }];
 
    
//    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textColor = UIColor.blueColor;
    return cell;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 112;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}
@end
