#!/bin/sh

rm -rf ~/Library/Developer/Xamarin
rm -rf ~/Library/Preferences/VisualStudio
rm -rf ~/Library/Caches/VisualStudio
rm -rf ~/Library/Logs/VisualStudio
rm -rf ~/Library/VisualStudio
rm -rf ~/Library/Preferences/Xamarin/
sudo rm -rf /Developer/MonoAndroid
sudo rm -rf /Developer/MonoTouch
sudo rm -rf /Applications/Visual\ Studio.app
sudo rm -rf /Applications/Xamarin\ Workbooks.app
sudo rm -rf /Applications/Xamarin\ Profiler.app
sudo rm -rf /Developer/MonoDroid
rm -rf ~/Library/MonoAndroid
sudo pkgutil --forget com.xamarin.android.pkg
sudo rm -rf /Library/Frameworks/Xamarin.Android.framework
rm -rf ~/Library/Developer/Xamarin/
rm -rf ~/Library/MonoTouch
sudo rm -rf /Library/Frameworks/Xamarin.iOS.framework
sudo rm -rf /Developer/MonoTouch
sudo pkgutil --forget com.xamarin.monotouch.pkg
sudo pkgutil --forget com.xamarin.xamarin-ios-build-host.pkg
sudo pkgutil --forget com.xamarin.xamarin.ios.pkg
sudo rm -rf /Library/Frameworks/Xamarin.Mac.framework
rm -rf ~/Library/Xamarin.Mac
sudo /Library/Frameworks/Xamarin.Interactive.framework/Versions/Current/uninstall
rm -rf ~/Library/Caches/XamarinInstaller/
rm -rf ~/Library/Caches/VisualStudioInstaller/
rm -rf ~/Library/Logs/XamarinInstaller/
rm -rf ~/Library/Logs/VisualStudioInstaller/
rm -rf ~/Library/Preferences/Xamarin/
rm -rf ~/Library/Preferences/Visual\ Studio/
