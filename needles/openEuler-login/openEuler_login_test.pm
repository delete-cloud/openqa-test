package openEuler_login_test;
use base "basetest";
use strict;
use testapi;

sub run {
    diag "Starting login test...";

    # 设置超时时间为1200秒 (20分钟)
    my $timeout = 1200;

    # 等待系统启动完成，可以通过检测某个特定的启动标志来实现
    # 例如，等待出现登录界面
    diag "Waiting for login screen to appear";
    assert_screen 'login', timeout => $timeout;

    # 输入密码
    diag "Entering password";
    type_string 'openEuler12#$', timeout => $timeout;
    assert_screen 'password-input', timeout => $timeout;

    # 发送 Enter 键以登录
    diag "Sending Enter key to login";
    send_key 'ret', timeout => $timeout;

    # 确认进入桌面
    diag "Checking if desktop is shown";
    assert_screen 'desktop', timeout => $timeout;

    diag "Login test completed.";
}

1;
