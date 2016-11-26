#!/bin/sh

sudo rm -rf $HOME/Library/Caches/com.xamarin.fontconfig
sudo rm -rf $HOME/Library/Caches/com.xamarin.universalinstaller
sudo rm -rf /Developer/MonoAndroid
sudo rm -rf /Developer/MonoTouch
sudo rm -rf /Applications/Visual\ Studio.app
sudo rm -rf /Applications/Xamarin\ Workbooks.app
sudo rm -rf /Applications/Xamarin\ Profiler.app
sudo rm -rf /Library/Frameworks/Mono.framework
sudo rm -rf /Library/Frameworks/Xamarin*
sudo pkgutil --forget com.xamarin.Inspector
sudo pkgutil --forget com.xamarin.profiler
sudo pkgutil --forget com.xamarin.xamarin-ios-build-host.pkg
sudo pkgutil --forget com.xamarin.xamarin.ios.pkg
sudo pkgutil --forget com.xamarin.monotouch.pkg
sudo pkgutil --forget com.xamarin.android.pkg
rm -rf $HOME/Library/Developer/Xamarin
rm -rf $HOME/Library/Preferences/VisualStudio
rm -rf $HOME/Library/Caches/VisualStudio
rm -rf $HOME/Library/Logs/VisualStudio
rm -rf $HOME/Library/Caches/Xamarin
rm -rf $HOME/Library/Caches/XamarinInstaller
rm -rf $HOME/Library/Xamarin
rm -rf $HOME/.local/share/Xamarin*
rm -rf $HOME/.local/share/MonoForAndroid
rm -rf $HOME/Library/Logs/XamarinInstaller
